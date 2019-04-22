<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_collection.html.cs" Inherits="DTcms.Web.mn_house" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<%@ Register src="UserControl/mn_footer_new.ascx" tagname="mn_footer_new" tagprefix="uc4" %>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    	<title>建盏精品收藏馆 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,老盏,建盏孤品,建盏精品,建盏收藏" />
<meta name="description" content="建盏精品收藏馆汇集了一线大师名家直供的第一手精品建盏：获奖建盏、各大博物馆收藏建盏、拍卖精品、孤品建盏、专利建盏，曜变盏，老盏等价格、收藏、名家押窑和私人定制服务。" />
    <link rel="stylesheet" href="../static/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css" type="text/css">
    <%--<link rel="stylesheet" href="../static/css/pagination.css" type="text/css">--%>
    <link rel="stylesheet" href="../static/css/pagination.css" type="text/css">
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .color_red_c9 {
            color: #c90319;
        }

        .ssbtn {
            width: 1rem;
            background: #c90319;
            color: white;
            height: .56rem;
            line-height: .56rem;
            text-align: center;
            border-radius: 0 3px 3px 0;
        }

        .search {
            background: #f7f7f7;
            height: 0.56rem;
            border-radius: 3px;
        }

        .ssbtnzx {
            width: 2rem;
            background: #c90319;
            color: white;
            height: .7rem;
            line-height: .7rem;
            text-align: center;
            border-radius: 0 3px 3px 0;
        }

        .searchzx {
            background: #f7f7f7;
            height: 0.7rem;
            border-radius: 3px;
        }

        .banner {
            overflow: hidden;
            border-radius: 5px;
            margin: .256rem;
        }

        .banner img {
            width: 100%;
        }

        .part1 {
            background: white;
            padding: 0.256rem;
            border-top: .1rem solid #f7f7f7;
        }

        .list {
            overflow: hidden;
            height: 7rem;
            position: relative;
        }

        .list .item {
            text-align: center;
            width: 33.3%;
            float: left;
            height: 3.3rem;
            margin-top: .2rem
        }

        .list .item .t1 {
            margin-top: .2rem;
            font-size: .18rem;
        }

        .list .item .pimg {
            height: 1.4rem;
            margin-top: .1rem;
            width: 100%;
            background-size: 128% !important;
            background-position: center !important;
        }

        .bt-zx {
            margin-top: .2rem;
            width: 1.34rem;
            height: .5rem;
        }
        /* 大师推荐 */
        .list1 {
            overflow: hidden;
            height: 14.1rem;
            position: relative;
        }

        .list1 .item1 {
            text-align: center;
            width: 50%;
            float: left;
            height: 4.5rem;
            margin-top: .2rem
        }

        .list1 .item1 .t1 {
            margin-top: .2rem;
            font-size: .18rem;
        }

        .list1 .item1 .pimg {
            height: 2.5rem;
            /* margin-top: .1rem; */
            width: 100%;
            background-size: 128% !important;
            background-position: center !important;
        }
        .swiper_container_suz2 {
            width: 100%;
            /* padding-left:3%; */
            height: 4.2rem;
            overflow: hidden;
            position: relative;
            background: white;
        }

        .swiper_container_suz2 .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            line-height: 1.3rem;
            height: 4.2rem;
            margin-top: 0rem;
            position: relative;
            /*-webkit-transform:scale(0.8);*/
        }
        .swiper_container_suz2 .swiper-slide img {
            width: 100%;
            height:auto;
            display: block;
        }
        /* 名家 */
    
		#swiper-container-star {
			width: 100%;
			height: 3.6rem;
		}

		#swiper-container-star a {
			display: inline-block;
			width: 100%;
			height: 100%;
		}

		#swiper-container-star a img {
			width: 100%;
			height: 2.6rem;
		}
		#swiper-container-star a #headimg {
			width: 100%;
			height: 2.6rem;
		}

		.star-describe {
			width: 100%;
			height: 1rem;
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

		.store{
            margin-top: .35rem;
            height: auto;
            border: 1px solid #ccc;
            background: #f7f7f7;
            border-radius: 5px;
        }
        #menupart {
			height: 100%;
			width: 80%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 99;
		}

        #menumark{
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left:0;
            background: rgba(99, 99, 99, 0.5);
            z-index: 98;
        }
        #menupart .menu-body{
            position: absolute;
            right: 0;
            top: 0;
            background: #fff;
            width: 100%;
            height: 100%;
            overflow: auto;
            padding-top: 1.2rem;
            padding-bottom: 1.06rem;
            box-sizing: border-box;
            padding-left: .2rem;
            padding-right: .2rem;
        }
        .menu-cate-part{
            width: 100%;
            position: relative;
            text-align: center;
        }
        .menu-cate-title{
            height: .7rem;
            position: relative;
            line-height: .7rem;
            font-size: 0.24rem;
            background: white;
            margin: auto;
            width: 1.5rem;
            z-index: 1;
        }
        .cate-list{
            background: #fff;
            overflow: hidden;
        }
        .cate-list .item{
        float: left;
        width: 33.3%;
        }
        .cate-list .item div{
            height: 0.6rem;
            line-height: 0.6rem;
            text-align: center;
            font-size: 0.22rem;
            color: #666;
            margin: .15rem;
            background: #f6f6f6;
        }
        .back-tag {
    border-top: 1px solid #c90319;
    border-left: 1px solid #c90319;
    height: 0.15rem;
    width: 0.15rem;
    float: right;
    margin: .15rem .15rem;
    transform: rotate(315deg);
    -o-transform: rotate(315deg);
    -webkit-transform: rotate(315deg);
    -moz-transform: rotate(315deg);
}
        .line{
    width: 100%;
    height: 1px;
    background: #f0f0f0;
    position: absolute;
    top: 16px;
}
        .w_50{
    width: 50% !important;
}
        .tk-mark {
            position: fixed;
            height: 100%;
            width: 100%;
            background: rgba(0, 0, 0, 0.3);
            top: 0;
            left: 0;
            z-index: 9999;
        }

        /*说明*/
        .tk-mark .kuang {
            position: absolute;
            height: 5.6rem;
            background: white;
            bottom: 0;
            width: 100%;
        }

        /*购买弹款*/
        .tk-mark .gmkuang {
            padding: 0.34rem 0 0;
            position: absolute;
            /*height: 6rem;*/
            background: white;
            bottom: 0;
            width: 100%;
        }
        .px22{
            font-size: .22rem
        }
        .totop {
            position: fixed;
            height: auto;
            z-index: 99999;
            top: 8rem;
            right: 0.4rem;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
    <header>
        <div class="flex-row college-hd">
            <div class="back" href="javascript:window.history.back()">
                返回
            </div>
            <div class="txt px36">收藏阁</div>
            <div class="menu">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <!-- <div style="height:1rem"></div> -->
    <div class="banner">
        <img src="../static/images/jianzhan/banner.png" alt="" />
    </div>

    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">每日严选</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="list">
        <% List<Product> lstpro = ModelProList;
           foreach (Product model in lstpro)
           { %>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:<%=model.ProductID %></div>
                    <div class="pimg" style="background:url(<%=model.Images %>)"></div>
                </div>
                <div class="t1 clamp1">【<%=model.Author %>】<%=model.ProductName %></div>
                <img class="bt-zx"  onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <%} %>
        </div>

                <!--分页-->
      <div class="div-h-3"></div>
        <div class="flex-row M-box m-style" style="justify-content: center">
        <div id="PageContent" runat="server" ></div></div>
        <div class="div-h-8"></div>
    </div>
<%--    <div style="text-align: center; padding: .4rem" class="showmore">
        <div class="color_red_c9 px28">展示更多</div>
        <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
    </div>--%>
  
    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">连锁门店</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="store">
            <div style="height:auto;padding: .4rem .3rem 0">
                <div class="px24 color_57">客服：4008-276-376</div>
                <div class="px24 color_57 mar-t-20" style="line-height:.4rem">地址：厦门市思明区台东路66号宝业营运中心705室 </div>
                <div class="px24 color_57 mar-t-20">时间：周一至周日（9.30-18.3 </div>
                <div class="px24 color_57 mar-t-20">（其他时间请提前联系我们）</div>
            </div>
            <img style="padding: 4%;width: 92%;" class="" src="../static//images/jianzhan/banner1.png" />
        </div>
        <div class="flex-row mar-t-40">
            <div class="flex-col"></div>
            <div class="px32" style="border-radius: 5px;background: #c90319;color:white;padding:.16rem .33rem">厦门店</div>
            <div class="flex-col"></div>
        </div>
    </div>
    <div style="background: #f7f7f7;padding: .5rem .6rem">
        <div class="flex-row" style="text-align:center">
            <img style="width:1.5rem;height:1.5rem;margin-left: .3rem" src="../static//images/jianzhan/ic_code.png" />
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
        <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center">闽ICP备17006498号-1 Copyright 2015 建盏天下网 版权所有</div>
        <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center"> 福建省盏天下电子商务有限公司</div>
    </div>
    <uc2:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />
        <uc4:mn_footer_new ID="mn_footer_new1" runat="server" />

   
    <div class="totop" style="display: block;">
        <img style="height:.8rem;width:.8rem" src="../static/images/jianzhan/to_top.png">
    </div>
    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <script src="../static/js/jquery.pagination.js"></script>
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script src="../static/js/swiper.js"></script>
    <script>
        $('.M-box').pagination({
            mode: 'fixed'
        });
        function hideTiXing() {
            $('#tixing').hide()
            utils.toggleBody(0)
        }

        function showTiXing() {
            utils.toggleBody(1)
            $('#tixing').show()
        }

        var swiper = new Swiper('.swiper_container_suz2', {
            slidesPerView: 1.5,
            spaceBetween: 10,
            // centeredSlides: true,
            paginationType: 'fraction',
            // autoplay: 5000,
        });
        // $("#content").css("height", window.innerHeight - 0.83 * 58);
        $('#showMark1').on('click', function () {
            if ($('#mark1').css('display') == 'none') {
                utils.toggleBody(1)  //在跳出弹窗的时候
                $('#mark1').show()
            }
        })
        $('#close').on('click', function () {
            $('#mark1').hide()
            utils.toggleBody(0)
        })
        $('.showmore').on('click', function () {
            $(this).parent().find('.list').css('height', 'unset')
            $(this).hide()
        })

        // <!-- 名家 -->
        // 名家名堂 滚动面板的配置
        var mySwiper = new Swiper('#swiper-container-star', {
            loop: true,
            autoplay: 3000,
            effect: 'coverflow',
            speed: 500,
            grabCursor: true,
            centeredSlides: true,
            slidesPerView: '3',
            coverflowEffect: {
                rotate: 50,
                stretch: 0,
                depth: 50,
                modifier: 1,
                slideShadows: true,
            }
        })

       
        // 返回顶部
        var backButton = $('.totop');
        function backToTop() {
            // $(window).animate({
            // 	pageYOffset: 0
            // }, 800);
            window.scrollTo(0, 0)
        }
        backButton.on('click', backToTop);

        $(window).on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */
            if ($(window).scrollTop() > $(window).height())
                backButton.fadeIn();
            else
                backButton.fadeOut();
        });
        $(window).trigger('scroll');

    </script>
    
    </form>
</body>

</html>