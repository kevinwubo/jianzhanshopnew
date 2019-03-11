using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Text;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_history_list : Web.UI.ManagePage
    {
        public BLL.proInquiry bllIn = new BLL.proInquiry();
        protected int totalCount;
        public int page;
        protected int pageSize;
        protected string keywords = string.Empty;
        protected string prolistview = string.Empty;
        public Model.manager Manager_Model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = DTRequest.GetQueryString("keywords");
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            this.pageSize = GetPageSize(20); //每页数量
            this.prolistview = Utils.GetCookie("article_list_view"); //显示方式
            if (!Page.IsPostBack)
            {
                 //ChkAdminLevel("site_channel_category", DTEnums.ActionEnum.View.ToString()); //检查权限
                RptBind(CombSqlTxt(this.keywords), "ppID asc");
            }
        }

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and telphone like '%" + keywords + "%' ");
            }
            return strTemp.ToString();
        }
        #endregion

        #region 返回每页数量=============================
        private int GetPageSize(int _default_size)
        {
            int _pagesize;
            if (int.TryParse(Utils.GetCookie("channel_category_page_size"), out _pagesize))
            {
                if (_pagesize > 0)
                {
                    return _pagesize;
                }
            }
            return _default_size;
        }
        #endregion

        private void RptBind(string _strWhere, string _orderby)
        {
            this.page = DTRequest.GetQueryInt("page", 1);
            this.txtKeywords.Text = this.keywords;
            BLL.proInquiry bll = new BLL.proInquiry();

            //4 销售用户组 5 编辑用户组
            if (Manager_Model.role_id == 4 || Manager_Model.role_id == 5 || Manager_Model.role_id == 6)
            {
                _strWhere = " and OperatorID =" + Manager_Model.id;
            }

            this.rptList.DataSource = bll.GetList_History(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("proInquiry_history_list.aspx", "keywords={0}&page={1}", this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("proInquiry_history_list.aspx", "keywords={0}", this.txtKeywords.Text.Trim()));
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
}