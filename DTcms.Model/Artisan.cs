using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 艺人管理
    /// </summary>
    [Serializable]
    public partial class Artisan
    {
        /// <summary>
        /// artisanID
        /// </summary>
        public int artisanID { get; set; }
        /// <summary>
        /// 艺人姓名
        /// </summary>
        public string artisanName { get; set; }
        /// <summary>
        /// 艺人姓名2
        /// </summary>
        public string artisanName2 { get; set; }
        /// <summary>
        /// 艺人性别
        /// </summary>
        public string sex { get; set; }
        /// <summary>
        /// 艺人身份证号
        /// </summary>
        public string IDNumber { get; set; }
        /// <summary>
        /// 出生日期
        /// </summary>
        public string birthday { get; set; }
        /// <summary>
        /// 工作单位
        /// </summary>
        public string workPlace { get; set; }
        /// <summary>
        /// 评审通过日期
        /// </summary>
        public string reviewDate { get; set; }
        /// <summary>
        /// 工艺师类别
        /// </summary>
        public string artisanType { get; set; }
        /// <summary>
        /// 荣誉称号
        /// </summary>
        public string artisanTitle { get; set; }
        /// <summary>
        /// 师从
        /// </summary>
        public string masterWorker { get; set; }
        /// <summary>
        /// 特点
        /// </summary>
        public string artisanSpecial { get; set; }
        /// <summary>
        /// 简介
        /// </summary>
        public string introduction { get; set; }
        /// <summary>
        /// 身份证头像
        /// </summary>
        public string IDHead { get; set; }
        /// <summary>
        /// 详细介绍
        /// </summary>
        public string DetailedIntroduction { get; set; }
        /// <summary>
        /// 视频地址
        /// </summary>
        public string VideoUrl { get; set; }
        /// <summary>
        /// 是否合作
        /// </summary>
        public string IsCooperation { get; set; }
        /// <summary>
        /// 是否推荐到首页
        /// </summary>
        public string IsRecommend { get; set; }

                /// <summary>
        /// 是否推荐到商城
        /// </summary>
        public string IsPushMall { get; set; }

        public DateTime Adddate { get; set; }
        
    }
}
