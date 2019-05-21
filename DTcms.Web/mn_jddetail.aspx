<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_jddetail.aspx.cs" Inherits="DTcms.Web.mn_jddetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer_new.ascx" tagname="mn_footer_new" tagprefix="uc2" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>

<head>
    <meta charset="utf-8">
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
    <script type="text/javascript" src="../static/js/jquery-2.1.4.js"></script>
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
    
     <% List<Artisan> lstArtB = ModelArtisanList;
        foreach (Artisan item in lstArtA)
        {
         %>
        <div class="flex-row college-hd">
            <a class="back" style="color:#fff" href="m_index.html">返回</a>
            <div class="txt px36">经典<%=item.artisanType %></div>
            <div class="menu" onclick="javascript:moveLeft()">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="intro-wrap about-wrap">

        <div class="intro-tit" style="padding-bottom:.3rem;border-bottom: 1px solid #f0f0f0">
            <div class="con-img">
                <img src="<%=item.IDHead %>" alt="">
            </div>
            <div class="con-txt">
                <h1><%=item.artisanName %></h1>
                <span>【<%=item.Adddate.ToShortDateString() %>】</span>
                <p><%=item.introduction %>
                </p>
            </div>
        </div>
        <%} %>
        <div class="part1" style="border-top: none;">
            <div class="flex-row" style="align-items: center;padding:.25rem 0">
                <div class="flex-col"></div>
                <div class="px32 color_57 mar-r-16">兔毫赏析</div>
                <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
                <div class="flex-col"></div>
            </div>
            <div class="list">

                <% List<Product> list = listProduct;
                   if (list != null && list.Count > 0)
                   {
                       foreach (Product pro in list)
                       { %>
                <div class="item">
                    <div style="margin: 0 .1rem">
                        <div class="t1 color_red_c9">ID:<%=pro.ProductID %></div>
                        <div class="pimg" style="background:url(<%=pro.Images %>)"></div>
                    </div>
                    <div class="t1 clamp1">【<%=pro.Author %>】<%=pro.ProductName %></div>
                    <img class="bt-zx"  onclick="xunjia('<%=pro.ProductName %>','<%=pro.ProductID %>')" src="../static/images/jianzhan/btn_ljzx.png" />
                </div>
                <%}
                   }%>
            </div>
<%--            <div style="text-align: center; padding: .4rem" class="showmore">
                <div class="color_red_c9 px28">展示更多</div>
                <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
            </div>--%>
        </div>
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
         <uc2:mn_footer_new ID="mn_footer_new1" runat="server" />
        <uc1:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
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