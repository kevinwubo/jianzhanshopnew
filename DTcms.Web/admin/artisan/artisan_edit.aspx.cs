using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.admin.artisan
{
    public partial class addArtisan : System.Web.UI.Page
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        protected string channel_name = string.Empty; //频道名称
        protected int channel_id;
        private int id = 0;
        public string page = string.Empty;
        public string keywords = string.Empty;
        ////页面初始化事件
        //protected void Page_Init(object sernder, EventArgs e)
        //{
        //    this.channel_id = DTRequest.GetQueryInt("channel_id");
        //    CreateOtherField(this.channel_id); //动态生成相应的扩展字段
        //}
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

        public void CreateOtherField(int artisanid)
        {
            Model.Artisan model = new Model.Artisan();
            BLL.Artisan bll = new BLL.Artisan();
            model = bll.GetModelList(artisanid, "");
            if (model != null)
            {
                txt_artisanName.Text = model.artisanName;//姓名
                rblSex.SelectedValue = model.sex;//性别
                txt_IDNumber.Text = model.IDNumber;//身份证号
                ddl_artisanType.SelectedValue = model.artisanType;//工艺师类别(待确认)
                rblSex.SelectedValue = model.sex.Trim();
                txt_artisanTitle.Text=model.artisanTitle;//荣誉称号
                txt_masterWorker.Text = model.masterWorker;//师从
                txt_artisanSpecial.Text=model.artisanSpecial;//特点
                txt_introduction.Text=model.introduction;//简介
                txt_IDHead.Text = model.IDHead.Replace("http://116.62.124.214/", "");//身份证头像
                txt_DetailedIntroduction.InnerText = model.DetailedIntroduction;//详细介绍
                txt_VideoUrl.Text=model.VideoUrl ;//视频地址
                rad_IsCooperation.SelectedValue = model.IsCooperation;//是否合作
                rad_IsRecommend.SelectedValue = model.IsRecommend;//是否推荐到首页
                rad_IsPushMall.SelectedValue = model.IsPushMall;//是否推荐到商城
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
                JscriptMsg("修改信息成功！", "artisan_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }
            else //添加
            {
                //ChkAdminLevel("channel_" + this.channel_name + "_list", DTEnums.ActionEnum.Add.ToString()); //检查权限
                if (!DoAdd())
                {
                    JscriptMsg("保存过程中发生错误啦！", "", "Error");
                    return;
                }
                JscriptMsg("添加信息成功！", "artisan_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }
        }
        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.Artisan model = new Model.Artisan();
            BLL.Artisan bll = new BLL.Artisan();
            model.artisanName = txt_artisanName.Text;//姓名
            model.sex = DTRequest.GetFormString("rblSex").Trim();//性别
            model.IDNumber = txt_IDNumber.Text;//身份证号
            model.artisanType = ddl_artisanType.Text;//工艺师类别(待确认)
            model.artisanTitle = txt_artisanTitle.Text;//荣誉称号
            model.masterWorker = txt_masterWorker.Text;//师从
            model.artisanSpecial = txt_artisanSpecial.Text;//特点
            model.introduction = txt_introduction.Text;//简介
            model.IDHead = txt_IDHead.Text;//身份证头像
            model.DetailedIntroduction = txt_DetailedIntroduction.Value;//详细介绍
            model.VideoUrl = txt_VideoUrl.Text;//视频地址
            model.IsCooperation = rad_IsCooperation.SelectedValue;//是否合作
            model.IsRecommend = rad_IsRecommend.SelectedValue;//是否推荐到首页
            model.IsPushMall = rad_IsPushMall.SelectedValue;//是否推荐到商城
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
            Model.Artisan model = new Model.Artisan();
            BLL.Artisan bll = new BLL.Artisan();
            model.artisanName = txt_artisanName.Text;//姓名
            model.sex = DTRequest.GetFormString("rblSex"); ;//性别
            model.IDNumber = txt_IDNumber.Text;//身份证号
            model.artisanType = ddl_artisanType.Text;//工艺师类别(待确认)
            model.artisanTitle = txt_artisanTitle.Text;//荣誉称号
            model.masterWorker = txt_masterWorker.Text;//师从
            model.artisanSpecial = txt_artisanSpecial.Text;//特点
            model.introduction = txt_introduction.Text;//简介
            model.IDHead = txt_IDHead.Text;//身份证头像
            model.DetailedIntroduction = txt_DetailedIntroduction.Value;//详细介绍
            model.VideoUrl = txt_VideoUrl.Text;//视频地址
            model.IsCooperation = rad_IsCooperation.SelectedValue;//是否合作
            model.IsRecommend = rad_IsRecommend.SelectedValue;//是否推荐到首页
            model.IsPushMall = rad_IsPushMall.SelectedValue;//是否推荐到商城
            model.artisanID = _id;
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