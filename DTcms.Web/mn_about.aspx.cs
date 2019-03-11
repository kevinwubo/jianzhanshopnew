using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class mn_about : System.Web.UI.Page
    {
        public List<Model.Product> ModelListHOT = null;//热卖产品 9个
        public BLL.Product bll = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();
        public static string Type = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Type = Request["type"];
            ModelListHOT = bll.GetProductList("  and ProductID in(" + bllCodes.GetModel(" and Code='MSY_MSJZ'").CodeValues + ") ", 9);
        }
    }
}