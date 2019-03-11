using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;

namespace DTcms.Web.admin.product
{
    public partial class productOper : System.Web.UI.Page
    {
        Product bll = new Product();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //产品下架架
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string productIDs = txt_CodeValues.Text;
                if (!string.IsNullOrEmpty(productIDs))
                {
                    string[] list = productIDs.Split(',');
                    foreach (string item in list)
                    {
                        bll.Update_InventoryCount(item, -1);
                    }
                    JscriptMsg("下架成功" + list.Length + "条！", "", "Success");
                }
            }
            catch (Exception ex)
            {
                JscriptMsg("下架失败" + ex.ToString() + "请稍后再试！", "", "Error");
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

        //产品下架
        protected void btnSubmit0_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }
    }
}