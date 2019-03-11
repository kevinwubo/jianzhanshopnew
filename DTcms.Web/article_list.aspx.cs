using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.web
{
    public partial class article_list : System.Web.UI.Page
    {
        public BLL.article bllArt = new BLL.article();
        public List<Model.articleView> ModelArticleList = null;
        public List<Model.articleView> ModelArticleHotList = null;//热文排行榜

        public int PageSize = 10;//一页显示10行
        protected int TotalCount=0;//总数
        protected int pageindex;//页数
        public string Keyword = string.Empty;
        private string sqlwhere = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            {
                Keyword = Server.UrlDecode(Request["keyword"]);
                if (!string.IsNullOrEmpty(Keyword))
                {
                    sqlwhere = " and b.title='" + Keyword + "'";
                }
                sqlwhere += " and b.title!='建盏天下'";
                this.pageindex = DTRequest.GetQueryInt("page", 1);
                //pageindex = pageindex == 0 ? 1 : pageindex;
                ModelArticleList = bllArt.GetArticleList(sqlwhere, PageSize, PageSize *( pageindex-1));
                //热文排行榜
                ModelArticleHotList = bllArt.GetArticleList(sqlwhere, 10);
                TotalCount = bllArt.GetTotalCount(sqlwhere);
                //绑定页码
                txtPageNum.Text = this.PageSize.ToString();
                string pageUrl = Utils.CombUrlTxt("article_list.aspx", "keyword={0}&page={1}", Server.UrlEncode(this.Keyword), "__id__");
                PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 8);
            }
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {
            int _pagesize;
            if (int.TryParse(txtPageNum.Text.Trim(), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    Utils.WriteCookie("article_page_size", _pagesize.ToString(), 43200);
                }
            }
            Response.Redirect(Utils.CombUrlTxt("article_list.aspx", "keywords={0}&page={1}", this.Keyword, "__id__"));
        }
    }
}