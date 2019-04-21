<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_shop_bak.aspx.cs" Inherits="DTcms.Web.mn_shop_bak" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<head>
<title>建盏商城 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,天目盏,兔毫盏,油滴盏,束口盏" />
<meta name="description" content="建盏商城是福建省建窑建盏首席品牌商城，提供产地大师名家直供的一手精品货源：兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏，提供建盏价格、收藏、名家押窑和私人定制服务。" />
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
	<link rel="stylesheet" type="text/css" href="project/Public/page/css/shop.css" />
	<link rel="stylesheet" type="text/css" href="project/Public/page/css/page.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/index.css" />
	<link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
	<script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
	<script type="text/javascript" src="project/public/base/js/core.js"></script>
	<%-- <script type="text/javascript" src="project/Public/page/js/shop.js"></script> --%>
	<%--<script type="text/javascript" src="project/Public/page/js/page.js"></script>--%>
	<style type="text/css">
	    div.default{ margin:0; padding:0; font-family:"Microsoft YaHei",Verdana; font-size:16px; }
	div.default a,div.default span{ display:inline-block; margin:0 0 0 -1px; padding:4px 16px; line-height:20px; height:28px; border:1px solid #e1e1e1; background:#fff; color:#333; text-decoration:none; }
	div.default span:first-child{ border-left:1px solid #e1e1e1; }
	div.default a:hover{ color:#666; background:#eee; }
	div.default span.current{ color:#fff; background:#488FCD; border-color:#488FCD; }
	div.default span.disabled{ color:#999; background:#fff; }
	    
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
					建盏商城
				</div>
				<div class="head-p-sides head-p-sides-side" onclick="moveLeft()">
					<img src="project/Public/image/side.png">
				</div>
			</div>
		</div>

		<div class="planbody bgc_cc">
			<!-- 条件选择器 -->
			<div class="weui-tab" style="position: absolute">
				<div class="bgc_ff">
					<div class="weui-navbar">
						<div class="weui-navbar__item" href="#tab1">
							<div class="div-on">业界大师
								<img src="project/Public/image/down_arrow.png" />
							</div>
						</div>
						<div class="weui-navbar__item" href="#tab2">
							<div>老牌传承人
								<img src="project/Public/image/down_arrow.png" />
							</div>
						</div>
						<div class="weui-navbar__item" href="#tab3">
							<div>名家工艺师
								<img src="project/Public/image/down_arrow.png" />
							</div>
						</div>
						<div class="weui-navbar__item" href="#tab4">
							<div>器形/釉色
								<img src="project/Public/image/down_arrow.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="item-plane" id="div_item_plane" style="display: none">
				<div class="tag-plane" style="display: none">
					<div style="margin: 0rem 0.4rem; clear: both;overflow: hidden">
						<% 
                            List<Artisan> lstArt = bllArtisan.GetArtisanList(" and artisanType='业界大师' and IsCooperation=1 ", "   Sort");
                            foreach (Artisan model in lstArt)
                            {%>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?name=<%=model.artisanName %>">
								<div class="btn-on"><%=model.artisanName %></div>
							</a>
						</div>
                        <%} %>
					</div>
					
				</div>
				<div class="tag-plane" style="display: none">
					<div style="margin: 0rem 0.4rem; clear: both;overflow: hidden">
						<% 
                            List<Artisan> lstArtL = bllArtisan.GetArtisanList(" and artisanType='老牌传承人' and IsCooperation=1 ", "   Sort");
                            foreach (Artisan model in lstArtL)
                            {%>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?name=<%=model.artisanName %>">
								<div class="btn-on"><%=model.artisanName %></div>
							</a>
						</div>
                        <%} %>
						
					</div>
				</div>
				<div class="tag-plane" style="display: none">
					<div style="margin: 0rem 0.4rem; clear: both;overflow: hidden">
						<% 
                            List<Artisan> lstArtM = bllArtisan.GetArtisanList(" and artisanType='名家工艺师' and IsCooperation=1 ", "  Sort");
                            foreach (Artisan model in lstArtM)
                            {%>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?name=<%=model.artisanName %>">
								<div class="btn-on"><%=model.artisanName %></div>
							</a>
						</div>
                        <%} %>
					</div>
				</div>
                <div class="tag-plane" style="display: none;">
					<div style="margin: 0rem 0.4rem; clear: both;overflow: hidden">
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type2=兔毫">
								<div class="btn-on">兔毫</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type2=油滴/鹧鸪斑">
								<div class="btn-on">油滴/鹧鸪斑</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type2=曜变">
								<div class="btn-on">曜变</div>
							</a>
						</div>
                        <div class="about-tag-item-3">
							<a href="mn_shop.aspx?type2=乌金釉">
								<div class="btn-on">乌金釉</div>
							</a>
						</div>
                        <div class="about-tag-item-3">
							<a href="mn_shop.aspx?type2=杂色釉/异毫">
								<div class="btn-on">杂色釉/异毫</div>
							</a>
						</div>
					</div>
					<div style="height:1px; width: 90%; background: #999;margin: 2% 5%;"></div>
					<div style="margin: 0rem 0.4rem; clear: both;overflow: hidden">
					
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=束口盏">
								<div class="btn-on">束口盏</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=灯盏">
								<div class="btn-on">灯盏</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=敞口盏/斗笠">
								<div class="btn-on">敞口盏/斗笠</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=撇口盏">
								<div class="btn-on">撇口盏</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=敛口盏">
								<div class="btn-on">敛口盏</div>
							</a>
						</div>
						<div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=钵型盏">
								<div class="btn-on">钵型盏</div>
							</a>
						</div>
                       <div class="about-tag-item-3">
							<a href="mn_shop.aspx?type3=创新器型">
								<div class="btn-on">创新器型</div>
							</a>
						</div>
					</div>
				</div>

			</div>
			<!-- 商品展示 -->
			<!-- <div style="height: 0.266rem;" class="bgc_cc"></div> -->
			<div id="planbody-shop-box" class="planbody-shop-box" style="padding-top: 1.4rem;">
				<div class="bgc_ff">
					<div style="font-size: 0.3rem;
					color: #999;
					height: 1.5rem;
					line-height: 1.5rem;
					margin: 0 0.4rem">传承大师-<%=artisanName%><%=Type4 %><%=Type2 %><%=Type3 %><%=Type7 %><%=artisanType %></div>
					<div class="planbody-shop">
						<div class="shop-describe flex_around">
							<% List<Product> lstPro = ModelProList;
                            foreach (Product model in lstPro)
                            { %>
                            <div class="show-view shop-view-state-b">
                            
								<p><%=model.ProductID %></p>
								<p style="height:2.98rem;">
                                    <a href="m_<%=model.ProductID %>.html">
									<img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author %>]</p>
								<p><%=model.ProductName %></p>								
                                <p>器型：<%=model.Type3%></p>
								<p  onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							    
							</div>
                            <%} %>
						</div>
					</div>
				</div>
			</div>
            <div style="background: #fff;width: 100%;">
				<ul class="page" id="page" style="padding:0.3rem">
                    <div id="PageContent" runat="server" style="margin: auto;width: 9rem;font-size: 0.3rem" class="default"></div>
                </ul>
			</div>
			<!-- 通用底部元素 片段截取 -->
			<uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
		</div>

		<uc1:mn_footer ID="mn_footer1" runat="server" />
        <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane  ID="mn_menuplane1" runat="server"/>			
		</div>
	</div>
        <!-- 筛选 -->
	<div id='menumark' style="display: none"></div>	
</body>

</html>
<script>
    var tabindex = 0, lastindex = 0, isshow = false;
    var ismenu;
    function moveLeft() {
        ismenu = true;
        // console.log("dhgsfhjsgdghj");
        $('#menupart').css("display", "block");
        $("#menumark").css("display", "block");
        $("#menupart").animate({ left: '20%' }, "slow"); //8.4
    }


    $("#div_item_plane").click(function () {
        $('.item-plane').css('display', 'none');
    })

    //点击隐藏在线咨询面板或拨号面板
    $('#menumark').click(function () {
        $(".footer").animate({ bottom: '0rem' }, "slow", function () {
            moveRight();
            $("#menumark").css("display", "none");
            $("#ksplane").css("display", "none");
            $("#zxplane").css("display", "none");
        });
    })



//   

    $('.weui-navbar').children().each(function (index, node) {
        $(this).click(function () {
            $('.item-plane').css('display', 'block');

            $('.weui-navbar').children().eq(tabindex).children('div').removeClass('div-on');
            $('.item-plane').children().css('display', 'none');
            lastindex = tabindex;
            tabindex = index;

            $('.item-plane').children().eq(tabindex).css('display', 'block');
            $(this).children('div').addClass('div-on');

            if (tabindex == lastindex) {
                isshow = !isshow;
                isshow ? $('.item-plane').css('display', 'block') : $('.item-plane').css('display', 'none')
            } else {
                $('.item-plane').css('display', 'block');
            }
        })
    })
</script>
