using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace DTcms.Common
{
    public static class EncryptStrByHashClass
    {
        private static string DESKey = "DTMS";        

        #region 一个用hash实现的加密解密方法
        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="src"></param>
        /// <returns></returns>
        public static string EncryptStrByHash(string src)
        {
            if (src.Length == 0)
            {
                return "";
            }
            byte[] HaKey = System.Text.Encoding.ASCII.GetBytes((src + "Test").ToCharArray());
            byte[] HaData = new byte[20];
            HMACSHA1 Hmac = new HMACSHA1(HaKey);
            CryptoStream cs = new CryptoStream(Stream.Null, Hmac, CryptoStreamMode.Write);
            try
            {
                cs.Write(HaData, 0, HaData.Length);
            }
            finally
            {
                cs.Close();
            }
            string HaResult = System.Convert.ToBase64String(Hmac.Hash).Substring(0, 16);
            byte[] RiKey = System.Text.Encoding.ASCII.GetBytes(HaResult.ToCharArray());
            byte[] RiDataBuf = System.Text.Encoding.ASCII.GetBytes(src.ToCharArray());
            byte[] EncodedBytes = { };
            MemoryStream ms = new MemoryStream();
            RijndaelManaged rv = new RijndaelManaged();
            cs = new CryptoStream(ms, rv.CreateEncryptor(RiKey, RiKey), CryptoStreamMode.Write);
            try
            {
                cs.Write(RiDataBuf, 0, RiDataBuf.Length);
                cs.FlushFinalBlock();
                EncodedBytes = ms.ToArray();
            }
            finally
            {
                ms.Close();
                cs.Close();
            }
            return HaResult + System.Convert.ToBase64String(EncodedBytes);
        }

        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="src"></param>
        /// <returns></returns>
        public static string DecrypStrByHash(string src)
        {
            if (src.Length < 40) return "";
            byte[] SrcBytes = System.Convert.FromBase64String(src.Substring(16));
            byte[] RiKey = System.Text.Encoding.ASCII.GetBytes(src.Substring(0, 16).ToCharArray());
            byte[] InitialText = new byte[SrcBytes.Length];
            RijndaelManaged rv = new RijndaelManaged();
            MemoryStream ms = new MemoryStream(SrcBytes);
            CryptoStream cs = new CryptoStream(ms, rv.CreateDecryptor(RiKey, RiKey), CryptoStreamMode.Read);
            try
            {
                cs.Read(InitialText, 0, InitialText.Length);
            }
            finally
            {
                ms.Close();
                cs.Close();
            }
            System.Text.StringBuilder Result = new System.Text.StringBuilder();
            for (int i = 0; i < InitialText.Length; ++i) if (InitialText[i] > 0) Result.Append((char)InitialText[i]);
            return Result.ToString();
        }

        #endregion
    }
}
