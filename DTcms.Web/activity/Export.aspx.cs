using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTcms.Model;
using DTcms.Common;

namespace DTcms.Web.activity
{
    public partial class Export : System.Web.UI.Page
    {
        private BLL.Auction bll = new BLL.Auction();
        private BLL.proInquiry bllP = new BLL.proInquiry();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isJianZhanJun = ddl_select.SelectedValue.Equals("建盏君") ? true : false;
            DataSet ds = bll.GetList(ddl_type.SelectedValue, isJianZhanJun);
            DataTable dt = ds.Tables[0];
            Dictionary<string, string> dict=new Dictionary<string,string>();

            CreateExcel(dt,  ddl_select.SelectedValue + DateTime.Now.ToString());
        }


        // <summary>
        /// DataTable中的数据导出到Excel并下载
        /// </summary>
        /// <param name="dt">要导出的DataTable</param>
        /// <param name="FileType">类型</param>
        /// <param name="FileName">Excel的文件名</param>
        public void CreateExcel(DataTable dt, string FileName)
        {
            Response.Clear();
            Response.Charset = "UTF-8";
            Response.Buffer = true;
            Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
            Response.AppendHeader("Content-Disposition", "attachment;filename=\"" + System.Web.HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8) + ".xls\"");
            Response.ContentType = "application/ms-excel";
            string colHeaders = string.Empty;
            string ls_item = string.Empty;
            DataRow[] myRow = dt.Select();
            int i = 0;
            int cl = dt.Columns.Count;
            ls_item += "产品编号" + "\t" + "最高出价" + "\t" + "产品名称" + "\t" + "作者" + "\t\n";
            foreach (DataRow row in myRow)
            {
                for (i = 0; i < cl; i++)
                {
                    if (i == (cl - 1))
                    {
                        ls_item += row[i].ToString() + "\n";
                    }
                    else
                    {
                        ls_item += row[i].ToString() + "\t";
                    }
                }
                Response.Output.Write(ls_item);
                ls_item = string.Empty;
            }
            Response.Output.Flush();
            Response.End();
        }

        /// <summary>
        /// 建盏君数据更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            List<Model.Auction> list = bll.GetALLLJZJist();
            if (list != null && list.Count > 0)
            {
                foreach (Auction info in list)
                {
                    Auction aution = new Auction();
                    aution.ProductID = info.ProductID;
                    proInquiry proModel = bllP.GetModelJZJ(" and (telphone='" + info.Telephone + "' or telphone='" + DESEncrypt.ConvertBy123(info.Telephone) + "') ");
                    if (proModel != null && !string.IsNullOrEmpty(proModel.OperatorID))
                    {
                        aution.OperatorID = proModel.OperatorID;
                        aution.Telephone = DESEncrypt.ConvertBy123(info.Telephone);
                        bll.UpdateJZJ(aution);
                    }
                }
            }            
        }


        /// <summary>
        /// 盏天下数据更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button3_Click(object sender, EventArgs e)
        {
            List<Model.Auction> list = bll.GetALLList();
            if (list != null && list.Count > 0)
            {
                foreach (Auction info in list)
                {
                    Auction aution = new Auction();
                    aution.ProductID = info.ProductID;
                    proInquiry proModel = bllP.GetModel(" and (telphone='" + info.Telephone + "' or telphone='" + DESEncrypt.ConvertBy123(info.Telephone) + "') ");
                    if (proModel != null && !string.IsNullOrEmpty(proModel.OperatorID))
                    {
                        aution.OperatorID = proModel.OperatorID;
                        aution.Telephone = DESEncrypt.ConvertBy123(info.Telephone);
                        bll.Update(aution);
                    }
                }
            }
        }
        
    }
}