using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 产品询价
    /// </summary>
    [Serializable]
    public partial class proInquiry
    {
        /// <summary>
        /// 询价ID 自动增长
        /// </summary>
        public int PPId { get; set; }

        /// <summary>
        /// 关联产品表 产品ID
        /// </summary>
        public string ProductID { get; set; }

        /// <summary>
        /// 客户姓名
        /// </summary>
        public string CustomerName { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        public string Sex { get; set; }

        //（询价内容+评论内容+手机号+qq号+留言时间+处理时间+处理状态+省份城市+姓名+性别+添加跟踪内容、跟踪状态(有意向、意向很大、意向大、无意向)、下次回访时间）
        /// <summary>
        /// 手机号
        /// </summary>
        public string telphone { get; set; }
        /// <summary>
        /// QQ号
        /// </summary>
        public string WebChartID { get; set; }

        /// <summary>
        /// 询价内容  留言内容
        /// </summary>
        public string InquiryContent  { get; set; }

        /// <summary>
        /// 评论内容
        /// </summary>
        public string CommentContent { get; set; }
        
        /// <summary>
        /// 处理状态  1:已处理 0:未处理
        /// </summary>
        public string ProcessingState { get; set; }
        /// <summary>
        /// 处理时间
        /// </summary>
        public DateTime ProcessingTime { get; set; }

        /// <summary>
        /// 省份
        /// </summary>
        public string Provence { get; set; }

        /// <summary>
        /// 城市
        /// </summary>
        public string City { get; set; }
        /// <summary>
        /// 跟踪内容
        /// </summary>
        public string TraceContent { get; set; }
        /// <summary>
        /// 跟踪状态(有意向、意向很大、意向大、无意向)
        /// </summary>
        public string TraceState { get; set; }
        /// <summary>
        /// 下次回访时间
        /// </summary>
        public DateTime NextVisitTime { get; set; }

        /// <summary>
        /// 添加时间 留言时间
        /// </summary>
        public DateTime AddDate { get; set; }

        /// <summary>
        /// 操作员ID
        /// </summary>
        public string OperatorID { get; set; }

        /// <summary>
        /// 销售电话
        /// </summary>
        public string SaleTelephone { get; set; }

        /// <summary>
        /// 新
        /// </summary>
        public string status { get; set; }

        /// <summary>
        /// 数据来源 MB:手机 PC:电脑
        /// </summary>
        public string SourceForm { get; set; }
         
    }


    public class InquiryInfo
    {
        public string datetime { get; set; }
        public string cityname { get; set; }
        public string salesname { get; set; }
        public string systemcount { get; set; }
        public string handcount { get; set; }
        public string info { get; set; }
    }

    public class InquiryAdver
    {
        public string datetime { get; set; }
        public string info { get; set; }
    }
}
