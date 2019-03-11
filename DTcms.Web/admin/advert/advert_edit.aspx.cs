using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data;
using DTcms.Web.UI;

namespace DTcms.Web.admin.advert
{
    public partial class advert_edit : ManagePage
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

        public void CreateOtherField(int advertID)
        {

            Model.advert model = new Model.advert();
            BLL.advert bll = new BLL.advert();
            model = bll.GetModelList(" and advertID='" + advertID + "' ");
            if (model != null)
            {
                txt_advertTitle.Text = model.advertTitle;
                txt_advertUrl.Text = model.advertUrl;
                ddl_advertPosition.SelectedValue = model.advertPosition;                
                txt_imageUrl.Text = model.imageUrl;                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (action == DTEnums.ActionEnum.Edit.ToString()) //修改
            {
                if (!DoEdit(this.id))
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("修改信息成功！", "advert_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }
            else //添加
            {
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加信息成功！", "advert_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }
        }

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.advert model = new Model.advert();
            BLL.advert bll = new BLL.advert();
            model.advertTitle=txt_advertTitle.Text;
            model.advertUrl = txt_advertUrl.Text;
            model.advertPosition = ddl_advertPosition.SelectedValue;
            model.advertPositionText = ddl_advertPosition.SelectedItem.Text;
            model.imageUrl = txt_imageUrl.Text;
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
            Model.advert model = new Model.advert();
            BLL.advert bll = new BLL.advert();
            model.advertTitle = txt_advertTitle.Text;
            model.advertUrl = txt_advertUrl.Text;
            model.advertPosition = ddl_advertPosition.SelectedValue;
            model.advertPositionText = ddl_advertPosition.SelectedItem.Text;
            model.imageUrl = txt_imageUrl.Text;
            model.advertID = _id;
            return bll.Update(model);
        }
        #endregion
    }
}