using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class guzhe : System.Web.UI.Page
    {
        public List<Model.Product> ModelList1111 = null;//1111元
        public List<Model.Product> ModelList2222 = null;//2222元
        public List<Model.Product> ModelList5555 = null;//5555元
        private BLL.CodeS bllCodes = new BLL.CodeS();
        public BLL.Product bll = new BLL.Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelList1111 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='1111Product'").CodeValues + ")", 0);
                ModelList2222 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='2222Product'").CodeValues + ")", 0);
                ModelList5555 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='5555Product'").CodeValues + ")", 0);
            }
        }
    }
}