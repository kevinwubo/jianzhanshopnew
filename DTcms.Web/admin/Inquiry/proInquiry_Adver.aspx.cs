using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_Adver : System.Web.UI.Page
    {
        BLL.proInquiry bll = new BLL.proInquiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.rptList.DataSource = bll.GetInquiryAdver("");
            this.rptList.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.rptList.DataSource = bll.GetInquiryAdver(txtAddTime.Text);
            this.rptList.DataBind();
        }
    }
}