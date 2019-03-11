using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.publiccode
{
    public partial class qrcode_edit : Web.UI.ManagePage
	{
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        protected string channel_name = string.Empty; //频道名称
        protected int channel_id;
        private int id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string _action = DTRequest.GetQueryString("action");
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

        public void CreateOtherField(int ID)
        {
            Model.QRCode model = new Model.QRCode();
            BLL.QRCode bll = new BLL.QRCode();
            model = bll.GetModelList(" and ID=" + ID);
            if (model != null)
            {
                rad_QRLocation.Text = model.QRLocation;
                txt_HotLine.Text = model.HotLine;
                txt_SalesPhone.Text = model.SalesPhone;
                txt_SalesName.Text = model.SalesName;
                txt_QRImage.Text = model.QRImage;
                txt_Remark.Text = model.Remark;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
            {
                //ChkAdminLevel("channel_" + this.channel_name + "_list", DTEnums.ActionEnum.Edit.ToString()); //检查权限
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("修改信息成功！", "qrcode_list.aspx?channel_id=" + this.channel_id, "Success");
            }
            else //添加
            {
                //ChkAdminLevel("channel_" + this.channel_name + "_list", DTEnums.ActionEnum.Add.ToString()); //检查权限
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加信息成功！", "qrcode_list.aspx?channel_id=" + this.channel_id, "Success");
            }
        }
        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.QRCode model = new Model.QRCode();
            BLL.QRCode bll = new BLL.QRCode();

            model.QRLocation=rad_QRLocation.Text;
            model.HotLine=txt_HotLine.Text  ;
            model.SalesPhone=txt_SalesPhone.Text;
            model.SalesName=txt_SalesName.Text;
            model.QRImage = txt_QRImage.Text;
            model.Remark = txt_Remark.Text;
            //model.UID=
            if (bll.Add(model) > 0)
            {
                result = true;
            }
            return result;
        }
        #endregion

        #region 修改操作=================================
        private bool DoEdit(int _id)
        {
            Model.QRCode model = new Model.QRCode();
            BLL.QRCode bll = new BLL.QRCode();

            model.QRLocation = rad_QRLocation.Text;
            model.HotLine = txt_HotLine.Text;
            model.SalesPhone = txt_SalesPhone.Text;
            model.SalesName = txt_SalesName.Text;
            model.QRImage = txt_QRImage.Text;
            model.Remark = txt_Remark.Text;
            model.ID = _id;
            return bll.Update(model);
        }
        #endregion

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