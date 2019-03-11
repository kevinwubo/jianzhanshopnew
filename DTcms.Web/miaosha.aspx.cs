using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class miaosha : System.Web.UI.Page
    {
        public List<Model.Product> ModelListMS = null;
        private BLL.CodeS bllCodes = new BLL.CodeS();
        public BLL.Product bll = new BLL.Product();
        public Model.Product Model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string values = bllCodes.GetModel(" and Code='ProductIDS'").CodeValues;
                if (!string.IsNullOrEmpty(values))
                {

                    ModelListMS = bll.GetProductList(" and ProductID in(" + values + ")", 0);
                    if (ModelListMS != null && ModelListMS.Count > 0)
                    {
                        Model = ModelListMS[0];
                    }
                }
            }
        }
    }
}