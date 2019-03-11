using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.UserControl
{
    public partial class M_Mask : System.Web.UI.UserControl
    {
        private BLL.QRCode bllQR = new BLL.QRCode();//二维码    
        public Model.QRCode QRCodeModel = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            QRCodeModel = bllQR.GetModelList(" and QRLocation='留言框'");
        }
    }
}