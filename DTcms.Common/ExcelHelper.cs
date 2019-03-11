using System;
using System.Collections.Generic;
using System.Text;
using System.Data.OleDb;

namespace DTcms.Common
{
    public class ExcelHelper
    {
        private OleDbConnection conn;
        private string connStr = "Provider=Microsoft.Ace.OleDb.12.0;Data Source={0};Extended Properties='Excel 12.0;HDR=yes'";
        public ExcelHelper(string fileName)
        {
            connStr = string.Format(connStr, fileName);//操作的文件路径早调用对象时给定
            Conn = new OleDbConnection(connStr);
        }

        public OleDbConnection Conn
        {
            get
            {
                return conn;
            }

            set
            {
                conn = value;
            }
        }



    }
}
