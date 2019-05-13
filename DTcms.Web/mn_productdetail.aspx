<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_productdetail.aspx.cs" Inherits="DTcms.Web.mn_productdetail" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_footer_new.ascx" tagname="mn_footer_new" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
     <% 
     List<Product> listProA=productModelList;
     foreach (Product model in listProA)
     { %>
<title>【<%=model.Author %>】<%=model.ProductName %>—建盏天下</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,<%=model.Author %>,<%=model.Type2 %>,<%=model.Type3 %>,<%=model.MarketPrice %>" />
<meta name="Description" content="【<%=model.Author %>】<%=model.ProductName %>,<%=model.Volume %><%=NoHTML(model.summary) %>" />
<%} %>
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <link rel="stylesheet" href="../static/css/swiper.min.css">
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
            <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }
        .txt p{
width:100% !important;
font-size:.22rem !important;
line-height:.46rem !important;
}.txt img{
width:100% !important;
}
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <header>
        <div class="flex-row college-hd">
            <div class="back"  href="javascript:window.history.back()">
                返回
            </div>
            <div class="txt px36">建盏学院</div>
            <div class="menu" onclick="javascript:moveLeft()">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="details-wrap">
        <div class="bannner-carousel">
            <div class="swiper-container-1 swiper-container" style="height:unset">
                <div class="swiper-wrapper">
                 <% List<string> strLst = productModelList != null && productModelList.Count > 0 ? productModelList[0].lstImages : null;
                         if(strLst!=null)
                         {
                             for (int i = 0; i < strLst.Count; i++)
                             {
                        %>
                                     <div class="swiper-slide"><%=strLst[i] %></div>
						<%}
                         } %>
       
                </div>
                <div class="swiper-pagination-1 swiper-pagination"></div>
            </div>
        </div>
                     <% 
             List<Product> listPro=productModelList;
             foreach (Product model in listPro)
             { %>
        <div class="goods-info">
            <div class="tit"><%=model.ProductName %></div>
            <span>ID:<%=model.ProductID %></span>
        </div>
        <div class="details-info">
            <div class="infp-wrap">
                <div class="info-l">信息：</div>
                <div class="info-r">
                    <div> 釉色：<span><%=model.Type2 %></span></div>
                    <div>
                        器形：
                        <span>
                            <%=model.Type3 %>
                        </span></div>
                    <div>
                        尺寸：
                        <span>
                           <%=model.Type4 %>
                        </span></div>
                    <div>
                        作者：
                        <span>
                            <%=model.Author %>
                        </span></div>
                </div>
            </div>
            <div class="infp-wrap">
                
                <div style="width:100%">
                    <div class="txt"> <%=model.summary.Replace("16pt", "20pt").Replace("900","730")%>             
                </div>
                </div>
          
            </div>
        </div>
        <div class="img-show" style="padding:.3rem">
                  <%=model.ProImageDetail%>
                  
        </div>
        <%} %>
    </section>
<uc2:mn_footer_new ID="mn_footer_new1" runat="server" />

    <uc1:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <script src="../static/js/jquery.pagination.js"></script>
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script src="../static/js/swiper.min.js"></script>
    <script>
        var swiper1 = new Swiper('.swiper-container-1', {
            pagination: '.swiper-pagination-1',
            paginationClickable: true,
            autoplay: 2000,
        });
    </script>
    </form>
</body>

</html>