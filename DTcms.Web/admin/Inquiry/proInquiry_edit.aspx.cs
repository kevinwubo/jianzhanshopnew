using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_edit : System.Web.UI.Page
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        protected string channel_name = string.Empty; //频道名称
        protected int channel_id;
        private int id = 0;
        private string page = string.Empty;
        public string keywords = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = DTRequest.GetQueryString("action");
            page = DTRequest.GetQueryString("page");
            keywords = DTRequest.GetQueryString("keywords");
            if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
            {
                this.id = DTRequest.GetQueryInt("channel_id");
                this.action = DTEnums.ActionEnum.Edit.ToString();//修改类型
            }
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
                {                    
                    this.channel_id = DTRequest.GetQueryInt("channel_id");
                    CreateOtherField(this.channel_id); //动态生成相应的扩展字段
                }
            }
        }


        public void CreateOtherField(int ppid)
        {
            BLL.manager bll_Man = new BLL.manager();
            DataSet ds = bll_Man.GetList(0, " role_id in(4,6) and is_lock=0", " id ");
            this.ddl_SaleUsers.Items.Clear();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string Id = dr["id"].ToString();
                string Title = dr["real_name"].ToString().Trim();
                this.ddl_SaleUsers.Items.Add(new ListItem(Title, Id));
                
            }

            Model.proInquiry model = new Model.proInquiry();
            BLL.proInquiry bll = new BLL.proInquiry();
            model = bll.GetModelList(ppid, "");
            if (model != null)
            {
                txt_ProductName.Text = model.ProductID;//产品名称
                txt_telphone.Text = model.telphone;//电话
                txt_WebChartID.Text = model.WebChartID;//身份证号
                txt_InquiryContent.Text = model.InquiryContent;//
                txt_CustomerName.Text = model.CustomerName;
                txt_CommentContent.Text = model.CommentContent;
                rad_ProcessingState.SelectedValue = model.ProcessingState;//
                //txt_ProcessingTime.Text = model.ProcessingTime;//
                txt_Provence.Text = model.Provence;//
                txt_City.Text = model.City;//
                txt_TraceContent.Text = model.TraceContent;//
                ddl_SaleUsers.SelectedValue = model.OperatorID;
                rad_TraceState.SelectedValue = model.TraceState;//
                txt_NextVisitTime.Text =model.NextVisitTime.ToShortDateString().Contains("000")?DateTime.Now.ToString("yyyy-MM-dd"): model.NextVisitTime.ToString("yyyy-MM-dd");//
            }
        }
        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            Model.proInquiry model = new Model.proInquiry();
            model.ProductID = txt_ProductName.Text;//产品名称
            model.telphone = txt_telphone.Text;//电话
            model.WebChartID = txt_WebChartID.Text;//身份证号
            model.InquiryContent = txt_InquiryContent.Text;//
            model.CommentContent = txt_CommentContent.Text;
            model.ProcessingState = rad_ProcessingState.SelectedValue;//
            //txt_ProcessingTime.Text = model.ProcessingTime;//
            model.Provence = txt_Provence.Text;//
            model.City = txt_City.Text;//
            model.TraceContent = txt_TraceContent.Text;//
            model.TraceState = rad_TraceState.SelectedValue;//
            model.NextVisitTime = Convert.ToDateTime(txt_NextVisitTime.Text);
            model.CustomerName = txt_CustomerName.Text;
            model.OperatorID = ddl_SaleUsers.SelectedValue;
            model.PPId = _id;
            BLL.proInquiry bll = new BLL.proInquiry();
            return bll.Update(model);
        }
        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
            {
                //ChkAdminLevel("channel_" + this.channel_name + "_list", DTEnums.ActionEnum.Edit.ToString()); //检查权限
                if (string.IsNullOrEmpty(rad_TraceState.SelectedValue))
                {
                    JscriptMsg("请确认跟踪状态！", "", "Error");
                    return;
                }

                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("修改信息成功！", "proInquiry_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }       
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
    }
}