using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DTcms.DBUtility;
using DTcms.Common;

namespace DTcms.DAL
{
    /// <summary>
    /// 二维码咨询
    /// </summary>
    public partial class QRCode
    {
        private string databaseprefix; //数据库表名前缀
        public QRCode(string _databaseprefix)
        {
            databaseprefix = _databaseprefix;
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.QRCode model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("INSERT INTO dt_QRCode(QRLocation,HotLine,SalesPhone,SalesName,QRImage,UID,Remark)VALUES ");
            strSql.Append("(@QRLocation,@HotLine,@SalesPhone,@SalesName,@QRImage,@UID,@Remark)");            
            strSql.Append(";set @ReturnValue= @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@QRLocation", SqlDbType.NVarChar,50),
                    new SqlParameter("@HotLine", SqlDbType.NVarChar,50),
					new SqlParameter("@SalesPhone", SqlDbType.NVarChar,50),
					new SqlParameter("@SalesName", SqlDbType.NVarChar,50),
					new SqlParameter("@QRImage", SqlDbType.NVarChar,50),
                    new SqlParameter("@UID", SqlDbType.NVarChar,50),
                    new SqlParameter("@Remark", SqlDbType.NVarChar,50),
                    new SqlParameter("@ReturnValue",SqlDbType.Int)};

            parameters[0].Value = model.QRLocation;
            parameters[1].Value = model.HotLine;
            parameters[2].Value = model.SalesPhone;
            parameters[3].Value = model.SalesName;
            parameters[4].Value = model.QRImage;
            parameters[5].Value = model.UID;
            parameters[6].Value = model.Remark;
            parameters[7].Direction = ParameterDirection.Output;
            List<CommandInfo> sqllist = new List<CommandInfo>();
            CommandInfo cmd = new CommandInfo(strSql.ToString(), parameters);
            sqllist.Add(cmd);

            DbHelperSQL.ExecuteSqlTranWithIndentity(sqllist);
            return (int)parameters[7].Value;
        }

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="artisanID"></param>
        /// <returns></returns>
        public bool Delete(int ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from dt_QRCode ");
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
            strSql.Append("SELECT ID,QRLocation,HotLine,SalesPhone,SalesName,QRImage,UID,AddDate,Remark from dt_QRCode");            
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where 1=1 " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM dt_QRCode");
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
        public bool Update(Model.QRCode model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update dt_QRCode set ");
            strSql.Append("QRLocation=@QRLocation,");
            strSql.Append("HotLine=@HotLine,");
            strSql.Append("SalesPhone=@SalesPhone,");
            strSql.Append("SalesName=@SalesName,");
            strSql.Append("QRImage=@QRImage,");
            strSql.Append("Remark=@Remark,");
            strSql.Append("UID=@UID");
            strSql.Append(" where ID=@ID");
            SqlParameter[] parameters = {
					            new SqlParameter("@QRLocation", SqlDbType.NVarChar,50),
                                new SqlParameter("@HotLine", SqlDbType.NVarChar,50),
					            new SqlParameter("@SalesPhone", SqlDbType.NVarChar,50),
                                new SqlParameter("@SalesName",SqlDbType.NVarChar,50),
					            new SqlParameter("@QRImage", SqlDbType.NVarChar,50),	
				                new SqlParameter("@Remark", SqlDbType.NVarChar,50),	
                                new SqlParameter("@UID", SqlDbType.NVarChar,50),	                                
                                new SqlParameter("@ID", SqlDbType.Int,4)};
            parameters[0].Value = model.QRLocation;
            parameters[1].Value = model.HotLine;
            parameters[2].Value = model.SalesPhone;
            parameters[3].Value = model.SalesName;
            parameters[4].Value = model.QRImage;
            parameters[5].Value = model.Remark;
            parameters[6].Value = model.UID;
            parameters[7].Value = model.ID;

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

        


        #region 前台页面展示
        /// <summary>
        /// 根据板块位置 展示艺人信息
        /// </summary>
        /// <param name="PlatePosition"></param>
        /// <returns></returns>
        public DataSet GetQRCodeList(string sqlwhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT QRLocation,HotLine,SalesPhone,SalesName,QRImage,UID,Remark from dt_QRCode");            
            if (!string.IsNullOrEmpty(sqlwhere))
            {
                strSql.Append(" where 1=1 " + sqlwhere);
            }
            strSql.Append(" order By Adddate desc");
            return DbHelperSQL.Query(strSql.ToString());
        }  
        #endregion
    }
}
