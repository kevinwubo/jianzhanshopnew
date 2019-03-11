using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 管理员信息表:实体类
    /// </summary>
    [Serializable]
    public partial class QRCode
    {
        public int ID { get; set; }

        /// <summary>
        /// 二维码位置  (首页、产品详情页、建盏之家列表页面 等等)
        /// </summary>
        public string QRLocation { get; set; }

        /// <summary>
        /// 热线电话
        /// </summary>
        public string HotLine { get; set; }

        /// <summary>
        /// 销售电话
        /// </summary>
        public string SalesPhone { get; set; }

        /// <summary>
        /// 销售员姓名
        /// </summary>
        public string SalesName { get; set; }

        /// <summary>
        /// 二维码图片
        /// </summary>
        public string QRImage { get; set; }

        /// <summary>
        /// 操作员
        /// </summary>
        public string UID { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddDate { get; set; }
    }
}
