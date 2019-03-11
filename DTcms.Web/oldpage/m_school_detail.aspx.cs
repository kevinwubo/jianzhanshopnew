using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class school_detail : System.Web.UI.Page
    {
        private string articleid = string.Empty;
        private BLL.article bllArt = new BLL.article();
        private BLL.Product bllPro = new BLL.Product();
        public Model.article Model = null;
        public List<Model.Product> ModelListNEW = null;//今日新品 6个
        public BLL.article_category acate = new BLL.article_category();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                articleid = Request["articleid"];
                Model = bllArt.GetModel(Convert.ToInt32(articleid));
                ModelListNEW = bllPro.GetProductList(" ", 6);
            }
        }
    }
}