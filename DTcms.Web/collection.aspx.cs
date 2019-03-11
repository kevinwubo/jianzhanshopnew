using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Text.RegularExpressions;

namespace DTcms.Web
{
    public partial class Collection : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        public List<Model.Product> ModelProList = null;
        private BLL.QRCode bllQR = new BLL.QRCode();//二维码        
        public Model.QRCode QRCodeModel = null;

        public int PageSize = 9;//一页显示9行
        protected int TotalCount;//总数
        protected int pageindex;//页数
        private string SqlWhere = string.Empty;
        public string KEYWORD = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ModelProList = bll.GetProductList("", 9);
            QRCodeModel = bllQR.GetModelList(" and QRLocation='收藏阁首页'");
            SqlWhere = " and MarketPrice>5000";
            TotalCount = bll.GetTotalCount(SqlWhere);
            this.pageindex = DTRequest.GetQueryInt("page", 1);
            //pageindex = pageindex == 0 ? 1 : pageindex;
            ModelProList = bll.GetProductList(SqlWhere, PageSize, (pageindex - 1) * PageSize);
            //绑定页码
            txtPageNum.Text = this.PageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("collection.aspx", "keywords={0}&page={1}", "", "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 8);
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

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

            return Htmlstring.Length > 50 ? Htmlstring.Substring(0, 49) : Htmlstring;
        }
    }
}