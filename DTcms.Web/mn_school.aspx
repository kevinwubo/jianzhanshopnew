<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_school.html.cs" Inherits="DTcms.Web.mn_school" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc1" %>
<html>

<head>
    <meta charset="utf-8">
    <title>建盏学院 - 建盏天下网</title>
        <meta name="keywords" content="建盏知识,选盏技巧,建盏新闻,建盏百科,建盏文化" />
        <meta name="description" content="建盏学院是建盏天下网传播千年的建盏文化和历史，共六大板块：建盏工艺，选盏技巧，百科知识，建盏新闻，拍卖行情，建盏历史，一站式指导盏友们如何鉴赏和入门的频道。" />
		<meta name="title" content="建盏天下" />  
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/pagination.css" type="text/css">
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
    <form id="form1" runat="server">
    <header>
        <div class="flex-row college-hd">
            <div class="back">
                 <a href="m_index.html">返回</a>
            </div>
            <div class="txt px36">建盏学院</div>
            <div class="menu" onclick="javascript:moveLeft()">
                <img src="../static/images/college/menu.png" alt="" >
            </div>
        </div>
    </header>
    <section class="colList-wrap">
        <div class="tab-box">
            <div class="tab-menu" id="div_xxzx">新闻资讯</div>
            <div class="tab-menu" id="div_pmhq">拍卖行情</div>
            <div class="tab-menu" d="div_jzgy">建盏工艺</div>
            <div class="tab-menu" id="div_bkzs">百科知识</div>
            <div class="tab-menu" id="div_jzjq">选盏技巧</div>
            <div class="tab-menu" id="div_whls">文化历史</div>
        </div>
        <div class="list-box">
            
             <% List<articleView> lstXW = ModelArticle;
                foreach (articleView model in lstXW)
                { %>
                <div class="list-con">
                <div class="con-img">
                    <img src="<%=model.img_url %>" alt="">
                </div>
                <div class="con-txt">
                    <h1><%=model.articleTitle %></h1>
                    <span>【<%=model.AddDate.ToShortDateString() %>】</span>
                    <p><%= model.zhaiyao.Length>40?model.zhaiyao.Substring(0,39):model.zhaiyao %> ......
                        <a href="mn_schooldetail.aspx?articleid=<%=model.id %>">查看更多></a>
                    </p>
                </div>
                </div>
                <%} %>
            
        </div>
        <!-- 分页 -->
        <div class="div-h-3"></div>
        <div class="flex-row M-box m-style" style="justify-content: center"></div>
        <div class="div-h-8"></div>
       
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
<uc1:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />

 <!-- 立即质询 -->
 <!-- 立即质询 -->
 <div id="guanzhuweixin-s" class="flex-row " style="position: fixed;bottom: 0;height: 1.62rem;background: white;text-align: center;align-items: center;border-top: 1px solid #f6f6f6;width: 100%;z-index: 99;">
     <div class="flex-col searchzx mar-l-30">

         <div class="flex-row" style="align-items: center;height: .7rem">
<!-- 
             <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                 alt=""> -->
             <input style="background: #f7f7f7" class="px24 pad-l-30" type="text" placeholder="大师或者编号" />
         </div>
     </div>
     <div class="ssbtnzx px24 mar-r-30">立即咨询</div>
 </div>
    
 <div class="totop" style="display: block;">
    <img style="height:.8rem;width:.8rem" src="../static/images/jianzhan/to_top.png">
</div>
<div class="backtohome" style="display: block;">
    <img style="height:.8rem;width:.8rem" src="../static/images/jianzhan/backhome.png">
</div>
    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <script src="../static/js/jquery.pagination.js"></script>
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script>
        // 返回顶部
        var backButton = $('.totop');
        var backToHome = $('.backtohome');
        function backToTop() {
            // $(window).animate({
            // 	pageYOffset: 0
            // }, 800);
            window.scrollTo(0, 0)
        }
        backButton.on('click', backToTop);
        backToHome.on('click', function () {
            location.href = '/mn_index.html'
        })

        $(window).on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */
            if ($(window).scrollTop() > $(window).height())
                backButton.fadeIn();
            else
                backButton.fadeOut();
        });
        $(window).trigger('scroll');
        $('.M-box').pagination({
            mode: 'fixed'
        });
        isTouchDevice();

        var title = getUrlParam("title");
        if (title == "xxzx") {
            $("#div_xxzx").addClass("active");
        }
        else if (title == "pmhq") {
            $("#div_pmhq").addClass("active");
        }
        else if (title == "jzgy") {
            $("#div_jzgy").addClass("active");
        }
        else if (title == "bkzs") {
            $("#div_bkzs").addClass("active");
        }
        else if (title == "jzjq") {
            $("#div_jzjq").addClass("active");
        }
        else if (title == "whls") {
            $("#div_whls").addClass("active");
        }
        else {
            $("#div_xxzx").addClass("active");
        }


        $(document).ready(function () {
            $("#div_xxzx").click(function () {
                window.location.href = "mn_school.aspx?title=xwzx";
                $("#div_xxzx").addClass("active");
                $("#div_pmhq").removeClass("active");
                $("#div_jzgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
            $("#div_pmhq").click(function () {
                window.location.href = "mn_school.aspx?title=pmhq";
                $("#div_xxzx").removeClass("active");
                $("#div_pmhq").addClass("active");
                $("#div_jzgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
            $("#div_jzgy").click(function () {
                window.location.href = "mn_school.aspx?title=jzgy";
                $("#div_xxzx").removeClass("active");
                $("#div_jzgy").addClass("active");
                $("#div_jjgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
            $("#div_bkzs").click(function () {
                window.location.href = "mn_school.aspx?title=bkzs";
                $("#div_xxzx").removeClass("active");
                $("#div_bkzs").addClass("active");
                $("#div_jzgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
            $("#div_jzjq").click(function () {
                window.location.href = "mn_school.aspx?title=jzjq";
                $("#div_xxzx").removeClass("active");
                $("#div_jzjq").addClass("active");
                $("#div_jzgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
            $("#div_whls").click(function () {
                window.location.href = "mn_school.aspx?title=whls";
                $("#div_xxzx").removeClass("active");
                $("#div_whls").addClass("active");
                $("#div_jzgy").removeClass("active");
                $("#div_bkzs").removeClass("active");
                $("#div_jzjq").removeClass("active");
                $("#div_jzjq").removeClass("active");
            });
        });
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            //构造一个含有目标参数的正则表达式对象            
            var r = window.location.search.substr(1).match(reg);
            //匹配目标参数            
            if (r != null) return unescape(r[2]);
            return null; //返回参数值        
        }
    </script>
    </form>
</body>

</html>