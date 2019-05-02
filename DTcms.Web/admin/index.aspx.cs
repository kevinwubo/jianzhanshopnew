using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using DTcms.BLL;

namespace DTcms.Web.admin
{
    public partial class index : Web.UI.ManagePage
    {
        protected Model.manager admin_info;
        private proInquiry probll = new proInquiry();
        public string tips = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                admin_info = GetAdminInfo();
                int count = probll.GetCountByCurrentDay(admin_info.id, DateTime.Now.ToShortDateString(), DateTime.Now.ToShortDateString());
                tips = admin_info.real_name + ":当日新咨询量【" + count + "】";

                int countmonth = probll.GetCountByCurrentDay(admin_info.id, DateTime.Now.ToShortDateString(), DateTime.Now.ToShortDateString());
                tips += "=>当月总新咨询量【" + countmonth + "】";
            }
        }

        //安全退出
        protected void lbtnExit_Click(object sender, EventArgs e)
        {
            Session[DTKeys.SESSION_ADMIN_INFO] = null;
            Utils.WriteCookie("AdminName", "DTcms", -14400);
            Utils.WriteCookie("AdminPwd", "DTcms", -14400);
            Response.Redirect("../jianzhan258/login.aspx");
        }

    }
}