using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.UserControl
{
    public partial class hotProduct_Left : System.Web.UI.UserControl
    {
        private BLL.Product bll = new BLL.Product();
        public List<Model.ProductListView> ModelProList = null;
        private string sqlwhere = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            sqlwhere = "  ";
            ModelProList = bll.GetProductListNEW(sqlwhere, 7, " NEWID()");
        }
    }
}