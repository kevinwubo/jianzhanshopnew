using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

namespace DTcms.Web.activity
{
    public partial class autohtml : System.Web.UI.Page
    {
        private string Url = "http://jianzhanshop.com:8080/";// ConfigurationManager.AppSettings["IPAddress"];
        //wuyishan  这个是武夷山盏天下团队
        //xiamen 这个是盏天下厦门团队
        //jianzhanjun 建盏君
        //julebu 俱乐部

        string[] strS = { "wuyishan", "xiamen", "jianzhanjun", "julebu" };
        int pageCount = 6;

        protected void Page_Load(object sender, EventArgs e)
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

        private bool Execute(string name)
        {
            for (int i = 0; i < strS.Length; i++)
            {
                for (int j = 1; j < pageCount; j++)
                {
                    MakePage(Url + "/activity/" + name + ".aspx?source=" + strS[i] + "&page=" + j, "/activity/" + name + "_" + strS[i] + "_" + j + ".html");
                }
            }  
            return true;
        }

        //首页
        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < strS.Length; i++)
            {
                MakePage(Url + "/activity/index.aspx?source=" + strS[i], "/activity/index_" + strS[i] + ".html");
            }
        }

        /// <summary>
        /// 小匠目录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            Execute("xiaojiangtulu");          
        }

        /// <summary>
        /// 小匠专场
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button9_Click(object sender, EventArgs e)
        {
            Execute("xiaojiangzhuanchang");
        }


        /// <summary>
        /// 名家图录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button8_Click(object sender, EventArgs e)
        {
            Execute("mingjiatulu");
        }

        /// <summary>
        /// 名家专场
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button7_Click(object sender, EventArgs e)
        {
            Execute("mingjiazhuanchang");
        }

        /// <summary>
        /// 大师图录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button6_Click(object sender, EventArgs e)
        {
            Execute("dashitulu");
        }

        /// <summary>
        /// 大师专场
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button5_Click(object sender, EventArgs e)
        {
            Execute("dashizhuanchang");
        }
    }
}