using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Text;

namespace DTcms.Web.admin.artisan
{
    public partial class artisan_list : Web.UI.ManagePage
    {
        protected int totalCount;
        public int page;
        protected int pageSize;
        protected string keywords = string.Empty;
        protected string prolistview = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = DTRequest.GetQueryString("keywords");

            this.pageSize = GetPageSize(12); //每页数量
            this.prolistview = Utils.GetCookie("article_list_view"); //显示方式
            if (!Page.IsPostBack)
            {
                //ChkAdminLevel("site_channel_category", DTEnums.ActionEnum.View.ToString()); //检查权限
                RptBind(CombSqlTxt(this.keywords), " Sort ");
            }
        }

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and (artisanName like  '%" + _keywords + "%' or artisanType like '%" + _keywords + "%' or artisanTitle like '%" + _keywords + "%')");
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
            BLL.Artisan bll = new BLL.Artisan();
            this.rptList.DataSource = bll.GetListTop(this.pageSize, this.page - 1, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("artisan_list.aspx", "keywords={0}&page={1}", this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
            int sucCount = 0; //成功数量
            int errorCount = 0; //失败数量
            BLL.Artisan bll = new BLL.Artisan();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (bll.Delete(id))
                    {
                        sucCount++;
                    }
                    else
                    {
                        errorCount++;
                    }
                }
            }
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", "artisan_list.aspx", "Success");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("artisan_list.aspx", "keywords={0}", this.txtKeywords.Text.Trim()));
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

    //    protected void ddl_IsCooperation_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        Response.Redirect(Utils.CombUrlTxt("artisan_list.aspx", "keywords={0}&IsCooperation={1}",
    //this.keywords, ddl_IsCooperation.SelectedValue));
    //    }
    }
}