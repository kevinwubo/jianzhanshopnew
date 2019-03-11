using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace DTcms.BLL
{
    public class Log
    {
        /// <summary>  
        /// 写入日志到文本文件  
        /// </summary>  
        /// <param name="action">动作</param>  
        /// <param name="strMessage">日志内容</param>  
        /// <param name="time">时间</param>  
        public static void WriteTextLog(string strMessage, DateTime time)
        {
            try
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + @"Log\";
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileFullPath = path + time.ToString("yyyy-MM-dd") + ".System.txt";
                StringBuilder str = new StringBuilder();
                str.Append("录入时间:    " + time.ToString() + "\r\n");
                str.Append("记录信息: " + strMessage + "\r\n");
                str.Append("-----------------------------------------------------------\r\n\r\n");
                StreamWriter sw;
                if (!File.Exists(fileFullPath))
                {
                    sw = File.CreateText(fileFullPath);
                }
                else
                {
                    sw = File.AppendText(fileFullPath);
                }
                sw.WriteLine(str.ToString());
                sw.Close();
            }
            catch (Exception ex)
            {              
            }
        }

        /// <summary>  
        /// 写入日志到文本文件  
        /// </summary>  
        /// <param name="action">动作</param>  
        /// <param name="strMessage">日志内容</param>  
        /// <param name="time">时间</param>  
        public static void SendMessage(string strMessage, DateTime time)
        {
            try
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + @"Log\";
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileFullPath = path + time.ToString("yyyy-MM-dd") + ".SMS.txt";
                StringBuilder str = new StringBuilder();
                str.Append("录入时间:    " + time.ToString() + "\r\n");
                str.Append("记录信息: " + strMessage + "\r\n");
                str.Append("-----------------------------------------------------------\r\n\r\n");
                StreamWriter sw;
                if (!File.Exists(fileFullPath))
                {
                    sw = File.CreateText(fileFullPath);
                }
                else
                {
                    sw = File.AppendText(fileFullPath);
                }
                sw.WriteLine(str.ToString());
                sw.Close();
            }
            catch (Exception ex)
            {
            }
        }
        /// <summary>  
        /// 写入日志到文本文件  
        /// </summary>  
        /// <param name="action">动作</param>  
        /// <param name="strMessage">日志内容</param>  
        /// <param name="time">时间</param>  
        public static void WriteDelLog(string strMessage, DateTime time)
        {
            try
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + @"Log\";
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileFullPath = path + time.ToString("yyyy-MM-dd") + ".DEL.txt";
                StringBuilder str = new StringBuilder();
                str.Append("录入时间:    " + time.ToString() + "\r\n");
                str.Append("记录信息: " + strMessage + "\r\n");
                str.Append("-----------------------------------------------------------\r\n\r\n");
                StreamWriter sw;
                if (!File.Exists(fileFullPath))
                {
                    sw = File.CreateText(fileFullPath);
                }
                else
                {
                    sw = File.AppendText(fileFullPath);
                }
                sw.WriteLine(str.ToString());
                sw.Close();
            }
            catch (Exception ex)
            {
            }
        }

        /// <summary>  
        /// 写入日志到文本文件  
        /// </summary>  
        /// <param name="action">动作</param>  
        /// <param name="strMessage">日志内容</param>  
        /// <param name="time">时间</param>  
        public static void WriteErrorLog(string strMessage, DateTime time)
        {
            try
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + @"Log\";
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileFullPath = path + time.ToString("yyyy-MM-dd") + ".Error.txt";
                StringBuilder str = new StringBuilder();
                str.Append("录入时间:    " + time.ToString() + "\r\n");
                str.Append("记录信息: " + strMessage + "\r\n");
                str.Append("-----------------------------------------------------------\r\n\r\n");
                StreamWriter sw;
                if (!File.Exists(fileFullPath))
                {
                    sw = File.CreateText(fileFullPath);
                }
                else
                {
                    sw = File.AppendText(fileFullPath);
                }
                sw.WriteLine(str.ToString());
                sw.Close();
            }
            catch (Exception ex)
            {
            }
        }
    }
}
