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
    public partial class proInquiry
    {
        private readonly Model.siteconfig siteConfig = new BLL.siteconfig().loadConfig(); //获得站点配置信息
        private readonly DAL.proInquiry dal;
        public proInquiry()
        {
            dal = new DAL.proInquiry(siteConfig.sysdatabaseprefix);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Model.proInquiry model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 获取数量
        /// </summary>
        public int GetCount(string telephone)
        {
            return dal.GetCount(telephone);
        }
                /// <summary>
        /// 获取数量
        /// </summary>
        public int GetCountByWCharID(string WCharID)
        {
            return dal.GetCountByWCharID(WCharID);
        }
        

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }



        public DataSet GetRealName(string tel)
        {
            return dal.GetRealName(tel);
        }
        public DataSet GetList(string sqlwhere)
        {
            return dal.GetList(sqlwhere);
        }

        /// <summary>
        /// 获得查询分页数据
        /// </summary>
        public DataSet GetList_History(int pageSize, int pageIndex, string strWhere, string filedOrder, out int recordCount)
        {
            return dal.GetList_History(pageSize, pageIndex, strWhere, filedOrder, out recordCount);
        }

        public int GetDistinctTelphoneCount(string sqlwhere)
        {
            return dal.GetDistinctTelphoneCount(sqlwhere);
        }

        /// <summary>
        /// 增加一条数据
        /// </summary>
        public bool Update(Model.proInquiry model)
        {
            return dal.Update(model);
        }

        /// <summary>
        /// 更新操作人
        /// </summary>
        public bool UpdateOperatorIDByPPID(int PPId, int OperatorID)
        {
            return dal.UpdateOperatorIDByPPID(PPId, OperatorID);
        }

        public Model.proInquiry GetModelList(int PPId, string strWhere)
        {
            return DataTableToModel(dal.GetModelList(PPId, strWhere).Tables[0]);
        }

        public bool DeleteAndHistory(int PPId)
        {
            return dal.DeleteAndHistory(PPId);
        }

        public bool Delete(int PPID)
        {
            return dal.Delete(PPID);
        }

        public Model.proInquiry GetModel(string strWhere)
        {
            Model.proInquiry model = new Model.proInquiry();
            DataSet ds= dal.GetProInquiryModel(strWhere);
            if (ds != null )
            {
                DataTable dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    model = GetproInquiryModel(dr);
                }
            }
            return model;
        }

        public Model.proInquiry GetModelJZJ(string strWhere)
        {
            Model.proInquiry model = new Model.proInquiry();
            DataSet ds = dal.GetProInquiryModelJZJ(strWhere);
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    model = GetproInquiryModel(dr);
                }
            }
            return model;
        }

        public Model.proInquiry DataTableToModel(DataTable dt)
        {
            Model.proInquiry model = new Model.proInquiry();
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



        private Model.proInquiry GetproInquiryModel(DataRow dr)
        {          
            Model.proInquiry model = new Model.proInquiry();
            model.PPId = Convert.ToInt32(dr["PPId"]);
            model.ProductID = Convert.ToString(dr["ProductID"]);
            model.telphone =DESEncrypt.ConvertByABC( Convert.ToString(dr["telphone"]));
            model.WebChartID = Convert.ToString(dr["WebChartID"]);
            model.InquiryContent = Convert.ToString(dr["InquiryContent"]);
            model.CommentContent = Convert.ToString(dr["CommentContent"]);
            model.ProcessingState = Convert.ToString(dr["ProcessingState"]);
            model.CustomerName = Convert.ToString(dr["CustomerName"]);
            model.Provence = Convert.ToString(dr["Provence"]);
            model.City = Convert.ToString(dr["City"]);
            model.TraceContent = Convert.ToString(dr["TraceContent"]);
            model.TraceState = Convert.ToString(dr["TraceState"]);
            if (!string.IsNullOrEmpty(dr["NextVisitTime"].ToString()))
            {
                model.NextVisitTime = Convert.ToDateTime(dr["NextVisitTime"]);
            }
            model.OperatorID = Convert.ToString(dr["OperatorID"]);
            return model;
        }

        public int GetCountByCurrentDay(int operatorID, string starttime, string endtime)
        {
            return dal.GetCountByCurrentDay(operatorID, starttime, endtime);
        }

        /// <summary>
        /// 获取未处理的资讯销售
        /// </summary>
        /// <returns></returns>
        public DataSet GetUnTreatedInquiry()
        {
            return dal.GetUnTreatedInquiry();
        }




        /// <summary>
        /// 统计数据
        /// </summary>
        /// <returns></returns>
        public List<DTcms.Model.InquiryInfo> GetProInquiry(string datetime)
        {
            List<DTcms.Model.InquiryInfo> listInfo = new List<Model.InquiryInfo>();
            DataTable dt = dal.GetDateTime(datetime).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                Model.InquiryInfo info = new Model.InquiryInfo();
                DataTable dtInquiry = dal.GetProInquiry(dr["date"].ToString(),"厦门").Tables[0];
                string message = "";
                if (dtInquiry != null && dtInquiry.Rows.Count > 0)
                {
                    foreach (DataRow drIn in dtInquiry.Rows)
                    {
                        message += "<b>" + drIn["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + drIn["SystemCount"].ToString() + "</b><b>（" + drIn["HandCount"].ToString() + "）" + "</b>，";
                    }
                }
                info.datetime = dr["date"].ToString();
                info.cityname = "<b>厦门</b>";
                info.info = message.TrimEnd('，');
                listInfo.Add(info);

                Model.InquiryInfo infoWys = new Model.InquiryInfo();
                dtInquiry = dal.GetProInquiry(dr["date"].ToString(), "武夷山").Tables[0];
                message = "";
                if (dtInquiry != null && dtInquiry.Rows.Count > 0)
                {
                    foreach (DataRow drIn in dtInquiry.Rows)
                    {
                        message += "<b>" + drIn["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + drIn["SystemCount"].ToString() + "</b><b>（" + drIn["HandCount"].ToString() + "）" + "</b>，";
                    }
                }
                infoWys.datetime = "";//dr["date"].ToString();
                infoWys.cityname = "<b>武夷山</b>";
                infoWys.info = message.TrimEnd('，');
                listInfo.Add(infoWys);


                Model.InquiryInfo infoBj = new Model.InquiryInfo();
                dtInquiry = dal.GetProInquiry(dr["date"].ToString(), "北京").Tables[0];
                message = "";
                if (dtInquiry != null && dtInquiry.Rows.Count > 0)
                {
                    foreach (DataRow drIn in dtInquiry.Rows)
                    {
                        message += "<b>" + drIn["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + drIn["SystemCount"].ToString() + "</b><b>（" + drIn["HandCount"].ToString() + "）" + "</b>，";
                    }
                }
                infoBj.datetime = "";//dr["date"].ToString();
                infoBj.cityname = "<b>北京</b>";
                infoBj.info = message.TrimEnd('，');
                listInfo.Add(infoBj);
            }

            string mess = "";

            string monthstr = dt.Rows[0]["date"].ToString().Substring(0, 7);
            DataTable dtTotal = dal.GetStatisticsOfMonth(monthstr,"厦门").Tables[0];
            Model.InquiryInfo infoTotal = new Model.InquiryInfo();
            if (dtTotal != null && dtTotal.Rows.Count > 0)
            {
                foreach (DataRow dr in dtTotal.Rows)
                {
                    mess += "<b>" + dr["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + dr["SystemCount"].ToString() + "</b><b>（" + dr["HandCount"].ToString() + "）</b>" + "，";
                }
            }
            infoTotal.datetime = monthstr + "汇总";
            infoTotal.cityname = "<b>厦门</b>";
            infoTotal.info = mess.TrimEnd('，');
            listInfo.Add(infoTotal);


            DataTable dtTotalWYS = dal.GetStatisticsOfMonth(monthstr, "武夷山").Tables[0];
            Model.InquiryInfo infoTotalWYS = new Model.InquiryInfo();
            mess = "";
            if (dtTotalWYS != null && dtTotalWYS.Rows.Count > 0)
            {
                foreach (DataRow dr in dtTotalWYS.Rows)
                {
                    mess += "<b>" + dr["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + dr["SystemCount"].ToString() + "</b><b>（" + dr["HandCount"].ToString() + "）</b>" + "，";
                }
            }
            infoTotalWYS.datetime = "";//monthstr + "汇总";
            infoTotalWYS.cityname = "<b>武夷山</b>";
            infoTotalWYS.info = mess.TrimEnd('，');
            listInfo.Add(infoTotalWYS);


            DataTable dtTotalBJ = dal.GetStatisticsOfMonth(monthstr, "北京").Tables[0];
            Model.InquiryInfo infoTotalBJ = new Model.InquiryInfo();
            mess = "";
            if (dtTotalBJ != null && dtTotalBJ.Rows.Count > 0)
            {
                foreach (DataRow dr in dtTotalBJ.Rows)
                {
                    mess += "<b>" + dr["real_name"].ToString() + "：</b><b style='font-size:larger;color:Red'>" + dr["SystemCount"].ToString() + "</b><b>（" + dr["HandCount"].ToString() + "）</b>" + "，";
                }
            }
            infoTotalBJ.datetime = "";//monthstr + "汇总";
            infoTotalBJ.cityname = "<b>北京</b>";
            infoTotalBJ.info = mess.TrimEnd('，');
            listInfo.Add(infoTotalBJ);

            return listInfo;          
        }


        public List<Model.InquiryAdver> GetInquiryAdver(string datetime)
        {
            List<Model.InquiryAdver> listInquiry = new List<Model.InquiryAdver>();
            DataTable dt = dal.GetProInquiryAdver(datetime).Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                
                string mess = "";
                foreach (DataRow dr in dt.Rows)
                {
                    Model.InquiryAdver info = new Model.InquiryAdver();
                    info.datetime = dr["date"].ToString();
                    info.info = "<b>PC新：</b><b  style='font-size:larger;color:Red'>（" + dr["PCCount"].ToString() + "）</b><b>手机新(" + dr["MobileCount"].ToString() + ")</b>";
                    listInquiry.Add(info);
                }
            }

            DataTable dtTotal = dal.GetProInquiryAdver_Total(datetime).Tables[0];
            if (dtTotal != null && dtTotal.Rows.Count > 0)
            {
                
                string mess = "";
                foreach (DataRow dr in dtTotal.Rows)
                {
                    Model.InquiryAdver info = new Model.InquiryAdver();
                    info.datetime = dr["date"].ToString() + "汇总";
                    info.info = "<b>PC新：</b><b  style='font-size:larger;color:Red'>（" + dr["PCCount"].ToString() + "）</b><b>手机新(" + dr["MobileCount"].ToString() + ")</b>";
                    listInquiry.Add(info);
                }
            }
            return listInquiry;

        }

        public DataSet GetTest()
        {
            return dal.GetTest();
        }

        public int GetCount(string telephone, string ppid)
        {
            return dal.GetCount(telephone, ppid);
        }
    }
}
