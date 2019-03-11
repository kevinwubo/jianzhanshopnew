using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace DTcms.Web.activity
{
    public partial class detail : BasePage
    {
        private string ProductID = string.Empty;
        private BLL.Product bll = new BLL.Product();
        public List<Model.Product> productModelList = null;
        private string PDType = "";
        public string StartTime = "";
        public string EndTime = "";
        public bool IsShowTiXing = false;
        public string Source = "";
        public bool isFinish = false;
        public string DetailTime = "";
        public string DetailStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Source = Request["source"];
            ProductID = Request.QueryString["productid"];
            PDType = Request.QueryString["type"];
            productModelList = bll.GetProductList(" and ProductID='" + ProductID + "'", 1);
            //小匠：2019年3月10日11点-11日的10点59分，合计24小时
            //名家：3月11日11点-12日的10点59分
            //大师：3月12日11点-13日的10点59分
            if (!string.IsNullOrEmpty(PDType))
            {
                string Type = "小匠";                
                if (PDType.Equals("XJ"))
                {
                    StartTime = StartTime10;
                    EndTime = EndTime11;
                }
                else if (PDType.Equals("MJ"))
                {
                    Type = "名家";
                    StartTime = StartTime11;
                    EndTime = EndTime12;
                }
                else if (PDType.Equals("DS"))
                {
                    Type = "大师";
                    StartTime = StartTime12;
                    EndTime = EndTime13;
                }


                TiXing1.ProductID = productModelList[0].ProductID;
                TiXing1.ProductName = productModelList[0].ProductName;
                TiXing1.Type = Type;
                TiXing1.Source = Source;
                TiXing1.Author = productModelList[0].Author;

                ChuJia1.Source = Source;
                ChuJia1.endTime = EndTime;
                ChuJia1.ProductID = productModelList[0].ProductID;
                ChuJia1.ProductName = productModelList[0].ProductName;
                ChuJia1.Type = Type;
                ChuJia1.Author = productModelList[0].Author;

                DateTime dtNow = DateTime.Now;
                DateTime dtStart = DateTime.Parse(StartTime);
                DateTime dtEnd = DateTime.Parse(EndTime);

                if (dtNow < dtStart)
                {
                    IsShowTiXing = true;
                }

                if (dtNow > dtEnd)
                {
                    isFinish = true;
                }

                if (DateTime.Now > DateTime.Parse(StartTime))
                {
                    DetailTime = EndTime;
                    DetailStr = "距结束";
                }
                else
                {
                    DetailTime = StartTime;
                    DetailStr = "距开始";
                }
            }
        }

        public static string NoHTML(string Htmlstring)
        {
            //删除脚本   
            Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
            //删除HTML   
            Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);

            Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", "   ", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);

            Htmlstring.Replace("<", "");
            Htmlstring.Replace(">", "");
            Htmlstring.Replace("\r\n", "");
            Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();

            return Htmlstring.Length > 50 ? Htmlstring.Substring(0, 49) : Htmlstring;
        }
    }
}