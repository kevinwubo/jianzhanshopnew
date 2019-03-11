using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DTcms.Web
{
    public partial class article_list2 : System.Web.UI.Page
    {
        private BLL.article bllArt = new BLL.article();
        private BLL.Artisan bllArtisan = new BLL.Artisan();
        public List<Model.Artisan> ArtisanHotList1 = null;//4
        public List<Model.Artisan> ArtisanHotList2 = null;//4

        public List<Model.articleView> ModelArticleNEWSList1 = null;//新闻资讯	2
        public List<Model.articleView> ModelArticleNEWSList2 = null;//新闻资讯	6
        public List<Model.articleView> ModelArticlePMList = null;//拍卖行情	paimai 4
        public List<Model.articleView> ModelArticlePMList2 = null;//拍卖行情	paimai 5

        public List<Model.articleView> ModelArticleGYList = null;//建盏工艺	gongyi
        public List<Model.articleView> ModelArticleBKList = null;//百科知识	baike
        public List<Model.articleView> ModelArticleJQList = null;//选盏技巧	jiqiao 3
        public List<Model.articleView> ModelArticleWHList = null;//文化历史	wenhua

        public List<Model.articleView> ModelArticleBYList = null;//保养使用	baoyang 3
        protected void Page_Load(object sender, EventArgs e)
        {
            ArtisanHotList1 = bllArtisan.GetArtisanList(" and IsPushMall=1 ", " NEWID() ", 4);// artisanType='老牌传承人'
            ArtisanHotList2 = bllArtisan.GetArtisanList(" and IsPushMall=1", " NEWID()", 4);// artisanType='业界大师'

            ModelArticleNEWSList1 = bllArt.GetArticleList(" and  b.title='新闻资讯' ", 2);
            ModelArticleNEWSList2 = bllArt.GetArticleList(" and b.title='新闻资讯' ", 6);

            ModelArticlePMList = bllArt.GetArticleList(" and b.title='拍卖行情' ", 4);
            ModelArticlePMList2 = bllArt.GetArticleList(" and b.title='拍卖行情' ", 3);

            ModelArticleJQList = bllArt.GetArticleList(" and b.title='选盏技巧'", 3);

            ModelArticleBYList = bllArt.GetArticleList(" and b.title='选盏技巧'", 3);
        }
    }
}