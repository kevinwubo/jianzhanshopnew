using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace DTcms.BLL
{
    /// <summary>
    /// 艺人管理
    /// </summary>
    public partial class QRCode
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.QRCode dal;
        public QRCode()
        {
            dal = new DAL.QRCode(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.QRCode model)
        {
            return dal.Add(model);
        }



        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.QRCode model)
        {
            return dal.Update(model);
        }

        public Model.QRCode GetModelList( string strWhere)
        {
            return DataTableToModel(dal.GetModelList( strWhere).Tables[0]);
        }

        public bool Delete(int ID)
        {
            return dal.Delete(ID);
        }

        public Model.QRCode DataTableToModel(DataTable dt)
        {
            Model.QRCode model = new Model.QRCode();
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

        private Model.QRCode GetproInquiryModel(DataRow dr)
        {
            Model.QRCode model = new Model.QRCode();
            model.ID = Convert.ToInt32(dr["ID"]);
            model.QRLocation = Convert.ToString(dr["QRLocation"]);
            model.HotLine = Convert.ToString(dr["HotLine"]);
            model.SalesPhone = Convert.ToString(dr["SalesPhone"]);
            model.SalesName = Convert.ToString(dr["SalesName"]);
            if (Convert.ToString(dr["QRImage"]).Contains("http://"))
            {
                model.QRImage = Convert.ToString(dr["QRImage"]);
            }
            else
            {
                model.QRImage = Convert.ToString(dr["QRImage"]);// "http://116.62.124.214/" +
            }
            model.UID = Convert.ToString(dr["UID"]);
            model.Remark = Convert.ToString(dr["Remark"]);
            if (!string.IsNullOrEmpty(dr["AddDate"].ToString()))
            {
                model.AddDate = Convert.ToDateTime(dr["AddDate"]);
            }
            
            return model;
        }

        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
    }
}
