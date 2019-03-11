using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.IO;

namespace DTcms.Web.admin.product
{
    public partial class product_list : Web.UI.ManagePage
    {
        protected int totalCount;
        public int page;
        protected int pageSize;
        public string keywords = string.Empty;
        public Model.manager Manager_Model = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.keywords = DTRequest.GetQueryString("keywords");
            Manager_Model = Session[DTKeys.SESSION_ADMIN_INFO] as Model.manager;
            this.pageSize = GetPageSize(20); //每页数量
            if (!Page.IsPostBack)
            {
                //ChkAdminLevel("site_channel_category", DTEnums.ActionEnum.View.ToString()); //检查权限
                string desc=" AddDate desc";
                if (DTRequest.GetQueryString("action").Equals("UP"))
                {
                    //desc = " CONVERT(bigint,ProductID) desc ";
                    desc = " ProductID desc ";
                }
                else if (DTRequest.GetQueryString("action").Equals("DOWN"))
                {
                    desc = " ProductID asc ";
                }
                RptBind(CombSqlTxt(this.keywords), desc);
            }
        }

        #region 组合SQL查询语句==========================
        protected string CombSqlTxt(string _keywords)
        {
            StringBuilder strTemp = new StringBuilder();
            _keywords = _keywords.Replace("'", "");
            if (!string.IsNullOrEmpty(_keywords))
            {
                strTemp.Append(" and (ProductName like  '%" + _keywords + "%' or Author like '%" + _keywords + "%' or ProductID like '%" + _keywords + "%' )");
            }
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
            BLL.Product bll = new BLL.Product();
            this.rptList.DataSource = bll.GetList(this.pageSize, this.page, _strWhere, _orderby, out this.totalCount);
            this.rptList.DataBind();

            //绑定页码
            txtPageNum.Text = this.pageSize.ToString();
            string pageUrl = Utils.CombUrlTxt("Product_list.aspx", "keywords={0}&page={1}", this.keywords, "__id__");
            PageContent.InnerHtml = Utils.OutPageList(this.pageSize, this.page, this.totalCount, pageUrl, 8);
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
            JscriptMsg("删除成功" + sucCount + "条，失败" + errorCount + "条！", "product_list.aspx", "Success");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect(Utils.CombUrlTxt("product_list.aspx", "keywords={0}",this.txtKeywords.Text.Trim()));
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }

        protected void lik_Upload_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile == false)//HasFile用来检查FileUpload是否有指定文件
                {
                    Response.Write("<script>alert('请您选择Excel文件')</script> ");
                    return;//当无文件时,返回
                }
                string IsXls = Path.GetExtension(FileUpload1.FileName).ToString().ToLower();//System.IO.Path.GetExtension获得文件的扩展名
                string filename = FileUpload1.FileName;              //获取Execle文件名  DateTime日期函数
                string savePath = Server.MapPath(filename);//Server.MapPath 获得虚拟服务器相对路径
                DataTable dt = new DataTable();
                FileUpload1.SaveAs(savePath);                        //SaveAs 将上传的文件内容保存在服务器上
                dt = GetExcelDatatable(savePath);           //调用自定义方法
                //DataRow[] dr = ds.Select();            //定义一个DataRow数组

                if (dt != null && dt.Rows.Count > 0)
                {
                    int i = 0;
                    int ei = 0;
                    foreach (DataRow dr in dt.Rows)
                    {

                        Model.Product model = new Model.Product();
                        BLL.Product bll = new BLL.Product();
                        model.ProductID = Convert.ToString(dr["产品编号"].ToString());
                        model.ProductName = dr["产品名称"].ToString();//产品名称
                        model.SubTitle = dr["副标题"].ToString();//副标题
                        model.Type2 = dr["工艺釉色"].ToString();//工艺釉色
                        model.Type3 = dr["器型"].ToString();//器型
                        model.Type4 = dr["口径"].ToString();//口径尺寸
                        model.Type5 = dr["用途功能"].ToString();//用途功能
                        model.Type6 = dr["传世老盏"].ToString();//传世老盏
                        model.Type7 = dr["价格区间"].ToString();//价格区间
                        model.Images = dr["身份图片"].ToString().Replace("？", dr["产品编号"].ToString());//产品展示图片
                        model.Volume = dr["口径尺寸"].ToString();//口径尺寸

                        model.CostPrice = dr["成本价"].ToString();//成本价
                        model.MarketPrice = dr["市场价"].ToString();//市场价
                        model.LowPrice = dr["最低价"].ToString();//最低价
                        model.InventoryCount = (dr["库存数量"].ToString());//库存数量                    
                        model.Author = dr["作者"].ToString();//产品作者
                        if (bll.Add(model) > 0)
                        {
                            i++;
                            //bll.Update_InventoryCount(model.ProductID.ToString(), Convert.ToInt32(dr["库存数量"].ToString()));
                        }
                        else
                        {
                            ei++;
                        }
                    }
                    JscriptMsg("成功导入" + i + "条，失败" + ei + "条！", "", "Success");
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteErrorLog("EXCEL导入异常__lik_Upload_Click"+ex.Message, DateTime.Now);                
            }
        }

        public System.Data.DataTable GetExcelDatatable(string fileUrl)
        {
            //支持.xls和.xlsx，即包括office2010等版本的   HDR=Yes代表第一行是标题，不是数据；
            string cmdText = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0; HDR=Yes; IMEX=1'";
            System.Data.DataTable dt = null;
            //建立连接
            OleDbConnection conn = new OleDbConnection(string.Format(cmdText, fileUrl));
            try
            {
                //打开连接
                if (conn.State == ConnectionState.Broken || conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                System.Data.DataTable schemaTable = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string strSql = "select * from [Sheet1$]";
                OleDbDataAdapter da = new OleDbDataAdapter(strSql, conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dt = ds.Tables[0];
                return dt;
            }
            catch (Exception exc)
            {
                //=throw exc;
                BLL.Log.WriteErrorLog("EXCEL导入异常___GetExcelDatatable" + exc.Message, DateTime.Now);
                return dt;
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }
    }
}