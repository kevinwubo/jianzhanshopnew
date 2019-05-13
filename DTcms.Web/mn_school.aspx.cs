using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web
{
    public partial class mn_school : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();
        public int PageSize = 12;//一页显示18条
        protected int TotalCount;//总数
        protected int pageindex;//页数
        public List<Model.articleView> ModelArticle = null;//新闻资讯	3条
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            {
                string title = Request["title"] != null ? Request["title"] : "xwzx";
                if (title.Equals("xwzx"))
                {
                    title = "新闻资讯";
                }
                else if (title.Equals("pmhq"))
                {
                    title = "拍卖行情";
                }
                else if (title.Equals("jzgy"))
                {
                    title = "建盏工艺";
                }
                else if (title.Equals("bkzs"))
                {
                    title = "百科知识";
                }
                else if (title.Equals("jzjq"))
                {
                    title = "选盏技巧";
                }
                else if (title.Equals("whls"))
                {
                    title = "文化历史";
                }
                else
                {
                    title = "新闻资讯";
                }

                string sqlwhere = " and  b.title='" + title + "' ";

                //ModelArticle = bllArt.GetArticleList(sqlwhere, 0);

                this.pageindex = DTRequest.GetQueryInt("page", 1);
                TotalCount = bllArt.GetTotalCount(sqlwhere);
                ModelArticle = bllArt.GetArticleList(sqlwhere, PageSize, (pageindex - 1) * PageSize, "", (pageindex - 1));

                //绑定页码
                //txtPageNum.Text = this.PageSize.ToString();
                string pageUrl = Utils.CombUrlTxt("mn_school.aspx", "?title={0}&page={1}", title, "__id__");
                PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 4);
            }
        }
    }
}