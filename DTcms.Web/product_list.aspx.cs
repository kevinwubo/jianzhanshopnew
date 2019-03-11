using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.web
{
    public partial class product_list : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        public BLL.Artisan bllArtisan = new BLL.Artisan(); 
        public List<Model.Product> ModelProList = null;
        public int PageSize = 12;//一页显示12行
        protected int TotalCount = 101;//总数
        protected int pageindex;//页数
        string sqlwhere = "";
        public string KEYWORD = string.Empty;
        public string strType1 = string.Empty;
        public string strType2 = string.Empty;
        public string strType3 = string.Empty;
        public string strType5 = string.Empty;
        public string strType6 = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            {
                KEYWORD = Request["keyword"];
                //if (!string.IsNullOrEmpty(KEYWORD))//首页搜索
                //{
                //    sqlwhere = " and ProductName like '%" + KEYWORD + "%' or Author like '%" + KEYWORD + "%'";
                //}

                //strType1 =Server.UrlDecode( Request["Type1"]);
                //strType2 = Server.UrlDecode(Request["Type2"]);
                //strType3 =Server.UrlDecode( Request["Type3"]);
                //strType5 = Server.UrlDecode(Request["Type5"]);
                //strType6 = Server.UrlDecode(Request["Type6"]);
                //if (!string.IsNullOrEmpty(strType1))//名家品牌
                //{
                //    sqlwhere = " and Type1='" + strType1 + "'";
                //    KEYWORD = strType1;
                //}
                //if (!string.IsNullOrEmpty(strType2))//工艺釉色
                //{
                //    sqlwhere = " and Type2='" + strType2 + "'";
                //    KEYWORD = strType2;
                //}
                //if (!string.IsNullOrEmpty(strType3))//经典器型
                //{
                //    sqlwhere = " and Type3='" + strType3 + "'";
                //    KEYWORD = strType3;
                //}
                //if (!string.IsNullOrEmpty(strType5))//功能用途
                //{
                //    sqlwhere = " and Type5='" + strType5 + "'";
                //    KEYWORD = strType5;
                //}
                //if (!string.IsNullOrEmpty(strType6))//传世老盏
                //{
                //    sqlwhere = " and Type6='" + strType6 + "'";
                //    KEYWORD = strType6;
                //}
                //this.pageindex = DTRequest.GetQueryInt("page", 1);
                ////pageindex = pageindex == 0 ? 1 : pageindex;
                //ModelProList = bll.GetProductList(sqlwhere, PageSize, (pageindex - 1) * PageSize);
                //TotalCount = bll.GetTotalCount(sqlwhere);
                //this.pageindex = DTRequest.GetQueryInt("page", 1);
                //pageindex = pageindex == 0 ? 1 : pageindex;
                ////绑定页码
                ////txtPageNum.Text = this.PageSize.ToString();
                //string pageUrl = Utils.CombUrlTxt("product_list.aspx", "keywords={0}&page={1}", "", "__id__");
                ////PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 8);
            }
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }
    }
}