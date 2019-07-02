using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public partial class Product
    {
        private string databaseprefix; //数据库表名前缀
        public Product(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.Product model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_Product(");
            strSql.Append("ProductName,SubTitle,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,CostPrice,MarketPrice,LowPrice,VideoUrl,VideoDetail,ProductID,PlatePosition,Author,ProImageDetail,Volume,IsPushMall,InventoryCount,Introduction)");
            strSql.Append(" values (");
            strSql.Append("@ProductName,@SubTitle, @Type2,@Type3,@Type4,@Type5, @Type6,@Type7,@Images, @summary,@ProductDetail,@CostPrice,@MarketPrice,@LowPrice,@VideoUrl,@VideoDetail,@ProductID,@PlatePosition,@Author,@ProImageDetail,@Volume,@IsPushMall,@InventoryCount,@Introduction)");
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@ProductName", SqlDbType.NVarChar,100),
                    new SqlParameter("@SubTitle", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type2", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type3", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type4", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type5", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type6", SqlDbType.NVarChar,100),
                    new SqlParameter("@Type7", SqlDbType.NVarChar,100),
                    new SqlParameter("@Images", SqlDbType.NVarChar,100),
                    new SqlParameter("@summary", SqlDbType.NText),
                    new SqlParameter("@ProductDetail", SqlDbType.NText),
                    new SqlParameter("@CostPrice", SqlDbType.Decimal,13),
                    new SqlParameter("@MarketPrice", SqlDbType.Decimal,13),
                    new SqlParameter("@LowPrice", SqlDbType.Decimal,13),
                    new SqlParameter("@VideoUrl", SqlDbType.NVarChar,100),
                    new SqlParameter("@VideoDetail", SqlDbType.NVarChar,100),
                    new SqlParameter("@ProductID", SqlDbType.NVarChar,100),
                    new SqlParameter("@PlatePosition", SqlDbType.NVarChar,100),
                    new SqlParameter("@Author", SqlDbType.NVarChar,100),
                    new SqlParameter("@ProImageDetail", SqlDbType.NVarChar,100),
                    new SqlParameter("@Volume", SqlDbType.NVarChar,100),
                    new SqlParameter("@IsPushMall", SqlDbType.NVarChar,10),
                    new SqlParameter("@InventoryCount", SqlDbType.Int,4),
                    new SqlParameter("@Introduction", SqlDbType.NVarChar,250),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value = model.ProductName;
            parameters[1].Value = model.SubTitle;
            parameters[2].Value = model.Type2;
            parameters[3].Value = model.Type3;
            parameters[4].Value = model.Type4;
            parameters[5].Value = model.Type5;
            parameters[6].Value = model.Type6;
            parameters[7].Value = model.Type7;
            parameters[8].Value = model.Images;
            parameters[9].Value = model.summary;

            parameters[10].Value = model.ProductDetail;
            parameters[11].Value = model.CostPrice;
            parameters[12].Value = model.MarketPrice;
            parameters[13].Value = model.LowPrice;
            parameters[14].Value = model.VideoUrl;
            parameters[15].Value = model.VideoDetail;
            parameters[16].Value = model.ProductID;
            parameters[17].Value = model.PlatePosition;
            parameters[18].Value = model.Author;
            parameters[19].Value = model.ProImageDetail;
            parameters[20].Value = model.Volume;
            parameters[21].Value = model.IsPushMall;
            parameters[22].Value = string.IsNullOrEmpty(model.InventoryCount) ? 0 : Convert.ToInt32(model.InventoryCount);
            parameters[23].Value = model.Introduction;
            parameters[24].Direction = ParameterDirection.Output;

            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[24].Value;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_Product ");
            strSql.Append(" where ID ='" + ID + "'");
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }

        
        /// <summary>
        /// 更新库存数量
        /// </summary>
        /// <param name="productid">产品ID</param>
        /// <param name="InventoryCount">库存数量</param>
        /// <returns></returns>
        public bool Update_InventoryCount(string productid,int InventoryCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("Update dt_Product set InventoryCount=" + InventoryCount + " where productid='" + productid + "'");
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 获取产品编号
        /// </summary>
        /// <returns></returns>
        public int GetMaxProductID()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select MAX(ID)+1 from dt_Product ");
            int i = DbHelperSQL.GetMaxID("ID", "dt_Product");
            if (i==1)
            {
                return 1001;
            }
            return i;
        }

        /// <summary>
        /// 获取单条数据
        /// </summary>
        /// <param name="productid"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetModel(int ID, string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT ProductID,ProductName,IsPushMall,SubTitle,ProImageDetail,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction  FROM dt_Product ");
            strSql.Append(" where ID=" + ID);
            if (strWhere.Trim() != "")
            {
                strSql.Append(" and " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 获取分类列表
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataSet GetTypeList(string type)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT ID,Code,Name,Type,adddate  FROM dt_Types ");
            strSql.Append(" where Type='" + type + "'");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool UpdateNoPrice(Model.Product model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_Product set ");
            strSql.Append("ProductName=@ProductName,");
            strSql.Append("SubTitle=@SubTitle,");
            //strSql.Append("Type1=@Type1,");
            strSql.Append("Type2=@Type2,");
            strSql.Append("Type3=@Type3,");
            strSql.Append("Type4=@Type4,");
            strSql.Append("Type5=@Type5,");
            strSql.Append("Type6=@Type6,");
            strSql.Append("Type7=@Type7,");
            strSql.Append("Images=@Images,");
            strSql.Append("summary=@summary,");
            strSql.Append("ProductDetail=@ProductDetail,");
            //strSql.Append("Material=@Material,");
            strSql.Append("Volume=@Volume,");
            //strSql.Append("CostPrice=@CostPrice,");
            //strSql.Append("MarketPrice=@MarketPrice,");
            //strSql.Append("LowPrice=@LowPrice,");
            //strSql.Append("ArtisanID=@ArtisanID,");
            strSql.Append("VideoUrl=@VideoUrl,");
            strSql.Append("VideoDetail=@VideoDetail,");
            strSql.Append("UpdateDate=@UpdateDate,");
            strSql.Append("PlatePosition=@PlatePosition,");
            strSql.Append("Author=@Author,");
            strSql.Append("ProImageDetail=@ProImageDetail,");
            strSql.Append("ProductID=@ProductID,");
            strSql.Append("IsPushMall=@IsPushMall,");
            strSql.Append("Introduction=@Introduction");
            strSql.Append(" where ID=@ID");
            SqlParameter[] parameters = {
					            new SqlParameter("@ProductName", SqlDbType.NVarChar,50),
					            new SqlParameter("@SubTitle", SqlDbType.NVarChar,100),
                                //new SqlParameter("@Type1", SqlDbType.NVarChar,100),
                                new SqlParameter("@Type2", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type3", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type4", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type5", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type6", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type7", SqlDbType.NVarChar,100),
                                new SqlParameter("@Images", SqlDbType.NVarChar,255),
					            new SqlParameter("@summary", SqlDbType.NText),
					            new SqlParameter("@ProductDetail", SqlDbType.NText),
                                //new SqlParameter("@Material",SqlDbType.NVarChar,500),                                
                                //new SqlParameter("@CostPrice", SqlDbType.Decimal,13),
                                //new SqlParameter("@MarketPrice", SqlDbType.Decimal,13),
                                //new SqlParameter("@LowPrice", SqlDbType.Decimal,13),
                                        //new SqlParameter("@ArtisanID", SqlDbType.NVarChar,200),
                                        new SqlParameter("@VideoUrl", SqlDbType.NVarChar,200),
                                        new SqlParameter("@VideoDetail", SqlDbType.NVarChar,200),
                                        new SqlParameter("@UpdateDate", SqlDbType.DateTime),
                                        new SqlParameter("@PlatePosition", SqlDbType.NVarChar,200),
                                        new SqlParameter("@Author", SqlDbType.NVarChar,100),
                                        new SqlParameter("@Volume", SqlDbType.NVarChar,50),
                                        new SqlParameter("@ProductID", SqlDbType.NVarChar,100),
                                        new SqlParameter("@ProImageDetail", SqlDbType.NVarChar,100),
                                        new SqlParameter("@IsPushMall", SqlDbType.NVarChar,10),
                                        new SqlParameter("@Introduction", SqlDbType.NVarChar,254),
                                        new SqlParameter("@ID", SqlDbType.Int)};
            parameters[0].Value = model.ProductName;
            parameters[1].Value = model.SubTitle;
            //parameters[2].Value = model.Type1;
            parameters[2].Value = model.Type2;
            parameters[3].Value = model.Type3;
            parameters[4].Value = model.Type4;
            parameters[5].Value = model.Type5;
            parameters[6].Value = model.Type6;
            parameters[7].Value = model.Type7;

            parameters[8].Value = model.Images;
            parameters[9].Value = model.summary;
            parameters[10].Value = model.ProductDetail;
            //parameters[12].Value = model.Material;

            //parameters[11].Value = model.CostPrice;
            //parameters[12].Value = model.MarketPrice;
            //parameters[13].Value = model.LowPrice;
            //parameters[17].Value = model.ArtisanID;
            parameters[11].Value = model.VideoUrl;
            parameters[12].Value = model.VideoDetail;
            parameters[13].Value = DateTime.Now;
            parameters[14].Value = model.PlatePosition;
            parameters[15].Value = model.Author;
            parameters[16].Value = model.Volume;
            parameters[17].Value = model.ProductID;
            parameters[18].Value = model.ProImageDetail;
            parameters[19].Value = model.IsPushMall;
            parameters[20].Value = model.Introduction;
            parameters[21].Value = model.ID;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.Product model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_Product set ");
            strSql.Append("ProductName=@ProductName,");
            strSql.Append("SubTitle=@SubTitle,");
            //strSql.Append("Type1=@Type1,");
            strSql.Append("Type2=@Type2,");
            strSql.Append("Type3=@Type3,");
            strSql.Append("Type4=@Type4,");
            strSql.Append("Type5=@Type5,");
            strSql.Append("Type6=@Type6,");
            strSql.Append("Type7=@Type7,");
            strSql.Append("Images=@Images,");
            strSql.Append("summary=@summary,");
            strSql.Append("ProductDetail=@ProductDetail,");
            //strSql.Append("Material=@Material,");
            strSql.Append("Volume=@Volume,");
            strSql.Append("CostPrice=@CostPrice,");
            strSql.Append("MarketPrice=@MarketPrice,");
            strSql.Append("LowPrice=@LowPrice,");
            //strSql.Append("ArtisanID=@ArtisanID,");
            strSql.Append("VideoUrl=@VideoUrl,");
            strSql.Append("VideoDetail=@VideoDetail,");
            strSql.Append("UpdateDate=@UpdateDate,");
            strSql.Append("PlatePosition=@PlatePosition,");
            strSql.Append("Author=@Author,");
            strSql.Append("ProImageDetail=@ProImageDetail,");
            strSql.Append("ProductID=@ProductID,");
            strSql.Append("IsPushMall=@IsPushMall,");
            strSql.Append("Introduction=@Introduction");
            strSql.Append(" where ID=@ID");
            SqlParameter[] parameters = {
					            new SqlParameter("@ProductName", SqlDbType.NVarChar,50),
					            new SqlParameter("@SubTitle", SqlDbType.NVarChar,100),
                                //new SqlParameter("@Type1", SqlDbType.NVarChar,100),
                                new SqlParameter("@Type2", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type3", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type4", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type5", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type6", SqlDbType.NVarChar,100),
					            new SqlParameter("@Type7", SqlDbType.NVarChar,100),
                                new SqlParameter("@Images", SqlDbType.NVarChar,255),
					            new SqlParameter("@summary", SqlDbType.NText),
					            new SqlParameter("@ProductDetail", SqlDbType.NText),
                                //new SqlParameter("@Material",SqlDbType.NVarChar,500),                                
					            new SqlParameter("@CostPrice", SqlDbType.Decimal,13),
					            new SqlParameter("@MarketPrice", SqlDbType.Decimal,13),
                                new SqlParameter("@LowPrice", SqlDbType.Decimal,13),
                                        //new SqlParameter("@ArtisanID", SqlDbType.NVarChar,200),
                                        new SqlParameter("@VideoUrl", SqlDbType.NVarChar,200),
                                        new SqlParameter("@VideoDetail", SqlDbType.NVarChar,200),
                                        new SqlParameter("@UpdateDate", SqlDbType.DateTime),
                                        new SqlParameter("@PlatePosition", SqlDbType.NVarChar,200),
                                        new SqlParameter("@Author", SqlDbType.NVarChar,100),
                                        new SqlParameter("@Volume", SqlDbType.NVarChar,50),
                                        new SqlParameter("@ProductID", SqlDbType.NVarChar,100),
                                        new SqlParameter("@ProImageDetail", SqlDbType.NVarChar,100),
                                        new SqlParameter("@IsPushMall", SqlDbType.NVarChar,10),
                                        new SqlParameter("@Introduction", SqlDbType.NVarChar,254),
                                        new SqlParameter("@ID", SqlDbType.Int)};
            parameters[0].Value = model.ProductName;
            parameters[1].Value = model.SubTitle;
            //parameters[2].Value = model.Type1;
            parameters[2].Value = model.Type2;
            parameters[3].Value = model.Type3;
            parameters[4].Value = model.Type4;
            parameters[5].Value = model.Type5;
            parameters[6].Value = model.Type6;
            parameters[7].Value = model.Type7;

            parameters[8].Value = model.Images;
            parameters[9].Value = model.summary;
            parameters[10].Value = model.ProductDetail;
            //parameters[12].Value = model.Material;
            
            parameters[11].Value = model.CostPrice;
            parameters[12].Value = model.MarketPrice;
            parameters[13].Value = model.LowPrice;
            //parameters[17].Value = model.ArtisanID;
            parameters[14].Value = model.VideoUrl;
            parameters[15].Value = model.VideoDetail;
            parameters[16].Value = DateTime.Now;
            parameters[17].Value = model.PlatePosition;
            parameters[18].Value = model.Author;
            parameters[19].Value = model.Volume;
            parameters[20].Value = model.ProductID;
            parameters[21].Value = model.ProImageDetail;
            parameters[22].Value = model.IsPushMall;
            parameters[23].Value = model.Introduction;
            parameters[24].Value = model.ID;
            
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM dt_Product");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }



        #region 前台页面展示
        
        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public int GetTotalCount(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  ProductID,ProductName,IsPushMall,ProImageDetail,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount  FROM dt_Product ");
            if (sqlwhere != "")
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }            
            return Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
        }


        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetProductModel(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  ProductID,ProductName,IsPushMall,ProImageDetail,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction  FROM dt_Product ");
            if (sqlwhere != "")
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetProductList(string sqlwhere,int count)
        {
            StringBuilder strSql = new StringBuilder();
            if (count > 0)
            {
                strSql.Append("SELECT top " + count + " ProductID,IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
                strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction  FROM dt_Product ");
            }
            else
            {
                strSql.Append("SELECT ProductID,IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
                strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction  FROM dt_Product ");
            }
            if (sqlwhere != "")
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order by AddDate desc");
            return DbHelperSQL.Query(strSql.ToString());
        }

        public DataSet GetProductList(int count,int RCount,string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT DISTINCT top " + count + " b.* FROM dt_Product AS a ");
            strSql.Append(" CROSS APPLY(   SELECT TOP(" + RCount + ") ProductID,IsPushMall,'' as summary ,'' as ProImageDetail,'' as ProductDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,Material ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction FROM dt_Product WHERE a.Author=Author " + sqlwhere + " ORDER BY AddDate DESC ) AS b order by AddDate desc ");
            return DbHelperSQL.Query(strSql.ToString());
        }


        public DataSet GetProductList(int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT DISTINCT top " + count + " b.* FROM dt_Product AS a ");
            strSql.Append(" CROSS APPLY(   SELECT TOP(2) ProductID,IsPushMall,'' as summary ,'' as ProImageDetail,'' as ProductDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,Material ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction FROM dt_Product WHERE a.Author=Author ORDER BY AddDate DESC ) AS b order by AddDate desc ");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetProductList(string sqlwhere, int count,string desc)
        {
            if (string.IsNullOrEmpty(desc))
            {
                desc = " AddDate desc";
            }
            StringBuilder strSql = new StringBuilder();
            //strSql.Append("SELECT  ProductID,IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            //strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount, ");

            if (count > 0)
            {
                strSql.Append(" SELECT top "+count+" ProductID,ProductName,Images,Author,case InventoryCount when 0 then '已结缘' else Author end as ShowTitle,InventoryCount, ");
                strSql.Append(" (select sort from dt_Artisan  where artisanName=dt_Product.Author) as ArtisanSort ,");
                strSql.Append(" (select COUNT(1) from dt_proInquiry where ProductID=dt_Product.ProductID) as InquiryCount,Type3,(select CountAll from dt_VisitCount where OID=dt_Product.ProductID) as CountAll FROM dt_Product");
            }
            else
            {
                strSql.Append(" SELECT  ProductID,ProductName,Images,Author,case InventoryCount when 0 then '已结缘' else Author end as ShowTitle,InventoryCount, ");
                strSql.Append(" (select sort from dt_Artisan  where artisanName=dt_Product.Author) as ArtisanSort ,");
                strSql.Append(" (select COUNT(1) from dt_proInquiry where ProductID=dt_Product.ProductID) as InquiryCount,Type3,(select CountAll from dt_VisitCount where OID=dt_Product.ProductID) as CountAll FROM dt_Product");
            }
            if (sqlwhere != "")
            {
                strSql.Append(" where 1=1 and InventoryCount>=0 " + sqlwhere);
            }
            strSql.Append(" order by " + desc);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetProductListNEW(string sqlwhere, int count,string desc)
        {
            if (string.IsNullOrEmpty(desc))
            {
                desc = " AddDate desc";
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " ProductID,ProductName,Images,Author,case InventoryCount when 0 then '已结缘' else Author end as ShowTitle,InventoryCount,Type3  FROM dt_Product ");
            if (sqlwhere != "")
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order by " + desc);
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="sqlwhere">查询条件</param>
        /// <param name="count">数量</param>
        /// <param name="PageCount">分页数量</param>
        /// <returns></returns>
        public DataSet GetProductList(string sqlwhere, int count, int PageCount)
        {
            string    OrderBy = " AddDate asc ";
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " ProductID,IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,ArtisanID,VideoUrl,VideoDetail,AddDate,UpdateDate,PlatePosition,Author,InventoryCount,Introduction  FROM dt_Product ");
            strSql.Append(" where ProductID not in ");
            strSql.Append(" (select top " + PageCount + " ProductID from dt_Product where 1=1 " + sqlwhere + " order by " + OrderBy + ") ");
            strSql.Append(sqlwhere);
            strSql.Append(" order by " + OrderBy);            
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 根据板块位置 展示产品信息
        /// </summary>
        /// <param name="sqlwhere">查询条件</param>
        /// <param name="count">数量</param>
        /// <param name="PageCount">分页数量</param>
        /// <returns></returns>
        public DataSet GetProductList(string sqlwhere, int count, int PageCount, string OrderBy = "")
        {
            //if (string.IsNullOrEmpty(OrderBy))
            //{
            //    OrderBy = " a.AddDate asc ";
            //}
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append("SELECT top " + count + " ProductID,a.IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            //strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,a.ArtisanID,a.VideoUrl,VideoDetail,a.AddDate,UpdateDate,PlatePosition,Author,InventoryCount");
            //strSql.Append(" ,(select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1) as ArtisanSort ");
            //strSql.Append("   FROM dt_Product  a left join dt_Artisan b on a.Author=b.artisanName where  b.IsCooperation=1  and  InventoryCount>=0 and ProductID not in ");
            //strSql.Append(" (select top " + PageCount + " ProductID from dt_Product a left join dt_Artisan b on a.Author=b.artisanName where  b.IsCooperation=1 and InventoryCount>=0 " + sqlwhere + "  order by a.AddDate desc,InventoryCount desc ,(select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1) ) ");
            //strSql.Append(sqlwhere);
            //strSql.Append(" order by " + OrderBy);
            //return DbHelperSQL.Query(strSql.ToString());
            if (string.IsNullOrEmpty(OrderBy))
            {
                OrderBy = " a.AddDate asc ";
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " ProductID,a.IsPushMall,ProImageDetail,ProductName,SubTitle,Type1,Type2,Type3,Type4,Type5,Type6,Type7,Images,summary,ProductDetail,Material ");
            strSql.Append(" ,Volume,CostPrice,MarketPrice,LowPrice,a.ArtisanID,a.VideoUrl,VideoDetail,a.AddDate,UpdateDate,PlatePosition,Author,InventoryCount,a.Introduction ");
            //strSql.Append(" ,(select sort from dt_Artisan  where artisanName=a.Author and IsCooperation=1) as ArtisanSort ");
            strSql.Append("   FROM dt_Product  a left join dt_Artisan b on a.Author=b.artisanName where  b.IsCooperation=1  and  InventoryCount>=0 and ProductID not in ");
            strSql.Append(" (select top " + PageCount + " ProductID from dt_Product a left join dt_Artisan b on a.Author=b.artisanName where  b.IsCooperation=1 and InventoryCount>=0 " + sqlwhere + "  order by " + OrderBy + " ) ");
            strSql.Append(sqlwhere);
            strSql.Append(" order by " + OrderBy);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 当天同手机号同产品编号只能资讯5次
        /// </summary>
        /// <param name="telephone"></param>
        /// <param name="productid"></param>
        /// <returns></returns>
        public int GetCountByTelephoneAndProductID(string telephone,string productid)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select ProductID from dbo.dt_proInquiry where telphone='" + telephone + "' and ProductID='" + productid + "' and AddDate between '" + DateTime.Now.ToShortDateString() + " 00:00:01' and '" + DateTime.Now.ToShortDateString() + " 23:59:59' ");
            return Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
        }

        /// <summary>
        /// 当天同手机号同产品编号只能资讯5次
        /// </summary>
        /// <param name="telephone"></param>
        /// <param name="productid"></param>
        /// <returns></returns>
        public int GetCountByTelephoneAndProductID(string telephone)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select ProductID from dbo.dt_proInquiry where telphone='" + telephone + "' and AddDate between '" + DateTime.Now.ToShortDateString() + " 00:00:01' and '" + DateTime.Now.ToShortDateString() + " 23:59:59' ");
            return Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
        }


        #endregion
    }
}
