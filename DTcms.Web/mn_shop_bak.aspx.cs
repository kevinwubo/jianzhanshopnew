using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using DTcms.BLL;
using System.Text;

namespace DTcms.Web
{
    public partial class mn_shop_bak : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        public BLL.Artisan bllArtisan = new BLL.Artisan();
        public List<Model.Product> ModelProList = null;
        private string sqlwhere = string.Empty;
        private string desc = string.Empty;
        private string KEYWORD = string.Empty;

        public int PageSize = 12;//一页显示18条
        protected int TotalCount;//总数
        protected int pageindex;//页数
        public string artisanName = "";
        public string Type4 = "";
        public string Type2 = "";
        public string Type3 = "";
        public string Type7 = "";
        public string artisanType = "";
        public string typeModel = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                KEYWORD = Server.UrlDecode((Request["keyword"]));
                artisanType = Request.QueryString["artisanType"];
                artisanName = Request.QueryString["name"];
                Type2 = Request.QueryString["Type2"];
                Type3 = Request.QueryString["Type3"];
                Type4 = Request.QueryString["Type4"];
                Type7 = Request.QueryString["Type7"];
                typeModel = Request.QueryString["typeModel"];
                string orderBy = " InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";

                if (!string.IsNullOrEmpty(artisanType))
                {
                    List<Model.Artisan> lstArtL = bllArtisan.GetArtisanList(" and artisanType='" + artisanType + "' ");
                    StringBuilder sb = new StringBuilder(); 
                    foreach (Model.Artisan item in lstArtL)
                    {
                        sb.Append("'" + item.artisanName + "',");
                    }

                    sqlwhere = " and Author in(" + sb.ToString().TrimEnd(',') + ")";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }

                if (!string.IsNullOrEmpty(artisanName))
                {
                    sqlwhere = " and Author='" + artisanName + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }

                if (!string.IsNullOrEmpty(Type2))
                {
                    sqlwhere = " and Type2='" + Type2 + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }

                if (!string.IsNullOrEmpty(Type3))
                {
                    sqlwhere = " and Type3='" + Type3 + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }

                if (!string.IsNullOrEmpty(Type4))
                {
                    sqlwhere = " and Type4='" + Type4 + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }
                if (!string.IsNullOrEmpty(Type7))
                {
                    sqlwhere = " and Type7='" + Type7 + "'";
                    orderBy = "  a.Adddate desc,InventoryCount desc, (select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1)";
                }

                if (!string.IsNullOrEmpty(KEYWORD) && KEYWORD != "null")//首页搜索
                {
                    sqlwhere = " and ProductID='" + KEYWORD + "' or ProductName like '%" + KEYWORD + "%' or Author like '%" + KEYWORD + "%' or Type2 like '" + KEYWORD + "' or Type3 like '" + KEYWORD + "' or Type4 like '" + KEYWORD + "' or Type5 like '" + KEYWORD + "'";
                }

                if (!string.IsNullOrEmpty(typeModel))
                {
                    if (typeModel.Equals("new"))
                    {
                        orderBy = " a.Adddate desc";
                    }
                    if (typeModel.Equals("type2"))
                    {
                        sqlwhere += " and Type2 in('兔毫','油滴/鹧鸪斑','曜变','乌金釉','杂色釉/异毫')";
                    }
                    if (typeModel.Equals("type3"))
                    {
                        sqlwhere += " and Type3 in('束口盏','灯盏','敞口盏/斗笠','撇口盏','敛口盏','钵型盏')";
                    }
                }

                sqlwhere += " and InventoryCount>=0";
                this.pageindex = DTRequest.GetQueryInt("page", 1);
                TotalCount = bll.GetTotalCount(sqlwhere);
                ModelProList = bll.GetProductList(sqlwhere, PageSize, (pageindex - 1) * PageSize, orderBy, (pageindex - 1));

                //绑定页码
                //txtPageNum.Text = this.PageSize.ToString();
                string pageUrl = Utils.CombUrlTxt("mn_shop.aspx", "?keywords={0}&page={1}&name={2}", "", "__id__", artisanName);
                PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 4);
            }
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }
    }
}