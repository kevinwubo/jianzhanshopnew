using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using DTcms.Common;
using System.Data;

namespace DTcms.Web.admin.Inquiry
{
    public partial class Auction_List : System.Web.UI.Page
    {
        public BLL.Auction bllIn = new BLL.Auction();
        protected int totalCount;
        public int page;
        protected int pageSize;
        protected string keywords = string.Empty;
        protected string prolistview = string.Empty;
        public Model.manager Manager_Model = null;
        public int DistinctCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = DTRequest.GetQueryString("keywords");
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            this.pageSize = GetPageSize(40); //每页数量
            this.prolistview = Utils.GetCookie("article_list_view"); //显示方式
            this.keywords = "";


            if (!Page.IsPostBack)
            {
                if (Manager_Model != null && (Manager_Model.role_id.Equals(9) || Manager_Model.role_id.Equals(1) || Manager_Model.role_id.Equals(2) || Manager_Model.role_id.Equals(3)))
                {
                    //ChkAdminLevel("site_channel_category", DTEnums.ActionEnum.View.ToString()); //检查权限
                    RptBind(CombSqlTxt(this.keywords), " id");
                }
            }
        }

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            
            _keywords = txtKeywords.Text;
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append("  and (a.Telephone like '%" + _keywords + "%' or a.Telephone like '" + DESEncrypt.ConvertBy123(_keywords) + "' or real_name='" + _keywords + "' or Author='" + _keywords + "' or Source='" + _keywords + "' )");
            }

            if (ddl_AuctionDetail.SelectedValue != "全部")
            {
                strTemp.Append(" and AuctionDetail='" + ddl_AuctionDetail.SelectedValue + "'");
            }


            if (ddl_AuctionType.SelectedValue != "全部")
            {
                strTemp.Append(" and AuctionType='" + ddl_AuctionType.SelectedValue + "'");
            }

            //唐僧看厦门的，叶煊看武夷山，沐易看建盏君，林高明看俱乐部
            if (Manager_Model != null)
            {

                if (Manager_Model.real_name.Equals("沐易315"))//  
                {
                    strTemp.Append(" and Source='jianzhanjun'");
                }
                else if (Manager_Model.real_name.Equals("叶煊2"))//叶煊
                {
                    strTemp.Append(" and Source='wuyishan'");
                }
                else if (Manager_Model.real_name.Equals("林高明"))//
                {
                    strTemp.Append(" and Source='julebu'");
                }
                else if (Manager_Model.real_name.Equals("唐僧"))//唐僧
                {
                    strTemp.Append(" and Source='xiamen'");
                }
                else
                {
                    //strTemp.Append(" and Source='XXXX'");
                }
            }
            //julebu 俱乐部 jianzhanjun 建盏君  xiamen 这个是厦门团队   wuyishan  这个是武夷山盏天
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
            BLL.Auction bll = new BLL.Auction();

            //DistinctCount = bll.GetDistinctTelphoneCount(_strWhere);
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("Auction_List.aspx", "keywords={0}&page={1}", this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            int sucCount = 0; //成功数量
            int errorCount = 0; //失败数量
            BLL.Auction bll = new BLL.Auction();
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
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", "Auction_List.aspx", "Success");
        }


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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            RptBind(CombSqlTxt(this.keywords), " id");
        }


        /// <summary>
        /// 数据导出
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lb_exprot_Click(object sender, EventArgs e)
        {
            BLL.Auction bll = new BLL.Auction();
            DataTable dt= bll.GetList(CombSqlTxt(this.keywords)).Tables[0];
            CreateExcel(dt, DateTime.Now.ToString());
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
            Response.ContentType = "application/ms-excel"; ;
            string colHeaders = string.Empty;
            string ls_item = string.Empty;
            DataRow[] myRow = dt.Select();
            int i = 0;
            int cl = dt.Columns.Count;
            ls_item += "序号" + "\t" + "作品编号" + "\t" + "产品名称" + "\t" + "作者" + "\t" + "底价" + "\t" + "保留价" + "\t" + "客户手机号" + "\t" + "客户出价" + "\t" + "行为" + "\t" + "关注时间" + "\t" + "归属销售" + "\t" + "专场" + "\t" + "来源" + "\t\n";
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
    }
}