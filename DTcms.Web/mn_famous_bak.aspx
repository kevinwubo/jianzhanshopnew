<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_famous_bak.aspx.cs" Inherits="DTcms.Web.mn_famous_bak" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>名家名堂 - 建盏天下网</title>
    <meta name="keywords" content="建盏名家,卓立旗,李达,孙建新,黄美金,陈大鹏" />
    <meta name="description" content="名家名堂是建盏天下网第一手发布建窑建盏大师名家资讯和个人介绍，业界大师：孙建新、李达、黄美金、陈大鹏、卓立旗、陆金喜；老牌传承人：蔡炳盛、蔡炳昆、叶礼旺、叶礼忠；知名品牌：飞惺、吉玉坊、芦花坪......" />
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
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/famous.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
    <script type="text/javascript" src="project/Public/base/js/core.js"></script>
    <!-- <script type="text/javascript" src="project/Public/page/js/about.js"></script> -->
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
        	    div.default{ margin:0; padding:0; font-family:"Microsoft YaHei",Verdana; font-size:12px; }
	div.default a,div.default span{ display:inline-block; margin:0 0 0 -1px; padding:4px 12px; line-height:20px; height:28px; border:1px solid #e1e1e1; background:#fff; color:#333; text-decoration:none; }
	div.default span:first-child{ border-left:1px solid #e1e1e1; }
	div.default a:hover{ color:#666; background:#eee; }
	div.default span.current{ color:#fff; background:#488FCD; border-color:#488FCD; }
	div.default span.disabled{ color:#999; background:#fff; }
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
                    名家名堂
                </div>
                <div class="head-p-sides head-p-sides-side" onclick="moveLeft()">
                    <img src="project/Public/image/side.png">
                </div>
            </div>
        </div>
        		<!-- 返回顶部按钮 -->
		<div class="totop">
			<img src="project/Public/image/toTop.png" />
		</div>
        <div class="planbody bgc_cc">
            <!-- 关于我们-导航栏-->
            <div id="list">
             <%
                List<Artisan> lstArt = ModelArticleList;
                if (lstArt != null && lstArt.Count > 0)
                {
                    foreach (Artisan model in lstArt)
                    {
                    %>
                <div id="item">
                    <div class="flex-row">
                        <div class="item-div">
                            <a href="m_art<%=model.artisanID %>.html">
                                <img class="imghead" src="<%=model.IDHead %>" />
                            </a>
                        </div>
                        <div class="flex-col" style="position: relative;">
                            <a href="m_art<%=model.artisanID %>.html" style="color: #333;">
                                <div class="title"><%=model.artisanName %></div>
                                <div class="desc"><%= model.introduction.Length>86?model.introduction.Substring(0,85):model.introduction %> ......</div>
                            </a>
                            <img class="xiala" style="position: absolute;right: 0.4rem;bottom: 0.4rem;" src="project/Public/image/famous-down.png" />
                            <img class="shangla" style="position: absolute;right: 0.4rem;bottom: 0.4rem;display:none" src="project/Public/image/famous-up.png" />
                        </div>
                    </div>
                    <div class="flex-row pro-plane" style="display: none">
                        <% 
                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 3);
                        foreach (Product modelPro in lstPro)
                        {
                            %>
                   <%--         <div class="pro-img" style="height: 2.93rem;width: 2.93rem; float:left;line-height: 2.93rem;">
                           <a href="mn_famous<%=modelPro.ProductID %>.html"  target="_blank"> <img style="width: 100%; vertical-align: middle;" src='<%=modelPro.Images %>' /></a>
                        </div>--%>
                        <div class="show-view shop-view-state-a">
							
								<p><%=modelPro.ProductID%></p>
								<p style="height:1.98rem;"><a href="m_<%=modelPro.ProductID %>.html">
									<img class="list-item-img" src="<%=modelPro.Images %>">
                                    </a>
								</p>
								<p>[<%=modelPro.Author%>]</p>
								<p><%=modelPro.ProductName%></p>
								<p>器型：<%=modelPro.Type3%></p>
								<p onclick="xunjia('<%=modelPro.ProductName %>','<%=modelPro.ProductID %>')">
									<span></span>
									<button class="shop-query">立即咨询</button>
								</p>
							</div>
                        <%} %>	
                    </div>
                </div>
                <%}
                } %>
            </div>
            <div style="background: #fff;width: 100%;">
				<ul class="page" id="page" style="padding:0.3rem">
                    <div id="PageContent" runat="server" style="margin: auto;width: 9rem;font-size: 0.3rem"  class="default"></div>
                </ul>
			</div>
            <!-- 通用底部元素 片段截取 -->
            <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
        </div>
            <form id="form1" runat="server">
		    <uc1:mn_footer ID="mn_footer1" runat="server" />
        </form>
                           <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane  ID="mn_menuplane1" runat="server"/></div>
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

    $('.xiala').click(function () {
        $(".shangla").show();
        $(".xiala").hide();
        $(this).parent().parent().parent().children().eq(1).show()
    })
    $('.shangla').click(function () {
        $(".xiala").show();
        $(".shangla").hide();
        // console.log($(this).parent().parent().children().eq(1))
        $(this).parent().parent().parent().children().eq(1).hide()
    })
    // $('#planbody-foot_box').load('./bass.html #planbody-foot');
</script>