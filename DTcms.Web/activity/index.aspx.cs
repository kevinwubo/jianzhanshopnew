using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.activity
{
    public partial class index : BasePage
    {
        public string Source = "";
        public string XJTime = "";
        public string XJStr = "";
        public string MJTime = "";
        public string MJStr = "";
        public string DSTime = "";
        public string DSStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Source = Request["source"];

            if (string.IsNullOrEmpty(Source))
            {
                Source = "xiamen";
            }

            if (DateTime.Now > DateTime.Parse(StartTime10))
            {
                XJTime = EndTime11;
                XJStr = "距结束";
            }
            else
            {
                XJTime = StartTime10;
                XJStr = "距开始";
            }


            if (DateTime.Now > DateTime.Parse(StartTime11))
            {
                MJTime = EndTime12;
                MJStr = "距结束";
            }
            else
            {
                MJTime = StartTime11;
                MJStr = "距开始";
            }

            if (DateTime.Now > DateTime.Parse(StartTime12))
            {
                DSTime = EndTime13;
                DSStr = "距结束";
            }
            else
            {
                DSTime = StartTime12;
                DSStr = "距开始";
            }
        }
    }
}