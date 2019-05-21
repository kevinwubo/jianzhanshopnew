using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class mn_jdlist : System.Web.UI.Page
    {
        public List<Model.Artisan> listArtisanQXYS = null;//器型 釉色    
        public string type = "";
        public BLL.Artisan bllArtisan = new BLL.Artisan();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                type = Request.QueryString["type"];
                if (!string.IsNullOrEmpty(type))
                {
                    listArtisanQXYS = bllArtisan.GetArtisanList(" and artisanType in('" + type + "') and IsCooperation=1 ");
                }
                else
                {
                    listArtisanQXYS = bllArtisan.GetArtisanList(" and artisanType in('器型','釉色') and IsCooperation=1 ");
                }
            }
        }
    }
}