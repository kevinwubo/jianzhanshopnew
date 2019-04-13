using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data;

namespace DTcms.Web.admin.Inquiry
{
    public partial class proInquiry_Add : System.Web.UI.Page
    {
        public Model.manager Manager_Model = null;
        private BLL.proInquiry bll = new BLL.proInquiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                if (Manager_Model != null)
                {
                    lbl_Salename.Text = Manager_Model.real_name;
                }
                else
                {
                    Response.Redirect("../login.aspx", false);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            if (Manager_Model != null)
            {
                Model.proInquiry model = new Model.proInquiry();
                model.telphone = txt_telphone.Text.Trim();
                Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
                model.OperatorID = Manager_Model != null ? Manager_Model.id.ToString() : "";
                model.ProductID = txt_ProductID.Text.Trim();
                model.CustomerName = txt_CustomerName.Text.Trim();
                model.WebChartID = txt_WebChartID.Text.Trim();
                model.InquiryContent = txt_InquiryContent.Text.Trim();
                model.TraceState = rad_TraceState.SelectedValue;
                model.ProcessingState = "1";
                model.status = "Hand";

                if (string.IsNullOrEmpty(rad_TraceState.SelectedValue))
                {
                    JscriptMsg("请确认跟踪状态！", "", "Error");
                }
                else
                {

                    if (!string.IsNullOrEmpty(model.telphone))
                    {
                        if (model.telphone.Length == 11)
                        {

                            DataSet ds = bll.GetRealName(model.telphone);
                            if (ds != null && ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                            {
                                JscriptMsg("手机号：" + model.telphone + "已经关联销售：" + ds.Tables[0].Rows[0]["real_name"].ToString() + "，不能重复添加！", "", "Success");
                            }
                            else
                            {
                                bll.Add(model);
                                JscriptMsg("手动添加咨询量成功！", "", "Success");
                            }
                        }
                        else
                        {
                            JscriptMsg("手机格式不正确！", "", "Success");
                        }
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(model.WebChartID))
                        {
                            int count = bll.GetCountByWCharID(model.WebChartID);
                            if (count > 0)
                            {
                                JscriptMsg("微信号：" + model.WebChartID + "已经添加，不能重复添加！", "", "Success");
                            }
                            else
                            {
                                bll.Add(model);
                                JscriptMsg("手动添加咨询量成功！", "", "Success");
                            }
                        }
                        else
                        {
                            bll.Add(model);
                            JscriptMsg("手动添加咨询量成功！", "", "Success");
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("../login.aspx", false);                
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