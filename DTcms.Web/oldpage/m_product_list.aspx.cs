using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web
{
    public partial class m_product_list : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        public BLL.Artisan bllArtisan = new BLL.Artisan();
        public List<Model.Product> ModelProList = null;
        private string sqlwhere = string.Empty;
        private string desc = string.Empty;
        private string KEYWORD = string.Empty;

        public int PageSize = 18;//一页显示18条
        protected int TotalCount;//总数
        protected int pageindex;//页数
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KEYWORD = Server.UrlDecode((Request["keyword"]));
                string artisanName = Request.QueryString["name"];
                string orderBy = " InventoryCount desc, ArtisanSort";
                if (!string.IsNullOrEmpty(artisanName))
                {
                    sqlwhere = " and a.Author='" + artisanName + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, ArtisanSort";
                }

                if (!string.IsNullOrEmpty(KEYWORD) && KEYWORD != "null")//首页搜索
                {
                    sqlwhere = " and ProductID='" + KEYWORD + "' or ProductName like '%" + KEYWORD + "%' or Author like '%" + KEYWORD + "%' or Type2 like '" + KEYWORD + "' or Type3 like '" + KEYWORD + "' or Type4 like '" + KEYWORD + "' or Type5 like '" + KEYWORD + "'";
                }
                sqlwhere += " and InventoryCount>=0";
                this.pageindex = DTRequest.GetQueryInt("page", 1);
                TotalCount = bll.GetTotalCount(sqlwhere);
                ModelProList = bll.GetProductList(sqlwhere, PageSize, (pageindex - 1) * PageSize, orderBy, pageindex);

                //绑定页码
                txtPageNum.Text = this.PageSize.ToString();
                string pageUrl = Utils.CombUrlTxt("m_product_list.aspx", "?keywords={0}&page={1}&name={2}", "", "__id__", artisanName);
                PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 8);
            }
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }
    }
}