using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class dashi : System.Web.UI.Page
    {
        public List<Model.Product> ModelListArtisan1 = null;
        public List<Model.Product> ModelListArtisan2 = null;
        public List<Model.Product> ModelListArtisan3 = null;
        public List<Model.Product> ModelListArtisan4 = null;
        public List<Model.Product> ModelListArtisan5 = null;
        public List<Model.Product> ModelListArtisan6 = null;
        public List<Model.Product> ModelListArtisan7 = null;
        public List<Model.Product> ModelListArtisan8 = null;
        public List<Model.Product> ModelListArtisan9 = null;
        private BLL.CodeS bllCodes = new BLL.CodeS();
        public BLL.Product bll = new BLL.Product();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelListArtisan1 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan1'").CodeValues + ")", 0);
                ModelListArtisan2 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan2'").CodeValues + ")", 0);
                ModelListArtisan3 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan3'").CodeValues + ")", 0);
                ModelListArtisan4 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan4'").CodeValues + ")", 0);
                ModelListArtisan5 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan5'").CodeValues + ")", 0);
                ModelListArtisan6 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan6'").CodeValues + ")", 0);
                ModelListArtisan7 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan7'").CodeValues + ")", 0);
                ModelListArtisan8 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan8'").CodeValues + ")", 0);
                ModelListArtisan9 = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='Artisan9'").CodeValues + ")", 0);
            }
        }
    }
}