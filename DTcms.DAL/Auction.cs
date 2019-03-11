using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public partial class Auction
    {
        private string databaseprefix; //数据库表名前缀
        public Auction(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.Auction model,bool isJianZhanJun=false)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_Auction(ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source) VALUES ");
            strSql.Append("(@ProductID,@ProductName,@Author,@LowPrice,@ReservePrice,@Telephone,@CustomerOffer,@AuctionDetail,@OperatorID,@AuctionType,@Source)");            
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@ProductID", SqlDbType.NVarChar,50),
                    new SqlParameter("@ProductName", SqlDbType.NVarChar,50),
					new SqlParameter("@Author", SqlDbType.NVarChar,50),
                    new SqlParameter("@LowPrice", SqlDbType.Decimal,18),
                    new SqlParameter("@ReservePrice", SqlDbType.Decimal,18),
                    new SqlParameter("@Telephone", SqlDbType.NVarChar,50),
                    new SqlParameter("@CustomerOffer", SqlDbType.Decimal,18),
                    new SqlParameter("@AuctionDetail", SqlDbType.NVarChar,50),
                    new SqlParameter("@OperatorID", SqlDbType.NVarChar,50),
                    new SqlParameter("@AuctionType", SqlDbType.NVarChar,50),
                    new SqlParameter("@Source", SqlDbType.NVarChar,50),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};

            parameters[0].Value = model.ProductID;
            parameters[1].Value = model.ProductName;
            parameters[2].Value = model.Author;
            parameters[3].Value = model.LowPrice;
            parameters[4].Value = model.ReservePrice;
            parameters[5].Value = model.Telephone;
            parameters[6].Value = model.CustomerOffer;
            parameters[7].Value = model.AuctionDetail;
            parameters[8].Value = model.OperatorID;
            parameters[9].Value = model.AuctionType;
            parameters[10].Value = model.Source;
            parameters[11].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            if (isJianZhanJun)
            {
                DbHelperSQLJZJ.ExecuteSqlTranWithIndentity(sqllist);
            }
            else
            {
                DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            }
            return (int)parameters[11].Value;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_Auction ");
            strSql.Append(" where ID ='" + ID + "'");
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 获取表数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetModelList(string strWhere, bool top1 = false, string OrderDesc = "")
        {
            StringBuilder strSql = new StringBuilder();
            if (top1)
            {
                strSql.Append("SELECT top 1 id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate  FROM dt_Auction");
            }
            else
            {
                strSql.Append("SELECT id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate  FROM dt_Auction");
            }
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            if (!string.IsNullOrEmpty(OrderDesc))
            {
                strSql.Append(OrderDesc);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 获取表数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetModelListJZJ(string strWhere, bool top1 = false, string OrderDesc = "")
        {
            StringBuilder strSql = new StringBuilder();
            if (top1)
            {
                strSql.Append("SELECT top 1 id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate  FROM dt_Auction");
            }
            else
            {
                strSql.Append("SELECT id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate  FROM dt_Auction");
            }
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            if (!string.IsNullOrEmpty(OrderDesc))
            {
                strSql.Append(OrderDesc);
            }
            return DbHelperSQLJZJ.Query(strSql.ToString());
        }
        

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT a.id,ProductID,ProductName,Author,LowPrice,ReservePrice,a.Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,a.AddDate,isnull(b.real_name,'新') as SalesName FROM dt_Auction a left join dt_Manager b on a.OperatorID=b.id ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1  " + strWhere);
            }
            
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }


        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT a.id,ProductID,ProductName,Author,LowPrice,ReservePrice,a.Telephone,CustomerOffer,AuctionDetail,a.AddDate,isnull(b.real_name,'新') as SalesName,AuctionType,Source FROM dt_Auction a left join dt_Manager b on a.OperatorID=b.id ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1  " + strWhere);
            }

            return DbHelperSQL.Query(strSql.ToString());
        }


        #region 临时方法
        /// <summary>
        /// 
        /// </summary>
        /// <param name="type">小匠/名家/大师</param>
        /// <param name="isJianZhanJun">是否建盏君数据</param>
        /// <returns></returns>
        public DataSet GetList(string type, bool isJianZhanJun)
        {
            StringBuilder strSql = new StringBuilder();
            string tablename = "dt_product";
            if (isJianZhanJun)
            {
                tablename = "DTcmsdb3SQL..dt_product";
            }
            strSql.Append("select a.ProductID,b.CustomerOffer,a.ProductName,a.Author from " + tablename + " a,(select ProductID,MAX(CustomerOffer) CustomerOffer from dt_Auction where AuctionType='" + type + "' and AuctionDetail='拍卖出价' group by ProductID) as b where a.ProductID=b.ProductID");

            return isJianZhanJun ? DbHelperSQLJZJ.Query(strSql.ToString()) : DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取所有建盏君数据
        /// </summary>
        /// <returns></returns>
        public DataSet GetALLLJZJist()
        {
            StringBuilder strSql = new StringBuilder();

            strSql.Append("select id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate from dt_Auction ");

            return DbHelperSQLJZJ.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取所有盏天下数据
        /// </summary>
        /// <returns></returns>
        public DataSet GetALLList()
        {
            StringBuilder strSql = new StringBuilder();

            strSql.Append("select id,ProductID,ProductName,Author,LowPrice,ReservePrice,Telephone,CustomerOffer,AuctionDetail,OperatorID,AuctionType,Source,AddDate from dt_Auction ");

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 更新建盏君
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool UpdateJZJ(Model.Auction model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_Auction set ");
            strSql.Append("OperatorID=@OperatorID ");
            strSql.Append(" where ProductID=@ProductID and Telephone=@Telephone");
            SqlParameter[] parameters = {
					            new SqlParameter("@OperatorID", SqlDbType.NVarChar,50),
                                new SqlParameter("@ProductID", SqlDbType.NVarChar,50),
					            new SqlParameter("@Telephone", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.OperatorID;
            parameters[1].Value = model.ProductID;
            parameters[2].Value = model.Telephone;

            int rows = DbHelperSQLJZJ.ExecuteSql(strSql.ToString(), parameters);
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
        /// 更新盏天下
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Update(Model.Auction model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_Auction set ");
            strSql.Append("OperatorID=@OperatorID ");
            strSql.Append(" where ProductID=@ProductID and Telephone=@Telephone");
            SqlParameter[] parameters = {
					            new SqlParameter("@OperatorID", SqlDbType.NVarChar,50),
                                new SqlParameter("@ProductID", SqlDbType.NVarChar,50),
					            new SqlParameter("@Telephone", SqlDbType.NVarChar,50)};
            parameters[0].Value = model.OperatorID;
            parameters[1].Value = model.ProductID;
            parameters[2].Value = model.Telephone;

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

        #endregion

        
    }
}
