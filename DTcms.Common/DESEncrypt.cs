using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace DTcms.Common
{
    /// <summary>
    /// DES加密/解密类。
    /// </summary>
    public class DESEncrypt
    {

        #region ========加密========

        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="Text"></param>
        /// <returns></returns>
        public static string Encrypt(string Text)
        {
            return Encrypt(Text, "DTcms");
        }
        /// <summary> 
        /// 加密数据 
        /// </summary> 
        /// <param name="Text"></param> 
        /// <param name="sKey"></param> 
        /// <returns></returns> 
        public static string Encrypt(string Text, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray;
            inputByteArray = Encoding.Default.GetBytes(Text);
            des.Key = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            des.IV = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            StringBuilder ret = new StringBuilder();
            foreach (byte b in ms.ToArray())
            {
                ret.AppendFormat("{0:X2}", b);
            }
            return ret.ToString();
        }

        #endregion

        #region ========解密========

        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="Text"></param>
        /// <returns></returns>
        public static string Decrypt(string Text)
        {
            return Decrypt(Text, "DTcms");
        }
        /// <summary> 
        /// 解密数据 
        /// </summary> 
        /// <param name="Text"></param> 
        /// <param name="sKey"></param> 
        /// <returns></returns> 
        public static string Decrypt(string Text, string sKey)
        {
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            int len;
            len = Text.Length / 2;
            byte[] inputByteArray = new byte[len];
            int x, i;
            for (x = 0; x < len; x++)
            {
                i = Convert.ToInt32(Text.Substring(x * 2, 2), 16);
                inputByteArray[x] = (byte)i;
            }
            des.Key = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            des.IV = ASCIIEncoding.ASCII.GetBytes(System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Encoding.Default.GetString(ms.ToArray());
        }


        /// <summary>
        ///  数字替换成字母 1A 2B 3C 4D 5E 6F 7G 8H 9I 0M
        ///  随机字母 
        /// </summary>
        /// <returns></returns>
        public static string ConvertBy123(string str)
        {
            try
            {
                //if (!string.IsNullOrEmpty(str) && str.Length == 11)
                //{
                //    string str05 = str.Substring(0, 5);
                //    string str611 = str.Substring(5);
                //    str = RandLetter(1) + ConvertABCDEFGHIM(str05) + RandLetter(1) + ConvertABCDEFGHIM(str611) + RandLetter(1);
                //}
                //else
                //{
                    str = str.Replace("1", "A").Replace("2", "B").Replace("3", "C").Replace("4", "D").Replace("5", "E").Replace("6", "F").Replace("7", "G").Replace("8", "H").Replace("9", "I").Replace("0", "M");
                //}
            }
            catch (Exception ex)
            {
                return str;
            }
            return str;
        }

        /// <summary>
        /// 数字替换成字母 1A 2B 3C 4D 5E 6F 7G 8H 9I 0M
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string ConvertABCDEFGHIM(string str)
        {
            return str.Replace("1", "A").Replace("2", "B").Replace("3", "C").Replace("4", "D").Replace("5", "E").Replace("6", "F").Replace("7", "G").Replace("8", "H").Replace("9", "I").Replace("0", "M"); ;
        }

        /// <summary>
        /// 随机生成字母
        /// </summary>
        /// <param name="n"></param>
        /// <returns></returns>
        public static string RandLetter(int n)
        {
            char[] arrChar = new char[]{ 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','Q','P','R','T','S','V','U','W','X','Y','Z'};

            StringBuilder num = new StringBuilder();

            Random rnd = new Random(DateTime.Now.Millisecond);
            for (int i = 0; i < n; i++)
            {
                num.Append(arrChar[rnd.Next(0, arrChar.Length)].ToString());

            }
            return num.ToString();
        }

        /// <summary>
        /// 字母替换成数字 A1 B2 C3 D4 E5 F6 G7 H8 I9 M0
        /// </summary>
        /// <returns></returns>
        public static string ConvertByABC(string str)
        {
            try
            {
                //if (!string.IsNullOrEmpty(str) && str.Length == 14)
                //{
                //    str = str.Substring(1);
                //    str = str.Substring(0, str.Length - 1);

                //    string str05 = str.Substring(0, 5);
                //    string str611 = str.Substring(6);
                //    str = Convert1234567890(str05) + Convert1234567890(str611);
                //}
                //else
                //{
                    str = str.Replace("A", "1").Replace("B", "2").Replace("C", "3").Replace("D", "4").Replace("E", "5").Replace("F", "6").Replace("G", "7").Replace("H", "8").Replace("I", "9").Replace("M", "0");
                //}
            }
            catch (Exception ex)
            {
                return str;
            }
            return str;
        }

        /// <summary>
        /// 字母替换成数字 A1 B2 C3 D4 E5 F6 G7 H8 I9 M0
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string Convert1234567890(string str)
        {
            return str.Replace("A", "1").Replace("B", "2").Replace("C", "3").Replace("D", "4").Replace("E", "5").Replace("F", "6").Replace("G", "7").Replace("H", "8").Replace("I", "9").Replace("M", "0");
        }
        #endregion

    }
}
