using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class m_school : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();

        public List<Model.articleView> ModelArticleXWZX = null;//新闻资讯	3条
        public List<Model.articleView> ModelArticlePMHQ = null;//拍卖行情	3条
        public List<Model.articleView> ModelArticleJZGY = null;//建盏工艺	3条
        public List<Model.articleView> ModelArticleBKZS = null;//百科知识	3条
        public List<Model.articleView> ModelArticleXZJQ = null;//选盏技巧	3条
        public List<Model.articleView> ModelArticleWHLS = null;//文化历史	3条
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelArticleXWZX = bllArt.GetArticleList(" and  b.title='新闻资讯' ", 3);
                ModelArticlePMHQ = bllArt.GetArticleList(" and  b.title='拍卖行情' ", 3);
                ModelArticleJZGY = bllArt.GetArticleList(" and  b.title='建盏工艺' ", 3);
                ModelArticleBKZS = bllArt.GetArticleList(" and  b.title='百科知识' ", 3);
                ModelArticleXZJQ = bllArt.GetArticleList(" and  b.title='选盏技巧' ", 3);
                ModelArticleWHLS = bllArt.GetArticleList(" and  b.title='文化历史' ", 3);
            }
        }
    }
}