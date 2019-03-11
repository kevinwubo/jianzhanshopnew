<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_collection.html.cs" Inherits="DTcms.Web.mn_house" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<html>
<head>
	<title>建盏精品收藏馆 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,老盏,建盏孤品,建盏精品,建盏收藏" />
<meta name="description" content="建盏精品收藏馆汇集了一线大师名家直供的第一手精品建盏：获奖建盏、各大博物馆收藏建盏、拍卖精品、孤品建盏、专利建盏，曜变盏，老盏等价格、收藏、名家押窑和私人定制服务。" />
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
	<link rel="stylesheet" type="text/css" href="project/Public/base/css/swiper-4.3.3.min.css" />
	<link rel="stylesheet" type="text/css" href="project/Public/page/css/house.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/index.css" />
	<link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
	<script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
	<script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
	<%--<script type="text/javascript" src="project/Public/base/js/core.js"></script>
	<script type="text/javascript" src="project/Public/page/js/house.js"></script>--%>
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
		#swiper-container-banner a{
			display: inline-block;
			width: 100%;
			height: 100%;
		}
		#swiper-container-banner a img{
			width: 100%;
			height: 100%;
		}
	</style>
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

		.swiper-container-stop {
			width: 100%;
			padding: 0.4rem 0;
			height: 4.5rem;
		}

		.swiper-container-stop a {
			display: inline-block;
			width: 100%;
			height: 100%;
		}

		.swiper-container-stop a img {
			width: 100%;
			height: 100%;
		}
		.shop-describe {
            width: 100%;
            height: auto;
            overflow: hidden;
            font-size: 0;
            transition: 1s;
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
          收藏阁
		  </div>
			<div class="head-p-sides head-p-sides-side" onclick="moveLeft()">
				<img src="project/Public/image/side.png">
			</div>
		</div>
	</div>
	<div class="planbody bgc_cc">
		<!-- banner -->		
			<div>
				<div id="swiper-container-banner" class="swiper-container">
					<div id="swiper-wrapper-banner" class="swiper-wrapper">
						<div class="swiper-slide">
							<a href="javascript:;">
								<img src="m_images/shouchangge.jpg">
							</a>
						</div>
						<%--<div class="swiper-slide">
							<a href="javascript:;">
								<img src="m_images/lun2.jpg">
							</a>
						</div>
						<div class="swiper-slide">
							<a href="javascript:;">
								<img src="m_images/lun3.jpg">
							</a>
						</div>
						<div class="swiper-slide">
							<a href="javascript:;">
								<img src="m_images/lun4.jpg">
							</a>
						</div>--%>
					</div>
					<!-- 分页器 -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
            <!-- 商品展示 -->
        <div id="planbody-shop-box" class="planbody-shop-box">
           <div class="bgc_ff">
            <div class="planbody-shop"> 
             <div class="shop-title"> 
              <span class="bgc_ff">馆藏精品</span> 
             </div>
             <div class="shop-describe flex_around">
             <% List<Product> lstpro = ModelProList;
                foreach (Product model in lstpro)
                { %>
                  <div class="show-view shop-view-state-a"> 
                  
                    <p><%=model.ProductID %></p>
					<p style="height:1.98rem;"><a href="m_<%=model.ProductID %>.html">
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
                  <%} %>            
             </div>
 <%--            <div class="shop-controll"> 
              <button class="load-surplus">查看所有产品<i class="iconfont icon-xiala1"></i></button> 
             </div>--%>
            </div>
           </div>
          </div>
          		<div style="background: #fff;width: 100%;">
				<ul class="page" id="page"style="padding:0.3rem">
                    <div id="PageContent" runat="server"  style="margin: auto;width: 9rem;font-size: 0.3rem" class="default"></div>
                </ul>
			</div>
		<!-- 商品展示 -->
		<!-- <div style="height: 0.266rem;" class="bgc_cc"></div> -->
		
		<div style="height: 0.266rem;" class="bgc_cc"></div>
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
        <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane ID="menuplane1" runat="server" />
        </div>
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

//    $('.load-surplus').click(function () {
//        // console.log($(this).parent().parent().children().eq(1))
//        $(this).parent().parent().children().eq(1).height('auto');
//        $(this).html('<a href="mn_shop.aspx">查看更多产品</a>');
//    })
</script>


<script>

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
	//顶部banner设置
//	var mySwiper = new Swiper('#swiper-container-banner', {
//		direction: 'horizontal',
//		loop: true,
//		autoplay: {
//			disableOnInteraction: false,
//			delay: 5000,

//		},
//		// 如果需要分页器
//		pagination: {
//			el: '.swiper-pagination',
//		}
//	})
	mySwiperstop1 = new Swiper('#swiper-container-stop1', {
		direction: 'horizontal',
		loop: false,
		// autoplay: {
		// 	disableOnInteraction: false,
		// 	delay: 3000,
		// },
		// 如果需要分页器
	})
	mySwiperstop2 = new Swiper('#swiper-container-stop2', {
		direction: 'horizontal',
		loop: false,
		// autoplay: {
		// 	// disableOnInteraction: false,
		// 	delay: 3000,
		// },
		// 如果需要分页器
	})
	mySwiperstop3 = new Swiper('#swiper-container-stop3', {
		direction: 'horizontal',
		loop: false,
		// autoplay: {
		// 	// disableOnInteraction: false,
		// 	delay: 3000,
		// },
		// 如果需要分页器
	})
</script>