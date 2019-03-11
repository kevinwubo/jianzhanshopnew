using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DTcms.Common;

namespace DTcms.BLL
{
    public class Auction
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.Auction dal;
        public Auction()
        {
            dal = new DAL.Auction(siteConfig.sysdatabaseprefix);
        }

        public int Add(Model.Auction model, bool isJianZhanJun = false)
        {
            return dal.Add(model,isJianZhanJun);
        }

        public Model.Auction GetModelList(string strWhere, bool top1 = false, string OrderDesc = "")
        {
            DataSet ds= dal.GetModelList(strWhere,top1, OrderDesc);
            return DataTableToModel(ds.Tables[0]);
        }


        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder,out recordCount);
        }

        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        /// <summary>
        /// 临时方法
        /// </summary>
        /// <param name="type"></param>
        /// <param name="isJianZhanJun"></param>
        /// <returns></returns>
        public DataSet GetList(string type, bool isJianZhanJun)
        {
            return dal.GetList(type, isJianZhanJun);
        }

        public bool Delete(int ID)
        {
            return dal.Delete(ID);
        }

        public Model.Auction DataTableToModel(DataTable dt)
        {
            Model.Auction model = new Model.Auction();
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

        private Model.Auction GetCodeModel(DataRow dr)
        {
            Model.Auction model = new Model.Auction();
            model.id = Convert.ToInt32(dr["id"]);
            model.ProductID = Convert.ToString(dr["ProductID"]);
            model.ProductName = Convert.ToString(dr["ProductName"]);
            model.Author = Convert.ToString(dr["Author"]);
            model.LowPrice = Convert.ToDecimal(dr["LowPrice"]);
            model.ReservePrice = Convert.ToDecimal(dr["ReservePrice"]);
            model.Telephone = DESEncrypt.ConvertByABC(Convert.ToString(dr["Telephone"]));
            model.CustomerOffer = Convert.ToDecimal(dr["CustomerOffer"]);
            model.AuctionDetail = Convert.ToString(dr["AuctionDetail"]);
            model.OperatorID = Convert.ToString(dr["OperatorID"]);
            model.AuctionType = Convert.ToString(dr["AuctionType"]);
            model.Source = Convert.ToString(dr["Source"]);
            if (!string.IsNullOrEmpty(dr["AddDate"].ToString()))
            {
                model.AddDate = Convert.ToDateTime(dr["AddDate"]);
            }
            return model;
        }


        #region 临时方法
        /// <summary>
        /// 获取所有建盏君数据
        /// </summary>
        /// <returns></returns>
        public List<Model.Auction> GetALLLJZJist()
        {
            List<Model.Auction> list = new List<Model.Auction>();
            DataTable dt = dal.GetALLLJZJist().Tables[0];
            Model.Auction model = new Model.Auction();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetCodeModel(dr);
                    list.Add(model);
                }
            }
            return list;
        }

        /// <summary>
        /// 获取所有盏天下数据

        /// </summary>
        /// <returns></returns>
        public List<Model.Auction> GetALLList()
        {
            List<Model.Auction> list = new List<Model.Auction>();
            DataTable dt = dal.GetALLList().Tables[0];
            Model.Auction model = new Model.Auction();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetCodeModel(dr);
                    list.Add(model);
                }
            }
            return list;
        }

         /// <summary>
        /// 更新建盏君
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool UpdateJZJ(Model.Auction model)
        {
            return dal.UpdateJZJ(model);
        }

        /// <summary>
        /// 更新盏天下
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool Update(Model.Auction model)
        {
            return dal.Update(model);
        }

        public Model.Auction GetModelListJZJ(string strWhere, bool top1 = false, string OrderDesc = "")
        {
            DataSet ds = dal.GetModelListJZJ(strWhere, top1, OrderDesc);
            return DataTableToModel(ds.Tables[0]);
        }

        #endregion
        
    }
}
