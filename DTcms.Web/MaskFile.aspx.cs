using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using System.Collections;
using System.Configuration;
using DTcms.BLL;

namespace DTcms.Web
{
    public partial class MaskFile : System.Web.UI.Page
    {
        private string Url = ConfigurationManager.AppSettings["IPAddress"];
        protected void Page_Load(object sender, EventArgs e)
        {
            //MakePage(Url + "/default.aspx", "/backuphtml/index.html");            
        } 

        protected void btn_Default_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/default.aspx", "index.html");
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
            strFilePage = Server.MapPath( strFileName);

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

        protected void btn_product_list_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/product_list.aspx", "product_list.html");
        }

        protected void btn_artisan_list_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/artisan_list.aspx", "artisan_list.html");
        }

        protected void btn_article_list_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/article_list2.aspx", "article_list2.html");
        }

        protected void btn_AllProduct_Click(object sender, EventArgs e)
        {
            try
            {
                BLL.Product bll = new BLL.Product();
                List<Model.ProductListView> lstPro = bll.GetProductList("", 0, "");
                foreach (Model.ProductListView model in lstPro)
                {
                    
                    MakePage(Url + "/product_detail.aspx?productid=" + model.ProductID, model.ProductID + ".html");
                }
            }
            catch (Exception ex)
            {
                
                   BLL.Log.WriteErrorLog(ex.Message, DateTime.Now);   
            }
        }

        protected void btn_collection_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/collection.aspx", "collection.html");
        }

        /// <summary>
        /// 艺人
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_AllArtisan_Click(object sender, EventArgs e)
        {
            try
            {
                BLL.Artisan bll = new BLL.Artisan();
                List<Model.Artisan> lstArt = bll.GetArtisanList(" and 1=1 ");
                foreach (Model.Artisan model in lstArt)
                {
                    BLL.Log.WriteErrorLog(model.artisanID.ToString(), DateTime.Now); 
                    MakePage(Url + "/artisan_detail.aspx?artisanid=" + model.artisanID, "artisan_" + model.artisanID + ".html");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog(ex.Message, DateTime.Now);              
            }
        }

        /// <summary>
        /// 文章
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_AllArticle_Click(object sender, EventArgs e)
        {
            try
            {
                BLL.Artisan bll = new BLL.Artisan();
                List<Model.Artisan> lstArt = bll.GetArtisanList("", 1000);
                foreach (Model.Artisan model in lstArt)
                {
                    MakePage(Url + "/article_detail.aspx?artisanid=" + model.artisanID, "article" + model.artisanID + ".html");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog(ex.Message, DateTime.Now);   
            }
        }

        protected void btn_ClearCache_Click(object sender, EventArgs e)
        {
            List<string> keys = new List<string>();
            // retrieve application Cache enumerator
            IDictionaryEnumerator enumerator = HttpRuntime.Cache.GetEnumerator();
            // copy all keys that currently exist in Cache
            while (enumerator.MoveNext())
            {
                keys.Add(enumerator.Key.ToString());
            }
            // delete every key from cache
            for (int i = 0; i < keys.Count; i++)
            {
                HttpRuntime.Cache.Remove(keys[i]);
            }
        }

        protected void btn_mn_index_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/mn_index.aspx", "m_index.html");
            }
            catch (Exception ex)
            {

                BLL.Log.WriteErrorLog("btn_mn_index_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_mn_shop_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/mn_shop.aspx", "m_product_list.html");
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_mn_shop_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_mn_famous_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/mn_famous.aspx", "m_artisan_list.html");
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_mn_famous_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_mn_house_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/mn_house.aspx", "m_collection.html");
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_mn_house_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_mn_school_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/mn_school.aspx", "m_school.html");
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_mn_school_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_allproductdetail_Click(object sender, EventArgs e)
        {
            BLL.Product bll = new BLL.Product();
            try
            {
                List<Model.ProductListView> lstPro = bll.GetProductList("", 0, "");
                foreach (Model.ProductListView model in lstPro)
                {
                    MakePage(Url + "/mn_productdetail.aspx?productid=" + model.ProductID, "m_" + model.ProductID + ".html");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_allproductdetail_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            try
            {
                BLL.Artisan bll = new BLL.Artisan();
                List<Model.Artisan> lstArt = bll.GetArtisanList("", 1000);
                foreach (Model.Artisan model in lstArt)
                {
                    MakePage(Url + "/mn_famousdetail.aspx?artisanid=" + model.artisanID, "m_art" + model.artisanID + ".html");
                }
            }
            catch (Exception ex)
            {

                BLL.Log.WriteErrorLog("mn_famousdetail" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_mn_about_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/mn_about.aspx", "mn_about.html");
        }

        protected void btn_OnlyOne_Click(object sender, EventArgs e)
        {
            BLL.Product bll = new BLL.Product();
            try
            {
                List<Model.ProductListView> lstPro = bll.GetProductListNEW("", Convert.ToInt32(txt_Count.Text), "");
                foreach (Model.ProductListView model in lstPro)
                {
                    MakePage(Url + "/product_detail.aspx?productid=" + model.ProductID, model.ProductID + ".html");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_OnlyOne_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_M_onlyProductID_Click(object sender, EventArgs e)
        {
            BLL.Product bll = new BLL.Product();
            try
            {
                List<Model.ProductListView> lstPro = bll.GetProductListNEW("", Convert.ToInt32(txt_MCount.Text), "");
                foreach (Model.ProductListView model in lstPro)
                {
                    MakePage(Url + "/mn_productdetail.aspx?productid=" + model.ProductID, "m_" + model.ProductID + ".html");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_M_onlyProductID_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void btn_HD_Click(object sender, EventArgs e)
        {
            try
            {
                MakePage(Url + "/dashi.aspx", "dashi.html");
                MakePage(Url + "/miaosha.aspx", "miaosha.html");
                MakePage(Url + "/guzhe.aspx", "guzhe.html");
                MakePage(Url + "/hdzc.aspx", "hdzc.html");
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("btn_HD_Click" + ex.Message, DateTime.Now);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MakePage(Url + "/M0/Tt01/01A1.aspx", "M0/Tt01/01A1.html");
        }
    }
}