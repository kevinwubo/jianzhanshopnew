using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class m_school_list : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();

        public List<Model.articleView> ModelArticle = null;//新闻资讯	3条
        public string Title = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Title =Server.UrlDecode( Request.QueryString["title"]);
            if (!IsPostBack)
            {
                ModelArticle = bllArt.GetArticleList(" and  b.title='" + Title + "' ", 30);
            }
        }
    }
}