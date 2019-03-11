using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web.admin
{
    public partial class Ajax : System.Web.UI.Page
    {
        private BLL.Product bll = new BLL.Product();
        private BLL.Artisan bllArt = new BLL.Artisan();
        private BLL.manager bllMan = new BLL.manager();

        private string ProductID = string.Empty;
        private int InventoryCount = 0;        
        private string Type = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Type = Request["Type"];
            if (Type == "UIC")//更新库存
            {
                ProductID = Request["productid"];
                InventoryCount = Convert.ToInt32(Request["count"]);
                bll.Update_InventoryCount(ProductID, InventoryCount);
                Console.Write("更新库存成功");
            }
            else if (Type == "USORT")
            {
                bllArt.Update_Sort(Request["ArtisanID"], Convert.ToInt32(Request["Sort"]));
                Console.Write("更新库存成功");
            }
            else if (Type.Equals("MSL"))
            {
                bllMan.UpdateSalesCountByID(Convert.ToInt32(Request["ID"]), Convert.ToInt32(Request["Count"]));
            }
        }
    }
}