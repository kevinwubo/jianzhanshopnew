using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DTcms.Web.web
{
    public partial class artisan_detail : System.Web.UI.Page
    {
        private BLL.Artisan bllArt = new BLL.Artisan();
        private BLL.article bllCle = new BLL.article();
        public BLL.Product bllPro = new BLL.Product();
        public List<Model.Artisan> ModelArtisanList = null;
        public List<Model.Artisan> ModelHotList = null;
        public List<Model.articleView> ModelArticleList = null;//相关资讯
        private string ArtisanID = string.Empty;
        private string ArtisanName = string.Empty;

        private BLL.QRCode bllQR = new BLL.QRCode();//二维码        
        public Model.QRCode QRCodeModel = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArtisanID=Request.QueryString["artisanid"];
                ArtisanName = Server.UrlDecode(Request.QueryString["artisanname"]);
                if (!string.IsNullOrEmpty(ArtisanName))
                {
                    ModelArtisanList = bllArt.GetArtisanList(" and artisanName='" + ArtisanName + "'", 1);//名家名堂
                }
                else
                {
                    ModelArtisanList = bllArt.GetArtisanList(" and ArtisanID='" + ArtisanID + "'", 1);//名家名堂
                }
                ModelHotList = bllArt.GetArtisanList(" and IsPushMall=1 ", " NEWID()", 5);//是否推送到商城

                ModelArticleList = bllCle.GetArticleList("", 20);//相关资讯

                QRCodeModel = bllQR.GetModelList(" and QRLocation='名家名堂详情页'");
            }
        }
        public static string NoHTML(string Htmlstring)
        {
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

            return Htmlstring;
        }
    }
}