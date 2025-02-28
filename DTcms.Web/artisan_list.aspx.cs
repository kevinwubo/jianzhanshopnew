﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;

namespace DTcms.Web.web
{
    public partial class artisan_list : System.Web.UI.Page
    {
        private BLL.Artisan bllArt = new BLL.Artisan();
        public BLL.Product bllPro = new BLL.Product();
        public List<Model.Artisan> ModelArticleList = null;

        public int PageSize = 10;//一页显示10行
        protected int TotalCount;//总数
        protected int pageindex;//页数
        protected string artisanType = string.Empty;
        private string SqlWhere = string.Empty;
        public string KEYWORD = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            {
                artisanType = Server.UrlDecode(Request["artisanType"]);
                if (!string.IsNullOrEmpty(artisanType))
                {
                    KEYWORD = artisanType;
                    SqlWhere = " and artisanType='" + artisanType + "'";
                }

                TotalCount = bllArt.GetTotalCount(SqlWhere);
                this.pageindex = DTRequest.GetQueryInt("page", 1);
                //pageindex = pageindex == 0 ? 1 : pageindex;
                ModelArticleList = bllArt.GetArtisanList(SqlWhere, PageSize, (pageindex - 1) * PageSize);     
                //绑定页码
                txtPageNum.Text = this.PageSize.ToString();
                string pageUrl = Utils.CombUrlTxt("artisan_list.aspx", "keywords={0}&page={1}", "", "__id__");
                PageContent.InnerHtml = Utils.OutPageList(this.PageSize, this.pageindex, this.TotalCount, pageUrl, 8);
                
            }
        }

        protected void txtPageNum_TextChanged(object sender, EventArgs e)
        {

        }
    }
}