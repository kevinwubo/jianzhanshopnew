using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.ajax
{
    public partial class wxcode : System.Web.UI.Page
    {
        private BLL.CodeS bllCodes = new BLL.CodeS();
        string WXCode = "13163806316";
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DateTime dt = DateTime.Now;
                int week= Convert.ToInt32(dt.DayOfWeek);

                string codes = bllCodes.GetModel("and Code='WXChartList' ").CodeValues;
                if (!string.IsNullOrEmpty(codes))
                {
                    string[] codeStr = codes.Split(',');
                    week = week == 0 ? 7 : week;
                    if (codeStr.Length < week)
                    {
                        WXCode = codeStr[0];
                    }
                    else
                    {
                        WXCode = codeStr[week - 1];
                    }
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteTextLog("--wxcode-exception" + ex, DateTime.Now);
                WXCode = "13163806316";
            }
            Response.Write(WXCode);
        }
    }
}