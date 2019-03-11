﻿using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 管理员信息表:记录【键值】
    /// </summary>
    [Serializable]
    public partial class CodeS
    {
        public int ID { get; set; }

        /// <summary>
        /// Code编码
        /// </summary>
        public string Code { get; set; }

        /// <summary>
        /// 显示CODE对应名称
        /// </summary>
        public string CodeName { get; set; }
        /// <summary>
        /// 显示CODE对应值
        /// </summary>
        public string CodeValues { get; set; }


        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime Adddate { get; set; }
    }
}