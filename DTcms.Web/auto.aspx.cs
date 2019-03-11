using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using System.Data;

namespace DTcms.Web
{
    public partial class auto : System.Web.UI.Page
    {
        public BLL.article bllArt = new BLL.article();
        protected void Page_Load(object sender, EventArgs e)
        {
            DTcms.BLL.proInquiry bll = new DTcms.BLL.proInquiry();
            DTcms.BLL.Product bllPro = new DTcms.BLL.Product();
            DTcms.BLL.CodeS bllCodes = new DTcms.BLL.CodeS();
            string SMSText = "盏天下-新CRM,作者:{0},作品名:{1},编号:{2} ,{3}!";
            DTcms.BLL.manager bllManager = new DTcms.BLL.manager();
            DateTime dtNow = Convert.ToDateTime(DateTime.Now.ToShortTimeString());
            string code = "DSalesQueue";
            //ASalesQueue 凌晨2点到12点分分配队列
            //BSalesQueue 12点~13点30分分配队列
            //CSalesQueue 13点30分~18点30分分配队列
            //DSalesQueue 18点30分~21点30分分配队列
            //ESalesQueue 21点30分~凌晨2点分配队列
            string datetime = DateTime.Now.AddDays(-1).ToShortDateString();
            string sqlTime = "";
            if (dtNow.CompareTo(Convert.ToDateTime("02:00")) > 0 && dtNow.CompareTo(Convert.ToDateTime("12:00")) < 0)
            {
                sqlTime = " and AddDate between '" + datetime + " 02:00' and '" + datetime + " 12:00'";
                code = "ASalesQueue";
            }
            else if (dtNow.CompareTo(Convert.ToDateTime("12:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("14:00")) < 0)
            {
                sqlTime = " and AddDate between '" + datetime + " 12:01' and '" + datetime + " 14:01'";
                code = "BSalesQueue";
            }
            else if (dtNow.CompareTo(Convert.ToDateTime("14:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("18:30")) < 0)
            {
                sqlTime = " and AddDate between '" + datetime + " 14:01' and '" + datetime + " 18:30'";
                code = "CSalesQueue";
            }
            else if (dtNow.CompareTo(Convert.ToDateTime("18:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime("21:30")) < 0)
            {
                sqlTime = " and AddDate between '" + datetime + " 18:31' and '" + datetime + " 21:30'";
                code = "DSalesQueue";
            }
            else if (dtNow.CompareTo(Convert.ToDateTime("21:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString() + " 01:59")) < 0)
            {
                sqlTime = " and AddDate between '" + datetime + " 21:31' and '" + datetime + " 01:59'";
                code = "ESalesQueue";
            }
            SMSText = bllCodes.GetModel(" and Code='SmsTemplate'").CodeValues;
            string codes = bllCodes.GetModel(" and Code in('" + code + "')").CodeValues;
            DataSet ds = bll.GetUnTreatedInquiry();
            string newsalesname = "";
            if (ds != null && ds.Tables != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        DTcms.Model.manager dtSale = new DTcms.Model.manager(); ;
                        string oldsalesname = dr["real_name"].ToString();
                        string[] salesCode = codes.Split(',');
                        Log.WriteTextLog("咨询量转移前销售姓名：" + oldsalesname , DateTime.Now);
                        List<string> list = new List<string>();
                        foreach (string str in salesCode)
                        {
                            list.Add(str);
                        }

                        int index = list.IndexOf(oldsalesname);
                        if (index > 0)
                        {
                            if (index + 1 > list.Count)
                            {
                                newsalesname = list[0];
                            }
                            else
                            {
                                newsalesname = list[index + 1];
                            }
                        }
                        else
                        {
                            newsalesname = list[0];
                        }

                        if (!string.IsNullOrEmpty(newsalesname))
                        {
                            dtSale = bllManager.GetModel(newsalesname);
                        }

                        string SmsMess = string.Format(SMSText, "不详", "不详", "不详", DateTime.Now.ToString());
                        if (!string.IsNullOrEmpty(dtSale.telephone))
                        {
                            List<DTcms.Model.Product> lstPro = bllPro.GetProductList(" and ProductID='" + dr["ProductID"] + "'", 1);
                            if (lstPro != null && lstPro.Count > 0)
                            {
                                DTcms.Model.Product modelPro = lstPro[0];
                                SmsMess = string.Format(SMSText, modelPro.Author, modelPro.ProductName, modelPro.ProductID, DateTime.Now.ToString()) + "咨询量转移";
                            }
                            SmsMess += "跟踪销售：" + newsalesname;
                        }
                        Log.WriteTextLog("咨询量转移后销售姓名：" + newsalesname + "==销售电话：" + dtSale.telephone, DateTime.Now);
                        DTcms.BLL.SMSHelper.SeedSMS(dtSale.telephone, SmsMess);
                        DTcms.BLL.Log.WriteTextLog("--手机号 销售：" + dtSale.telephone + "-询价-短信内容：" + SmsMess, DateTime.Now);

                        bll.UpdateOperatorIDByPPID(Convert.ToInt32(dr["ppid"]), dtSale.id);
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
    }
}