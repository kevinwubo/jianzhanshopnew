using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DTcms.Common;
using System.Data;
namespace DTcms.Web.activity.ajax
{
    public partial class addajax : System.Web.UI.Page
    {
        private string ProductID = string.Empty;
        private string Telephone = string.Empty;
        private string Source = string.Empty;
        /// <summary>
        /// 类型：小匠、名家、大师
        /// </summary>
        private string AuctionType = string.Empty;
        /// <summary>
        /// 用户行为：拍卖提醒、拍卖出价
        /// </summary>
        private string Action = string.Empty;
        /// <summary>
        /// 客户出价
        /// </summary>
        private string CustomerOffer = string.Empty;

        private BLL.Product productBll = new BLL.Product();
        private BLL.proInquiry inquiryBll = new BLL.proInquiry();
        private BLL.Auction auctionBll = new BLL.Auction();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    ProductID = Request["ProductID"]; 
                    Telephone = Request["Telephone"];
                    AuctionType = Request["AuctionType"];
                    Action = Request["Action"];
                    CustomerOffer = Request["CustomerOffer"];
                    Source = Request["Source"];
                    //根据产品ID获取产品明细
                    Model.Product productModel = productBll.GetProductModel(" and ProductID='" + ProductID + "'");
                    if (productModel != null)
                    {
                        Model.Auction model = new Model.Auction();
                        model.ProductID = ProductID;
                        model.ProductName = productModel.ProductName;
                        model.Author = productModel.Author;
                        model.LowPrice = !string.IsNullOrEmpty(productModel.LowPrice) ? Convert.ToDecimal(productModel.LowPrice) : 0;
                        //model.ReservePrice = !string.IsNullOrEmpty(ReservePrice) ? Convert.ToDecimal(ReservePrice) : 0;
                        model.Telephone = DESEncrypt.ConvertBy123(Telephone);
                        model.CustomerOffer = !string.IsNullOrEmpty(CustomerOffer) ? Convert.ToDecimal(CustomerOffer) : 0;
                        model.AuctionDetail = Action;

                        //销售关联and ProductID='" + ProductID + "'
                        bool isJianZhanJun = false;

                        Model.proInquiry inquiryModel = new Model.proInquiry();
                        Source = Source.Replace("?", "");

                        if (Source.Equals("julebu") || Source.Equals("jianzhanjun"))
                        {
                           isJianZhanJun = true;
                           inquiryModel= inquiryBll.GetModelJZJ("  and( telphone='" + Telephone + "' or telphone='" + DESEncrypt.ConvertBy123(Telephone) + "')");
                        }
                        else
                        {
                            inquiryModel = inquiryBll.GetModel("  and( telphone='" + Telephone + "' or telphone='" + DESEncrypt.ConvertBy123(Telephone) + "')");
                        }
                        if (!string.IsNullOrEmpty(inquiryModel.OperatorID))
                        {
                            model.OperatorID = inquiryModel.OperatorID;
                        }
                        else
                        {
                            model.OperatorID = "0";
                        }
                        
                        model.Source = Source;
                        model.AuctionType = AuctionType;
                        if (Action.Equals("拍卖提醒"))//拍卖提醒同一个订单只能操作一次
                        {
                            Model.Auction modelAuction = auctionBll.GetModelList(" and  ProductID='" + ProductID + "' and Telephone='" + DESEncrypt.ConvertBy123(Telephone) + "' and AuctionDetail='拍卖提醒'");
                            if (modelAuction != null)
                            {
                                if (string.IsNullOrEmpty(modelAuction.ProductID))
                                {
                                    auctionBll.Add(model,isJianZhanJun);
                                }
                            }
                            else
                            {
                                auctionBll.Add(model, isJianZhanJun);
                            }
                        }
                        else//拍卖出价可以多次拍 
                        {
                            auctionBll.Add(model, isJianZhanJun);
                        }
                        Response.Write(Action + "成功！建盏顾问将很快回复！");
                    }
                }
                catch (Exception ex)
                {
                    BLL.Log.WriteTextLog("拍卖：" + Action + ex, DateTime.Now);
                }

            }
        }
    }
}