using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DTcms.DBUtility;
using System.Data.SqlClient;

namespace DTcms.DAL
{
    public class VisitCount
    {
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(string OID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_VisitCount(CountAll,OID)");
            strSql.Append(" values (@CountAll,@OID)");            
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@CountAll", SqlDbType.NVarChar,100),
                    new SqlParameter("@OID", SqlDbType.NVarChar,50),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value = 1;
            parameters[1].Value = OID;
            parameters[2].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[2].Value;
        }


        public void AddVisit(string OID)
        {
            if (Exists(OID))
            {
                Update(OID);
            }
            else
            {
                Add(OID);
            }
        }

        public bool Update(string OID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_VisitCount set ");
            strSql.Append("CountAll=CountAll+1");
            strSql.Append(" where OID=@OID");
            SqlParameter[] parameters = {					            
                                new SqlParameter("@OID", SqlDbType.NVarChar,50)};
            parameters[0].Value = OID;           

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
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string OID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from dt_VisitCount");
            strSql.Append(" where OID=@OID ");
            SqlParameter[] parameters = {
					new SqlParameter("@OID", SqlDbType.NVarChar,30)};
            parameters[0].Value = OID;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
    }
}
