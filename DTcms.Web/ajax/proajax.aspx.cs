﻿using System;
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
                    Response.Write("成功！建盏天下顾问即将联系您，为您提供建盏报价！");
                }
                else if (proCount > 2)//当天同手机号同产品编号只能资讯2次
                {
                    Response.Write("成功！建盏天下顾问即将联系您，为您提供建盏报价！");
                }
                else if (proTelCount > 5)//手机号大于5次 同一天
                {
                    Response.Write("成功！建盏天下顾问即将联系您，为您提供建盏报价！");
                }
                else if (tel.Length != 11)
                {
                    Response.Write("成功！建盏天下顾问即将联系您，为您提供建盏报价！");
                }
                else
                {
                #endregion

                    

                    string InquiryType = Request["InquiryType"];
                    string SourceForm = Request["SourceForm"];
                    string Content = Request["Content"];//留言内容
                    string smsMess = "新客户咨询！";
                    #region 获取发送短信手机号码
                    string code = "DSalesQueue";

                    DateTime dtNow = Convert.ToDateTime(DateTime.Now.ToShortTimeString());

                    //班次分配
                    //ASalesQueue 1）凌晨班：凌晨1点016到早上5点30
                    //BSalesQueue 2）早班：5点31~9点30，这
                    //CSalesQueue 3）上午班：9点31~12点
                    //DSalesQueue 4）午睡班：12点01~14点
                    //ESalesQueue 5）下午班：14点01~18点
                    //FSalesQueue 6）晚班：18:01到21点45
                    //GSalesQueue 7）夜班：21点46到凌晨1点
                    string datetime = DateTime.Now.AddDays(-1).ToShortDateString();
                    string sqlTime = "";
                    if (dtNow.CompareTo(Convert.ToDateTime("01:16")) > 0 && dtNow.CompareTo(Convert.ToDateTime("05:30")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 01:16' and '" + datetime + " 05:30'";
                        code = "ASalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("05:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime("09:30")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 05:31' and '" + datetime + " 09:30'";
                        code = "BSalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("09:31")) > 0 && dtNow.CompareTo(Convert.ToDateTime("12:00")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 09:31' and '" + datetime + " 12:00'";
                        code = "CSalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("12:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("14:00")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 12:01' and '" + datetime + " 14:00'";
                        code = "DSalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("14:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("18:00")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 14:01' and '" + datetime + " 18:00'";
                        code = "ESalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("18:01")) > 0 && dtNow.CompareTo(Convert.ToDateTime("21:45")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 18:01' and '" + datetime + " 21:45'";
                        code = "FSalesQueue";
                    }
                    else if (dtNow.CompareTo(Convert.ToDateTime("21:46")) > 0 && dtNow.CompareTo(Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString() + " 01:15")) < 0)
                    {
                        sqlTime = " and AddDate between '" + datetime + " 21:46' and '" + datetime + " 01:15'";
                        code = "GSalesQueue";
                    }

                    #region 城市信息优先级最高
                    ProCityInfo info = getProCityInfo();
                    string city = "";
                    string province = "";
                    if (info != null)
                    {
                        city = info.city;
                        province = info.province;
                        if (!string.IsNullOrEmpty(info.city))
                        {
                            if (info.city.Contains("北京") || info.city.Contains("廊坊"))
                            {
                                code = "BeiJingSalesQueue";
                            }
                        }
                    }
                   
                    #endregion

                    //广告页面过来单独使用一个队列
                    if (!string.IsNullOrEmpty(SourceForm) && "AD".Equals(SourceForm))
                    {
                        code = "ADSalesQueue";
                    }

                    SMSText = bllCodes.GetModel(" and Code='SmsTemplate'").CodeValues;
                    //当前销售队列
                    string codes = bllCodes.GetModel(" and Code='" + code + "'").CodeValues;
                    BLL.Log.WriteTextLog("当前销售队列：" + codes , DateTime.Now);
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
                    BLL.Log.WriteTextLog("最近资讯销售姓名：" + codeNames, DateTime.Now);
                    string lastSaleName = bllCodes.GetLastSaleNameByCodes(codeNames.TrimEnd(','), sqlTime);// 最近资讯销售姓名
                    Model.manager dtSale = new manager(); ;
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
                                manager mr = bllManager.GetModel(item.Replace("'", ""));

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
                    #endregion
                    Model.proInquiry model = new Model.proInquiry();
                    if (InquiryType == "询价")
                    {
                        #region 增加询价数据
                        string TxtValue = Request["TxtValue"];
                        string Type = Request["Type"];
                        string Name = Request["Name"];//您的称呼
                        DataTable dtTel = bll.GetList(" and (telphone='" + TxtValue + "' or telphone='" + DESEncrypt.ConvertBy123(TxtValue) + "')").Tables[0];
                        model.ProductID = ProductID;
                        model.SourceForm = string.IsNullOrEmpty(SourceForm) ? "MB" : SourceForm;
                        model.ProcessingState = "0";
                        model.CustomerName = Name;
                        model.InquiryContent = Content;
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
                            model.HistoryOperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.OperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.SaleTelephone = GetSalestelephone(Convert.ToString(dtTel.Rows[0]["OperatorID"]));
                            smsMess = "老客户咨询！";
                        }
                        else
                        {
                            model.HistoryOperatorID = dtSale != null ? dtSale.id.ToString() : "0";
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
                            model.HistoryOperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.OperatorID = Convert.ToString(dtTel.Rows[0]["OperatorID"]);
                            model.SaleTelephone = GetSalestelephone(Convert.ToString(dtTel.Rows[0]["OperatorID"]));
                            smsMess = "老客户咨询！";
                        }
                        else
                        {
                            model.HistoryOperatorID = dtSale != null ? dtSale.id.ToString() : "0";
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

                        if (!string.IsNullOrEmpty(saleName))
                        {
                            DTcms.BLL.SMSHelper.SeedSMS(model.SaleTelephone, SmsMess);
                            BLL.Log.WriteTextLog("--手机号 销售：" + model.SaleTelephone + "-询价-短信内容：" + SmsMess, DateTime.Now);

                            //发送给老板
                            DTcms.BLL.SMSHelper.SeedSMS(GetManagerTele(), SmsMess);
                            BLL.Log.WriteTextLog("--手机号 BOSS：" + GetManagerTele() + "-询价-短信内容：" + SmsMess, DateTime.Now);

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
                    }

                    if (InquiryType.Equals("头条询价"))
                    {
                        Response.Write("申请成功，建盏天下专属客服将在24小时内为您提供建盏鉴别和定价免费咨询！");
                    }
                    else
                    {
                        Response.Write("成功！建盏天下顾问即将联系您，为您提供建盏报价！");
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

        
        private ProCityInfo getProCityInfo()
        {
            ProCityInfo info = new ProCityInfo();
            try
            {
                string ip = HttpContext.Current.Request.UserHostAddress;
                string url = "http://apis.juhe.cn/ip/ipNew?ip=" + ip + "&key=5cbe82bf7bc6e5623d9424a440dc52f3";
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

                TelephoneJsonInfo result = JsonConvert.DeserializeObject<TelephoneJsonInfo>(resphtml);
                if (result != null)
                {
                    resultinfo re = result.result;
                    if (re != null)
                    {
                        info.city = !string.IsNullOrEmpty(re.City) ? re.City : "";
                        info.province = !string.IsNullOrEmpty(re.Province) ? re.Province : "";
                    }
                }
                BLL.Log.WriteTextLog("getProCityInfo" + resphtml, DateTime.Now);
            }
            catch (Exception ex)
            {
                info = null;
                BLL.Log.WriteTextLog("--异常记录getProCityInfo" + ex.ToString(), DateTime.Now);
            }
            return info;
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