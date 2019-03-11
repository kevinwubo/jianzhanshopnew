using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    [Serializable]
    public class Auction
    {
        public int id { get; set; }
        /// <summary>
        /// 产品编号
        /// </summary>
        public string ProductID { get; set; }
        /// <summary>
        /// 产品名称
        /// </summary>
        public string ProductName { get; set; }
        /// <summary>
        /// 作者
        /// </summary>
        public string Author { get; set; }
        /// <summary>
        /// 底价
        /// </summary>
        public decimal LowPrice { get; set; }
        /// <summary>
        /// 保留价
        /// </summary>
        public decimal ReservePrice { get; set; }
        /// <summary>
        /// 手机号
        /// </summary>
        public string Telephone { get; set; }
        /// <summary>
        /// 客户出价
        /// </summary>
        public decimal CustomerOffer { get; set; }
        /// <summary>
        /// 行为：拍卖出价、拍卖提醒
        /// </summary>
        public string AuctionDetail { get; set; }
        /// <summary>
        /// 销售ID
        /// </summary>
        public string OperatorID { get; set; }
        /// <summary>
        /// 类型：小匠、名家、大师
        /// </summary>
        public string AuctionType { get; set; }
        /// <summary>
        /// 出价时间
        /// </summary>
        public DateTime AddDate { get; set; }

        public string Source { get; set; }
    }
}
