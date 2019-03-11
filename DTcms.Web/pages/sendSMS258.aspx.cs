using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;

namespace DTcms.Web.pages
{
    public partial class sendSMS258 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            string teles = txt_telephones.Text;
            string success = "";
            string fail = "";
            if (teles != null)
            {
                string[] telesss = teles.Split(',');
                if (telesss != null)
                {
                    foreach (string str in telesss)
                    {
                        if (!string.IsNullOrEmpty(str) && str.Length == 11)
                        {
                            SMSHelper.SeedSMS(str, txt_message.Text);
                            success += str + ",";
                        }
                        else
                        {
                            fail += str + ",";
                        }
                    }
                }
            }
            txt_result.Text = "发送成功：" + success + "====发送失败：" + fail;
        }
    }
}