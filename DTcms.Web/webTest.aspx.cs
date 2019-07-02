using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using System.Data;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using DTcms.Model;

namespace DTcms.Web
{
    public partial class webTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        private string getCity(string telephone)
        {
            ////
            //string url = "http://apis.juhe.cn/mobile/get?phone=" + telephone + "&key=f6b3c53f05453d39221ac36b31bf170e";
            ////请求数据
            //HttpWebRequest res = (HttpWebRequest)WebRequest.Create(url);
            ////方法名
            //res.Method = "GET";
            ////获取响应数据
            //HttpWebResponse resp = (HttpWebResponse)res.GetResponse();
            ////读取数据流
            //StreamReader sr = new StreamReader(resp.GetResponseStream(), Encoding.UTF8);
            ////编译成字符串
            //string resphtml = sr.ReadToEnd();

            //TelephoneJson result = JsonConvert.DeserializeObject<TelephoneJson>(resphtml);
            return "";
        }

        public ProCityInfo getProvinceCityInfo()
        {
            string ip = HttpContext.Current.Request.UserHostAddress;
            ProCityInfo info = new ProCityInfo();
            IpService.IpAddressSearchWebServiceSoapClient client = new IpService.IpAddressSearchWebServiceSoapClient();
            string theIpAddress = ip;
            string[] IPAddress = client.getCountryCityByIp(theIpAddress);
            info.province = IPAddress[1];
            //info.city = IPAddress[1].Substring(3, 3);
            return info;
        }


      
        protected void Button1_Click(object sender, EventArgs e)
        {
            getProvinceCityInfo();
            //getCity("15802148204");
            
            //proInquiry bll = new proInquiry();
            //DataTable dt = bll.GetTest().Tables[0];
            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    for (int i = 0; i < dt.Rows.Count; i++)
            //    {
            //        int count = bll.GetCount(dt.Rows[i]["tel"].ToString(), dt.Rows[i]["id"].ToString());
            //        if (count == 0)
            //        {
            //            Model.proInquiry model = new Model.proInquiry();
            //            model.ProductID = dt.Rows[i]["id"].ToString();
            //            model.WebChartID = "";
            //            model.CustomerName = "";
            //            model.InquiryContent = "91数据导入";
            //            model.telphone = dt.Rows[i]["tel"].ToString();
            //            model.CustomerName = "";
            //            model.SourceForm = "PC";
            //            model.ProcessingState = "1";
            //            model.OperatorID = "2";
            //            model.SaleTelephone = "13916116545";
            //            model.status = "新";
            //            model.AddDate = Convert.ToDateTime(dt.Rows[i]["date"].ToString() + " " + dt.Rows[i]["time"].ToString());
            //            bll.Add(model);
            //        }
            //    }
            //}
        }
    }
}