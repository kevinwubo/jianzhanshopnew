using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using System.Configuration;

namespace DTcms.Web
{
    public class Global : System.Web.HttpApplication
    {
        private string Url = ConfigurationManager.AppSettings["IPAddress"];

        protected void Application_Start(object sender, EventArgs e)
        {
           
        }
        private void LoadFromWebservice()
        {
            //定义一个定时器，并开启和配置相关属性
            System.Timers.Timer Wtimer = new System.Timers.Timer(1000);//执行任务的周期
            Wtimer.Elapsed += new System.Timers.ElapsedEventHandler(Wtimer_Elapsed);
            Wtimer.Enabled = true;
            Wtimer.AutoReset = true;
        }

        void Wtimer_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 静态生成页面的方法
        /// </summary>
        /// <param name="strPageUrl">生成源</param>
        /// <param name="strFileName">生成到</param>
        private bool MakePage(string strPageUrl, string strFileName)
        {
            string strDir, strFilePage;
            strFilePage = Server.MapPath(strFileName);

            StreamWriter sw = null;
            //获得aspx的静态html
            try
            {
                //if (!Directory.Exists(Server.MapPath(strDir)))
                //{
                //    Directory.CreateDirectory(Server.MapPath(strDir));
                //}
                if (File.Exists(strFilePage))
                {
                    File.Delete(strFilePage);
                }
                sw = new StreamWriter(strFilePage, false, System.Text.Encoding.GetEncoding("UTF-8"));
                System.Net.WebRequest wReq = System.Net.WebRequest.Create(strPageUrl);
                System.Net.WebResponse wResp = wReq.GetResponse();
                System.IO.Stream respStream = wResp.GetResponseStream();
                System.IO.StreamReader reader = new System.IO.StreamReader(respStream, System.Text.Encoding.GetEncoding("UTF-8"));
                if (File.Exists(strFilePage))
                {
                    string str = reader.ReadToEnd();
                    if (!string.IsNullOrEmpty(str))
                    {
                        sw.Write(str);
                    }
                }
                else
                {
                    sw.Write(reader.ReadToEnd());
                }

            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog(ex.Message, DateTime.Now);
                return false;//生成到出错
            }
            finally
            {
                sw.Flush();
                sw.Close();
                sw = null;
            }

            return true;
        }

        protected void Application_End(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);

            string RequestURL = "http://www.jianzhanshop.com/WebTest.aspx.aspx";
            //这里设置你的web地址，可以随便指向你的任意一个aspx页面甚至不存在的页面，目的是要激发Application_Start
            System.Net.HttpWebRequest __HttpWebRequest = (System.Net.HttpWebRequest)System.Net.WebRequest.Create(RequestURL);
            System.Net.HttpWebResponse __HttpWebResponse = (System.Net.HttpWebResponse)__HttpWebRequest.GetResponse();
            System.IO.Stream __rStream = __HttpWebResponse.GetResponseStream();//得到回写的字节流  
            //当不再需要计时器时，请使用 Dispose 方法释放计时器持有的资源。
            __rStream.Close();
            __rStream.Dispose();
        }
    }
}