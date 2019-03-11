using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class m_indexn : System.Web.UI.Page
    {
        public List<Model.Product> ModelListNEW = null;//今日新品 6个
        public List<Model.Product> ModelListHOT = null;//热卖产品 6个

        private BLL.Artisan bllArt = new BLL.Artisan();        
        public List<Model.Artisan> ModelArticleList = null;//名家推荐
        public BLL.Product bll = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelListNEW = bll.GetProductList(9);                
                ModelListHOT = bll.GetProductList("  and ProductID in(" + bllCodes.GetModel(" and Code='MSY_MSJZ'").CodeValues + ") ", 10);
                ModelArticleList = bllArt.GetArtisanList(" ", "sort ", 5);
            }
        }
    }
}