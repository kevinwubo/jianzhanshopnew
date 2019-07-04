using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using DTcms.DBUtility;
using System.Data;
using DTcms.Common;

namespace DTcms.DAL
{
    public class proInquiry
    {
        private string databaseprefix; //数据库表名前缀
        public proInquiry(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据  CustomerName
        /// </summary>
        public int Add(Model.proInquiry model)
        {

            #region 判断重复
            //DataTable dt = GetList(" and (telphone='" + model.telphone + "' or telphone='" + DESEncrypt.ConvertBy123(model.telphone) + "') and ProductID='" + model.ProductID + "' ").Tables[0];
            //if (dt != null && dt.Rows.Count > 0)
            //{
            //    return 0;
            //}
            #endregion

            StringBuilder strSql = new StringBuilder();
            strSql.Append(" INSERT INTO dt_proInquiry(");
            strSql.Append(" ProductID,telphone,WebChartID,Provence,City,InquiryContent,CustomerName,OperatorID,status,ProcessingState,SourceForm,TraceState,HistoryOperatorID)");
            strSql.Append(" VALUES(@ProductID,@telphone,@WebChartID,@Provence,@City,@InquiryContent,@CustomerName,@OperatorID,@status,@ProcessingState,@SourceForm,@TraceState,@HistoryOperatorID)");
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@ProductID", SqlDbType.NVarChar,20),
                    new SqlParameter("@telphone", SqlDbType.NVarChar,20),
					new SqlParameter("@WebChartID", SqlDbType.NVarChar,20),
					new SqlParameter("@Provence", SqlDbType.NVarChar,30),
                    new SqlParameter("@City", SqlDbType.NVarChar,30),
                    new SqlParameter("@InquiryContent",SqlDbType.NVarChar,200),
                    new SqlParameter("@CustomerName",SqlDbType.NVarChar,50),
                    new SqlParameter("@OperatorID",SqlDbType.NVarChar,50),
                    new SqlParameter("@status",SqlDbType.NVarChar,50),
                    new SqlParameter("@ProcessingState",SqlDbType.NVarChar,50),
                    new SqlParameter("@SourceForm",SqlDbType.NVarChar,50),
                    new SqlParameter("@TraceState",SqlDbType.NVarChar,50),
                    new SqlParameter("@HistoryOperatorID",SqlDbType.NVarChar,50),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value =model.ProductID!=null? model.ProductID:"未知";
            parameters[1].Value = DESEncrypt.ConvertBy123(model.telphone);
            parameters[2].Value = model.WebChartID;
            parameters[3].Value = model.Provence;
            parameters[4].Value = model.City;
            parameters[5].Value=model.InquiryContent;
            parameters[6].Value = model.CustomerName;
            parameters[7].Value = model.OperatorID;
            parameters[8].Value = model.status;
            parameters[9].Value = model.ProcessingState;
            parameters[10].Value = model.SourceForm;
            parameters[11].Value = model.TraceState;
            parameters[12].Value = model.HistoryOperatorID;
            parameters[13].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[13].Value;
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT PPId,a.ProductID,telphone,WebChartID,InquiryContent,CommentContent,ProcessingState,ProcessingTime,Provence,City, ");
            strSql.Append(" TraceContent,TraceState,NextVisitTime,CustomerName,sex,OperatorID,b.Author,a.AddDate,b.ProductName ,status,c.real_name, ");
            strSql.Append(" case ProcessingState when '1' then '已处理' else '未处理' end as ProcessingStateDesc, ");
            strSql.Append(" case TraceState when '已成交' then 'style=color:red' when '有意向' then 'style=color:blue' when '假号' then 'style=color:lightgrey' else '' end as fontColor ");
            strSql.Append(" FROM dbo.dt_proInquiry a left join dt_Product b on a.ProductID=b.ProductID ");
            strSql.Append(" left join dt_manager c on a.OperatorID=c.id ");

            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList_History(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT PPId,a.ProductID,telphone,WebChartID,InquiryContent,CommentContent,ProcessingState,ProcessingTime,Provence,City, ");
            strSql.Append(" TraceContent,TraceState,NextVisitTime,CustomerName,sex,OperatorID,b.Author,a.AddDate,b.ProductName ,status,c.real_name, ");
            strSql.Append(" case ProcessingState when '1' then '已处理' else '未处理' end as ProcessingStateDesc ");
            strSql.Append(" FROM dbo.dt_proInquiry_history a left join dt_Product b on a.ProductID=b.ProductID ");
            strSql.Append(" left join dt_manager c on a.OperatorID=c.id ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        /// <summary>
        /// 去掉重复数据
        /// </summary>
        /// <param name="sqlwhere"></param>
        /// <returns></returns>
        public int GetDistinctTelphoneCount(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select distinct telphone from  dbo.dt_proInquiry a ,dbo.dt_manager c where a.OperatorID=c.id");
            if (sqlwhere.Trim() != "")
            {
                strSql.Append("  " + sqlwhere);
            }
            return  Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
        }





        /// <summary>
        /// 获取当月销售咨询量
        /// </summary>
        /// <returns></returns>
        public DataSet GetStatisticsOfMonth(string month, string cityname)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select convert(nvarchar(7) ,a.AddDate,23) as date,b.real_name,b.cityname ");
            strSql.Append(" ,SUM(case when status='Hand' then 1 else 0 end) as HandCount ");
            strSql.Append(" , SUM(case when status like '%新%' then 1 else 0 end) as  SystemCount from dbo.dt_proInquiry a, dt_manager b  ");
            strSql.Append(" where convert(nvarchar(7) ,a.AddDate,23)= '" + month + "' and b.cityname='" + cityname + "'  ");//and a.status like '%新%'
            strSql.Append(" and a.OperatorID=b.id group by convert(nvarchar(7) ,a.AddDate,23),real_name,b.cityname order by SystemCount asc");
            return DbHelperSQL.Query(strSql.ToString());
        }


        public DataSet GetProInquiryModel(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT PPId,ProductID,telphone,WebChartID,InquiryContent,CommentContent,ProcessingState,ProcessingTime,Provence,City,TraceContent,TraceState,NextVisitTime,CustomerName,sex,status,SourceForm,AddDate,OperatorID,datastatus  FROM dt_proInquiry ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        public DataSet GetProInquiryModelJZJ(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" SELECT PPId,ProductID,telphone,WebChartID,InquiryContent,CommentContent,ProcessingState,ProcessingTime,Provence,City,TraceContent,TraceState,NextVisitTime,CustomerName,sex,status,SourceForm,AddDate,OperatorID,datastatus  FROM dt_proInquiry ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            return DbHelperSQLJZJ.Query(strSql.ToString());
        }

        /// <summary>
        /// 查询销售咨询量
        /// </summary>
        /// <returns></returns>
        public DataSet GetProInquiry()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select CONVERT(varchar(100),  a.AddDate, 23) as date,b.real_name ,b.CityName");
            strSql.Append("    ,SUM(case when status='Hand' then 1 else 0 end) as HandCount ");
            strSql.Append(", SUM(case when isnull(status,1)!='Hand' then 1 else 0 end) as  SystemCount from dbo.dt_proInquiry a, dt_manager b  ");
            strSql.Append("where  convert(nvarchar(7) ,a.AddDate,23)= convert(nvarchar(7) ,getdate(),23)and a.OperatorID=b.id  and datastatus=0");
            strSql.Append("group by CONVERT(varchar(100),  a.AddDate, 23),real_name,b.CityName  order by date desc");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 查询销售咨询量
        /// </summary>
        /// <returns></returns>
        public DataSet GetProInquiry(string datetime,string cityname)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select CONVERT(varchar(100),  a.AddDate, 23) as date,b.real_name ,b.CityName");
            strSql.Append("    ,SUM(case when status='Hand' then 1 else 0 end) as HandCount ");
            strSql.Append(", SUM(case when status like '%新%' then 1 else 0 end) as  SystemCount from dbo.dt_proInquiry a, dt_manager b  ");
            strSql.Append("where  CONVERT(varchar(100),  a.AddDate, 23)='" + datetime + "'  and a.OperatorID=b.id and b.CityName='" + cityname + "' and datastatus=0 ");//and  a.status like '%新%'
            strSql.Append("group by CONVERT(varchar(100),  a.AddDate, 23),real_name,b.CityName  order by SystemCount asc");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        ///  推广数据
        /// </summary>
        /// <returns></returns>
        public DataSet GetProInquiryAdver(string datetime)
        {
            StringBuilder strSql = new StringBuilder();
            if (string.IsNullOrEmpty(datetime))
            {
                strSql.Append("select CONVERT(varchar(100),  a.AddDate, 23) as date");
                strSql.Append(",SUM(case when SourceForm='MB' and ISNULL(a.status,'')='新' then 1 else 0 end) as MobileCount ");
                strSql.Append(",SUM(case when SourceForm='AD' and ISNULL(a.status,'')='新' then 1 else 0 end) as ADCount ");
                strSql.Append(" , SUM(case when SourceForm='PC' and ISNULL(a.status,'')='新' then 1 else 0 end) as  PCCount  from dbo.dt_proInquiry a, dt_manager b  ");
                strSql.Append(" where  convert(nvarchar(7) ,a.AddDate,23)= convert(nvarchar(7) ,getdate(),23)and a.OperatorID=b.id  and datastatus=0");
                strSql.Append("group by CONVERT(varchar(100),  a.AddDate, 23)  order by date desc");
            }
            else
            {
                strSql.Append("select CONVERT(varchar(100),  a.AddDate, 23) as date");
                strSql.Append(",SUM(case when SourceForm='MB' and ISNULL(a.status,'')='新' then 1 else 0 end) as MobileCount ");
                strSql.Append(",SUM(case when SourceForm='AD' and ISNULL(a.status,'')='新' then 1 else 0 end) as ADCount ");
                strSql.Append(" , SUM(case when SourceForm='PC' and ISNULL(a.status,'')='新' then 1 else 0 end) as  PCCount  from dbo.dt_proInquiry a, dt_manager b  ");
                strSql.Append(" where  convert(nvarchar(7) ,a.AddDate,23)='" + datetime + "'  and a.OperatorID=b.id  and datastatus=0");
                strSql.Append("group by CONVERT(varchar(100),  a.AddDate, 23)  order by date desc");
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 推广数据最新
        /// </summary>
        /// <returns></returns>
        public DataSet GetProInquiryAdver_Total(string datetime)
        {
            StringBuilder strSql = new StringBuilder();
            if (string.IsNullOrEmpty(datetime))
            {
                strSql.Append("select convert(nvarchar(7) ,a.AddDate,23) as date");
                strSql.Append(",SUM(case when SourceForm='MB' and ISNULL(a.status,'')='新' then 1 else 0 end) as MobileCount ");
                strSql.Append(",SUM(case when SourceForm='AD' and ISNULL(a.status,'')='新' then 1 else 0 end) as ADCount ");
                strSql.Append(", SUM(case when SourceForm='PC' and ISNULL(a.status,'')='新' then 1 else 0 end) as  PCCount from dbo.dt_proInquiry a, dt_manager b  ");
                strSql.Append("where convert(nvarchar(7) ,a.AddDate,23)= convert(nvarchar(7) ,getdate(),23) and a.OperatorID=b.id  and datastatus=0");
                strSql.Append("group by convert(nvarchar(7) ,a.AddDate,23)");
            }
            else
            {
                strSql.Append("select convert(nvarchar(7) ,a.AddDate,23) as date");
                strSql.Append(",SUM(case when SourceForm='MB' and ISNULL(a.status,'')='新' then 1 else 0 end) as MobileCount ");
                strSql.Append(",SUM(case when SourceForm='AD' and ISNULL(a.status,'')='新' then 1 else 0 end) as ADCount ");
                strSql.Append(", SUM(case when SourceForm='PC' and ISNULL(a.status,'')='新' then 1 else 0 end) as  PCCount from dbo.dt_proInquiry a, dt_manager b  ");
                strSql.Append("where convert(nvarchar(7) ,a.AddDate,23)= '" + datetime + "' and a.OperatorID=b.id  and datastatus=0");
                strSql.Append("group by convert(nvarchar(7) ,a.AddDate,23)");
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        public DataSet GetDateTime(string datetime)
        {
            StringBuilder strSql = new StringBuilder();
            if (!string.IsNullOrEmpty(datetime))
            {
                strSql.Append("select CONVERT(varchar(100),  AddDate, 23) date from dt_proInquiry where  convert(nvarchar(7) ,AddDate,23)= '" + datetime + "' group by  CONVERT(varchar(100),  AddDate, 23) order by date asc");
            }
            else
            {
                strSql.Append("select CONVERT(varchar(100),  AddDate, 23) date from dt_proInquiry where  convert(nvarchar(7) ,AddDate,23)= convert(nvarchar(7) ,getdate(),23) group by  CONVERT(varchar(100),  AddDate, 23) order by date asc");
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sqlwhere"></param>
        /// <returns></returns>
        public DataSet GetRealName(string tel)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select b.real_name from  dbo.dt_proInquiry a,dt_manager b where a.OperatorID=b.id and datastatus=0 and (a.telphone='" + DESEncrypt.ConvertBy123(tel) + "' or a.telphone='" + tel + "' )");
            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int PPId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_proInquiry  set datastatus=1 ");
            strSql.Append(" where PPId ='" + PPId + "'");
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }


        public bool UpdateTraceStateBytelphone(string telphone,string wxno, string TraceState)
        {
            StringBuilder strSql = new StringBuilder();
            if (string.IsNullOrEmpty(telphone))
            {
                strSql.Append("update dt_proInquiry  set TraceState='" + TraceState + "' ");
                strSql.Append(" where WebChartID ='" + wxno + "' ");
            }
            else
            {
                strSql.Append("update dt_proInquiry  set TraceState='" + TraceState + "' ");
                strSql.Append(" where (telphone ='" + DESEncrypt.ConvertBy123(telphone) + "' or telphone ='" + telphone + "') ");

            }
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool DeleteAndHistory(int PPId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" insert into dbo.dt_proInquiry_history  select * from  dbo.dt_proInquiry where PPId  ='" + PPId + "' ");
            strSql.Append("delete from dt_proInquiry ");
            strSql.Append(" where PPId ='" + PPId + "'");
            int i = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (i > 0)
                return true;
            else
                return false;
        }

        // 
        /// <summary>
        /// 
        /// </summary>
        /// <param name="artisanID"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public int GetCount(string telephone)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select telphone from dt_proInquiry where telphone='" + DESEncrypt.ConvertBy123(telephone) + "' or telphone='" + telephone + "'");
            return DbHelperSQL.Query(strSql.ToString()).Tables[0].Rows.Count;
        }

        public int GetCountByWCharID(string WebChartID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select WebChartID from dt_proInquiry where WebChartID='" + WebChartID + "' ");
            return DbHelperSQL.Query(strSql.ToString()).Tables[0].Rows.Count;
        }


        public DataSet GetList(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select telphone,OperatorID from dt_proInquiry ");
            if (sqlwhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 获取表数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetModelList(int PPId, string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT PPId,ProductID,telphone,WebChartID,InquiryContent,CommentContent,ProcessingState,ProcessingTime,Provence ");
            strSql.Append(" ,City,TraceContent,TraceState,NextVisitTime,AddDate,OperatorID,CustomerName  FROM dt_proInquiry ");
            strSql.Append(" where PPId=" + PPId);
            if (strWhere.Trim() != "")
            {
                strSql.Append("  " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        public int GetCountByCurrentDay(int operatorID, string starttime, string endtime)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select  PPId from dt_proInquiry where OperatorID=" + operatorID + " and  status='新' and AddDate between '" + starttime + " 00:00:01' and '" + endtime + " 23:59:59'");

            return DbHelperSQL.Query(sb.ToString()).Tables[0].Rows.Count;
        }

        /// <summary>
        /// 获取未处理的资讯消息
        /// </summary>
        /// <returns></returns>
        public DataSet GetUnTreatedInquiry()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("select a.PPId,a.ProductID,b.real_name,telphone,sourceForm,City from dt_proInquiry a,dt_manager b where a.OperatorID=b.id and datediff(mi,a.AddDate,GETDATE())>15 and a.status='新'  and a.ProcessingState=0");
            return DbHelperSQL.Query(sb.ToString());
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.proInquiry model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("UPDATE dt_proInquiry ");
            strSql.Append("SET telphone = @telphone ");
            strSql.Append(",WebChartID = @WebChartID ");
            strSql.Append(",InquiryContent = @InquiryContent ");
            strSql.Append(",CommentContent = @CommentContent ");
            strSql.Append(",ProcessingState = @ProcessingState ");
            strSql.Append(",ProcessingTime = @ProcessingTime ");
            strSql.Append(",Provence = @Provence ");
            strSql.Append(",City = @City ");
            strSql.Append(",TraceContent = @TraceContent ");
            strSql.Append(",TraceState = @TraceState ");
            strSql.Append(",NextVisitTime = @NextVisitTime ");
            strSql.Append(",OperatorID = @OperatorID ");
            strSql.Append(",CustomerName = @CustomerName ");
            strSql.Append(" WHERE PPId=@PPId");
            SqlParameter[] parameters = {
					            new SqlParameter("@telphone", SqlDbType.NVarChar,50),
                                new SqlParameter("@WebChartID", SqlDbType.NVarChar,50),
					            new SqlParameter("@InquiryContent", SqlDbType.NVarChar,500),
                                new SqlParameter("@CommentContent",SqlDbType.NVarChar,500),
					            new SqlParameter("@ProcessingState", SqlDbType.NVarChar,50),
					            new SqlParameter("@ProcessingTime", SqlDbType.DateTime),
                                new SqlParameter("@Provence", SqlDbType.NVarChar,50),
					            new SqlParameter("@City", SqlDbType.NVarChar,50),
					            new SqlParameter("@TraceContent", SqlDbType.NVarChar,50),
					            new SqlParameter("@TraceState", SqlDbType.NVarChar,50),
					            new SqlParameter("@NextVisitTime", SqlDbType.DateTime),
					            new SqlParameter("@OperatorID", SqlDbType.NVarChar,20),
                                new SqlParameter("@CustomerName", SqlDbType.NVarChar,20),
                                new SqlParameter("@PPId", SqlDbType.Int,4)};
            parameters[0].Value = DESEncrypt.ConvertBy123(model.telphone);
            parameters[1].Value = model.WebChartID;
            parameters[2].Value = model.InquiryContent;
            parameters[3].Value = model.CommentContent;

            parameters[4].Value = model.ProcessingState;
            parameters[5].Value = DateTime.Now;// model.ProcessingTime;
            parameters[6].Value = model.Provence;
            parameters[7].Value = model.City;
            parameters[8].Value = model.TraceContent;
            parameters[9].Value = model.TraceState;
            parameters[10].Value = model.NextVisitTime;
            parameters[11].Value = model.OperatorID;
            parameters[12].Value = model.CustomerName;
            parameters[13].Value = model.PPId;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                UpdateTraceStateBytelphone(model.telphone,model.WebChartID, model.TraceState);
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
        public bool UpdateOperatorIDByPPID(int PPId, int OperatorID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("UPDATE dt_proInquiry ");
            strSql.Append(" SET OperatorID=@OperatorID,AddDate=getdate() ");
            strSql.Append(" WHERE PPId=@PPId");
            SqlParameter[] parameters = {
					            new SqlParameter("@OperatorID", SqlDbType.NVarChar,20),
                                new SqlParameter("@PPId", SqlDbType.Int,4)};
   
            parameters[0].Value = OperatorID;
            parameters[1].Value = PPId;

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

        #region 可以删除
        public DataSet GetTest()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select date,time,tel,id from a91data ");
            return DbHelperSQL.Query(strSql.ToString());
        }

        public int GetCount(string telephone, string ppid)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select telphone from dt_proInquiry where (telphone='" + DESEncrypt.ConvertBy123(telephone) + "' or telphone='" + telephone + "') and ProductID='" + ppid + "'");
            return DbHelperSQL.Query(strSql.ToString()).Tables[0].Rows.Count;
        }
        #endregion

        
    }
}
