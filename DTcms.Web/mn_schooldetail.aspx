<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_schooldetail.aspx.cs" Inherits="DTcms.Web.mn_schooldetail" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="mn_menuplane" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
        <% article model = Model;
       if (model != null)
       {%>
<title><%=model.title%>—建盏学院<%=acate.GetTitle(model.category_id) %></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=model.title%>,建盏天下" />
<meta name="Description" content="<%=model.zhaiyao.Length > 150 ? model.zhaiyao.Substring(0, 149) : model.zhaiyao %>" />
<%} %>
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
    <script type="text/javascript" src="project/Public/base/js/core.js"></script>
    <script type="text/javascript" src="project/Public/page/js/about.js"></script>
    <style type="text/css">
        #swiper-container-banner {
            width: 100%;
            height: 6.5rem;
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
        <% article modelShow = Model;
           if (modelShow != null)
           { %>
            <!-- 头部标题-->
            <div class="detail-title-plane">
                <div class="title"><%=model.title %></div>
                <div class="desc">
                    <span>日期：<%=model.add_time %></span>
                    <span style="margin-left: 0.2rem">板块：
                        <span style="color: #b32b2b"><%=acate.GetTitle(model.category_id) %></span>
                    </span>
                </div>
            </div>
            <div style="height: 1px;background-color: #999;width: 90%;margin:0 5%"></div>
            <!-- 富文本内容 -->
            <div class="content">
                <p><%=model.content %></p>
            </div>
            <!-- 通用底部元素 片段截取 -->
            <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
            <%} %>
            <uc1:mn_footer ID="mn_footer1" runat="server" />
                   <div id="menupart" style="display: none;left:200%;">
            <uc3:mn_menuplane  ID="mn_menuplane1" runat="server"/></div>
        </div>
        </div>
 
    
    
        <!-- 筛选 -->
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
</script>