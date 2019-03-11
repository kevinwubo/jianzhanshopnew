using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace DTcms.Web.activity
{
    public partial class dashitulu :BasePage
    {
        public List<Model.Product> ModelList = null;
        public BLL.Product bll = new BLL.Product();
        private BLL.CodeS bllCodes = new BLL.CodeS();        
        public string Source = "";
        public string PageHtml = "";
        private int pageindex = 0;
        private int pagecount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {            

            ModelList = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='315DASHI'").CodeValues + ") ", 99);//大师专场
            string productID = Request["keyword"];
            Source = Request["source"];
            if (!string.IsNullOrEmpty(productID))
            {
                ModelList = ModelList.FindAll(p => p.ProductID.Equals(productID));
            }

            #region 分页
            try
            {
                pagecount = ModelList.Count / pageSize;
                pageindex = string.IsNullOrEmpty(Request["page"]) ? 1 : int.Parse(Request["page"]);
                if (ModelList.Count % pageSize > 0)
                {
                    pagecount += 1;
                }
                StringBuilder sb = new StringBuilder();
                for (int i = 1; i <= pagecount; i++)
                {
                    sb.Append("<a href='dashitulu.aspx?page=" + i + "&source=" + Source + "'>" + i + "</a>");                    
                    //sb.Append("<a href='dashitulu_" + Source + "_" + i + ".html'>" + i + "</a>");    
                }
                PageHtml = sb.ToString();
                ModelList = ModelList.Skip((pageindex - 1) * pageSize).Take(pageSize).ToList();
            }
            catch (Exception ex)
            {
                ModelList = ModelList;
            }
            #endregion
        }
    }
}