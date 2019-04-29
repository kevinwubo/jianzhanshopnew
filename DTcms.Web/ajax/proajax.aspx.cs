using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DTcms.Model;
using DTcms.Common;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json;

namespace DTcms.Web.ajax
{
    public partial class proajax : System.Web.UI.Page
    {
        private BLL.proInquiry bll = new BLL.proInquiry();
        private BLL.Product bllPro = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();
        private string SMSText = "【盏天下】-新CRM,作者:{0},作品名:{1},编号:{2} ,{3}!";
        private BLL.manager bllManager = new BLL.manager();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                #region 手机黑名单                
                string BlackMobile = bllCodes.GetModel(" and Code='BlackMobile'").CodeValues;
                string tel = string.IsNullOrEmpty(Request["Tel"]) ? Request["TxtValue"] : Request["Tel"];
                string ProductID = Request["ProductID"];
                BLL.Log.WriteTextLog("资讯手机号开始" + tel, DateTime.Now);
                int proCount = bllPro.GetCountByTelephoneAndProductID(DESEncrypt.ConvertBy123(tel), ProductID);
                int proTelCount = bllPro.GetCountByTelephoneAndProductID(DESEncrypt.ConvertBy123(tel));

                if (BlackMobile.Contains(tel))
                {
                    Response.Write("成功！您的询价对我们很重要，建盏顾问将很快回复！");
                }
                else if (proCount > 2)//当天同手机号同产品编号只能资讯2次
                {
                    Response.Write("成功！您的询价对我们很重要，建盏顾问将很快回复！");
                }
                else if (proTelCount > 5)//手机号大于5次 同一天
                {
                    Response.Write("成功！您的询价对我们很重要，建盏顾问将很快回复！");
                }
                else
                {
                #endregion
                    string InquiryType = Request["InquiryType"];
                    string SourceForm = Request["SourceForm"];
                    string smsMess = "新客户咨询！";
                    #region 获取发送短信手机号码
                    string code = "DSalesQueue";

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
                    ProCityInfo info = getCity(tel);
                    string city = "";
                    string province = "";
                    if (info != null)
                    {
                        city = info.city;
                        province = info.province;
                        if (info.city.Equals("北京") || info.city.Equals("天津"))
                        {
                            code = "BeiJingSalesQueue";
                        }
                    }
                    #endregion
                    

                    SMSText = bllCodes.GetModel(" and Code='SmsTemplate'").CodeValues;
                    //当前销售队列
                    string codes = bllCodes.GetModel(" and Code='" + code + "'").CodeValues;
                    string lastSaleName = bllCodes.GetLastSaleName(sqlTime);// 最近资讯销售姓名
                    Model.manager dtSale = new manager(); ;
                    string realnames = "";
                    if (!string.IsNullOrEmpty(codes))
                    {
                        #region 老逻辑
                        string[] str = codes.Split(',');
                        List<string> lstSales = new List<string>();
                        string OutSalesCodes = bllCodes.GetList(" and Code in('XiaMenSales','WuYiShanSales')");
                        foreach (string item in str)
                        {
                            //厦门武夷山排除销售
                            if (!OutSalesCodes.Contains(item))
                            {
                                #region 如果当前销售大于指数量不在分配咨询量
                                int inquiryCount = bllCodes.GetInquiryCountBySalesName(item);// 当日总数量
                                manager mr = bllManager.GetModel(item);
                                int salesCount = 100;
                                if (mr != null)
                                {
                                    salesCount = mr.salesCount;
                                }

                                #endregion

                                #region 当天在微信队列中的排除销售咨询队列
                                DateTime dt = DateTime.Now;
                                int week = Convert.ToInt32(dt.DayOfWeek);

                                string wxCodes = bllCodes.GetModel("and Code='WXChartList' ").CodeValues;
                                string WXCode = "";
                                try
                                {
                                    //BLL.Log.WriteTextLog("--WXCode" + wxCodes, DateTime.Now);
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
                                    BLL.Log.WriteTextLog("--异常记录WXCode" + ex.ToString(), DateTime.Now);
                                    WXCode = wxCodes.Split(',')[0];
                                }
                                #endregion
                                if (mr != null)
                                {
                                    if (inquiryCount <= salesCount && !WXCode.Equals(mr.telephone))//inquiryCount <= salesCount && 
                                    {
                                        lstSales.Add(item);
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

                        ////厦门武夷山排除销售
                        //string OutSalesCodes = bllCodes.GetList(" and Code in('XiaMenSales','WuYiShanSales')");

                        //string[] strs = codes.Split(',');//当前时间队列销售
                        //string newSales = "";

                        //foreach (string str in strs)
                        //{
                        //    if (!OutSalesCodes.Contains(str))
                        //    {
                        //        newSales += "'" + str + "'" + ",";
                        //    }
                        //}
                        //realnames = bllCodes.GetMinProInquiryBySalesName(newSales.TrimEnd(','));

                        if (!string.IsNullOrEmpty(realnames))
                        {
                            dtSale = bllManager.GetModel(realnames);
                        }
                    }
                    #endregion
                    Model.proInquiry model = new Model.proInquiry();
                    if (InquiryType == "询价")
                    {
                        #region 增加询价数据
                        string TxtValue = Request["TxtValue"];
                        string Type = Request["Type"];
                        DataTable dtTel = bll.GetList(" and (telphone='" + TxtValue + "' or telphone='" + DESEncrypt.ConvertBy123(TxtValue) + "')").Tables[0];
                        model.ProductID = ProductID;
                        model.SourceForm = SourceForm == "MB" ? "MB" : "PC";
                        model.ProcessingState = "0";
                        if (bll.GetCount(TxtValue) == 0)
                            model.status = "新";
                        if (Type.Equals("特"))
                            model.status += "特";

                        if (Type == "QQ")
                            model.WebChartID = TxtValue;
                        else
                            model.telphone = TxtValue;
                        if (dtTel != null && dtTel.Rows.Count > 0)
                        {
                            model.OperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.SaleTelephone = GetSalestelephone(Convert.ToString(dtTel.Rows[0]["OperatorID"]));
                            smsMess = "老客户咨询！";
                        }
                        else
                        {
                            model.OperatorID = dtSale != null ? dtSale.id.ToString() : "0";
                            model.SaleTelephone = dtSale != null ? dtSale.telephone : "0";
                        }
                        #endregion
                    }
                    else
                    {
                        #region 增加咨询量
                        string WebChart = Request["WebChart"];//微信/QQ
                        string Name = Request["Name"];//您的称呼
                        string Content = Request["Content"];//留言内容
                        string Tel = Request["Tel"];//手机号码        
                        //string city = Request["City"];
                        DataTable dtTel = bll.GetList(" and (telphone='" + Tel + "'  or telphone='" + DESEncrypt.ConvertBy123(Tel) + "')").Tables[0];
                        model.ProductID = ProductID;
                        model.WebChartID = WebChart;
                        model.CustomerName = Name;
                        model.InquiryContent = Content;       
                        model.telphone = Tel;
                        model.CustomerName = Name;
                        model.SourceForm = "PC";
                        model.ProcessingState = "0";
                        if (dtTel != null && dtTel.Rows.Count > 0)
                        {
                            model.OperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.SaleTelephone = GetSalestelephone(Convert.ToString(dtTel.Rows[0]["OperatorID"]));
                            smsMess = "老客户咨询！";
                        }
                        else
                        {
                            model.OperatorID = dtSale != null ? dtSale.id.ToString() : "0";
                            model.SaleTelephone = dtSale != null ? dtSale.telephone : "0";
                        }
                        if (bll.GetCount(Tel) == 0)
                        {
                            model.status = "新";
                        }
                        if (InquiryType.Equals("特"))
                            model.status += "特";
                        #endregion
                    }
                    model.City = city;
                    model.Provence = province;
                    bll.Add(model);
                    #region 发送短信
                    string SmsMess = string.Format(SMSText, "不详", "不详", "不详", DateTime.Now.ToString());
                    if (!string.IsNullOrEmpty(model.SaleTelephone))
                    {
                        List<Model.Product> lstPro = bllPro.GetProductList(" and ProductID='" + model.ProductID + "'", 1);
                        if (lstPro != null && lstPro.Count > 0)
                        {
                            Product modelPro = lstPro[0];
                            SmsMess = string.Format(SMSText, modelPro.Author, modelPro.ProductName, model.ProductID, DateTime.Now.ToString()) + smsMess;
                        }

                        string saleName = "";
                        if (!string.IsNullOrEmpty(model.OperatorID))
                        {
                            Model.manager modelM = bllManager.GetModel(Convert.ToInt32(model.OperatorID));
                            saleName = (modelM != null ? modelM.real_name : realnames);
                            SmsMess += "跟踪销售：" + saleName;
                        }
                        SmsMess = SmsMess.Replace("-", "-" + saleName);//+ "[盏天下]" 

                        DTcms.BLL.SMSHelper.SeedSMS(model.SaleTelephone, SmsMess);
                        BLL.Log.WriteTextLog("--手机号 销售：" + model.SaleTelephone + "-询价-短信内容：" + SmsMess, DateTime.Now);

                        //发送给老板
                        DTcms.BLL.SMSHelper.SeedSMS(GetManagerTele(), SmsMess);
                        BLL.Log.WriteTextLog("--手机号 BOSS：" + GetManagerTele() + "-询价-短信内容：" + SmsMess, DateTime.Now);

                        //DTcms.BLL.SMSHelper.SeedSMS("15802148204", SmsMess);
                        //BLL.Log.WriteTextLog("--厦门---手机号 Sales_Manager：17359271665-询价-短信内容：" + SmsMess, DateTime.Now);
                        //发送城市对应的主管销售人员
                        if (dtSale.CityName.Equals("厦门"))
                        {
                            DTcms.BLL.SMSHelper.SeedSMS("17359271665", SmsMess);
                            BLL.Log.WriteTextLog("--厦门---手机号 Sales_Manager：17359271665-询价-短信内容：" + SmsMess, DateTime.Now);
                        }
                        else if (dtSale.CityName.Equals("武夷山"))
                        {
                            DTcms.BLL.SMSHelper.SeedSMS("13163806316", SmsMess);
                            BLL.Log.WriteTextLog("---武夷山---手机号 Sales_Manager：13163806316-询价-短信内容：" + SmsMess, DateTime.Now);
                        }                        
                    }

                    if (InquiryType.Equals("头条询价"))
                    {
                        Response.Write("申请成功，建盏天下专属客服将在24小时内为您提供建盏鉴别和定价免费咨询！");
                    }
                    else
                    {
                        Response.Write("成功！您的询价对我们很重要，建盏顾问将很快回复！");
                    }

                    #endregion
                }
            }
            catch (Exception ex)
            {
                BLL.Log.WriteTextLog("--异常记录" + ex.ToString(), DateTime.Now);
            }
        }

        public static string GetSalestelephone(string id)
        {
            BLL.manager bll = new BLL.manager();
            DataTable dt = bll.GetList(1, "  id='" + id + "'  ", " NEWID()").Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                return dt.Rows[0]["telephone"].ToString();
            }
            return "";
        }

        /// <summary>
        /// 获取管理员手机号码
        /// </summary>
        /// <returns></returns>
        public static string GetManagerTele()
        {
            BLL.manager bll = new BLL.manager();
            DataTable dt = bll.GetList(1, "  real_name in('苏摩') ", " NEWID()").Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                return dt.Rows[0]["telephone"].ToString();
            }
            return "";
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
                        info.province = !string.IsNullOrEmpty(re.province) ? re.city : "";
                    }
                }
                BLL.Log.WriteTextLog("getCity" + resphtml, DateTime.Now);
            }
            catch (Exception ex)
            {
                info = null;
                BLL.Log.WriteTextLog("--异常记录getCity" + ex.ToString(), DateTime.Now);
            }
            return info;
        }
    }
}