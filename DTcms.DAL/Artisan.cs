using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    public partial class Artisan
    {
        private string databaseprefix; //数据库表名前缀
        public Artisan(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.Artisan model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_Artisan(");
            strSql.Append("artisanName,sex,IDNumber,artisanType,artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation,IsRecommend,IsPushMall)");
            strSql.Append(" values (");
            strSql.Append("@artisanName,@sex,@IDNumber, @artisanType,@artisanTitle,@masterWorker,@artisanSpecial,@introduction,@IDHead,@DetailedIntroduction,@VideoUrl,@IsCooperation,@IsRecommend,@IsPushMall)");
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@artisanName", SqlDbType.NVarChar,100),
                    new SqlParameter("@sex", SqlDbType.NVarChar,50),
					new SqlParameter("@IDNumber", SqlDbType.NVarChar,100),
					new SqlParameter("@artisanType", SqlDbType.NVarChar,255),
					new SqlParameter("@artisanTitle", SqlDbType.NVarChar,255),
                    new SqlParameter("@masterWorker", SqlDbType.NVarChar,255),
					new SqlParameter("@artisanSpecial", SqlDbType.NVarChar,100),
					new SqlParameter("@introduction", SqlDbType.NVarChar,100),
					new SqlParameter("@IDHead", SqlDbType.NVarChar,100),
					new SqlParameter("@DetailedIntroduction", SqlDbType.NText),
					new SqlParameter("@VideoUrl", SqlDbType.NVarChar,255),
					new SqlParameter("@IsCooperation", SqlDbType.NVarChar,20),
                    new SqlParameter("@IsRecommend", SqlDbType.NVarChar,20),
                    new SqlParameter("@IsPushMall", SqlDbType.NVarChar,20),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};
            parameters[0].Value = model.artisanName;
            parameters[1].Value = model.sex;
            parameters[2].Value = model.IDNumber;
            parameters[3].Value = model.artisanType;
            parameters[4].Value = model.artisanTitle;
            parameters[5].Value = model.masterWorker;
            parameters[6].Value = model.artisanSpecial;
            parameters[7].Value = model.introduction;
            parameters[8].Value = model.IDHead;
            parameters[9].Value = model.DetailedIntroduction;
            parameters[10].Value = model.VideoUrl;
            parameters[11].Value = model.IsCooperation;
            parameters[12].Value = model.IsRecommend;
            parameters[13].Value = model.IsPushMall;
            parameters[14].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[14].Value;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int artisanID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_Artisan ");
            strSql.Append(" where artisanID ='" + artisanID + "'");
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
        public DataSet GetModelList(int artisanID,string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(" ,artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation,Adddate,update_time  FROM dbo.dt_Artisan ");
            strSql.Append(" where artisanID=" + artisanID);
            if (strWhere.Trim() != "")
            {
                strSql.Append(" and " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.Artisan model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_Artisan set ");
            strSql.Append("artisanName=@artisanName,");
            strSql.Append("sex=@sex,");
            strSql.Append("IDNumber=@IDNumber,");
            strSql.Append("artisanType=@artisanType,");
            strSql.Append("artisanTitle=@artisanTitle,");
            strSql.Append("masterWorker=@masterWorker,");
            strSql.Append("artisanSpecial=@artisanSpecial,");
            strSql.Append("introduction=@introduction,");
            strSql.Append("IDHead=@IDHead,");
            strSql.Append("DetailedIntroduction=@DetailedIntroduction,");
            strSql.Append("VideoUrl=@VideoUrl,");
            strSql.Append("IsCooperation=@IsCooperation,");
            strSql.Append("IsRecommend=@IsRecommend,");
            strSql.Append("IsPushMall=@IsPushMall,");
            strSql.Append("update_time=@update_time");
            strSql.Append(" where artisanID=@artisanID");
            SqlParameter[] parameters = {
					            new SqlParameter("@artisanName", SqlDbType.NVarChar,50),
                                new SqlParameter("@sex", SqlDbType.NVarChar,50),
					            new SqlParameter("@IDNumber", SqlDbType.NVarChar,100),
                                new SqlParameter("@artisanType",SqlDbType.NVarChar,100),
					            new SqlParameter("@artisanTitle", SqlDbType.NVarChar,255),
					            new SqlParameter("@masterWorker", SqlDbType.NVarChar,255),
                                new SqlParameter("@artisanSpecial", SqlDbType.NVarChar,255),
					            new SqlParameter("@introduction", SqlDbType.NVarChar),
					            new SqlParameter("@IDHead", SqlDbType.NVarChar),
					            new SqlParameter("@DetailedIntroduction", SqlDbType.NText),
					            new SqlParameter("@VideoUrl", SqlDbType.NVarChar,50),
					            new SqlParameter("@IsCooperation", SqlDbType.NVarChar,255),
                                new SqlParameter("@IsRecommend", SqlDbType.NVarChar,255),
					            new SqlParameter("@update_time", SqlDbType.DateTime),
                                new SqlParameter("@IsPushMall", SqlDbType.NVarChar,10),
                                new SqlParameter("@artisanID", SqlDbType.Int,4)};
            parameters[0].Value = model.artisanName;
            parameters[1].Value = model.sex;
            parameters[2].Value = model.IDNumber;
            parameters[3].Value = model.artisanType;
            
            parameters[4].Value = model.artisanTitle;
            parameters[5].Value = model.masterWorker;
            parameters[6].Value = model.artisanSpecial;
            parameters[7].Value = model.introduction;
            parameters[8].Value = model.IDHead;
            parameters[9].Value = model.DetailedIntroduction;
            parameters[10].Value = model.VideoUrl;
            parameters[11].Value = model.IsCooperation;
            parameters[12].Value = model.IsRecommend;
            parameters[13].Value = DateTime.Now;
            parameters[14].Value = model.IsPushMall;
            parameters[15].Value = model.artisanID;

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
        /// 更新库存数量
        /// </summary>
        /// <param name="artisanID">艺人ID</param>
        /// <param name="Sort">排序</param>
        /// <returns></returns>
        public bool Update_Sort(string artisanID, int Sort)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("Update dt_Artisan set Sort=" + Sort + " where artisanID='" + artisanID + "'");
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
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM dt_Artisan");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }

        public DataSet GetListTop(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top " + pageSize + " * FROM dt_Artisan where 1=1 " + strWhere + " and artisanID not in (select top " + pageSize * pageIndex + " artisanID from dt_Artisan where 1=1 " + strWhere + " Order by " + filedOrder + ")");

            strSql.Append(" Order by " + filedOrder);
            StringBuilder strSqlCount = new StringBuilder();
            strSqlCount.Append("select * FROM dt_Artisan");
            if (strWhere.Trim() != "")
            {
                strSqlCount.Append(" where 1=1 " + strWhere);
            }

            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSqlCount.ToString())));
            return DbHelperSQL.Query(strSql.ToString());
        }

        #region 前台页面展示

        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(string sqlwhere,int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order By Adddate desc");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order By Adddate desc");
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(string sqlwhere,string desc)
        {
            if (string.IsNullOrEmpty(desc))
            {
                desc = " Adddate desc";
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order By " + desc);

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(string sqlwhere,string desc, int count)
        {
            if (string.IsNullOrEmpty(desc))
            {
                desc = " Adddate desc";
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order By " + desc);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(string sqlwhere, int count, int indexCount)
        {
            string orderBy="Sort ";
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT top " + count + " artisanID,IsPushMall,artisanName,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            strSql.Append(" where artisanID not in (select top " + indexCount + " artisanID from dt_Artisan where 1=1 " + sqlwhere + " order By " + orderBy + " )");
            strSql.Append(sqlwhere + " order By " + orderBy);
            return DbHelperSQL.Query(strSql.ToString());
        }
        
        /// <summary>
        /// 获取数量
        /// </summary>
        /// <param name="sqlwhere"></param>
        /// <returns></returns>
        public int GetTotalCount(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  artisanID,artisanName,IsPushMall,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            return  Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
        }


        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetArtisanList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  artisanID,artisanName,IsPushMall,artisanName2,sex,IDNumber,birthday,workPlace,reviewDate,artisanType,IsRecommend ");
            strSql.Append(",artisanTitle,masterWorker,artisanSpecial,introduction,IDHead,DetailedIntroduction,VideoUrl,IsCooperation FROM dt_Artisan ");
            if (!string.IsNullOrEmpty(strWhere))
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), filedOrder));
        }
        #endregion
    }
}
