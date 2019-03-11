using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_info : System.Web.UI.Page
    {
        BLL.proInquiry bll = new BLL.proInquiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.rptList.DataSource = bll.GetProInquiry("");
                this.rptList.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string datetime = txtAddTime.Text;
            this.rptList.DataSource = bll.GetProInquiry(datetime);
            this.rptList.DataBind();
        }
    }
}