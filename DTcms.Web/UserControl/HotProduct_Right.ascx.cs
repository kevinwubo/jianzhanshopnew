using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.UserControl
{
    public partial class HotProduct_Right : System.Web.UI.UserControl
    {
        private BLL.Product bll = new BLL.Product();
        public List<Model.Product> ModelProList = null;
        private string sqlwhere = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            sqlwhere = "  ";
            ModelProList = bll.GetProductList(sqlwhere, 4);
        }
    }
}