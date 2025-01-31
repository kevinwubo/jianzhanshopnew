﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Text;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_list : Web.UI.ManagePage
    {
        public BLL.proInquiry bllIn = new BLL.proInquiry();
        protected int totalCount;
        public int page;
        protected int pageSize;
        protected string keywords = string.Empty;
        protected string TraceState = string.Empty;
        protected string prolistview = string.Empty;
        public Model.manager Manager_Model = null;
        public int DistinctCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = DTRequest.GetQueryString("keywords");
            this.TraceState = DTRequest.GetQueryString("TraceState");
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            this.pageSize = GetPageSize(20); //每页数量
            this.prolistview = Utils.GetCookie("article_list_view"); //显示方式
            if (!Page.IsPostBack)
            {
                ddl_TraceState.SelectedValue = TraceState;
                 //ChkAdminLevel("site_channel_category", DTEnums.ActionEnum.View.ToString()); //检查权限
                RptBind(CombSqlTxt(this.keywords, this.TraceState), "ppID desc");
            }
        }

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords,string TraceState)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and (telphone like '%" + keywords.Trim() + "%' or telphone like '%" + DESEncrypt.ConvertBy123(keywords.Trim()) + "%' or telphone='" + DESEncrypt.ConvertBy123(keywords.Trim()) + "' or c.real_name='" + keywords.Trim() + "')");
            }
            if (!string.IsNullOrEmpty(TraceState))
            {
                strTemp.Append(" and TraceState='" + TraceState + "'");
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
            if (Manager_Model.role_id == 4 || Manager_Model.role_id == 5 || Manager_Model.role_id == 6 || Manager_Model.role_id == 8)
            {

                _strWhere += "  and a.OperatorID =" + Manager_Model.id;
            }            
            DistinctCount = bll.GetDistinctTelphoneCount(_strWhere);
            _strWhere += " and datastatus=0";
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("proInquiry_list.aspx", "keywords={0}&page={1}&TraceState={2}", this.keywords, "__id__", this.TraceState);
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            int sucCount = 0; //成功数量
            int errorCount = 0; //失败数量
            BLL.proInquiry bll = new BLL.proInquiry();
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
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", "proInquiry_list.aspx", "Success");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("proInquiry_list.aspx", "keywords={0}&TraceState={1}", this.txtKeywords.Text.Trim(),ddl_TraceState.SelectedValue));
        }

        #region JS提示============================================
        /// <summary>
        /// 添加编辑删除提示
        /// </summary>
        /// <param name="msgtitle">提示文字</param>
        /// <param name="url">返回地址</param>
        /// <param name="msgcss">CSS样式</param>
        protected void JscriptMsg(string msgtitle, string url, string msgcss)
        {
            string msbox = "parent.jsprint(\"" + msgtitle + "\", \"" + url + "\", \"" + msgcss + "\")";
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "JsPrint", msbox, true);
        }
        /// <summary>
        /// 带回传函数的添加编辑删除提示
        /// </summary>
        /// <param name="msgtitle">提示文字</param>
        /// <param name="url">返回地址</param>
        /// <param name="msgcss">CSS样式</param>
        /// <param name="callback">JS回调函数</param>
        protected void JscriptMsg(string msgtitle, string url, string msgcss, string callback)
        {
            string msbox = "parent.jsprint(\"" + msgtitle + "\", \"" + url + "\", \"" + msgcss + "\", " + callback + ")";
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "JsPrint", msbox, true);
        }
        #endregion

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_Into_History_Click(object sender, EventArgs e)
        {
            int sucCount = 0; //成功数量
            int errorCount = 0; //失败数量
            BLL.proInquiry bll = new BLL.proInquiry();
            for (int i = 0; i < rptList.Items.Count; i++)
            {
                int id = Convert.ToInt32(((HiddenField)rptList.Items[i].FindControl("hidId")).Value);
                CheckBox cb = (CheckBox)rptList.Items[i].FindControl("chkId");
                if (cb.Checked)
                {
                    if (bll.DeleteAndHistory(id))
                    {
                        sucCount++;
                    }
                    else
                    {
                        errorCount++;
                    }
                }
            }
            JscriptMsg("移动到释放库" + sucCount + "条，失败" + errorCount + "条！", "proInquiry_list.aspx", "Success");
        }

        protected void ddl_TraceState_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("proInquiry_list.aspx", "keywords={0}&TraceState={1}", this.txtKeywords.Text.Trim(), ddl_TraceState.SelectedValue));
        }

        
    }
}