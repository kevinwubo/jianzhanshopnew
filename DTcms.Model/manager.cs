﻿using System;
using System.Collections.Generic;
using System.Text;

namespace DTcms.Model
{
    /// <summary>
    /// 管理员信息表:实体类
    /// </summary>
    [Serializable]
    public partial class manager
    {
        public manager()
        { }
        #region Model
        private int _id;
        private int _role_id;
        private int _role_type = 2;
        private string _role_name;
        private string _user_name;
        private string _password;
        private string _salt;
        private string _real_name = "";
        private string _telephone = "";
        private string _email = "";
        private int _is_lock = 0;
        private DateTime _add_time = DateTime.Now;
        /// <summary>
        /// 自增ID
        /// </summary>
        public int id
        {
            set { _id = value; }
            get { return _id; }
        }
        /// <summary>
        /// 角色ID
        /// </summary>
        public int role_id
        {
            set { _role_id = value; }
            get { return _role_id; }
        }
        /// <summary>
        /// 管理员类型1超管2系管
        /// </summary>
        public int role_type
        {
            set { _role_type = value; }
            get { return _role_type; }
        }

        /// <summary>
        /// 角色名
        /// </summary>
        public string role_name
        {
            set { _role_name = value; }
            get { return _role_name; }
        }

        /// <summary>
        /// 用户名
        /// </summary>
        public string user_name
        {
            set { _user_name = value; }
            get { return _user_name; }
        }
        /// <summary>
        /// 登录密码
        /// </summary>
        public string password
        {
            set { _password = value; }
            get { return _password; }
        }
        /// <summary>
        /// 6位随机字符串,加密用到
        /// </summary>
        public string salt
        {
            set { _salt = value; }
            get { return _salt; }
        }
        /// <summary>
        /// 用户昵称
        /// </summary>
        public string real_name
        {
            set { _real_name = value; }
            get { return _real_name; }
        }
        /// <summary>
        /// 联系电话
        /// </summary>
        public string telephone
        {
            set { _telephone = value; }
            get { return _telephone; }
        }
        /// <summary>
        /// 电子邮箱
        /// </summary>
        public string email
        {
            set { _email = value; }
            get { return _email; }
        }
        /// <summary>
        /// 是否锁定
        /// </summary>
        public int is_lock
        {
            set { _is_lock = value; }
            get { return _is_lock; }
        }
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime add_time
        {
            set { _add_time = value; }
            get { return _add_time; }
        }

        /// <summary>
        /// 销售咨询数量(每月)
        /// </summary>
        public int salesCount { get; set; }
        /// <summary>
        /// 销售所在城市
        /// </summary>
        public string CityName { get; set; }
        #endregion Model
    }
}
