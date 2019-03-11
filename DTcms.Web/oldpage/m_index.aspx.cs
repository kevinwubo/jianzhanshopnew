using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class m_index : System.Web.UI.Page
    {
        public List<Model.Product> ModelListA1 = null;//最新匠作
        public List<Model.Product> ModelListA2 = null;//名师匠作
        private BLL.Product bll = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("http://jianzhanshop.com/m_index.html", false);
            if (!IsPostBack)
            {
                //ModelListA1 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='MSY_ZXJZ'").CodeValues + ")", 6);

                //ModelListA2 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='MSY_MSJZ'").CodeValues + ")", 6);
            }
        }
    }
}