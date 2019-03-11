using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.BLL;
using System.Data;

namespace DTcms.Web
{
    public partial class webTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            proInquiry bll = new proInquiry();
            DataTable dt = bll.GetTest().Tables[0];
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    int count = bll.GetCount(dt.Rows[i]["tel"].ToString(), dt.Rows[i]["id"].ToString());
                    if (count == 0)
                    {
                        Model.proInquiry model = new Model.proInquiry();
                        model.ProductID = dt.Rows[i]["id"].ToString();
                        model.WebChartID = "";
                        model.CustomerName = "";
                        model.InquiryContent = "91数据导入";
                        model.telphone = dt.Rows[i]["tel"].ToString();
                        model.CustomerName = "";
                        model.SourceForm = "PC";
                        model.ProcessingState = "1";
                        model.OperatorID = "2";
                        model.SaleTelephone = "13916116545";
                        model.status = "新";
                        model.AddDate = Convert.ToDateTime(dt.Rows[i]["date"].ToString() + " " + dt.Rows[i]["time"].ToString());
                        bll.Add(model);
                    }
                }
            }
        }
    }
}