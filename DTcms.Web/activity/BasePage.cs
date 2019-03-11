using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DTcms.Web.activity
{
    public class BasePage : System.Web.UI.Page
    {
        private BLL.CodeS bllCodes = new BLL.CodeS();
        private string _startTime10 { get; set; }
        private string _endTime11 { get; set; }

        private string _startTime11 { get; set; }
        private string _endTime12 { get; set; }

        private string _startTime12 { get; set; }
        private string _endTime13 { get; set; }
        //每页条数   
        public const int pageSize = 10;

        static BasePage()
        {

        }

        /// <summary>
        /// 小匠
        /// </summary>
        protected virtual string StartTime10
        {
            get
            {
                _startTime10 = bllCodes.GetModel(" and Code='XJStartTime'").CodeValues;//"2019/03/10 11:00:00";
                return _startTime10;
            }
            set 
            { 
                _startTime10 = value; 
            }
        }
        /// <summary>
        /// 小匠
        /// </summary>
        protected virtual string EndTime11
        {
            get
            {
                _endTime11 = bllCodes.GetModel(" and Code='XJEndTime'").CodeValues;// "2019/03/11 10:59:00";
                return _endTime11;
            }
            set
            {
                _endTime11 = value;
            }
        }


        /// <summary>
        /// 名家
        /// </summary>
        protected virtual string StartTime11
        {
            get
            {
                _startTime10 = bllCodes.GetModel(" and Code='MJStartTime'").CodeValues;// "2019/03/11 11:00:00";
                return _startTime10;
            }
            set
            {
                _startTime10 = value;
            }
        }
        /// <summary>
        /// 名家
        /// </summary>
        protected virtual string EndTime12
        {
            get
            {
                _endTime11 = bllCodes.GetModel(" and Code='MJEndTime'").CodeValues;//"2019/03/12 10:59:00";
                return _endTime11;
            }
            set
            {
                _endTime11 = value;
            }
        }


        /// <summary>
        /// 大师
        /// </summary>
        protected virtual string StartTime12
        {
            get
            {
                _startTime10 = bllCodes.GetModel(" and Code='DSStartTime'").CodeValues;//"2019/03/12 11:00:00";
                return _startTime10;
            }
            set
            {
                _startTime10 = value;
            }
        }
        /// <summary>
        /// 大师
        /// </summary>
        protected virtual string EndTime13
        {
            get
            {
                _endTime11 = bllCodes.GetModel(" and Code='DSEndTime'").CodeValues;// "2019/03/13 10:59:00";
                return _endTime11;
            }
            set
            {
                _endTime11 = value;
            }
        }
    }

    
}