using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace DTcms.Web.activity
{
    public partial class mingjiatulu : BasePage
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
            Source = Request["source"];
            ModelList = bll.GetProductList(" and ProductID in(" + bllCodes.GetModel(" and Code='315MINGJIA'").CodeValues + ") ", 100);//名家专场
            string productID = Request["keyword"];
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
                    sb.Append("<a href='mingjiatulu.aspx?page=" + i + "&source=" + Source + "''>" + i + "</a>");
                    //sb.Append("<a href='mingjiatulu_" + Source + "_" + i + ".html'>" + i + "</a>");     
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