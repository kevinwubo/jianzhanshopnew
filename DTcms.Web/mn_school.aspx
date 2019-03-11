<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_school.html.cs" Inherits="DTcms.Web.mn_school" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="mn_menuplane" tagprefix="uc3" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<html>

<head>
    <title>建盏学院 - 建盏天下网</title>
        <meta name="keywords" content="建盏知识,选盏技巧,建盏新闻,建盏百科,建盏文化" />
        <meta name="description" content="建盏学院是建盏天下网传播千年的建盏文化和历史，共六大板块：建盏工艺，选盏技巧，百科知识，建盏新闻，拍卖行情，建盏历史，一站式指导盏友们如何鉴赏和入门的频道。" />
		<meta name="title" content="建盏天下" />  
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=750, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta content="telephone=no" name="format-detection">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <link rel="stylesheet" type="text/css" href="project/Public/base/css/reset.css?d=" />
    <link rel="stylesheet" type="text/css" href="project/Public/base/css/bass.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/index.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/base/css/swiper-4.3.3.min.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/school.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
<%--    <script type="text/javascript" src="project/Public/base/js/core.js"></script>
    <script type="text/javascript" src="project/Public/page/js/about.js"></script>--%>
    <style type="text/css">
        #swiper-container-banner {
            width: 100%;
            height: 5.2rem;
        }

        #swiper-container-banner a {
            display: inline-block;
            width: 100%;
            height: 100%;
        }

        #swiper-container-banner a img {
            width: 100%;
            height: 100%;
        }
    </style>
</head>

<body>
    <div id="app">
        <div id="header" class="header bgc_c3">
            <!-- 通用头 -->
            <div id="head-page" class="head-page head-page-home">
                <div class="head-left">
					<div class="head-backpage">
						<a href="javascript:window.history.back()">
							<span class="head-backpage-img"></span>
							<span>返回上页</span>
						</a>
					</div>
					<div class="head-gohome">
						<a href="m_index.html">
							<span class="gohome-bor"></span>
							<span class="head-gohome-img"></span>
							<span>首页</span>
						</a>
					</div>
				</div>
                <div class="head-title">
                    建盏学院
                </div>
                <div class="head-p-sides head-p-sides-side" onclick="moveLeft()">
                    <img src="project/Public/image/side.png">
                </div>
            </div>
        </div>
        <div class="planbody bgc_cc">
            <!-- 关于我们-导航栏-->
            <div class="about-tag-plane">
                <ul id=about-tag-list class="about-tag-list">
                    <li class="about-tag-item">
                        <div id="div_xxzx">新闻资讯</div>
                    </li>
                    <li class="about-tag-item">
                        <div id="div_pmhq">拍卖行情</div>
                    </li>
                    <li class="about-tag-item">
                        <div id="div_jzgy">建盏工艺</div>
                    </li>
                    <li class="about-tag-item">
                        <div id="div_bkzs">百科知识</div>
                    </li>
                    <li class="about-tag-item">
                        <div id="div_jzjq">选盏技巧</div>
                    </li>
                    <li class="about-tag-item">
                        <div id="div_whls">文化历史</div>
                    </li>
                </ul>
            </div>
            <div id="list">
                <% List<articleView> lstXW = ModelArticle;
                   foreach (articleView model in lstXW)
                   { %>
                <a href="mn_schooldetail.aspx?articleid=<%=model.id %>" id="item" class="flex-row">
                    <div class="item-div"><img  class="imghead" src="<%=model.img_url %>"/></div>
                    <div class="flex-col" style="position: relative;">
                        <div class="title"><%=model.articleTitle %></div>
                        <div class="desc"><%=model.zhaiyao %></div>
                        <img  style="position: absolute;right: 0.4rem;bottom: 0.4rem;" src="project/Public/image/r-arr.png"/>
                    </div> 
                </a>
                <%} %>
            </div>
            <!-- 门店 -->
            <div id="planbody-promise" class="planbody-promise bgc_ff">

            </div>
            <!-- 通用底部元素 片段截取 -->
            <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
        </div>
            <form id="form1" runat="server">
		    <uc1:mn_footer ID="mn_footer1" runat="server" />
        </form>
    	<!-- 筛选 -->
            <div id="menupart" style="display: none;left:200%;"><uc3:mn_menuplane  ID="mn_menuplane1" runat="server"/></div>
    </div>
    	<div id='menumark' style="display: none"></div>
	
</body>

</html>
<script>
    //点击隐藏在线咨询面板或拨号面板
    $('#menumark').click(function () {

        if (iskuaishu) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#ksplane").css("display", "none");
            });
            iskuaishu = false;
        }
        if (iszaixian) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#zxplane").css("display", "none");
            });
            iszaixian = false;
        }
        moveRight();
    })

    // $('#planbody-foot_box').load('./bass.html #planbody-foot');
    var title = getUrlParam("title");
    if (title == "xxzx") {
        $("#div_xxzx").addClass("btn-on");
    }
    else if (title == "pmhq") {
        $("#div_pmhq").addClass("btn-on");
    }
    else if (title == "jzgy") {
        $("#div_jzgy").addClass("btn-on");
    }
    else if (title == "bkzs") {
        $("#div_bkzs").addClass("btn-on");
    }
    else if (title == "jzjq") {
        $("#div_jzjq").addClass("btn-on");
    }
    else if (title == "whls") {
        $("#div_whls").addClass("btn-on");
    }
    else {
        $("#div_xxzx").addClass("btn-on");
    }


    $(document).ready(function () {
        $("#div_xxzx").click(function () {
            window.location.href = "mn_school.aspx?title=xwzx";
            $("#div_xxzx").addClass("btn-on");
            $("#div_pmhq").removeClass("btn-on");
            $("#div_jzgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
        });
        $("#div_pmhq").click(function () {
            window.location.href = "mn_school.aspx?title=pmhq";
            $("#div_xxzx").removeClass("btn-on");
            $("#div_pmhq").addClass("btn-on");
            $("#div_jzgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
        });
        $("#div_jzgy").click(function () {
            window.location.href = "mn_school.aspx?title=jzgy";
            $("#div_xxzx").removeClass("btn-on");
            $("#div_jzgy").addClass("btn-on");
            $("#div_jjgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
        });
        $("#div_bkzs").click(function () {
            window.location.href = "mn_school.aspx?title=bkzs";
            $("#div_xxzx").removeClass("btn-on");
            $("#div_bkzs").addClass("btn-on");
            $("#div_jzgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
        });
        $("#div_jzjq").click(function () {
            window.location.href = "mn_school.aspx?title=jzjq";
            $("#div_xxzx").removeClass("btn-on");
            $("#div_jzjq").addClass("btn-on");
            $("#div_jzgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
        });
        $("#div_whls").click(function () {
            window.location.href = "mn_school.aspx?title=whls";
            $("#div_xxzx").removeClass("btn-on");
            $("#div_whls").addClass("btn-on");
            $("#div_jzgy").removeClass("btn-on");
            $("#div_bkzs").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
            $("#div_jzjq").removeClass("btn-on");
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