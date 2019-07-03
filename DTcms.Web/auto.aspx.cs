using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using System.Data;
using DTcms.Model;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json;

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
            //DateTime dtNow = Convert.ToDateTime(DateTime.Now.ToShortTimeString());
            string code = "DSalesQueue";
            //ASalesQueue 凌晨2点到12点分分配队列
            //BSalesQueue 12点~13点30分分配队列
            //CSalesQueue 13点30分~18点30分分配队列
            //DSalesQueue 18点30分~21点30分分配队列
            //ESalesQueue 21点30分~凌晨2点分配队列
            //string datetime = DateTime.Now.AddDays(-1).ToShortDateString();
            //string sqlTime = "";
            //if (dtNow.CompareTo(Convert.ToDateTime("02:00")) > 0 && dtNow.CompareTo(Convert.ToDateTime("12:00")) < 0)
            //{
            //    sqlTime = " and AddDate between '" + datetime + " 02:00' and '" + datetime + " 12:00'";
            //    code = "ASalesQueue";
            //}
            //else if (dtNow.CompareTo(Convert.ToDateTime("12:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("14:00")) < 0)
            //{
            //    sqlTime = " and AddDate between '" + datetime + " 12:01' and '" + datetime + " 14:01'";
            //    code = "BSalesQueue";
            //}
            //else if (dtNow.CompareTo(Convert.ToDateTime("14:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("18:30")) < 0)
            //{
            //    sqlTime = " and AddDate between '" + datetime + " 14:01' and '" + datetime + " 18:30'";
            //    code = "CSalesQueue";
            //}
            //else if (dtNow.CompareTo(Convert.ToDateTime("18:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime("21:30")) < 0)
            //{
            //    sqlTime = " and AddDate between '" + datetime + " 18:31' and '" + datetime + " 21:30'";
            //    code = "DSalesQueue";
            //}
            //else if (dtNow.CompareTo(Convert.ToDateTime("21:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString() + " 01:59")) < 0)
            //{
            //    sqlTime = " and AddDate between '" + datetime + " 21:31' and '" + datetime + " 01:59'";
            //    code = "ESalesQueue";
            //}
            SMSText = bllCodes.GetModel(" and Code='SmsTemplate'").CodeValues;
            //string codes = bllCodes.GetModel(" and Code in('" + code + "')").CodeValues;
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

                        BLL.Log.WriteTextFPLog("重新分配PPID" + dr["PPId"].ToString(), DateTime.Now);
                        DateTime dtNow = Convert.ToDateTime(DateTime.Now.ToShortTimeString());

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

                        #region 城市信息优先级最高
                        ProCityInfo info = getCity(dr["telphone"].ToString());
                        string city = "";
                        string province = "";
                        if (info != null)
                        {
                            city = info.city;
                            province = info.province;
                            if (!string.IsNullOrEmpty(info.city))
                            {
                                if (info.city.Equals("北京") || info.city.Equals("天津") || info.city.Equals("廊坊"))
                                {
                                    code = "BeiJingSalesQueue";
                                }
                            }
                        }
                        #endregion


                        SMSText = bllCodes.GetModel(" and Code='SmsTemplate'").CodeValues;
                        //当前销售队列
                        string codes = bllCodes.GetModel(" and Code='" + code + "'").CodeValues;

                        string codeNames = "";
                        if (!string.IsNullOrEmpty(codes))
                        {
                            string[] codeList = codes.Split(',');
                            foreach (string str in codeList)
                            {
                                DTcms.Model.SalesModel salemodel = bllCodes.GetLastSaleNameBySaleName(str);
                                if (salemodel != null)
                                {
                                    if (salemodel.saleCount > salemodel.saleCurrentDayCount || salemodel.saleCurrentDayCount == 0)
                                    {
                                        codeNames += "'" + str + "'" + ",";
                                    }
                                }
                            }

                            //如果销售都分配满了 按照队列去自动分配
                            if (string.IsNullOrEmpty(codeNames))
                            {
                                foreach (string str in codeList)
                                {
                                    codeNames += "'" + str + "'" + ",";
                                }
                            }
                        }

                        string lastSaleName = bllCodes.GetLastSaleNameByCodes(codeNames.TrimEnd(','), sqlTime);// 最近资讯销售姓名

                        string realnames = "";
                        if (!string.IsNullOrEmpty(codes))
                        {
                            #region 老逻辑
                            string[] str = codeNames.Split(',');
                            List<string> lstSales = new List<string>();
                            string OutSalesCodes = bllCodes.GetList(" and Code in('XiaMenSales','WuYiShanSales')");
                            foreach (string item in str)
                            {
                                //厦门武夷山排除销售
                                if (!OutSalesCodes.Contains(item.Replace("'", "")))
                                {
                                    DTcms.Model.manager mr = bllManager.GetModel(item.Replace("'", ""));

                                    #region 当天在微信队列中的排除销售咨询队列
                                    DateTime dta = DateTime.Now;
                                    int week = Convert.ToInt32(dta.DayOfWeek);

                                    string wxCodes = bllCodes.GetModel("and Code='WXChartList' ").CodeValues;
                                    string WXCode = "";
                                    try
                                    {
                                        //BLL.Log.WriteTextFPLog("--WXCode" + wxCodes, DateTime.Now);
                                        if (!string.IsNullOrEmpty(wxCodes))
                                        {
                                            week = week == 0 ? 7 : week;
                                            string[] codeStr = wxCodes.Split(',');
                                            if (codeStr.Length < week)
                                            {
                                                WXCode = codeStr[0];
                                            }
                                            else
                                            {
                                                int cou = week - 1;
                                                WXCode = codeStr[cou];
                                            }
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        BLL.Log.WriteTextFPLog("--异常记录WXCode" + ex.ToString(), DateTime.Now);
                                        WXCode = wxCodes.Split(',')[0];
                                    }
                                    #endregion
                                    if (mr != null)
                                    {
                                        if (!WXCode.Equals(mr.telephone))
                                        {
                                            lstSales.Add(item.Replace("'", ""));
                                        }
                                    }
                                }
                            }
                            try
                            {
                                if (lstSales != null && lstSales.Count > 0)
                                {
                                    if (lstSales.Contains(lastSaleName))
                                    {
                                        if (lstSales.IndexOf(lastSaleName) + 1 < lstSales.Count)
                                        {
                                            realnames = lstSales[lstSales.IndexOf(lastSaleName) + 1];
                                        }
                                        else
                                        {
                                            realnames = lstSales[0];
                                        }
                                    }
                                    else
                                    {
                                        realnames = lstSales[0];
                                    }
                                }
                                else
                                {
                                    realnames = str[0];
                                }
                            }
                            catch (Exception ex)
                            {
                                realnames = str[0];
                            }
                            #endregion

                            if (!string.IsNullOrEmpty(realnames))
                            {
                                dtSale = bllManager.GetModel(realnames.Replace("'", ""));
                            }
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
                        Log.WriteTextFPLog("SmsMess：" + SmsMess, DateTime.Now);
                        if (!string.IsNullOrEmpty(newsalesname))
                        {
                            Log.WriteTextFPLog("咨询量转移后销售姓名：" + newsalesname + "==销售电话：" + dtSale.telephone, DateTime.Now);
                            DTcms.BLL.SMSHelper.SeedSMS(dtSale.telephone, SmsMess);
                            DTcms.BLL.Log.WriteTextFPLog("--手机号 销售：" + dtSale.telephone + "-询价-短信内容：" + SmsMess, DateTime.Now);

                            bll.UpdateOperatorIDByPPID(Convert.ToInt32(dr["ppid"]), dtSale.id);
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        private ProCityInfo getCity(string telephone)
        {
            ProCityInfo info = new ProCityInfo();
            try
            {
                string url = "http://apis.juhe.cn/mobile/get?phone=" + telephone + "&key=f6b3c53f05453d39221ac36b31bf170e";
                //请求数据
                HttpWebRequest res = (HttpWebRequest)WebRequest.Create(url);
                //方法名
                res.Method = "GET";
                //获取响应数据
                HttpWebResponse resp = (HttpWebResponse)res.GetResponse();
                //读取数据流
                StreamReader sr = new StreamReader(resp.GetResponseStream(), Encoding.UTF8);
                //编译成字符串
                string resphtml = sr.ReadToEnd();

                TelephoneJson result = JsonConvert.DeserializeObject<TelephoneJson>(resphtml);
                if (result != null)
                {
                    result re = result.result;
                    if (re != null)
                    {
                        info.city = !string.IsNullOrEmpty(re.city) ? re.city : "";
                        info.province = !string.IsNullOrEmpty(re.province) ? re.province : "";
                    }
                }
                BLL.Log.WriteTextFPLog("getCity" + resphtml, DateTime.Now);
            }
            catch (Exception ex)
            {
                info = null;
                BLL.Log.WriteTextFPLog("--异常记录getCity" + ex.ToString(), DateTime.Now);
            }
            return info;
        }
    }
}