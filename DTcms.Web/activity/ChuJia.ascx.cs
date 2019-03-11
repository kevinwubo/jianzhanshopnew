using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DTcms.Web.activity
{
    public partial class ChuJia : System.Web.UI.UserControl
    {
        public string ProductName { get; set; }
        public string ProductID { get; set; }
        public string Author { get; set; }
        public string Type { get; set; }
        public string endTime { get; set; }
        public string Source { get; set; }
        /// <summary>
        ///小匠专场：10元，及10元的整数倍
        ///名家专场：50元，及50元的整数倍
        ///大师专场：100元，及100元的整数倍
        /// </summary>
        public string Unit { get; set; }
        BLL.Auction bll = new BLL.Auction();
        public decimal CustomerOffer = 500;
        public string HighTelePhone = "158****8899";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Model.Auction model = bll.GetModelList(" and ProductID='" + ProductID + "' and AuctionDetail='拍卖出价'",true, "Order by CustomerOffer desc");
                if (model != null)
                {
                    CustomerOffer = model.CustomerOffer;
                    HighTelePhone = !string.IsNullOrEmpty(model.Telephone) ? model.Telephone.Substring(0, 3) + "****" + model.Telephone.Substring(7) : HighTelePhone;
                }

                if (!string.IsNullOrEmpty(Type))
                {
                    if (Type.Equals("小匠"))
                    {
                        Unit = "10";
                    }
                    else if (Type.Equals("名家"))
                    {
                        Unit = "100";
                    }
                    else if (Type.Equals("大师"))
                    {
                        Unit = "100";
                    }
                }

            }
        }
    }
}