using System;
using System.Data;
using System.Collections.Generic;
using DTcms.Common;

namespace DTcms.BLL
{
    /// <summary>
    /// ��������
    /// </summary>
    public partial class article
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //���վ��������Ϣ
        private readonly DAL.article dal;

        public article()
        {
            dal = new DAL.article(siteConfig.sysdatabaseprefix);
        }

        #region ��������=============================================
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(int id)
        {
            return dal.Exists(id);
        }
        /// <summary>
        /// �Ƿ���ڱ���
        /// </summary>
        public bool ExistsTitle(string title)
        {
            return dal.ExistsTitle(title);
        }
          /// <summary>
        /// �Ƿ���ڱ���
        /// </summary>
        public bool ExistsTitle(string title, int category_id)
        {
            return dal.ExistsTitle(title, category_id);
        }
        /// <summary>
        /// �Ƿ���ڸü�¼
        /// </summary>
        public bool Exists(string call_index)
        {
            return dal.Exists(call_index);
        }

        /// <summary>
        /// ������Ϣ����
        /// </summary>
        public string GetTitle(int id)
        {
            return dal.GetTitle(id);
        }

        /// <summary>
        /// ��ȡ�Ķ�����
        /// </summary>
        public int GetClick(int id)
        {
            return dal.GetClick(id);
        }

        /// <summary>
        /// ������������
        /// </summary>
        public int GetCount(string strWhere)
        {
            return dal.GetCount(strWhere);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public int Add(Model.article model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// �޸�һ������
        /// </summary>
        public void UpdateField(int id, string strValue)
        {
            dal.UpdateField(id, strValue);
        }

        /// <summary>
        /// ����һ������
        /// </summary>
        public bool Update(Model.article model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// ɾ��һ������
        /// </summary>
        public bool Delete(int id)
        {
            return dal.Delete(id);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public Model.article GetModel(int id)
        {
            return dal.GetModel(id);
        }

        /// <summary>
        /// �õ�һ������ʵ��
        /// </summary>
        public Model.article GetModel(string call_index)
        {
            return dal.GetModel(call_index);
        }

        /// <summary>
        /// ���ǰ��������
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(Top, strWhere, filedOrder);
        }
        
        /// <summary>
        /// ��ò�ѯ��ҳ����
        /// </summary>
        public DataSet GetList(int channel_id, int category_id, int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(channel_id, category_id, pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        #endregion  Method

        #region ǰ̨ģ���õ��ķ���===================================
        /// <summary>
        /// ������ͼ��ʾǰ��������
        /// </summary>
        public DataSet GetList(string channel_name, int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(channel_name, Top, strWhere, filedOrder);
        }

        /// <summary>
        /// ������ͼ��ʾǰ��������
        /// </summary>
        public DataSet GetList(string channel_name, int category_id, int Top, string strWhere, string filedOrder)
        {
            return dal.GetList(channel_name, category_id, Top, strWhere, filedOrder);
        }

        /// <summary>
        /// ������ͼ��ò�ѯ��ҳ����
        /// </summary>
        public DataSet GetList(string channel_name, int category_id, int pageIndex, string strWhere, string filedOrder, out int recordCount, out int pageSize)
        {
            pageSize = new channel().GetPageSize(channel_name); //�Զ����Ƶ����ҳ����
            return dal.GetList(channel_name, category_id, pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }
          /// <summary>
        /// ������ͼ��ȡ�ܼ�¼��
        /// </summary>
        public int GetCount(string channel_name, int category_id, string strWhere)
        {
            return dal.GetCount(channel_name, category_id,strWhere);
        }

        /// <summary>
        /// ��ò�ѯ��ҳ����(�����õ�)
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        /// <summary>
        /// ��ȡ�����б�
        /// </summary>
        /// <param name="articleType">�������</param>
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
               #region ���ͼƬ��ʾ
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
        /// ��ȡ�����б�
        /// </summary>
        /// <param name="articleType">�������</param>
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
                #region ���ͼƬ��ʾ
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