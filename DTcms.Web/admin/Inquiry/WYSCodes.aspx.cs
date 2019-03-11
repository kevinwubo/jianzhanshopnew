using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.Inquiry
{
    public partial class WYSCodes : Web.UI.ManagePage
    {
        protected int totalCount;
        public int page;
        protected int pageSize;
        public string keywords = string.Empty;
        private BLL.CodeS bll = new BLL.CodeS();
        private int id = 0;
        private string _action = string.Empty;
        public Model.manager managerInfo = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _action = DTRequest.GetQueryString("action");
            
            this.id = DTRequest.GetQueryInt("channel_id");
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
                {
                    Model.CodeS model = bll.GetModel(" and ID=" + this.id + "  ");
                    if (model != null)
                    {
                        txt_CodeValues.Text = model.CodeValues;
                        ddl_Codes.SelectedValue = model.Code;
                    }
                }
            }
            this.pageSize = GetPageSize(30); //每页数量
            RptBind("  Operatorid=19", "  sort ");
        }

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
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("WYSCodes.aspx", "keywords={0}&page={1}", this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl,8);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Model.CodeS model = new Model.CodeS();
            model.Code = ddl_Codes.SelectedValue;
            model.CodeName = ddl_Codes.SelectedItem.Text;
            model.CodeValues = txt_CodeValues.Text.TrimEnd(',');
            if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
            {
                model.ID = this.id;
                bll.Update(model);
                JscriptMsg("更新成功！", "WYSCodes.aspx", "Success");
            }
            else
            {
                Model.CodeS modeld = bll.GetModel(" and Code='" + ddl_Codes.SelectedValue + "'");
                if (string.IsNullOrEmpty(modeld.Code))
                {
                    bll.Add(model);
                    JscriptMsg("添加成功！", "WYSCodes.aspx", "Success");
                }
                else
                {
                    JscriptMsg("已经存在、不能重复添加！", "WYSCodes.aspx", "Success");
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int sucCount = 0; //成功数量
            int errorCount = 0; //失败数量
            BLL.Product bll = new BLL.Product();
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
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", "WYSCodes.aspx", "Success");
        }
    }
}