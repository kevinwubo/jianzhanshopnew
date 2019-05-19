<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_famousdetail.aspx.cs" Inherits="DTcms.Web.mn_famousdetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
     <% List<Artisan> lstArtA = ModelArtisanList;
    foreach (Artisan model in lstArtA)
    {
         %>
<title>建盏名家大师【<%=model.artisanName %>】 - 建盏天下网</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,建盏老师,<%=model.artisanName %>,建盏品牌" />
<meta name="Description" content="【<%=model.artisanName %>】<%=NoHTML(model.introduction) %>" />
<%} %>
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
            <div class="back" href="javascript:window.history.back()">
                返回
            </div>
            <div class="txt px36">名家名堂</div>
            <div class="menu" onclick="javascript:moveLeft()">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="intro-wrap about-wrap">

     <% List<Artisan> lstArt = ModelArtisanList;
        foreach (Artisan model in lstArt)
        { %>
        <div class="intro-tit">
            <div class="con-img">
                <img src="<%=model.IDHead %>" alt="">
            </div>
            <div class="con-txt">
                <h1><%=model.artisanName %></h1>
                <span>【<%=model.artisanTitle %>】</span>
                <p>简介：<%=model.introduction%>
                </p>
            </div>
        </div>
        <div class="about-con">
            <div class="fea-main">
                <%=model.DetailedIntroduction%>
            </div>
        </div>
        <%--<div class="close-all">收起全部</div>--%>
        <div class="part1" style="border-top: none;">
            <div class="flex-row" style="align-items: center;padding:.25rem 0">
                <div class="flex-col"></div>
                <div class="px32 color_57 mar-r-16">人气推荐</div>
                <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
                <div class="flex-col"></div>
            </div>
            <div class="list">
            <%
                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'",0);
                        foreach (Product modelPro in lstPro)
                        {%>
                <div class="item">
                    <div style="margin: 0 .1rem">
                        <div class="t1 color_red_c9">ID:<%=modelPro.ProductID %></div>
                        <div class="pimg" style="background:url(<%=modelPro.Images %>)"></div>
                    </div>
                    <div class="t1 clamp1">【<%=modelPro.Author %>】<%=modelPro.ProductName %></div>
                    <img class="bt-zx"  onclick="xunjia('<%=modelPro.ProductName %>','<%=modelPro.ProductID %>')" src="../static/images/jianzhan/btn_ljzx.png" />
                </div>
                <%} %>
            </div>
<%--            <div style="text-align: center; padding: .4rem" class="showmore">
                <div class="color_red_c9 px28">展示更多</div>
                <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
            </div>--%>
        </div>

        <%} %>
        <div style="background: #f7f7f7;padding: .5rem .6rem">
            <div class="flex-row" style="text-align:center">
                <img style="width:1.5rem;height:1.5rem;margin-left: .3rem"
                    src="../static//images/jianzhan/ic_code.png" />
                <div class="flex-col">
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20">关于我们</div>
                        <div class="mar-l-30 color_3 px20">售后服务</div>
                    </div>
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20">服务保障</div>
                        <div class="mar-l-30 color_3 px20">在线支付</div>
                    </div>
                    <div class="flex-row" style="height:.43rem;align-items:center">
                        <div class="color_red_c9 px30 mar-l-30">4008-2313-2321</div>
                        <div class="color_red_c9 px16">(24小时在线)</div>
                    </div>
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20" style="text-align:left">(识别二维码了解更多)</div>
                    </div>
                </div>
            </div>
            <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center">闽ICP备17006498号-1 Copyright 2015 建盏天下网
                版权所有</div>
            <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center"> 福建省盏天下电子商务有限公司</div>
        </div>
    </section>
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
    <script>
        $('.close-all').click(function () {
            if ($('.about-con').is(':hidden')) {
                $('.about-con').show();
                $(this).html('收起全部');
            } else {
                $('.about-con').hide();
                $(this).html('展开全部');
            }
        })
    </script>
</body>

</html>