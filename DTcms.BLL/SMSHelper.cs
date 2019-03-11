using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Net;
using System.IO;

namespace DTcms.BLL
{
    public static class SMSHelper
    {

        //public static void SendSms(string telephone, string msgText)
        //{
        //    try
        //    {

        //        Encoding myEncoding = Encoding.GetEncoding("utf-8");
        //        string param = HttpUtility.UrlEncode("account", myEncoding) +
        //        "=" + HttpUtility.UrlEncode("sdk_zhantianxia", myEncoding) +
        //        "&" + HttpUtility.UrlEncode("password", myEncoding) +
        //        "=" + HttpUtility.UrlEncode("JIANzhan258", myEncoding) +
        //        "&" + HttpUtility.UrlEncode("destmobile", myEncoding) +
        //        "=" + HttpUtility.UrlEncode(telephone, myEncoding) +
        //        "&" + HttpUtility.UrlEncode("msgText", myEncoding) +
        //        "=" + HttpUtility.UrlEncode(msgText + "【盏天下】", myEncoding);//
        //        //"&" + HttpUtility.UrlEncode("sendDateTime", myEncoding) +
        //        //"=" + HttpUtility.UrlEncode(DateTime.Now.ToString(), myEncoding);

        //        byte[] postBytes = Encoding.ASCII.GetBytes(param);

        //        HttpWebRequest req = (HttpWebRequest)
        //        HttpWebRequest.Create("http://www.jianzhou.sh.cn/JianzhouSMSWSServer/http/sendBatchMessage");
        //        req.Method = "POST";
        //        req.ContentType =
        //        "application/x-www-form-urlencoded;charset=utf-8";
        //        req.ContentLength = postBytes.Length;

        //        using (Stream reqStream = req.GetRequestStream())
        //        {
        //            reqStream.Write(postBytes, 0, postBytes.Length);
        //        }
        //        using (WebResponse wr = req.GetResponse())
        //        {
        //            //BLL.Log.WriteTextLog("--手机号 ：" + telephone + "-资讯报文：" + param, DateTime.Now);
        //            //在这里对接收到的页面内容进行处理  
        //        } 
        //    }
        //    catch (System.Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //    }
        //}

        public static void SeedSMS(string phone,string msg)
        {
            try
            {
                String account = "N1524341";//API账号
                String password = "k4nrbLgyK";//API密码
                String url = "http://smssh1.253.com/msg/send/json";
                //String phone = "15802148204";
                //String msg = "【盏天下】您的验证码是123456";//253短信测试内容
                string postJsonTpl = "\"account\":\"{0}\",\"password\":\"{1}\",\"phone\":\"{2}\",\"report\":\"true\",\"msg\":\"{3}\"";
                string jsonBody = string.Format(postJsonTpl, account, password, phone, msg);
                String result = doPostMethodToObj(url, "{" + jsonBody + "}");
            }
            catch (Exception ex)
            {
                 Console.WriteLine(ex.Message);
            }
        }

        public static string doPostMethodToObj(string url, string jsonBody)
        {
            string result = String.Empty;
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
            httpWebRequest.ContentType = "application/json";
            
            //BLL.Log.WriteTextLog("短信发送请求：" + jsonBody, DateTime.Now);
            httpWebRequest.Method = "POST";
            // Create NetworkCredential Object
            NetworkCredential admin_auth = new NetworkCredential("N1524341", "k4nrbLgyK");
            // Set your HTTP credentials in your request header
            httpWebRequest.Credentials = admin_auth;
            // callback for handling server certificates
            ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            using (StreamWriter streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {

                streamWriter.Write(jsonBody);

                streamWriter.Flush();

                streamWriter.Close();
                HttpWebResponse httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (StreamReader streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {

                    result = streamReader.ReadToEnd();                    
                   // BLL.Log.WriteTextLog("短信发送结果：" + result, DateTime.Now);

                }

            }
            return result;
        }
    }
}
