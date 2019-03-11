using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;
using DTcms.Common;

namespace DTcms.BLL
{
    public partial class Product
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.Product dal;
        public Product()
        {
            dal = new DAL.Product(siteConfig.sysdatabaseprefix);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.Product model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.Product model)
        {
            return dal.Update(model);
        }

                /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool UpdateNoPrice(Model.Product model)
        {
            return dal.UpdateNoPrice(model);
        }

        

        public bool Delete(int ID)
        {
            return dal.Delete(ID);
        }

        public DataTable GetTypeList(string type)
        {
            return dal.GetTypeList(type).Tables[0];
        }

        public int GetMaxProductID()
        {
            return dal.GetMaxProductID();
        } 

        /// <summary>
        /// 更新库存数据
        /// </summary>
        /// <param name="productid"></param>
        /// <param name="InventoryCount"></param>
        /// <returns></returns>
        public bool Update_InventoryCount(string productid, int InventoryCount)
        {
            return dal.Update_InventoryCount(productid, InventoryCount);
        }

        public Model.Product GetModel(int ID, string strWhere)
        {
            return DataTableToModel(dal.GetModel(ID, strWhere).Tables[0]);
        }

        public Model.Product DataTableToModel(DataTable dt)
        {
            Model.Product model = new Model.Product();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetModel(dr);                    
                }
            }
            return model;
        }
        public Model.ProductListView GetModelList(DataRow dr)
        {
            Model.ProductListView model = new Model.ProductListView();
            if (dr != null)
            {
                model.ProductID = Convert.ToString(dr["ProductID"]);
                model.ProductName = Convert.ToString(dr["ProductName"]);//产品名称
                //"http://116.62.124.214/" + 
                model.Images = (string.IsNullOrEmpty(dr["Images"].ToString()) ? "images/articleImg.jpg" : Convert.ToString(dr["Images"]));//产品展示图片
                model.InventoryCount = string.IsNullOrEmpty(dr["InventoryCount"].ToString()) ? 0 : Convert.ToInt32(dr["InventoryCount"]);
                model.Author = Convert.ToString(dr["Author"]);//产品作者
                model.ShowTitle = Convert.ToString(dr["ShowTitle"]);
                model.Type3 = Convert.ToString(dr["Type3"]);
            }
            return model;
        }


        public Model.Product GetModel(DataRow dr, bool isAddPrice=false)
        {
            Model.Product model = new Model.Product();
            if (dr != null)
            {
                model.ProductID = Convert.ToString(dr["ProductID"]);
                model.ProductName = Convert.ToString(dr["ProductName"]);//产品名称
                model.SubTitle = Convert.ToString(dr["SubTitle"]);//副标题
                model.Type1 = Convert.ToString(dr["Type1"]);//名家品牌
                model.Type2 = Convert.ToString(dr["Type2"]);//工艺釉色
                model.Type3 = Convert.ToString(dr["Type3"]);//器型
                model.Type4 = Convert.ToString(dr["Type4"]);//口径尺寸
                model.Type5 = Convert.ToString(dr["Type5"]);//用途功能
                model.Type6 = Convert.ToString(dr["Type6"]);//传世老盏
                model.Type7 = Convert.ToString(dr["Type7"]);//价格区间
                model.operatorID = Convert.ToString(dr["Type7"]);
                model.Images = (string.IsNullOrEmpty(dr["Images"].ToString()) ? "images/articleImg.jpg" : Convert.ToString(dr["Images"]));//产品展示图片
                //"http://116.62.124.214/" + 

                if (!Convert.ToString(dr["summary"]).Contains("http://116.62.124.214"))
                {
                    if (Convert.ToString(dr["summary"]).Contains(".com"))
                    {
                        model.summary = Convert.ToString(dr["summary"]).Replace("http://jianzhanshop.com/", "").Replace("http://121.42.156.253/", "");//摘要
                    }
                    else if (Convert.ToString(dr["summary"]).Contains("http://121.42.156.253/"))
                    {
                        model.summary = Convert.ToString(dr["summary"]).Replace("http://121.42.156.253/", "");//产品内容明细
                    }
                    else
                    {
                        model.summary = Convert.ToString(dr["summary"]);//.Replace("/productimg", "http://116.62.124.214/productimg");//摘要
                    }
                }
                else
                {
                    model.summary = Convert.ToString(dr["summary"]);
                }
                if (!Convert.ToString(dr["ProductDetail"]).Contains("http://116.62.124.214"))
                {

                    if (Convert.ToString(dr["ProductDetail"]).Contains(".com"))
                    {
                        model.ProductDetail = Convert.ToString(dr["ProductDetail"]).Replace("http://jianzhanshop.com/", "").Replace("http://121.42.156.253/", "");//产品内容明细
                    }
                    else if (Convert.ToString(dr["ProductDetail"]).Contains("http://121.42.156.253/"))
                    {
                        model.ProductDetail = Convert.ToString(dr["ProductDetail"]).Replace("http://121.42.156.253/", "");//产品内容明细
                    }
                    else
                    {
                        model.ProductDetail = Convert.ToString(dr["ProductDetail"]);//.Replace("/productimg", "http://116.62.124.214/productimg");//产品内容明细
                    }
                }
                else
                {
                    model.ProductDetail = Convert.ToString(dr["ProductDetail"]);
                }
                model.Material = Convert.ToString(dr["Material"]);//材料
                model.Volume = Convert.ToString(dr["Volume"]);//容量
                model.CostPrice = Convert.ToString(dr["CostPrice"]);//成本价
                model.MarketPrice = Convert.ToString(dr["MarketPrice"]);//市场价
                model.LowPrice = Convert.ToString(dr["LowPrice"]);//最低价
                model.ArtisanID = Convert.ToString(dr["ArtisanID"]);//艺人ID
                model.ProductID = Convert.ToString(dr["ProductID"]);
                model.PlatePosition = Convert.ToString(dr["PlatePosition"]);//推荐位置
                model.Author = Convert.ToString(dr["Author"]);//产品作者
                model.InventoryCount = Convert.ToString(dr["InventoryCount"]);//库存数量     
                model.ProImageDetail = Convert.ToString(dr["ProImageDetail"]);// 产品图片详细    
                model.IsPushMall = Convert.ToString(dr["IsPushMall"]);// 是否推荐到商城  0 否 1 是
                Regex r = new Regex(@"<img[\s\S]*?>", RegexOptions.IgnoreCase);

                // 定义正则表达式用来匹配 img 标签            
                MatchCollection collImages = r.Matches(model.summary);
                List<string> lstImages = new List<string>();
                List<string> lstImagesUrl = new List<string>();
                //if (collImages.Count > 10)
                //{
                //    for (int i=0; i < 10; i++)
                //    {
                //        lstImages.Add(collImages[i].Value);
                //        lstImagesUrl.Add(GetHtmlImageUrlList(collImages[i].Value));
                //    }
                //}
                //else
                //{
                    foreach (Match item in collImages)
                    {
                        lstImages.Add(item.Value);
                        lstImagesUrl.Add(GetHtmlImageUrlList(item.Value));
                    }
                //}
                model.lstImages = lstImages;
                model.lstImagesUrl =lstImagesUrl;

                ///拍卖新增字段
                if (isAddPrice)
                {
                    BLL.Auction bll = new Auction();
                    Model.Auction Amodel = bll.GetModelList(" and ProductID='" + model.ProductID + "' and AuctionDetail='拍卖出价'", true, "Order by CustomerOffer desc");

                    Model.Auction AmodelJZJ = bll.GetModelListJZJ(" and ProductID='" + model.ProductID + "' and AuctionDetail='拍卖出价'", true, "Order by CustomerOffer desc");

                    if (Amodel.CustomerOffer > AmodelJZJ.CustomerOffer)
                    {
                        Amodel = Amodel;
                    }
                    else
                    {
                        Amodel = AmodelJZJ;
                    }

                    if (Amodel != null)
                    {
                        model.CustomerOffer = Amodel.CustomerOffer;
                        Random rd = new Random();
                        model.HighTelePhone = !string.IsNullOrEmpty(Amodel.Telephone) ? Amodel.Telephone.Substring(0, 3) + "****" + Amodel.Telephone.Substring(7) : "158****" + rd.Next(1001, 9999);
                    }

                }
            }
            return model;
        }
        /// <summary> 
        /// 取得HTML中所有图片的 URL。 
        /// </summary> 
        /// <param name="sHtmlText">HTML代码</param> 
        /// <returns>图片的URL列表</returns> 
        public string GetHtmlImageUrlList(string sHtmlText)
        {
            // 定义正则表达式用来匹配 img 标签 
            Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<imgUrl>[^\s\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

            // 搜索匹配的字符串 
            MatchCollection matches = regImg.Matches(sHtmlText);
            int i = 0;
            //string[] sUrlList = new string[matches.Count];
            string str = string.Empty;
            // 取得匹配项列表 
            foreach (Match match in matches)
                str = match.Groups["imgUrl"].Value;
            return str;
        }
        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductList(string sqlwhere,int count,bool isAddPrice=false)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(sqlwhere + count.ToString() + isAddPrice) as List<Model.Product>;
            if (list == null || isAddPrice)
            {
                DataTable dt = dal.GetProductList(sqlwhere, count).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr, isAddPrice));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + isAddPrice, prolist, CacheHelper.Min); 
            }
            else
            {
                prolist = list;                
            }
            return prolist;
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductListNEW(string sqlwhere, int count)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(sqlwhere + count.ToString()) as List<Model.Product>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList(sqlwhere, count).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr,true));
                }
                CacheHelper.Insert(sqlwhere + count.ToString(), prolist, CacheHelper.Min);
            }
            else
            {
                List<Model.Product> prolistnew = new List<Model.Product>();
                if (list != null && list.Count > 0)
                {
                    foreach (Model.Product info in list)
                    {
                        BLL.Auction bll = new Auction();
                        Model.Auction Amodel = bll.GetModelList(" and ProductID='" + info.ProductID + "' and AuctionDetail='拍卖出价'", true, "Order by CustomerOffer desc");

                        Model.Auction AmodelJZJ = bll.GetModelListJZJ(" and ProductID='" + info.ProductID + "' and AuctionDetail='拍卖出价'", true, "Order by CustomerOffer desc");

                        if (Amodel.CustomerOffer > AmodelJZJ.CustomerOffer)
                        {
                            Amodel = Amodel;
                        }
                        else
                        {
                            Amodel = AmodelJZJ;
                        }

                        if (Amodel != null)
                        {
                            info.CustomerOffer = Amodel.CustomerOffer;
                            Random rd = new Random();
                            info.HighTelePhone = !string.IsNullOrEmpty(Amodel.Telephone) ? Amodel.Telephone.Substring(0, 3) + "****" + Amodel.Telephone.Substring(7) : "158****" + rd.Next(1001, 9999);
                        }
                        prolistnew.Add(info);
                    }
                }

                prolist = prolistnew;
            }
            return prolist;
        }


        public Model.Product GetProductModel(string sqlwhere)
        {
            Model.Product model = new Model.Product();
            var m = CacheHelper.Get(sqlwhere) as Model.Product;
            if (m == null)
            {
                DataTable dt = dal.GetProductModel(sqlwhere).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    model=GetModel(dr);
                }
                CacheHelper.Insert(sqlwhere, model, CacheHelper.Min);
            }
            else
            {
                model = m;
            }
            return model;
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductList(int count)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(count.ToString()) as List<Model.Product>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList( count).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr));
                }
                CacheHelper.Insert(count.ToString(), prolist, CacheHelper.Min);
            }
            else
            {
                prolist = list;
            }
            return prolist;
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductList(int count,int Rcount,string sqlwhere)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(count.ToString() + Rcount.ToString() + sqlwhere) as List<Model.Product>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList(count,Rcount , sqlwhere).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr));
                }
                CacheHelper.Insert(count.ToString() + Rcount.ToString() + sqlwhere, prolist, CacheHelper.Min);
            }
            else
            {
                prolist = list;
            }
            return prolist;
        }

        /// <summary>
        /// 当天同手机号同产品编号只能资讯5次
        /// </summary>
        /// <param name="telephone"></param>
        /// <param name="productid"></param>
        /// <returns></returns>
        public int GetCountByTelephoneAndProductID(string telephone, string productid)
        {
            try
            {
                return dal.GetCountByTelephoneAndProductID(telephone, productid);
            }
            catch (Exception ex)
            {
                return 0;                
            }
        }

        /// <summary>
        /// 当天同手机号同产品编号只能资讯5次
        /// </summary>
        /// <param name="telephone"></param>
        /// <param name="productid"></param>
        /// <returns></returns>
        public int GetCountByTelephoneAndProductID(string telephone)
        {
            try
            {
                return dal.GetCountByTelephoneAndProductID(telephone);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.ProductListView> GetProductList(string sqlwhere, int count,string desc)
        {
            List<Model.ProductListView> prolist = new List<Model.ProductListView>();
            var list = CacheHelper.Get(sqlwhere + count.ToString() + desc) as List<Model.ProductListView>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList(sqlwhere, count, desc).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModelList(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + desc, prolist, CacheHelper.Min); 
            }
            else {
                prolist = list;
            }

            return prolist;
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.ProductListView> GetProductListNEW(string sqlwhere, int count, string desc)
        {
            List<Model.ProductListView> prolist = new List<Model.ProductListView>();
            var list = CacheHelper.Get(sqlwhere + count.ToString() + desc) as List<Model.ProductListView>;
            if (list == null)
            {
                DataTable dt = dal.GetProductListNEW(sqlwhere, count, desc).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModelList(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + desc, prolist, CacheHelper.Min);
            }
            else
            {
                prolist = list;
            }

            return prolist;
        }
        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductList(string sqlwhere, int count, int indexCount, string OrderBy ,int pageindex)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(sqlwhere + count.ToString() + indexCount.ToString() + pageindex.ToString() + OrderBy) as List<Model.Product>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList(sqlwhere, count, indexCount, OrderBy).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + indexCount.ToString() + pageindex.ToString() + OrderBy, prolist, CacheHelper.Min);
            }
            else
            {
                prolist = list;
            }

            return prolist;
        }

        /// <summary>
        /// 获取产品LIST 根据产品板块
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public List<Model.Product> GetProductList(string sqlwhere, int count, int indexCount)
        {
            List<Model.Product> prolist = new List<Model.Product>();
            var list = CacheHelper.Get(sqlwhere + count.ToString()+indexCount.ToString()) as List<Model.Product>;
            if (list == null)
            {
                DataTable dt = dal.GetProductList(sqlwhere, count, indexCount).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    prolist.Add(GetModel(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + indexCount.ToString(), prolist, CacheHelper.Min); 
            }
            else
            {
                prolist = list;
            }

            return prolist;
        }

        /// <summary>
        /// 或者总数
        /// </summary>
        /// <param name="sqlwhere"></param>
        /// <returns></returns>
        public int GetTotalCount(string sqlwhere)
        {
            return dal.GetTotalCount(sqlwhere);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
    }
}
