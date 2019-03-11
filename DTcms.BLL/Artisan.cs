using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using DTcms.Common;

namespace DTcms.BLL
{
    /// <summary>
    /// 艺人管理
    /// </summary>
    public partial class Artisan
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.Artisan dal;
        public Artisan()
        {
            dal = new DAL.Artisan(siteConfig.sysdatabaseprefix);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.Artisan model)
        {
            return dal.Add(model);
        }

        public Model.Artisan GetModelList(int artisanID, string strWhere)
        {
            return DataTableToModel(dal.GetModelList(artisanID, strWhere).Tables[0]);
        }

        public bool Delete(int artisanID)
        {
            return dal.Delete(artisanID);
        }

        

        public bool Update_Sort(string artisanID, int Sort)
        {
            return dal.Update_Sort(artisanID, Sort);
        }
        public Model.Artisan DataTableToModel(DataTable dt)
        {
            Model.Artisan model = new Model.Artisan();
            int rowsCount = dt.Rows.Count;
            if (rowsCount > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    model = GetArtisanModel(dr);
                }
            }
            return model;
        }

        private Model.Artisan GetArtisanModel(DataRow dr)
        {
            Model.Artisan model = new Model.Artisan();
            model.artisanID = Convert.ToInt32(dr["artisanID"]);
            model.artisanName = Convert.ToString(dr["artisanName"]);
            model.artisanName2 = Convert.ToString(dr["artisanName2"]);
            model.sex = Convert.ToString(dr["sex"]);
            model.IDNumber = Convert.ToString(dr["IDNumber"]);
            model.birthday = Convert.ToString(dr["birthday"]);
            model.workPlace = Convert.ToString(dr["workPlace"]);
            model.reviewDate = Convert.ToString(dr["reviewDate"]);
            model.artisanType = Convert.ToString(dr["artisanType"]).Trim();
            model.artisanTitle = Convert.ToString(dr["artisanTitle"]);
            model.masterWorker = Convert.ToString(dr["masterWorker"]);
            model.artisanSpecial = Convert.ToString(dr["artisanSpecial"]);
            model.introduction = Convert.ToString(dr["introduction"]);
            model.introduction = model.introduction;
            model.IDHead = Convert.ToString(dr["IDHead"]);//"http://116.62.124.214/" + 
            model.DetailedIntroduction = Convert.ToString(dr["DetailedIntroduction"]);
            model.VideoUrl = Convert.ToString(dr["VideoUrl"]);
            model.IsCooperation = Convert.ToString(dr["IsCooperation"]);
            model.IsRecommend = Convert.ToString(dr["IsRecommend"]);
            model.IsPushMall = Convert.ToString(dr["IsPushMall"]);
            #region 随机图片显示
            if (string.IsNullOrEmpty(model.VideoUrl))
            {
                Random rad = new Random();
                model.VideoUrl = "images/" + rad.Next(5) + ".jpg";
            }
            #endregion
            return model;
        }

        /// <summary>
        /// 获取艺人信息
        /// </summary>
        /// <param name="artisan"></param>
        /// <returns></returns>
        public List<Model.Artisan> GetArtisanList(string sqlwhere,int count)
        {
            List<Model.Artisan> lstArtisan=new List<Model.Artisan>();
            var list = CacheHelper.Get(sqlwhere + count.ToString()) as List<Model.Artisan>;
            if (list == null)
            {
                DataTable dt = dal.GetArtisanList(sqlwhere, count).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    lstArtisan.Add(GetArtisanModel(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString(), lstArtisan, CacheHelper.Min); 
            }
            else
            {
                lstArtisan = list;
            }
            return lstArtisan;
        }

        /// <summary>
        /// 获取艺人信息
        /// </summary>
        /// <param name="artisan"></param>
        /// <returns></returns>
        public List<Model.Artisan> GetArtisanList(string sqlwhere)
        {
            List<Model.Artisan> lstArtisan = new List<Model.Artisan>();
            var list = CacheHelper.Get(sqlwhere) as List<Model.Artisan>;
            if (list == null)
            {
                DataTable dt = dal.GetArtisanList(sqlwhere).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    lstArtisan.Add(GetArtisanModel(dr));
                }
                CacheHelper.Insert(sqlwhere, lstArtisan, CacheHelper.Min); 
            }
            else
            {
                lstArtisan = list;
            }
            return lstArtisan;
        }

        /// <summary>
        /// 获取艺人信息
        /// </summary>
        /// <param name="artisan"></param>
        /// <returns></returns>
        public List<Model.Artisan> GetArtisanList(string sqlwhere,string desc)
        {
            List<Model.Artisan> lstArtisan = new List<Model.Artisan>();
            var list = CacheHelper.Get(sqlwhere + desc) as List<Model.Artisan>;
            if (list == null)
            {
                DataTable dt = dal.GetArtisanList(sqlwhere,desc).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    lstArtisan.Add(GetArtisanModel(dr));
                }
                CacheHelper.Insert(sqlwhere + desc, lstArtisan, CacheHelper.Min);
            }
            else
            {
                lstArtisan = list;
            }
            return lstArtisan;
        }

        /// <summary>
        /// 获取艺人信息
        /// </summary>
        /// <param name="artisan"></param>
        /// <returns></returns>
        public List<Model.Artisan> GetArtisanList(string sqlwhere,string desc, int count)
        {

            List<Model.Artisan> lstArtisan = new List<Model.Artisan>();
            var list = CacheHelper.Get(sqlwhere + count.ToString()) as List<Model.Artisan>;
            if (list == null)
            {
                DataTable dt = dal.GetArtisanList(sqlwhere, desc, count).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    lstArtisan.Add(GetArtisanModel(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString(), lstArtisan, CacheHelper.Min); 
            }
            else
            {
                lstArtisan = list;
            }
            return lstArtisan;
        }

        /// <summary>
        /// 获取艺人信息
        /// </summary>
        /// <param name="artisan"></param>
        /// <returns></returns>
        public List<Model.Artisan> GetArtisanList(string sqlwhere, int count,int indexCount)
        {            
            List<Model.Artisan> lstArtisan = new List<Model.Artisan>();
            var list = CacheHelper.Get(sqlwhere + count.ToString()+indexCount.ToString()) as List<Model.Artisan>;
            if (list == null)
            {
                DataTable dt = dal.GetArtisanList(sqlwhere, count, indexCount).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    lstArtisan.Add(GetArtisanModel(dr));
                }
                CacheHelper.Insert(sqlwhere + count.ToString() + indexCount.ToString(), lstArtisan, CacheHelper.Min);
            }
            else
            {
                lstArtisan = list;
            }

            return lstArtisan;
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.Artisan model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }


        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetListTop(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetListTop(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        public Model.Artisan GetArtisanList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            DataSet ds = dal.GetArtisanList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
            return DataTableToModel(ds.Tables[0]);
        }

        public int GetTotalCount(string sqlwhere)
        {
            return dal.GetTotalCount(sqlwhere);
        }
        
    }
}
