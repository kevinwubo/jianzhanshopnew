using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
        /// <summary>
    /// advert:实体类
    /// </summary>
    [Serializable]
    public partial class advert
    {
        public int advertID { get; set; }
        /// <summary>
        ///  广告标题
        /// </summary>
        public string advertTitle { get; set; }

        /// <summary>
        /// 跳转URL地址
        /// </summary>
        public string advertUrl { get; set; }

        /// <summary>
        /// 位置Code
        /// </summary>
        public string advertPosition { get; set; }

        /// <summary>
        /// 位置名称
        /// </summary>
        public string advertPositionText { get; set; }

        /// <summary>
        /// 广告图片
        /// </summary>
        public string imageUrl { get; set; }

        public DateTime adddate { get; set; }
    }
}
