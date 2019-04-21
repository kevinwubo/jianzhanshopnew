using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web
{
    public partial class mn_famous_bak : System.Web.UI.Page
    {
        public int PageSize = 8;//一页显示8行
        protected int TotalCount;//总数
        protected int pageindex;//页数
        protected string artisanType = string.Empty;
        private string SqlWhere = string.Empty;
        public string KEYWORD = string.Empty;

        public List<Model.Artisan> ModelArticleList = null;
        private BLL.Artisan bllArt = new BLL.Artisan();
        public BLL.Product bllPro = new BLL.Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            artisanType = Server.UrlDecode(Request["artisanType"]);
            if (!string.IsNullOrEmpty(artisanType))
            {
                KEYWORD = artisanType;
                SqlWhere = " and artisanType='" + artisanType + "'";
            }
            //else
            //{
            //    SqlWhere = " and Sort<11 ";//顺序编号 显示10以内
            //}

            TotalCount = bllArt.GetTotalCount(SqlWhere);
            this.pageindex = DTRequest.GetQueryInt("page", 1);
            pageindex = pageindex == 0 ? 1 : pageindex;
            ModelArticleList = bllArt.GetArtisanList(SqlWhere, PageSize, (pageindex - 1) * PageSize);  
            //绑定页码
            //txtPageNum.Text = this.PageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("mn_famous.aspx", "keywords={0}&page={1}", "", "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 4);
        }
    }
}