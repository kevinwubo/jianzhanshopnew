<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_famousdetail.aspx.cs" Inherits="DTcms.Web.mn_famousdetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<html>

<head>
     <% List<Artisan> lstArtA = ModelArtisanList;
    foreach (Artisan model in lstArtA)
    {
         %>
<title>建盏名家大师【<%=model.artisanName %>】 - 建盏天下网</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,建盏老师,<%=model.artisanName %>,建盏品牌" />
<meta name="Description" content="【<%=model.artisanName %>】<%=NoHTML(model.introduction) %>" />
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
    <link rel="stylesheet" type="text/css" href="project/Public/page/css/famous.css" />
    <link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
    <script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
    <script type="text/javascript" src="project/Public/base/js/core.js"></script>
    <!-- <script type="text/javascript" src="project/Public/page/js/famous_detail.js"></script> -->
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
                    名家名堂
                </div>
                <div class="head-p-sides head-p-sides-side" onclick="moveLeft()">
                    <img src="project/Public/image/side.png">
                </div>
            </div>
        </div>
        <div class="planbody bgc_cc">
        <% List<Artisan> lstArt = ModelArtisanList;
                        foreach (Artisan model in lstArt)
                        { %>
            <!-- 关于我们-导航栏-->
            <div id="list">
                <div id="item">
                    
                    <div class="flex-row">
                        <div class="item-div">
                            <img class="imghead" src="<%=model.IDHead %>" />
                        </div>
                        <div class="flex-col" style="position: relative;">
                            <div class="title"><%=model.artisanName %></div>
                            <div class="desc"><%=model.artisanTitle %></div>
                            <img class="xiala"  onclick="showcontent()" style="position: absolute;right: 0.4rem;bottom: 0.4rem; display: none" src="project/Public/image/famous-down.png" />
                        </div>
                    </div>
                    <div class="pro-plane">
                        <div class="part">
                            <div class="desc-title">个人介绍</div>
                            <div class="desc-content">
                                <%=model.DetailedIntroduction%>
                            </div>
                        </div>
                       
                    </div>
                    <div class="hidden-btn" onclick="hideconten()">
                        <img src="project/Public/image/shouqi.png" />
                    </div>
                    
                </div>
            </div>
            <!-- 商品展示 -->
            <!-- <div style="height: 0.266rem;" class="bgc_cc"></div> -->
            <div id="planbody-shop-box" class="planbody-shop-box">
                <div class="bgc_ff">
                    <div class="planbody-shop">
                        <div class="shop-title">
                            <span class="bgc_ff">名家作品</span>
                        </div>
                        <div class="shop-describe flex_around">
                         <%
                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'",0);
                        foreach (Product modelPro in lstPro)
                        {%>
                        <div class="show-view shop-view-state-a">
								<p><%=modelPro.ProductID%></p>
								<p style="height:1.98rem;"><a href="m_<%=modelPro.ProductID %>.html" >
									<img class="list-item-img" src="<%=modelPro.Images %>">
                                    </a>
								</p>
								<p>[<%=modelPro.Author%>]</p>
								<p><%=modelPro.ProductName%></p>
								<p>器型：<%=modelPro.Type3%></p>
								<p onclick="xunjia('<%=modelPro.ProductName %>')">
									<span></span>
									<button class="shop-query">立即询价</button>
								</p>
							</div>

                    <%} %>
      
                        </div>
                        <div class="shop-controll">
                            <button class="load-surplus">显示所有产品
                                <i class="iconfont icon-xiala1"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
            <div style="height: 0.266rem;" class="bgc_cc"></div>
            <!-- 通用底部元素 片段截取 -->
            <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
        </div>
        <form id="form1" runat="server">
		    <uc1:mn_footer ID="mn_footer1" runat="server" />
        </form>
         <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane ID="menuplane1" runat="server" />
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

        // 点击展开列表
        $('.load-surplus').click(function () {
            // console.log($(this).parent().parent().children().eq(1))
            $(this).parent().parent().children().eq(1).height('auto');
            $(this).html('<a href="m_school.html">查看更多产品</a>');
        })
        function hideconten() {
            $(".pro-plane").hide()
            $(".hidden-btn").hide()
            $(".xiala").show();
        }
        function showcontent() {
            $(".xiala").hide();
            $(".pro-plane").show()
            $(".hidden-btn").show()
        }

        // $('#planbody-foot_box').load('./bass.html #planbody-foot')
        </script>
</body>

</html>
