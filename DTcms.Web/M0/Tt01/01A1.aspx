<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="01A1.aspx.cs" Inherits="DTcms.Web.M0.Tt01._01A1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="/UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="/UserControl/menuplane.ascx" tagname="mn_menuplane" tagprefix="uc2" %>
<%@ Register src="/UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<!DOCTYPE html>
<html>

<head>
	<title>建盏天下网(JianZhanShop.com) - 建窑建盏首席品牌商城</title>
    <meta name="keywords" content="建盏,建窑,天目盏,兔毫盏,油滴盏" />
    <meta name="description" content="建盏天下(JianZhanShop.com)是国内首家专注于建窑建盏的专业门户，提供产地艺人直供的精品兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏。建盏天下传播千年的建盏文化和历史，大师名家，老盏等权威信息，提供建盏品鉴、收藏和定制服务。" />
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
	<link rel="stylesheet" type="text/css" href="/project/Public/base/css/reset.css?d=" />
	<link rel="stylesheet" type="text/css" href="/project/Public/base/css/bass.css" />
	<link rel="stylesheet" type="text/css" href="/project/Public/base/css/swiper-4.3.3.min.css" />
	<link rel="stylesheet" type="text/css" href="/project/Public/page/css/index.css" />
	<link rel="stylesheet" type="text/css" href="/project/Public/iconfont/iconfont.css" />
	<script type="text/javascript" src="/project/Public/base/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/project/Public/base/js/swiper-4.3.3.min.js"></script>
	<script type="text/javascript" src="/project/Public/base/js/ZRrem.js"></script>
	<!-- <script type="text/javascript" src="/project/Public/base/js/core.js"></script> -->
	<!-- <script type="text/javascript" src="/project/Public/page/js/index.js"></script> -->
    <!-- Bytedance Tracking -->
    <script>
        (function (r, d, s, l) {
            var meteor = r.meteor = r.meteor || []; meteor.methods = ["track", "off", "on"]; meteor.factory = function (method) {
                return function () {
                    var args = Array.prototype.slice.call(arguments); args.unshift(method); meteor.push(args); return meteor
                } 
            }; for (var i = 0; i < meteor.methods.length; i++) {
                var key = meteor.methods[i]; meteor[key] = meteor.factory(key)
            } meteor.load = function () {
                var js, fjs = d.getElementsByTagName(s)[0]; js = d.createElement(s);
                js.src = "https://analytics.snssdk.com/meteor.js/v1/" + l + "/sdk"; fjs.parentNode.insertBefore(js, fjs)
            }; meteor.load(); if (meteor.invoked) { return }
            meteor.invoked = true; meteor.track("pageview")
        })(window, document, "script", "81787640763");
    </script>
<!-- End Bytedance Tracking -->
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

		#swiper-container-star {
			width: 100%;
			height: 4.77rem;
		}

		#swiper-container-star a {
			display: inline-block;
			width: 100%;
			height: 100%;
		}

		#swiper-container-star a img {
			width: 100%;
			height: 3.7rem;
		}

		.star-describe {
			width: 100%;
			height: 1.07rem;
			background-color: white;
			text-align: center;
			overflow: hidden;
		}

		.star-describe p:nth-child(1) {
			font-size: 0.37rem;
			line-height: 0.37rem;
			color: #cc3333;
			padding-top: 0.106rem;
			padding-bottom: 0.106rem;
		}

		.star-describe p:nth-child(2) {
			font-size: 0.26rem;
			line-height: 0.26rem;
			color: #333333;
		}

		#swiper-container-stop {
			width: 100%;
			padding: 0.4rem 0;
			height: 4.5rem;
		}

		#swiper-container-stop a {
			display: inline-block;
			width: 100%;
			height: 100%;
		}

		#swiper-container-stop a img {
			width: 100%;
			height: 100%;
		}
		.planbody-active-main-4 {
			position: relative;
			display: inline-block;
			vertical-align: top;
			width: 45%;
			height: 6rem;
			box-sizing: border-box;
			border-right: 2px solid #b1b1b1;
			padding-top: 0.613rem;
			padding-bottom: 0.613rem;
			float: left;
			border-top: 2px solid #b1b1b1;
		}

		.planbody-active-main-4 .active-main-img {
			position: absolute;
			left: 0.8rem;
			top: 0.8rem;
			width: 2.76rem;
			height: 2.76rem;
		}

		.active-main-img,
		.active-main-img img {
			width: 2.76rem;
			height: 2.76rem;
			display: inline-block;
		}

		.planbody-active-main-4 .active-main-text {
			width: 100%;
			margin-top: 3.6rem;
		}

		.planbody-active-main-6 {
			position: relative;
			display: inline-block;
			vertical-align: top;
			width: 55%;
			height: 2rem;
			box-sizing: border-box;
			border-top: 2px solid #b1b1b1;
			padding-top: 0.15rem;
			padding-bottom: 0.15rem;
			display: flex;
		}

		.planbody-active-main-6 .active-main-img {
			width: 1.6rem;
			height: 1.6rem;
			margin-left: 0.4rem
		}

		.planbody-active-main-6 .active-main-img img{
			width: 1.6rem;
			height: 1.6rem;
			/* display: inline-block; */
		}

		.planbody-active-main-6 .active-main-text {
			top: 0.15rem;
			position: relative;
		}
		#menupart {
	        height: 100%;
	        width: 80%;
	        position: absolute;
	        top: 0;
	        left: 0;
	        z-index: 99;
        }
        #menupart .menu-body {
			width: 100%
		}
		#swiper-container-star a #headimg {
            width: 100%;
            height: 3.7rem;
        }
        .head-p-logo, .head-p-search-index, .head-p-sides {
            display: inline-block;
            vertical-align: top;
            height: auto;
            box-sizing: border-box;
 	        margin-top: 0.226rem;
        }
        .head-p-search-index {
	        height: auto;
	        background-color: #b32b2b;
	        padding-top: 2px;
	        padding-bottom: 2px;
	        padding-left: 2px;
	        box-sizing: border-box;
        }
        .head-p-search-index input{
	        width: 4.16rem;
	        height: 0.72rem;
	        border: none;
	        outline: none;
	        background-color: white;
	        display: inline-block;
	        vertical-align: top;
	        font-size: 0.385rem;
	        text-indent: 0.173rem;
        }
        .head-p-search-index label{
	        display: inline-block;
	        width: 1.12rem;
	        text-align: center;
	        line-height: 0.72rem;
	        font-size: 0.385rem;
	        color: white;
        }
        .head-p-sides {
	        position: absolute;
	        right: 0.33rem;
	        top: 0.426rem;
	        margin-top: 0;
        }
        .head-p-sides img{
	        display: inline-block;
	        width: 0.733rem;
        }
	</style>
</head>

<body>
	<div id="app">
		<div class="header bgc_ff">
			<!-- 通用头 -->
			<div class="head-page head-page-home">
				<div class="head-p-logo">
					<img src="/project/Public/image/logo.png" />
				</div>
				<div class="head-p-search-index">
					<input type="text" id="keyword" placeholder="作者编号或名称" class="col_33">
					<label id="btnSearch">搜索</label>
				</div>
				<div class="head-p-sides" onclick="moveLeft()">
					<img src="/project/Public/image/about.png">
				</div>
			</div>
		</div>
		<!-- 返回顶部按钮 -->
		<div class="totop">
			<img src="/project/Public/image/toTop.png" />
		</div>
		<div class="planbody bgc_cc">
			<!-- banner -->
			<div>
				<div id="swiper-container-banner" class="swiper-container">
					<div id="swiper-wrapper-banner" class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="/mn_shop.aspx?name=陈大鹏">
								<img src="/m_images/lun2.jpg">
							</a>
						</div>
						<div class="swiper-slide">
							<a href="/mn_shop.aspx?name=孙建兴">
								<img src="/m_images/lun3.jpg">
							</a>
						</div>
						<div class="swiper-slide">
							<a href="/mn_shop.aspx?name=李达">
								<img src="/m_images/lun4.jpg">
							</a>
						</div>
			<%--			<div class="swiper-slide">
							<a href="/mn_shop.aspx?name=李达">
								<img src="/m_images/lun4.jpg">
							</a>
						</div>--%>
					</div>
					<!-- 分页器 -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<!-- nav -->
			<div class="planbody-nav bgc_ff">

				<a href="/m_artisan_list.html" class="col_33">
					<dl>
						<dt>
							<img src="/project/Public/image/home_star.png">
						</dt>
						<dd>名家名堂</dd>
					</dl>
				</a>
                <a href="/m_product_list.html" class="col_33">
					<dl>
						<dt>
							<img src="/project/Public/image/home_shop.png">
						</dt>
						<dd><b style="color:Red">商城</b></dd>
					</dl>
				</a>
				<a href="/m_school.html" class="col_33">
					<dl>
						<dt>
							<img src="/project/Public/image/home_school.png">
						</dt>
						<dd>建盏学院</dd>
					</dl>
				</a>
				<a href="/m_collection.html" class="col_33">
					<dl>
						<dt>
							<img src="/project/Public/image/home_house.png">
						</dt>
						<dd>收藏馆</dd>
					</dl>
				</a>
			</div>
			<!-- active -->
			<div style="height: 0.266rem;" class="bgc_cc"></div>
            <div class="planbody-active bgc_ff">
				<a href="//zt_yaobian.html" class="planbody-active-main-4 bor_r">
					<div class="active-main-text">
						<p>精彩专题</p >
						<p>专题活动全知道</p >
						<p>限时好礼</p >
					</div>
					<div class="active-main-img">
						<img src="/m_images/01.png" alt='active'>
					</div>
				</a>
				<a href="/mn_shop.aspx?typeModel=new" class="planbody-active-main-6 bor_l">
					<div class="active-main-text">
						<p>每周新品</p >
						<p>新品好货快速了解</p >
						<p>每周一更</p >
					</div>
					<div class="active-main-img">
						<img src="/m_images/02.png" alt='active'>
					</div>
				</a>
				<a href="/mn_shop.aspx?type2=油滴/鹧鸪斑" class="planbody-active-main-6 bor_r">
					<div class="active-main-img">
						<img src="/m_images/03.png" alt='active'>
					</div>
					<div class="active-main-text" style=" margin-left: 0.4rem;">
						<p>精美釉色</p >
						<p>油滴釉色快速导航</p >
						<p>即时更新</p >
					</div>
				</a>
				<a href="/mn_shop.aspx?type3=束口盏" class="planbody-active-main-6 bor_l">
					<div class="active-main-text">
						<p>完美器形</p >
						<p>束口器型快速导航</p >
						<p>即时更新</p >
					</div>
					<div class="active-main-img">
						<img src="/m_images/04.png" alt='active'>
					</div>
				</a>
			</div>
			<!-- 商品展示 -->
			<div style="height: 0.266rem;" class="bgc_cc"></div>
			<div id="planbody-shop-box" class="planbody-shop-box">
				<div class="bgc_ff">
					<div class="planbody-shop">
						<div class="shop-title">
							<span class="bgc_ff">新品推荐</span>
						</div>
						<div class="shop-describe flex_around">							
	<% 
                            List<Product> lstPro = ModelListNEW;
                            if (lstPro != null && lstPro.Count > 0)
                            {
                                foreach (Product model in lstPro)
                                {
                             %>
                             <div class="show-view shop-view-state-a">
							
								<p><%=model.ProductID %></p>
								<p style="height:1.98rem;"><a href="/m_<%=model.ProductID %>.html">
									<img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author %>]</p>
								<p><%=model.ProductName %></p>
								<p>器型：<%=model.Type3%></p>
								<p onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							</div>
							<%}
                            } %>
						</div>
						<div class="shop-controll">
							<button class="load-surplus">再显示3款新品
								<i class="iconfont icon-xiala1"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="bgc_cc">
					<div class="planbody-shop">
						<div class="shop-title">
							<span class="bgc_cc">热门推荐</span>
						</div>
						<div class="shop-describe flex_around">
							<% List<Product> lstProHot = ModelListHOT;
                           if (lstProHot != null && lstProHot.Count > 0)
                           {
                               foreach (Product model in lstProHot)
                               { %>
                               <div class="show-view shop-view-state-a">
							
								<p><%=model.ProductID%></p>
								<p style="height:1.98rem;">
                                    <a href="/m_<%=model.ProductID %>.html">
									    <img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author%>]</p>
								<p><%=model.ProductName%></p>
								<p>器型：<%=model.Type3%></p>
								<p onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							</div>	
                            <%}
                           }%>
						</div>
						<div class="shop-controll">
							<button class="load-surplus">再显示3款新品
								<i class="iconfont icon-xiala1"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="bgc_cc">
					<div class="planbody-shop">
						<div class="shop-title">
							<span class="bgc_cc">大师作品</span>
						</div>
						<div class="shop-describe flex_around">							
							 <% 
                            List<ProductListView> lstDSZPPro = ModelListDSZP;
                            if (lstDSZPPro != null && lstDSZPPro.Count > 0)
                            {
                                foreach (ProductListView model in lstDSZPPro)
                                {
                             %>
							<div class="show-view shop-view-state-a">
								<p><%=model.ProductID %></p>
								<p style="height:1.98rem;"><a href="/m_<%=model.ProductID %>.html" >
									<img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author %>]</p>
								<p><%=model.ProductName %></p>
								<p>器型：<%=model.Type3%></p>
								<p onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							</div>
							<%}
                            } %>	
						</div>
						<div class="shop-controll">
							<button class="load-surplus">再显示3款新品
								<i class="iconfont icon-xiala1"></i>
							</button>
						</div>
					</div>
				</div>
                <div class="bgc_ff">
					<div class="planbody-shop">
						<div class="shop-title">
							<span class="bgc_ff">名家作品</span>
						</div>
						<div class="shop-describe flex_around">							
							<% 
                            List<ProductListView> lstMJZPPro = ModelListMJZP;
                            if (lstMJZPPro != null && lstMJZPPro.Count > 0)
                            {
                                foreach (ProductListView model in lstMJZPPro)
                                {
                             %>
                             <div class="show-view shop-view-state-a">
							
								<p><%=model.ProductID %></p>
								<p style="height:1.98rem;"><a href="/m_<%=model.ProductID %>.html">
									<img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author %>]</p>
								<p><%=model.ProductName %></p>
								<p>器型：<%=model.Type3%></p>
								<p onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							</div>
							<%}
                            } %>
						</div>
						<div class="shop-controll">
								<button class="load-surplus">再显示3款新品
									<i class="iconfont icon-xiala1"></i>
								</button>
						</div>
					</div>
				</div>
				
			</div>
			<!-- star -->
			<div style="height: 0.266rem;" class="bgc_ff"></div>
			<div class="bgc_cc">
				<div class="shop-title" style="width: 6.66rem;margin: 0 auto;margin-bottom: 0.866rem">
					<span style="padding: 0;" class="bgc_cc">
						<i></i>名家名堂
						<i></i>
					</span>
				</div>
				<div id="swiper-container-star" class="swiper-container">
					<div id="swiper-wrapper-star" class="swiper-wrapper">
						
				<%
                        List<Artisan> lstArt = ModelArticleList;
                        if (lstArt != null && lstArt.Count > 0)
                        {
                            foreach (Artisan model in lstArt)
                            { %>
                    	<div class="swiper-slide">
							<a href="/m_art<%=model.artisanID %>.html">
								<%--<img src="<%=model.IDHead %>">--%>
                                <div id="headimg" style="background: url(<%=model.IDHead %>) no-repeat center;background-size: auto 100%;"></div>
								<div class="star-describe">
									<p><%=model.artisanName %> </p>
									<p><%=model.artisanTitle %></p>
								</div>
							</a>
						</div>		
                        <%}
                        }%>	
					</div>
				</div>
				<div class="shop-controll star-controll">
					<button><a href="/m_artisan_list.html">查看更多大师
						<i class="iconfont icon-youjiantou" style="font-size: 0.26rem"></i>
                        </a>
					</button>
				</div>
			</div>
			<!-- 保障 -->
			<div class="planbody-promise bgc_ff">
				<div class="promise">
					<div class="promise-title">八大保障</div>
					<ul class="promise-ul flex_around">
						<li><a href="/mn_fwbz.html" style="color:White">艺人直销</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">一手货源</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">原矿铁胎</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">实物视频</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">实体门店</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">1对1客服</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">赝品赔付</a></li>
						<li><a href="/mn_fwbz.html" style="color:White">15天退换</a></li>
					</ul>
				</div>
			</div>
			<div style="height: 0.266rem;" class="bgc_cc"></div>
			<!-- 门店 -->
			<div id="planbody-promise" class="planbody-promise bgc_ff">
				<div class="promise" id="promise">
					<div class="promise-title">连锁门店</div>
					<div class="planbody-store">
						<div class="store-left">
							<ul class="store-title">
								<li class="initStyle ">
									<span class="initStyle"></span>厦门店</li>
								<li>
									<span></span>武夷山店</li>
								<li>
									<span></span>建阳店</li>
							</ul>
							<div><a style="color:White" href="tel:4008276376">立即预约上门</a></div>
						</div>
						<div class="store-detail">
							<div class="initStyle">
								<p>
									<span style="padding-left: 0.3rem;">客服：</span>
									<span style="width: 4.6rem;">4008-276-376</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">地址：</span>
									<span style="width: 4.6rem;">厦门市思明区台东路66号宝业营运中心705室</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">时间：</span>
									<span style="width: 4.6rem;">
										周一至周日 (9.30-21.30)
										<br> (其他时间请提前联系我们)
									</span>
								</p>
								<p id="swiper-container-stop" class="swiper-container">
									<mdiv id="swiper-wrapper-stop" class="swiper-wrapper">
										
                                        <mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN1.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN2.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN3.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN4.png">
											</a>
										</mdiv>
									</mdiv>
									<mdiv class="swiper-pagination"></mdiv>
								</p>
							</div>
							<div>
								<p>
									<span style="padding-left: 0.3rem;">客服：</span>
									<span style="width: 4.6rem;">4008-276-376</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">地址：</span>
									<span style="width: 4.6rem;">武夷山市金盘亭路水岸花苑第四幢B座</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">时间：</span>
									<span style="width: 4.6rem;">
										周一至周日 (9.30-21.30)
										<br> (其他时间请提前联系我们)
									</span>
								</p>
								<p id="swiper-container-stop" class="swiper-container swiper2">
									<mdiv id="swiper-wrapper-stop" class="swiper-wrapper">
										
                                        <mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN5.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN6.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN7.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN8.png">
											</a>
										</mdiv>
									</mdiv>
									<mdiv class="swiper-pagination"></mdiv>
								</p>
							</div>
							<div>
								<p>
									<span style="padding-left: 0.3rem;">客服：</span>
									<span style="width: 4.6rem;">4008-276-376</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">地址：</span>
									<span style="width: 4.6rem;">南平市建阳区武夷智谷软件园建盏CLUB</span>
								</p>
								<p>
									<span style="padding-left: 0.3rem;">时间：</span>
									<span style="width: 4.6rem;">
										周一至周日 (9.30-21.30)
										<br> (其他时间请提前联系我们)
									</span>
								</p>
								<p id="swiper-container-stop" class="swiper-container swiper3">
									<mdiv id="swiper-wrapper-stop" class="swiper-wrapper">
										
                                        <mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN9.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN10.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN11.png">
											</a>
										</mdiv>
										<mdiv class="swiper-slide">
											<a href="javascript:;">
												<img src="/m_images/lunN12.png">
											</a>
										</mdiv>
									</mdiv>
									<mdiv class="swiper-pagination"></mdiv>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 通用底部元素 片段截取 -->
			<uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
		</div>
		<form id="form1" runat="server">
		<uc1:mn_footer ID="mn_footer1" runat="server" />    
        </form>

		
		<!-- 筛选 -->
		
		<div id="menupart" style="display: none;left:200%;">
        <uc2:mn_menuplane ID="mn_menuplane1" runat="server" />
			
		</div>
	</div>
    <div id='menumark' style="display: none"></div>
</body>

</html>
<script>
      $("#btnSearch").bind("click", function (e) {
            var keyword = $("#keyword").val();
            window.location.href = "mn_shop.aspx?keyword=" + keyword;
        });
    
// 点击在线客服
	$('#zaixian').click(function () {
		$(".footer").animate({ bottom: '0rem' }, "slow", function () {
				$("#menumark").css("display", "none");
				$("#ksplane").css("display", "none");
			});
			iskuaishu = false;
	})


    $("#menumark").click(function(){
        $("#menupart").animate({ left: '100%' }, "slow", function () {
			$(this).css("display", "none");
			$("#menumark").css("display", "none");
		});
    })
    var ismenu;
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
		if (ismenu) {//8.4
			moveRight();
		}
	})

    function moveLeft() {
		ismenu = true;
		// console.log("dhgsfhjsgdghj");
		$('#menupart').css("display", "block");
		$("#menumark").css("display", "block");
		$("#menupart").animate({ left: '20%' }, "slow");//8.4
	}

	// 点击展开列表
	$('.load-surplus').click(function () {
		// console.log($(this).parent().parent().children().eq(1))
		$(this).parent().parent().children().eq(1).height('auto');
		$(this).html('<a href="/m_product_list.html">查看更多产品</a>');
	})

	var tabindex = 0;
	var iskuaishu = false;
	var iszaixian = false;
	//顶部banner设置
	var mySwiper = new Swiper('#swiper-container-banner', {
		direction: 'horizontal',
		loop: true,
		autoplay: {
			disableOnInteraction: false,
			delay: 5000,

		},
		// 如果需要分页器
		pagination: {
			el: '.swiper-pagination',
		}
	})
	var mySwiper1 = new Swiper('#swiper-container-stop', {
		direction: 'horizontal',
		loop: true,
		autoplay: {
			disableOnInteraction: false,
			delay: 5000,
		},
		pagination: {
			el: '.swiper-pagination',
		}
		// observer: true,//修改swiper自己或子元素时，自动初始化swiper
		// observeParents: true//修改swiper的父元素时，自动初始化swiper
		// 如果需要分页器

	})
	var mySwiper2 = new Swiper('.swiper2', {
		direction: 'horizontal',
		loop: true,
		autoplay: {
			disableOnInteraction: false,
			delay: 5000,

		},
		pagination: {
			el: '.swiper-pagination',
		}
		// observer: true,//修改swiper自己或子元素时，自动初始化swiper
		// observeParents: true//修改swiper的父元素时，自动初始化swiper
		// 如果需要分页器

	})
	var mySwiper3 = new Swiper('.swiper3', {
		direction: 'horizontal',
		loop: true,
		autoplay: {
			disableOnInteraction: false,
			delay: 5000,
		},
		pagination: {
			el: '.swiper-pagination',
		}
		// observer: true,//修改swiper自己或子元素时，自动初始化swiper
		// observeParents: true//修改swiper的父元素时，自动初始化swiper
		// 如果需要分页器

	})

	// 名家名堂 滚动面板的配置
	var mySwiper = new Swiper('#swiper-container-star', {
		loop: true,
		autoplay: {
			disableOnInteraction: false,
			delay: 5000,

		},
		effect: 'coverflow',
		grabCursor: true,
		centeredSlides: true,
		slidesPerView: '3',
		coverflowEffect: {
			rotate: 50,
			stretch: 0,
			depth: 100,
			modifier: 1,
			slideShadows: true,
		}
	})
	//门店切换
	$('.store-title').children().each(function (index, node) {
		$(this).click(function () {
			$('.store-title').children().eq(tabindex).removeClass('initStyle');
			$('.store-title').children().eq(tabindex).children().eq(0).removeClass('initStyle');
			$('.store-detail').children().eq(tabindex).removeClass('initStyle');
			tabindex = index;
			$('.store-detail').children().eq(tabindex).addClass('initStyle');
			$(this).addClass('initStyle');
			$(this).children().eq(0).addClass('initStyle');
			// mySwiper1.update(true);
			index == 0 ? mySwiper1.update(true) : index == 1 ? mySwiper2.update(true) : mySwiper3.update(true)

		})
	})
	// 隐藏分类面板
	function moveRight() {
		console.log("dhgsfhjsgdghj");
		$("#menupart").animate({ left: '100%' }, "slow", function () {
			$(this).css("display", "none");
			$("#menumark").css("display", "none");
		});
	}


	// 拨号面板取消按钮事件
	function cancle() {
		$('#lexian').hide()
	}
	//弹出拨打电话面板
	function showLeXian() {
		$('#lexian').show()
	}
	// 返回顶部
	var backButton = $('.totop');
	function backToTop() {
		$('.planbody').animate({
			scrollTop: 0
		}, 800);
	}
	backButton.on('click', backToTop);

	$(".planbody").on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */
		if ($(".planbody").scrollTop() > $(".planbody").height())
			backButton.fadeIn();
		else
			backButton.fadeOut();
	});
	$(".planbody").trigger('scroll');
</script>