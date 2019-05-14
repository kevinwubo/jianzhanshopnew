using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DTcms.BLL
{
    /// <summary>
    /// 管理员信息表:记录【键值】
    /// </summary>
    [Serializable]
    public partial class CodeS
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.CodeS dal;
        public CodeS()
        {
            dal = new DAL.CodeS(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.CodeS model)
        {
            return dal.Add(model);
        }



        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.CodeS model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(int ID)
        {
            return dal.Delete(ID);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        public Model.CodeS GetModel(string sqlwhere)
        {
            return DataTableToModel(dal.GetModelList(sqlwhere).Tables[0]);
        }

        /// <summary>
        /// 获取厦门、武夷山两个城市排除销售
        /// </summary>
        /// <param name="sqlwhere"></param>
        /// <returns></returns>
        public string  GetList(string sqlwhere)
        {
            string outsales = "";
           DataSet ds= dal.GetModelList(sqlwhere);
           if (ds != null && ds.Tables.Count > 0)
           {
               foreach (DataRow dr in ds.Tables[0].Rows)
               {
                   if (!string.IsNullOrEmpty(dr["CodeValues"].ToString()))
                   {
                       outsales += dr["CodeValues"].ToString() + ",";
                   }
               }
               outsales = outsales.TrimEnd(',');
           }
           return outsales;
        }

        /// <summary>
        /// 获取最近一个销售姓名
        /// </summary>
        /// <returns></returns>
        public string GetLastSaleName(string sqlTime)
        {
            DataTable dt = dal.GetLastSaleName(sqlTime).Tables[0];
            if (dt.Rows.Count == 0)
            {
                return "";
            }
            return Convert.ToString(dal.GetLastSaleName(sqlTime).Tables[0].Rows[0][0]);
        }


                /// <summary>
        /// 获取当前队列最新销售
        /// </summary>
        /// <returns></returns>
        public string GetLastSaleNameByCodes(string names,string datetime)
        {
            DataTable dt = dal.GetLastSaleNameByCodes(names, datetime).Tables[0];
            if (dt.Rows.Count == 0)
            {
                return "";
            }
            return Convert.ToString(dal.GetLastSaleNameByCodes(names, datetime).Tables[0].Rows[0][0]);
        }

                        /// <summary>
        /// 获取当前队列最新销售
        /// </summary>
        /// <returns></returns>
        public DTcms.Model.SalesModel GetLastSaleNameBySaleName(string name)
        {
            DTcms.Model.SalesModel model = new Model.SalesModel();
            try
            {
                DataTable dt = dal.GetLastSaleNameBySaleName(name).Tables[0];
                if (dt != null && dt.Rows.Count > 0)
                {
                    model.salename = dt.Rows[0]["real_name"].ToString();
                    model.saleCount = int.Parse(dt.Rows[0]["salesCount"].ToString());
                    model.saleCurrentDayCount = int.Parse(dt.Rows[0]["countCurrentDay"].ToString());
                }
            }
            catch (Exception ex)
            {
                model = null;
            }
            return model;
        }

        public int GetInquiryCountBySalesName(string salename)
        {
            return dal.GetInquiryCountBySalesName(salename);
        }

        /// <summary>
        /// 返回队列中咨询量最少的销售
        /// </summary>
        /// <param name="salename"></param>
        /// <returns></returns>
        public string GetMinProInquiryBySalesName(string salename)
        {
            DataTable dt = dal.GetMinProInquiryBySalesName(salename).Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                return dt.Rows[0]["real_name"].ToString();
            }
            return "";
        }

        public Model.CodeS DataTableToModel(DataTable dt)
        {
            Model.CodeS model = new Model.CodeS();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetCodeModel(dr);
                }
            }
            return model;
        }

        private Model.CodeS GetCodeModel(DataRow dr)
        {
            Model.CodeS model = new Model.CodeS();
            model.ID = Convert.ToInt32(dr["ID"]);
            model.Code = Convert.ToString(dr["Code"]);
            model.CodeName = Convert.ToString(dr["CodeName"]);
            model.CodeValues = Convert.ToString(dr["CodeValues"]);
            if (!string.IsNullOrEmpty(dr["AddDate"].ToString()))
            {
                model.Adddate = Convert.ToDateTime(dr["AddDate"]);
            }
            return model;
        }
    }
}
