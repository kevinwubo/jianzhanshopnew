using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DTcms.Web.web
{
    public partial class article_detail : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();
        private BLL.Product bllPro = new BLL.Product();
        public BLL.article_category acate = new BLL.article_category();
        public Model.article Model = null;
        public List<Model.articleView> ModelArticleList = null;
        public Model.Product ModelPro = null;
        private string articleid = string.Empty;

        private BLL.QRCode bllQR = new BLL.QRCode();//二维码        
        public Model.QRCode QRCodeModel = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                articleid = Request["articleid"];
                Model = bllArt.GetModel(Convert.ToInt32(articleid));
                ModelArticleList = bllArt.GetArticleList("", 16);

                QRCodeModel = bllQR.GetModelList(" and QRLocation='新闻详情页'");
                #region 随机产品信息
                Random ObjRandom = new Random();

                int ID = bllPro.GetMaxProductID() - ObjRandom.Next(10);
                ModelPro = bllPro.GetModel(ID, "");
                if (ModelPro == null)//补偿机制 没有取到数据
                {
                    ID = bllPro.GetMaxProductID() - ObjRandom.Next(3);
                    ModelPro = bllPro.GetModel(ID, "");
                }
                #endregion

            }
        }
        public static string NoHTML(string Htmlstring)
        {
            if (string.IsNullOrEmpty(Htmlstring))
            {
                return "";
            }
            //删除脚本   
            Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
            //删除HTML   
            Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);

            Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", "   ", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);

            Htmlstring.Replace("<", "");
            Htmlstring.Replace(">", "");
            Htmlstring.Replace("\r\n", "");
            Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();

            return Htmlstring.Length > 150 ? Htmlstring.Substring(0, 149) : Htmlstring;
        }
    }
}