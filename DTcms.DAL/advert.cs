using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public partial class advert
    {
        private string databaseprefix; //数据库表名前缀
        public advert(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据  CustomerName
        /// </summary>
        public int Add(Model.advert model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" INSERT INTO dt_advert(");
            strSql.Append(" advertTitle,advertUrl,advertPosition,imageUrl,advertPositionText)");
            strSql.Append(" VALUES(@advertTitle,@advertUrl,@advertPosition,@imageUrl,@advertPositionText)");
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@advertTitle", SqlDbType.NVarChar,50),
                    new SqlParameter("@advertUrl", SqlDbType.NVarChar,50),
					new SqlParameter("@advertPosition", SqlDbType.NVarChar,50),
					new SqlParameter("@imageUrl", SqlDbType.NVarChar,50),
                    new SqlParameter("@advertPositionText", SqlDbType.NVarChar,50),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value = model.advertTitle;
            parameters[1].Value = model.advertUrl;
            parameters[2].Value = model.advertPosition;
            parameters[3].Value = model.imageUrl;
            parameters[4].Value = model.advertPositionText;
            parameters[5].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[5].Value;
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.advert model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("UPDATE dt_advert ");
            strSql.Append("SET advertTitle = @advertTitle ");
            strSql.Append(",advertUrl = @advertUrl ");
            strSql.Append(",advertPosition = @advertPosition ");
            strSql.Append(",imageUrl = @imageUrl,advertPositionText=@advertPositionText ");
            strSql.Append(" WHERE advertID=@advertID");
            SqlParameter[] parameters = {
					            new SqlParameter("@advertTitle", SqlDbType.NVarChar,50),
                                new SqlParameter("@advertUrl", SqlDbType.NVarChar,50),
					            new SqlParameter("@advertPosition", SqlDbType.NVarChar,50),
                                new SqlParameter("@imageUrl",SqlDbType.NVarChar,200),
                                new SqlParameter("@advertPositionText",SqlDbType.NVarChar,50),
                                new SqlParameter("@advertID", SqlDbType.Int,4)};
            parameters[0].Value = model.advertTitle;
            parameters[1].Value = model.advertUrl;
            parameters[2].Value = model.advertPosition;
            parameters[3].Value = model.imageUrl;            
            parameters[4].Value = model.advertPositionText;
            parameters[5].Value = model.advertID;
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
            strSql.Append("SELECT advertID,advertTitle,advertUrl,advertPositionText,advertPosition,imageUrl,adddate  FROM dt_advert ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        /// <summary>
        /// 获取表数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetModelList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT advertID,advertTitle,advertPositionText,advertUrl,advertPosition,imageUrl,adddate  FROM dt_advert  ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1  " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int advertID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_advert ");
            strSql.Append(" where advertID ='" + advertID + "'");
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }
    }
}
