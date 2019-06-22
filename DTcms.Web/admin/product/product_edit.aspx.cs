using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data;
using System.IO;

namespace DTcms.Web.admin.product
{
    public partial class product_edit : Web.UI.ManagePage
    {
        private string action = DTEnums.ActionEnum.Add.ToString(); //操作类型
        protected string channel_name = string.Empty; //频道名称
        protected int channel_id;
        private int id = 0;
        private string page = string.Empty;
        private string keywords = string.Empty;

        public Model.manager Manager_Model = null;
        //页面初始化事件
        //protected void Page_Init(object sernder, EventArgs e)
        //{
        //    this.channel_id = DTRequest.GetQueryInt("channelid");
        //    CreateOtherField(this.channel_id); //动态生成相应的扩展字段
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            #region 权限
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            
            #endregion


            string _action = DTRequest.GetQueryString("action");
            page = DTRequest.GetQueryString("page");
            keywords = DTRequest.GetQueryString("keywords");
            if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString())
            {
                this.id = DTRequest.GetQueryInt("channelid");
                this.action = DTEnums.ActionEnum.Edit.ToString();//修改类型
            }
            BLL.Product bll = new BLL.Product();
            if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.View.ToString())
            {
                btnSubmit.Visible = false;
                //lbl_ProductNO.Text = bll.GetMaxProductID().ToString();
            }
            
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.Edit.ToString()||!string.IsNullOrEmpty(_action) && _action == DTEnums.ActionEnum.View.ToString())
                {
                    this.channel_id = DTRequest.GetQueryInt("channelid");
                    CreateOtherField(this.channel_id); //动态生成相应的扩展字段
                }
            }
        }

        //private void TreeBind()
        //{
        //    BLL.Product bll = new BLL.Product();
        //    DataTable dt = bll.GetTypeList("PP");

        //    this.ddl_PlatePosition.Items.Clear();
        //    this.ddl_PlatePosition.Items.Add(new ListItem("请选择推荐位置...", ""));
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        string Code = dr["Code"].ToString();
        //        string Title = dr["Name"].ToString().Trim();
        //        this.ddl_PlatePosition.Items.Add(new ListItem(Title, Code));
        //    }
        //}

        public void CreateOtherField(int ID)
        {
            Model.Product model = new Model.Product();
            BLL.Product bll = new BLL.Product();
            model = bll.GetModel(ID, "");
            lbl_ProductNO.Text = model.ProductID.ToString();
            txt_ProductName.Text = model.ProductName;//产品名称
            txt_SubTitle.Text = model.SubTitle;//副标题
            //ddl_Type1.SelectedValue = model.Type1;//名家品牌
            ddl_Type2.SelectedValue = model.Type2;//工艺釉色
            ddl_Type3.SelectedValue = model.Type3;//器型
            ddl_Type4.SelectedValue = model.Type4;//口径尺寸
            ddl_Type5.SelectedValue = model.Type5;//用途功能
            ddl_Type6.SelectedValue = model.Type6;//传世老盏
            ddl_Type7.SelectedValue = model.Type7;//价格区间
            txt_introduction.Text = model.Introduction;//摘要
            txt_Images.Text = model.Images.Replace("http://116.62.124.214/", ""); //产品展示图片
            txt_summary.Value = model.summary;//摘要
            txt_ProductDetail.Value = model.ProductDetail;//产品内容明细
            //txt_Material.Text = model.Material;//材料
            txt_Volume.Text = model.Volume;//口径尺寸

            //1/2/3  超级管理组/系统管理组/管理组
            if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
            {
                txt_CostPrice.Text =string.IsNullOrEmpty(model.CostPrice)?"0": model.CostPrice;//成本价
                txt_MarketPrice.Text = string.IsNullOrEmpty(model.MarketPrice) ? "0" : model.MarketPrice;//市场价
                txt_LowPrice.Text = string.IsNullOrEmpty(model.LowPrice) ? "0" : model.LowPrice;//最低价
            }
            
            //txt_ArtisanID.Text = model.ArtisanID;//艺人ID
            txt_ProImageDetail.Text = model.ProImageDetail; //产品图片详细描述 单张
            txt_Author.Text = model.Author;//产品作者
            //rad_IsPushMall.SelectedValue = model.IsPushMall;//是否推荐到商城  0 否 1 是
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
                MakePage("http://jianzhanshop.com/product_detail.aspx?productid=" + lbl_ProductNO.Text, lbl_ProductNO.Text + ".html");

                JscriptMsg("修改信息成功！", "product_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
            }
            else //添加
            {
                //ChkAdminLevel("channel_" + this.channel_name + "_list", DTEnums.ActionEnum.Add.ToString()); //检查权限
                BLL.Product bll = new BLL.Product();
                if (bll.GetTotalCount(" and ProductID='" + lbl_ProductNO.Text + "'") > 0)
                {
                    JscriptMsg("产品编号重复：" + lbl_ProductNO.Text, "", "Error");
                }
                else
                {

                    if (!DoAdd())
                    {

                        JscriptMsg("保存过程中发生错误啦！", "", "Error");
                        return;
                    }
                    MakePage("http://jianzhanshop.com/product_detail.aspx?productid=" + lbl_ProductNO.Text, lbl_ProductNO.Text + ".html");

                    JscriptMsg("添加信息成功！", "product_list.aspx?channel_id=" + this.channel_id + "&page=" + page + "&keywords=" + keywords, "Success");
                }
            }
        }

        /// <summary>
        /// 静态生成页面的方法
        /// </summary>
        /// <param name="strPageUrl">生成源</param>
        /// <param name="strFileName">生成到</param>
        private bool MakePage(string strPageUrl, string strFileName)
        {
            string strDir, strFilePage;
            strFilePage = Server.MapPath("/"+strFileName);

            StreamWriter sw = null;
            //获得aspx的静态html
            try
            {
                //if (!Directory.Exists(Server.MapPath(strDir)))
                //{
                //    Directory.CreateDirectory(Server.MapPath(strDir));
                //}
                if (File.Exists(strFilePage))
                {
                    File.Delete(strFilePage);
                }
                sw = new StreamWriter(strFilePage, false, System.Text.Encoding.GetEncoding("UTF-8"));
                System.Net.WebRequest wReq = System.Net.WebRequest.Create(strPageUrl);
                System.Net.WebResponse wResp = wReq.GetResponse();
                System.IO.Stream respStream = wResp.GetResponseStream();
                System.IO.StreamReader reader = new System.IO.StreamReader(respStream, System.Text.Encoding.GetEncoding("UTF-8"));
                sw.Write(reader.ReadToEnd());
            }
            catch (Exception ex)
            {
                return false;//生成到出错
            }
            finally
            {
                sw.Flush();
                sw.Close();
                sw = null;
            }

            return true;
        }

        #region 增加操作=================================
        private bool DoAdd()
        {
            bool result = false;
            Model.Product model = new Model.Product();
            BLL.Product bll = new BLL.Product();
            model.ProductName = txt_ProductName.Text;//产品名称
            model.SubTitle = txt_SubTitle.Text;//副标题
            //model.Type1 = ddl_Type1.SelectedValue;//名家品牌
            model.Type2 = ddl_Type2.SelectedValue;//工艺釉色
            model.Type3 = ddl_Type3.SelectedValue;//器型
            model.Type4 = ddl_Type4.SelectedValue;//口径尺寸
            model.Type5 = ddl_Type5.SelectedValue;//用途功能
            model.Type6 = ddl_Type6.SelectedValue;//传世老盏
            model.Type7 = ddl_Type7.SelectedValue;//价格区间
            model.Images = txt_Images.Text;//产品展示图片
            model.summary = txt_summary.Value;//摘要
            model.ProductDetail = txt_ProductDetail.Value;//产品内容明细
            //model.Material = txt_Material.Text;//材料
            model.Volume = txt_Volume.Text;//口径尺寸
            //1/2/3  超级管理组/系统管理组/管理组
            model.Introduction = txt_introduction.Text;
            if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
            {
                model.CostPrice =txt_CostPrice.Text;//成本价
                model.MarketPrice = txt_MarketPrice.Text;//市场价
                model.LowPrice = txt_LowPrice.Text;//最低价
            }
            //model.ArtisanID = txt_ArtisanID.Text;//艺人ID
            model.ProductID = Convert.ToString(lbl_ProductNO.Text);
            model.ProImageDetail = txt_ProImageDetail.Text;//产品图片详细描述 单张
            model.Author = txt_Author.Text;//产品作者
            //model.IsPushMall = rad_IsPushMall.SelectedValue;//是否推荐到商城  0 否 1 是
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
            Model.Product model = new Model.Product();
            BLL.Product bll = new BLL.Product();
            model.ProductName = txt_ProductName.Text;//产品名称
            model.SubTitle = txt_SubTitle.Text;//副标题
            //model.Type1 = ddl_Type1.SelectedValue;//名家品牌
            model.Type2 = ddl_Type2.SelectedValue;//工艺釉色
            model.Type3 = ddl_Type3.SelectedValue;//器型
            model.Type4 = ddl_Type4.SelectedValue;//口径尺寸
            model.Type5 = ddl_Type5.SelectedValue;//用途功能
            model.Type6 = ddl_Type6.SelectedValue;//传世老盏
            model.Type7 = ddl_Type7.SelectedValue;//价格区间
            model.Images = txt_Images.Text;//产品展示图片
            model.summary = txt_summary.Value;//摘要
            model.ProductDetail = txt_ProductDetail.Value;//产品内容明细
            //model.Material = txt_Material.Text;//材料
            model.Volume = txt_Volume.Text;//口径尺寸
            //1/2/3  超级管理组/系统管理组/管理组
            if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
            {
                model.CostPrice = txt_CostPrice.Text;//成本价
                model.MarketPrice = txt_MarketPrice.Text;//市场价
                model.LowPrice = txt_LowPrice.Text;//最低价
            }
            //model.ArtisanID = txt_ArtisanID.Text;//艺人ID
            model.Author = txt_Author.Text;
            model.ProImageDetail = txt_ProImageDetail.Text;//产品图片详细描述 单张
            model.ProductID = Convert.ToString(lbl_ProductNO.Text);
            //model.IsPushMall = rad_IsPushMall.SelectedValue;//是否推荐到商城  0 否 1 是
            model.ID = _id;
            model.Introduction = txt_introduction.Text;
            //1/2/3  超级管理组/系统管理组/管理组
            if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
            {
                if (bll.Update(model))
                {
                    return true;
                }
            }
            else
            {
                if (bll.UpdateNoPrice(model))
                {
                    return true;
                }
            }
            return false;
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