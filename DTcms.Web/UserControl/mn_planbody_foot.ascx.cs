using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.UserControl
{
    public partial class mn_planbody_foot : System.Web.UI.UserControl
    {
        BLL.QRCode bll = new BLL.QRCode();
        public string TELEPHONE = "13163806316";
        protected void Page_Load(object sender, EventArgs e)
        {
            Model.QRCode model = bll.GetModelList("");
            if (model != null)
            {
                TELEPHONE = model.SalesPhone;
            }
        }
    }
}