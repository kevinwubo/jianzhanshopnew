using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.UserControl
{
    public partial class HotArtisan_Left : System.Web.UI.UserControl
    {
        private BLL.Artisan bllArt = new BLL.Artisan();
        public List<Model.Artisan> ArtisanList = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            ArtisanList = bllArt.GetArtisanList(" and IsPushMall=1 ", " NEWID() ", 4);
        }
    }
}