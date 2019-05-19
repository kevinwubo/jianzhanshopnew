<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_detail.aspx.cs" Inherits="DTcms.Web.web.product_detail" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
 <% 
     List<Product> listPro1=productModelList;
     foreach (Product model in listPro1)
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
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }
    </style>
</head>

<body>
    <header>
        <div class="flex-row college-hd">
            <div class="back">
                返回
            </div>
            <div class="txt px36">建盏学院</div>
            <div class="menu">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <%     List<Product> listPro=productModelList;
           foreach (Product model in listPro)
           { %>

    <section class="details-wrap">
        <div class="bannner-carousel">
            <div class="swiper-container-1 swiper-container">
                <div class="swiper-wrapper">
                    
                    <div class="swiper-slide"><img src="<%=model.Images %>"></div>
                    <% List<string> strLst = model.lstImages;
               List<string> strLstUrl = model.lstImagesUrl;
               for (int i = 0; i < strLst.Count;i++ )
               {                      
                        %>
                        <div class="swiper-slide"><img src="<%=strLstUrl[i] %>"></div>
                <%} %>
                </div>
                <div class="swiper-pagination-1 swiper-pagination"></div>
            </div>
        </div>
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
                            <%=model.Volume %>
                        </span></div>
                    <div>
                        作者：
                        <span>
                            <%=model.Author %>
                        </span></div>
                </div>
            </div>
            <div class="infp-wrap">
                <div class="info-l" style="width:20%">介绍：</div>
                <div class="info-r">
                    <div class="txt"> <%=model.summary%></div>
                </div>
            </div>
        </div>
        <div class="img-show" style="padding:.3rem">
        <%=model.ProImageDetail %>
        </div>
    </section>

    <%} %>
    <footer style="border-top: 2px solid #F0F0F0;">
        <div class="flex-row pad-l-30 pad-r-30 pad-t-20 pad-b-40" style="text-align: center;align-items: center;">
            <a  class="flex-col" href="m_index.html">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_home.png" alt="">
                <div style="margin-top: .1rem;">首页</div>
            </a>
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_fl.png" alt="" />
                <div style="margin-top: .1rem;">分类</div>
            </div>
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic-zx.png" alt="" />
                <div style="margin-top: .1rem;">咨询</div>
            </div>
            <div style="width:2rem" class="mar-l-20">
                <div class="flex-row">
                    <img style="height: .5rem;width:.55rem" src="../static/images/jianzhan/ic_wx.png" alt="" />
                    <div class="flex-col px16">(长按复制添加微信)</div>
                </div>
                <div style="margin-top: .1rem;">1231723876</div>
            </div>
        </div>
    </footer>
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
</body>

</html>