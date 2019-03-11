using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using DTcms.BLL;

namespace DTcms.Web.ajax
{
    public partial class prolistAjax : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        private BLL.Artisan bllArtisan = new BLL.Artisan();
        public List<Model.ProductListView> ModelProList = null;
        JavaScriptSerializer jss = new JavaScriptSerializer();
        private string sqlwhere = string.Empty;
        private string desc = string.Empty;
        string KEYWORD = string.Empty;
        private bool IsOrderType = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            KEYWORD = Server.UrlDecode((Request["keyword"]));

            //KEYWORD = Request["keyword"];
            if (!string.IsNullOrEmpty(KEYWORD) && KEYWORD != "null")//首页搜索
            {
                sqlwhere = " and ProductID='" + KEYWORD + "' or ProductName like '%" + KEYWORD + "%' or Author like '%" + KEYWORD + "%' or Type2 like '" + KEYWORD + "' or Type3 like '" + KEYWORD + "' or Type4 like '" + KEYWORD + "' or Type5 like '" + KEYWORD + "'";
            }
            
            string Type1 = Request["type1"];//作者
            string Type2 = Request["type2"];//釉色分类
            string Type3 = Request["type3"];//器型分类
            string Type4 = Request["type4"];//口径分类
            string Type5 = Request["type5"];//价格分类
            string Type6 = Request["type6"];//功能分类
            string Type7 = Request["type7"];//老盏分类
            string OrderType = Request["OrderType"];//default:默认 new:新品  sales:销量  hot：人气
            if (OrderType == "new")//新品
            {
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            else if (OrderType == "sales")//销量
            {
                desc = " InquiryCount desc  ";
            }
            else if (OrderType == "hot")//人气
            {
                //按照历史售出数量（或者按照这个作品询价数量），降序排列，库存数相同随机显示 暂时无
                desc = " CountAll  desc ";
            }
            else if (OrderType == "default")//默认
            {
                //sqlwhere = " and MarketPrice>1999 ";
                desc = " InventoryCount desc, ArtisanSort  ";//库存量越大显示在最前面
                sqlwhere = "  and 1=1 ";
                //sqlwhere += " and Author in('陈大鹏','黄美金','李达','陆金喜','孙建兴','卓立旗','裴春元')";
            }

            if (!string.IsNullOrEmpty(OrderType))
            {
                IsOrderType = true;
            }

            if (!string.IsNullOrEmpty(Type1) && Type1 != "null")//作者
            {

                if (Type1 == "老牌传承人")
                {
                    sqlwhere += " and Author in(" + GetAllArtisan(Type1) + ")";
                }
                else if (Type1 == "业界大师")
                {
                    sqlwhere += " and Author in(" + GetAllArtisan(Type1) + ")";
                }
                else if (Type1 == "名家工艺师")
                {
                    sqlwhere += " and Author in(" + GetAllArtisan(Type1) + ")";
                }
                else if (Type1 == "知名品牌")
                {
                    sqlwhere += " and Author in(" + GetAllArtisan(Type1) + ")";
                }
                else
                {
                    sqlwhere += " and Author='" + Type1 + "'";
                }
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type2) && Type2 != "null")//釉色分类
            {
                sqlwhere += " and Type2='" + Type2 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type3) && Type3 != "null")//经典器型
            {
                sqlwhere += " and Type3='" + Type3 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type4) && Type4 != "null")//口径分类
            {
                sqlwhere += " and Type4='" + Type4 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type5) && Type5 != "null")//功能分类
            {
                sqlwhere += " and Type5='" + Type5 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type6) && Type6 != "null")//传世老盏
            {
                sqlwhere += " and Type6='" + Type6 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }
            if (!string.IsNullOrEmpty(Type7) && Type7 != "null")//价格分类
            {
                sqlwhere += " and Type7='" + Type7 + "'";
                //按照有库存的上线时间降序
                desc = " adddate desc ";
            }

            if (string.IsNullOrEmpty(desc) && IsOrderType == false)
            {
                //sqlwhere = " and MarketPrice>1999 ";
                desc = " InventoryCount desc,ArtisanSort  ";
                //sqlwhere += " and Author in('陈大鹏','黄美金','李达','陆金喜','孙建兴','卓立旗','裴春元')";
            }
            //sqlwhere += " and IsPushMall=1";
            ModelProList = bll.GetProductList(sqlwhere, 0, desc);
            Response.Write(jss.Serialize(ModelProList));
        }

        public string GetAllArtisan(string author)
        {
            string str = "";
            List<Model.Artisan> lstArtA = bllArtisan.GetArtisanList(" and artisanType='" + author + "' and IsCooperation=1");
            foreach (Model.Artisan model in lstArtA)
            {
                str += "'" + model.artisanName + "',";
            }
            return str.Substring(0, str.Length - 1);
        }
    }
}