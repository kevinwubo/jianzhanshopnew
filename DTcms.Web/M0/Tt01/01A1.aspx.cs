using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace DTcms.Web.M0.Tt01
{
    public partial class _01A1 : System.Web.UI.Page
    {
        public List<Model.Product> ModelListNEW = null;//今日新品 9个
        public List<Model.Product> ModelListHOT = null;//热卖产品 9个
        public List<Model.ProductListView> ModelListMJZP = null;//名家作品 9个
        public List<Model.ProductListView> ModelListDSZP = null;//大师作品 9个
        private BLL.Artisan bllArt = new BLL.Artisan();
        public List<Model.Artisan> ModelArticleList = null;//名家推荐
        public BLL.Product bll = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();
        public BLL.Artisan bllArtisan = new BLL.Artisan();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelListNEW = bll.GetProductList(9);
                ModelListHOT = bll.GetProductList(9, 1, " and MarketPrice>5000  ");
                ModelArticleList = bllArt.GetArtisanList(" ", "sort ", 5);

                List<Model.Artisan> lstArtL = bllArtisan.GetArtisanList(" and artisanType='名家工艺师' and IsCooperation=1 ");
                StringBuilder sb = new StringBuilder();
                foreach (Model.Artisan item in lstArtL)
                {
                    sb.Append("'" + item.artisanName + "',");
                }
                string sqlwhere = " and Author in(" + sb.ToString().TrimEnd(',') + ")";
                ModelListMJZP = bll.GetProductList(sqlwhere, 9, " InquiryCount desc,Adddate desc");

                ModelListDSZP = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='MSY_DSSJ'").CodeValues + ") ", 9, " InquiryCount desc,Adddate desc");
            }
        }
    }
}