using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    /// <summary>
    /// 文章内容
    /// </summary>
    public partial class article
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.article dal;

        public article()
        {
            dal = new DAL.article(siteConfig.sysdatabaseprefix);
        }

        #region 基本方法=============================================
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int id)
        {
            return dal.Exists(id);
        }
        /// <summary>
        /// 是否存在标题
        /// </summary>
        public bool ExistsTitle(string title)
        {
            return dal.ExistsTitle(title);
        }
          /// <summary>
        /// 是否存在标题
        /// </summary>
        public bool ExistsTitle(string title, int category_id)
        {
            return dal.ExistsTitle(title, category_id);
        }
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string call_index)
        {
            return dal.Exists(call_index);
        }

        /// <summary>
        /// 返回信息标题
        /// </summary>
        public string GetTitle(int id)
        {
            return dal.GetTitle(id);
        }

        /// <summary>
        /// 获取阅读次数
        /// </summary>
        public int GetClick(int id)
        {
            return dal.GetClick(id);
        }

        /// <summary>
        /// 返回数据总数
        /// </summary>
        public int GetCount(string strWhere)
        {
            return dal.GetCount(strWhere);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.article model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 修改一列数据
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            dal.UpdateField(id, strValue);
        }

        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Model.article model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.article GetModel(int id)
        {
            return dal.GetModel(id);
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Model.article GetModel(string call_index)
        {
            return dal.GetModel(call_index);
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }
        
        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int channel_id, int category_id, int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(channel_id, category_id, pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        #endregion  Method

        #region 前台模板用到的方法===================================
        /// <summary>
        /// 根据视图显示前几条数据
        /// </summary>
        public DataSet GetList(string channel_name, int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(channel_name, Top, strWhere, filedOrder);
        }

        /// <summary>
        /// 根据视图显示前几条数据
        /// </summary>
        public DataSet GetList(string channel_name, int category_id, int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(channel_name, category_id, Top, strWhere, filedOrder);
        }

        /// <summary>
        /// 根据视图获得查询分页数据
        /// </summary>
        public DataSet GetList(string channel_name, int category_id, int pageIndex, string strWhere, string filedOrder, out int recordCount, out int pageSize)
        {
            pageSize = new channel().GetPageSize(channel_name); //自动获得频道分页数量
            return dal.GetList(channel_name, category_id, pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
          /// <summary>
        /// 根据视图获取总记录数
        /// </summary>
        public int GetCount(string channel_name, int category_id, string strWhere)
        {
            return dal.GetCount(channel_name, category_id,strWhere);
        }

        /// <summary>
        /// 获得查询分页数据(搜索用到)
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="articleType">文章类别</param>
        /// <returns></returns>
        public List<Model.articleView> GetArticleList(string sqlwhere,int count)
        {
            List<Model.articleView> lstM = new List<Model.articleView>();
            DataTable dt = dal.GetArticleList(sqlwhere, count).Tables[0];
            Random rad = new Random(DateTime.Now.Millisecond);
           foreach (DataRow dr in dt.Rows)
           {
               Model.articleView model = new Model.articleView();
               model.articleTitle = Convert.ToString(dr["articleTitle"]);
               model.id = Convert.ToString(dr["id"]);
               model.img_url = Convert.ToString(dr["img_url"]).Replace("http://121.42.156.253", "");
               #region 随机图片显示
               if (string.IsNullOrEmpty(model.img_url))
               {                   
                   model.img_url = "images/" + rad.Next(5) + ".jpg";
               }
               #endregion
               model.zhaiyao = Convert.ToString(dr["zhaiyao"]);
               model.articleType = Convert.ToString(dr["title"]);
               model.AddDate = Convert.ToDateTime(dr["add_time"]);
               model.Call_Index = Convert.ToString(dr["Call_Index"]);               
               lstM.Add(model);
           }
           return lstM;
        }

        /// <summary>
        /// 获取文章列表
        /// </summary>
        /// <param name="articleType">文章类别</param>
        /// <returns></returns>
        public List<Model.articleView> GetArticleList(string sqlwhere, int count, int indexCount)
        {
            List<Model.articleView> lstM = new List<Model.articleView>();
            DataTable dt = dal.GetArticleList(sqlwhere, count, indexCount).Tables[0];
            Random rad = new Random(DateTime.Now.Millisecond);
            foreach (DataRow dr in dt.Rows)
            {
                Model.articleView model = new Model.articleView();
                model.articleTitle = Convert.ToString(dr["articleTitle"]);
                model.id = Convert.ToString(dr["id"]);
                model.img_url = Convert.ToString(dr["img_url"]);
                #region 随机图片显示
                if (string.IsNullOrEmpty(model.img_url))
                {                    
                    model.img_url = "images/" + rad.Next(5) + ".jpg";
                }
                #endregion
                model.zhaiyao = Convert.ToString(dr["zhaiyao"]);
                model.articleType = Convert.ToString(dr["title"]);
                model.AddDate = Convert.ToDateTime(dr["add_time"]);
                model.Call_Index = Convert.ToString(dr["Call_Index"]);
                lstM.Add(model);
            }
            return lstM;
        }

        public int GetTotalCount(string sqlwhere)
        {
            return dal.GetTotalCount(sqlwhere);
        }
        #endregion

    }
}