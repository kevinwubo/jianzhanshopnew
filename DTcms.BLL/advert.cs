using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DTcms.BLL
{
    public partial class advert
    {

        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.advert dal;
        public advert()
        {
            dal = new DAL.advert(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.advert model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.advert model)
        {
            return dal.Update(model);
        }

        public Model.advert GetModelList(string strWhere)
        {
            return DataTableToModel(dal.GetModelList(strWhere).Tables[0]);
        }

        public Model.advert DataTableToModel(DataTable dt)
        {
            Model.advert model = new Model.advert();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetproInquiryModel(dr);
                }
            }
            return model;
        }

        private Model.advert GetproInquiryModel(DataRow dr)
        {
            Model.advert model = new Model.advert();
            model.advertID = Convert.ToInt32(dr["advertID"]);
            model.advertPosition = Convert.ToString(dr["advertPosition"]);
            model.advertTitle = Convert.ToString(dr["advertTitle"]);
            model.advertPositionText = Convert.ToString(dr["advertPositionText"]);
            model.advertUrl = Convert.ToString(dr["advertUrl"]);
            model.imageUrl = Convert.ToString(dr["imageUrl"]);
            return model;
        }

        public bool Delete(int advertID)
        {
            return dal.Delete(advertID);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
    }
}
