using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.activity
{
    public partial class TiXing_List : System.Web.UI.UserControl
    {
        public string ProductName{get;set;}
        public string ProductID {get;set;}
        public string Author { get; set; }
        public string Type { get; set; }
        public string Source { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}