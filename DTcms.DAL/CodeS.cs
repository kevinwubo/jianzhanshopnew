using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public partial class CodeS
    {
        private string databaseprefix; //数据库表名前缀
        public CodeS(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.CodeS model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_CodeS(Code,CodeName,CodeValues)VALUES ");
            strSql.Append("(@Code,@CodeName,@CodeValues)");            
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@Code", SqlDbType.NVarChar,50),
                    new SqlParameter("@CodeName", SqlDbType.NVarChar,50),
					new SqlParameter("@CodeValues", SqlDbType.NVarChar,2000),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};

            parameters[0].Value = model.Code;
            parameters[1].Value = model.CodeName;
            parameters[2].Value = model.CodeValues;
            parameters[3].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[3].Value;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_CodeS ");
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
        public DataSet GetModelList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT ID,Code,CodeName,CodeValues,AddDate from dt_CodeS");            
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取最近一个销售姓名
        /// </summary>
        /// <returns></returns>
        public DataSet GetLastSaleName(string sqlTime)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 b.real_name from dbo.dt_proInquiry a,dt_manager b where a.OperatorID=b.id  and status='新' and status!='Hand'  order by PPId desc ");//" + sqlTime + "
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 获取当前队列最新销售
        /// </summary>
        /// <returns></returns>
        public DataSet GetLastSaleNameByCodes(string names,string datetime)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 b.real_name,salesCount from dbo.dt_proInquiry a,dt_manager b where a.OperatorID=b.id  and status='新' and status!='Hand' and b.real_name in(" + names + ") order by PPId desc ");//" + sqlTime + "
            return DbHelperSQL.Query(strSql.ToString());
        }

                /// <summary>
        /// 获取当前队列最新销售
        /// </summary>
        /// <returns></returns>
        public DataSet GetLastSaleNameBySaleName(string name)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  b.real_name,b.salesCount,COUNT(1) as countCurrentDay from dt_proInquiry a ,dt_manager b where a.OperatorID=b.id and b.real_name='" + name + "'  and   status='新' and AddDate between '" + DateTime.Now.ToShortDateString() + " 00:00:01' and '" + DateTime.Now.ToShortDateString() + " 23:59:59' group by real_name,b.salesCount ");//" + sqlTime + "
            return DbHelperSQL.Query(strSql.ToString());
        }

        


        /// <summary>
        /// 获取当前销售本月咨询所有量
        /// </summary>
        /// <param name="salesname"></param>
        /// <returns></returns>
        public int GetInquiryCountBySalesName(string salesname)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ppid from dbo.dt_proInquiry a,dt_manager b where a.OperatorID=b.id and b.real_name='" + salesname + "' and isnull(a.status,'')='新' and CONVERT(varchar(100),  a.AddDate, 23)=CONVERT(varchar(100),  GETDATE(), 23)   ");
            //return DbHelperSQL.ExecuteSql(strSql.ToString());
            return Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            
        }

        public DataSet GetMinProInquiryBySalesName(string salesname)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select b.real_name,COUNT(1) from dbo.dt_proInquiry a,dt_manager b where a.OperatorID=b.id and b.real_name in(" + salesname + ")");
            strSql.Append("and  isnull(a.status,'')!='Hand'  and AddDate between CONVERT(varchar(7), getdate() , 120) + '-01' and dateadd(ms,-3,DATEADD(mm, DATEDIFF(m,0,getdate())+1, 0)) ");
            strSql.Append("group by b.real_name  order by COUNT(1) asc");

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  ID,Code,CodeName,CodeValues,AddDate,sort,change_date  FROM dt_CodeS");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.CodeS model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_CodeS set ");
            strSql.Append("Code=@Code,");
            strSql.Append("CodeName=@CodeName,");
            strSql.Append("CodeValues=@CodeValues,change_date=getdate()");
            strSql.Append(" where ID=@ID");
            SqlParameter[] parameters = {
					            new SqlParameter("@Code", SqlDbType.NVarChar,50),
                                new SqlParameter("@CodeName", SqlDbType.NVarChar,50),
					            new SqlParameter("@CodeValues", SqlDbType.NVarChar,2000),                                
                                new SqlParameter("@ID", SqlDbType.Int,4)};
            parameters[0].Value = model.Code;
            parameters[1].Value = model.CodeName;
            parameters[2].Value = model.CodeValues;
            parameters[3].Value = model.ID;

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
    }
}
