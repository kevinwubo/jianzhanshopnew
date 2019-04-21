using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class mn_school_bak : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();

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

                

                ModelArticle = bllArt.GetArticleList(" and  b.title='" + title + "' ", 0);
            }
        }
    }
}