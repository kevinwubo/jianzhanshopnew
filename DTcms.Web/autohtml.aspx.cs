using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

namespace DTcms.Web
{
    public partial class autohtml : System.Web.UI.Page
    {
        private string Url = ConfigurationManager.AppSettings["IPAddress"];
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                BLL.Log.WriteErrorLog("自动备份执行开始", DateTime.Now);
                MakePage(Url + "/default.aspx", "/backuphtml/index.html");
                MakePage(Url + "/product_list.aspx", "/backuphtml/product_list.html");
                MakePage(Url + "/artisan_list.aspx", "/backuphtml/artisan_list.html");
                BLL.Product bll = new BLL.Product();
                List<Model.ProductListView> lstPro = bll.GetProductList("", 0, "");
                foreach (Model.ProductListView model in lstPro)
                {

                    MakePage(Url + "/product_detail.aspx?productid=" + model.ProductID, "/backuphtml/" + model.ProductID + ".html");
                }
                MakePage(Url + "/collection.aspx", "/backuphtml/collection.html");
                BLL.Artisan bllA = new BLL.Artisan();
                List<Model.Artisan> lstArt = bllA.GetArtisanList(" and 1=1 ");
                foreach (Model.Artisan model in lstArt)
                {
                    BLL.Log.WriteErrorLog(model.artisanID.ToString(), DateTime.Now);
                    MakePage(Url + "/artisan_detail.aspx?artisanid=" + model.artisanID, "/backuphtml/artisan_" + model.artisanID + ".html");
                }

                BLL.Artisan bllBB = new BLL.Artisan();
                List<Model.Artisan> lstArtAA = bllBB.GetArtisanList("", 1000);
                foreach (Model.Artisan model in lstArtAA)
                {
                    MakePage(Url + "/article_detail.aspx?artisanid=" + model.artisanID, "/backuphtml/article" + model.artisanID + ".html");
                }

                MakePage(Url + "/mn_index.aspx", "/backuphtml/m_index.html");
                MakePage(Url + "/mn_shop.aspx", "/backuphtml/m_product_list.html");
                MakePage(Url + "/mn_famous.aspx", "/backuphtml/m_artisan_list.html");
                MakePage(Url + "/mn_house.aspx", "/backuphtml/m_collection.html");
                MakePage(Url + "/mn_school.aspx", "/backuphtml/m_school.html");
                BLL.Product bllAAA = new BLL.Product();
                List<Model.ProductListView> lstProAAA = bllAAA.GetProductList("", 0, "");
                foreach (Model.ProductListView model in lstProAAA)
                {
                    MakePage(Url + "/mn_productdetail.aspx?productid=" + model.ProductID, "/backuphtml/m_" + model.ProductID + ".html");
                }

                BLL.Artisan bllSSS = new BLL.Artisan();
                List<Model.Artisan> lstArtSSS = bllSSS.GetArtisanList("", 1000);
                foreach (Model.Artisan model in lstArtSSS)
                {
                    MakePage(Url + "/mn_famousdetail.aspx?artisanid=" + model.artisanID, "/backuphtml/m_art" + model.artisanID + ".html");
                }
                BLL.Log.WriteErrorLog("自动备份执行结束", DateTime.Now);
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog(ex.Message, DateTime.Now);
            }
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
    }
}