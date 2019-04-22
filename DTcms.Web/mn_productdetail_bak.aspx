<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_productdetail_bak.aspx.cs" Inherits="DTcms.Web.mn_productdetail_bak" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
     <% 
     List<Product> listProA=productModelList;
     foreach (Product model in listProA)
     { %>
<title>【<%=model.Author %>】<%=model.ProductName %>—建盏天下</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,<%=model.Author %>,<%=model.Type2 %>,<%=model.Type3 %>,<%=model.MarketPrice %>" />
<meta name="Description" content="【<%=model.Author %>】<%=model.ProductName %>,<%=model.Volume %><%=NoHTML(model.summary) %>" />
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
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/detail.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
    <%--<script type="text/javascript" src="project/Public/base/js/core.js"></script>
    <script type="text/javascript" src="project/Public/page/js/detail.js"></script>--%>
    <style type="text/css">
        #swiper-container-banner {
            width: 100%;
            height: 6.5rem;
        }

        .swiper-container-horizontal>.swiper-pagination-bullets,
        .swiper-pagination-custom,
        .swiper-pagination-fraction {
            bottom: 30px;
        }

        .swiper-pagination-bullet-active {
            opacity: 1 !important;
            background: #cc3333 !important;
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

        .swiper-pagination-bullet {
            width: 0.3rem;
            height: 0.3rem;
            display: inline-block;
            border-radius: 100%;
            background: #000;
            opacity: .4;
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
       .detailcontent img {
            width: 100%;
        }
    </style>
</head>

<body>
    <div id="app">
        <div  class="header bgc_c3">
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
							
						</a>
					</div>
				</div>
                <div class="head-title">
                    作品详情
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
                     <% List<string> strLst = productModelList != null && productModelList.Count > 0 ? productModelList[0].lstImages : null;
                         if(strLst!=null)
                         {
                             for (int i = 0; i < strLst.Count; i++)
                             {
                        %>
						<div class="swiper-slide">
							<a href="javascript:;">
								<%=strLst[i] %>
							</a>
						</div>
						<%}
                         } %>
                    

                         <%--<div class="swiper-slide">
							<a href="javascript:;">
								<img alt="销售二维码" id="salesImage" src="/upload/201808/17/201808171349190002.jpg" width="200" height="235" />
							</a>
						</div>
                        <script type="text/javascript" language="javascript">
                            $.post("ajax/wxcode.aspx", function (result) {
                                jQuery("#salesImage").attr("src", "/upload/salesimage/" + result + ".jpg");
                            });
                        </script>--%>
					</div>
					<!-- 分页器 -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
            <!-- 内容询价 -->
            <div class="infoplane" style="margin-top:0.3rem">
             <% 
             List<Product> listPro=productModelList;
             foreach (Product model in listPro)
             { %>
                <div class="flex-row info-title">
                    <div class="flex-col"><strong><%=model.ProductName %></strong></div>
                    <div class="flex-col red-word">编号：<%=model.ProductID %></div>
                </div>
                <div class="flex-row auther-info">
                    <div class="flex-col" style="flex: 0.6;-webkit-box-flex: 0.6;">
                        <div class="text"><strong>作者：<%=model.Author %></strong></div>
                        <div class="text"><strong>尺寸：<%=model.Volume%></strong></div>
                    </div>
                    <div class="flex-col"  style="flex: 0.8;-webkit-box-flex: 0.6;">
                        <div class="text"><strong>釉色：<%=model.Type2 %></strong></div>
                        <div class="text"><strong>器形：<%=model.Type3 %></strong></div>
                    </div>
                    <div style="line-height: 2rem;margin-right: 0.3rem;">
                        <img onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')" style="vertical-align: middle;width: 3rem;margin-top: 0.4rem;" src='project/Public/image/xunwen.png' />
                    </div>
                </div>
   <%--             <div class="infoplane-foot-part">
                   
                </div>--%>
                <div id="detailcontent" style="margin-top: 0.3rem; width: 93%; line-height: 0.5rem; font-size: 0.42rem !important;margin: 0 0.3rem;">    
                 <%=model.summary.Replace("16pt", "20pt").Replace("900","730")%>             
                    <%=model.ProImageDetail%>
                </div>
                <%} %>
            </div>
            <!-- 通用底部元素 片段截取 -->
            <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
        </div>

           <form id="form1" runat="server">
		    <uc1:mn_footer ID="mn_footer1" runat="server" />
        </form>
        <%--<uc2:mn_menuplane  ID="mn_menuplane1" runat="server"/>--%>
        <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane  ID="mn_menuplane1" runat="server"/>			
		</div>
    </div>
        	<!-- 筛选 -->
	<div id='menumark' style="display: none"></div>
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
</script>
</body>

</html>