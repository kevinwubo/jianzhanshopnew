<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_index.aspx.cs" Inherits="DTcms.Web.mpage.mn_index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta content="小匠专场拍卖" http-equiv="keywords">
    <meta name="description" content="小匠专场拍卖">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../static/css/1905_jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="../static/css/1905_base_1_30.css" type="text/css">

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
            margin: 0rem .256rem;
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
            font-size: .22rem;
        }

        .list .item .pimg {
            height: 1.4rem;
            margin-top: .1rem;
            width: 100%;
            background-size: 100% !important;
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
            background-size: 100% !important;
            background-position: center !important;
        }
        
        .swiper_container_suz2 {
            width: 100%;
            /* padding-left:3%; */
            height: 2.94rem;
            overflow: hidden;
            position: relative;
            background: #fff;
        }
        .swiper_container_suz2 .swiper-slide:last-child img{
            border-right:.06rem solid #000;
            width: 5.27rem;
        }
        .swiper_container_suz2 .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            line-height: 1.3rem;
            height: 2.8rem;
            margin-top: 0rem;
            position: relative;
            /* border-top: 3px solid #000;
            border-bottom: 3px solid #000;
            border-left: 3px solid #000; */
            /*-webkit-transform:scale(0.8);*/
        }
        .swiper_container_suz2 .swiper-slide img {
            width: 5.36rem;
            height: 100%;
            display: block;
            border-top: 3px solid #000;
            border-bottom: 3px solid #000;
            border-left: .06rem solid #000;
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
            border-radius: 15px;
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
            border: 1px solid #e6e6e6;
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
       
        .px22{
            font-size: .22rem
        }
        .totop {
            position: fixed;
            height: auto;
            z-index: 99999;
            top: 8.5rem;
            right: 0.4rem;
        }
        .swiper-container {
            width: 5.32rem;
            height: 3.26rem;
        } 
        /*包裹自定义分页器的div的位置等CSS样式*/
        .swiper-pagination-custom {
         bottom: .3rem
        }
        /*自定义分页器的样式，这个你自己想要什么样子自己写*/
        .swiper-custom {
            width: .1rem;
            height: .1rem;
            display: inline-block;
            background: #666;
            opacity: .3;
            margin: 0 5px;
            border-radius: 50%;
            margin: 0 .3rem
        }
        /*自定义分页器激活时的样式表现*/
        .swiper-custom-active {
            opacity: 1;
            width: 1.2rem;
            background-color: #F78E00;
        }
        /* 名家名堂 */
        .mj-item:nth-child(2n+1){
            margin-left: .0rem;
        }
        .mj-item{
            height: 2.8rem;
            /* width: 3.39rem; */
            width: 48.5%;
            margin-left: .2rem;
            margin-bottom: .2rem;
            float:left;
            background: #F8F8F8
        }
        .mj-item img{
            display: block;
           width: 100%;
           height:1.9rem;
        }
        .mj-item .t1{
            margin-top: .2rem;
            font-size:.22rem;
            font-family:SourceHanSansCN-Normal;
            font-weight:400;
            color:rgba(38,38,38,1);
            line-height:.22rem;
            height:.22rem;
            margin-left: .15rem
        }
        .mj-item .t2{
            margin-top: .11rem;
            height:.16rem;
            font-size:.16rem;
            font-family:SourceHanSansCN-Light;
            font-weight:300;
            color:rgba(115,115,115,1);
            line-height:.16rem;
            margin-left: .15rem
        } 
        /* 器形 | 釉色 */
        .qxys-item:nth-child(2n+1){
            margin-left: .0rem;
        }
        .qxys-item{
            height: 1.19rem;
            width: 48.5%;
            margin-left: .2rem;
            margin-bottom: .2rem;
            float:left;
            background: #F8F8F8
        }
        .qxys-item img{
            display: block;
           width: 1.77rem;
           height:1.19rem;
        }
        .qxys-item .t1{
            margin-top: .14rem;
            font-size:.2rem;
            font-family:SourceHanSansCN-Normal;
            font-weight:400;
            color:rgba(38,38,38,1);
            line-height:.2rem;
            height:.2rem;
            margin-left: .03rem;
        }
        .qxys-item .t2{
            margin-top: .08rem;
            font-size:.16rem;
            font-family:SourceHanSansCN-Light;
            font-weight:300;
            color:rgba(115,115,115,1);
            line-height:.2rem;
            margin-left: .15rem;
            margin-right: .1rem;
        }   
        .qxys-item .t3{
            margin-right: .15rem;
            height:.16rem;
            font-size:.16rem;
            font-family:SourceHanSansCN-Light;
            font-weight:300;
            color:rgba(150,8,27,1);
            line-height:.24rem;
            text-align: right
        } 
         /* 大师推荐 */
         .ds-list {
            overflow: hidden;
            height: 8.6rem;
            position: relative;
        }
        .ds-list .ds-item:nth-child(2n+1){
            margin-left: .0rem;
        }
        .ds-list .ds-item {
            text-align: center;
            /* width: 3.39rem; */
            width: 48.5%;
            float: left;
            height: 3.97rem;
            margin-left: .2rem;
            margin-top: .2rem;
            background: #f0f0f0;
        }

        .ds-list .ds-item  .t1 {
            height:.2rem;
            font-size:.2rem;
            line-height: .22rem;
            font-family:SourceHanSansCN-Light;
            margin-left: -.1rem;
            text-align: left;
            color:rgba(38,38,38,1);
        }
        .ds-list .ds-item  .t2 {
            height:.17rem;
            text-align: left;
            font-size:.15rem;
            font-family:SourceHanSansCN-Normal;
            color:rgba(153,153,153,1);
        }

        .ds-list .ds-item  .pimg {
            height: 2.56rem;
            /* margin-top: .1rem; */
            width: 100%;
            background-size: 100% !important;
            background-position: center !important;
        }     
        .ds-list .ds-item .bt-zx  {
            margin-top: 0;
            height: .32rem;
            width: .92rem;
            border-radius: 5px;
        }
        .swiper-button-next, .swiper-container-rtl .swiper-button-prev {
        background-image: url(../static/images/jianzhan_0509/right.png);
        right: 0px;
        left: auto;
        }
        .swiper-button-prev, .swiper-container-rtl .swiper-button-next {
        background-image: url(../static/images/jianzhan_0509/left.png);
        left: 0px;
        right: auto;
        }
        .lsmd-bg{
            position: relative;
            background:#fbfbfb;
            margin-top: .3rem
        }
        .ic_52{
            width: .52rem;
            height: .52rem;
        }
        .dp-t1{
            font-size: .28rem;
            color: #999
        }
        .dpact{
            color: #B32B2B
        }
    </style>
</head>

<body>

    <div class="flex-row bg_color_f navheight" style="align-items: center;max-width: 750px;">
        <div class="flex-row pad-l-30" style="align-items: center">
            <img class="mar-r-16" style="width: .5rem" src="../static/images/jianzhan/logo.png" />
        </div>
        <div class="flex-col search">

            <div class="flex-row" style="align-items: center;height: .56rem">

                <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                    alt="">
                <input style="background: #f7f7f7" class="px24" type="text" placeholder="大师或者编号" />
            </div>
        </div>
        <div class="ssbtn px24 mar-r-30">搜索</div>
    </div>
    <!-- <div style="height:1rem"></div> -->
    <div class="banner">
        <img src="../static/images/jianzhan/banner.png" alt="" />
    </div>

    <div class="flex-row pad-l-30 pad-r-30 pad-t-40 pad-b-40" style="text-align: center;align-items: center;">
        <a href="../jianzhan/storePage.html" class="flex-col">
            <img style="height: 1.2rem;
            width: .7rem;" src="../static/images/jianzhan/sc.png" alt="">
        </a>
        <a href="../jianzhan/famousPage.html" class="flex-col">
            <img style="height: 1.2rem;
            width: .7rem;" src="../static/images/jianzhan/ic_xt.png" alt="">
        </a>
        <a href="../jianzhan/collegeList.html" class="flex-col">
            <img style="height: 1.2rem;
            width: .7rem;" src="../static/images/jianzhan/iic_xy.png" alt="" />
        </a>
        <a href="../jianzhan/collegeList.html" class="flex-col">
            <img style="height: 1.2rem;
            width: .7rem;" src="../static/images/jianzhan/ic_zt.png" alt="" />
        </a>
        <a href="../jianzhan/shouchangPage.html" class="flex-col">
            <img style="height: 1.2rem;
            width: .7rem;" src="../static/images/jianzhan/ic_sc.png" alt="" />
        </a>
    </div>

    <!-- <div class="flex-row mar-l-30 mar-r-30 pad-t-16 pad-b-16" style="border-top: 1px solid #f7f7f7;align-items: center;">
        <img style="height: .18rem;width: .18rem" class="mar-r-16" src="../static/images/jianzhan/ic_lb.png" alt="" />
        <div class="px20 color_57 mar-r-16">公告</div>
        <div class="flex-col clamp1 px20 color_9" style="line-height: .32rem;
        height: .28rem;"> 很多人都不知道建盏的束口线有什么用，你知道吗？</div>
        <div class="px16 color_9 mar-l-30">更多></div>
    </div> -->

    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">新品推荐</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="list">
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/201.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>

            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/202.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/203.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/204.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/205.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/206.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/207.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/208.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/209.png)"></div>
                </div>
                <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png" />
            </div>
        </div>
    </div>
    <div style="text-align: center; padding: .4rem" class="showmore">
        <div class="color_red_c9 px28">展示更多</div>
        <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
    </div>
    </div>
    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">人气推荐</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="list">
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/201.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/202.png)"></div>

                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/203.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/204.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/205.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/206.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/207.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/208.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
            <div class="item">
                <div style="margin: 0 .1rem">
                    <div class="t1 color_red_c9">ID:10161</div>
                    <div class="pimg" style="background:url(../static/images/jianzhan_0509/209.png)"></div>
                    <div class="t1 clamp1">【吴继旺】柴烧鹧鸪</div>
                    <img class="bt-zx" src="../static/images/jianzhan/btn_ljzx_y.png" />
                </div>
            </div>
        </div>
        <div style="text-align: center; padding: .4rem" class="showmore">
            <div class="color_red_c9 px28">展示更多</div>
            <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
        </div>
    </div>

    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">名家名堂</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="list" style="height: auto;padding-top: .3rem;">
            <div class="mj-item">
                <img src="../static/images/jianzhan_0509/mjmt.png" alt="">
                <div class="t1">国大师非遗传承人 【孙建兴】</div>
                <div class="t2">播放 5836 次</div>
            </div>
            <div class="mj-item"">
                <img src=" ../static/images/jianzhan_0509/mjmt.png" alt="">
                <div class="t1">国大师非遗传承人 【孙建兴】</div>
                <div class="t2">播放 5836 次</div>
            </div>
            <div class=" mj-item"">
                <img src=" ../static/images/jianzhan_0509/mjmt.png" alt="">
                <div class="t1">国大师非遗传承人 【孙建兴】</div>
                <div class="t2">播放 5836 次</div>
            </div>
            <div class="mj-item"">
                <img src=" ../static/images/jianzhan_0509/mjmt.png" alt="">
                <div class="t1">国大师非遗传承人 【孙建兴】</div>
                <div class="t2">播放 5836 次</div>
            </div>
        </div>
        <a href="#" style=" text-align:center; display: block;padding: .4rem">
            <div class="color_red_c9 px28">展示更多</div>
            <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
         </a>
    </div>
    <div class="part1">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">器形 | 釉色</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="list" style="height: auto;padding-top: .3rem;">
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/ys1.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【兔毫】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/a.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【敛口盏】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/ys2.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【曜变】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/b.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【敞口盏】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/ys3.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【油滴/鹧鸪斑】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/c.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【束口盏】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/ys4.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【金乌釉】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
            <a href="#" class="qxys-item flex-row">
                <img src="../static/images/jianzhan_0509/d.png" alt="">
                <div class="flex-col">
                    <div class="t1 clamp1">【撇口盏】</div>
                    <div class="t2 clamp2">
                        简介：在黑色釉中透露出均...
                    </div>
                    <div class="t3">详情</div>
                </div>
            </a>
        </div>
        <a href="#" style=" text-align:center; padding: .4rem;display: block;">
            <div class="color_red_c9 px28">展示更多</div>
            <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
         </a>
    </div>
    <div class="part1" style="background: #fbfbfb;border-top:0px">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">大师推荐</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="ds-list">
            <div class="ds-item">
                <div class="pimg" style="background:url(../static/images/jianzhan_0509/ds1.png)"></div>
                <div class="flex-row" style="flex-direction: column">
                    <div class="flex-row mar-t-20" style="align-items: center;padding: 0 .13rem">
                        <div class="flex-col t1 clamp1">【小撇口金油滴】</div>
                        <img class="bt-zx" src="../static/images/jianzhan_0509/ds_zx.png" />
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">编号：67047</div>
                        <div class="t2 clamp1 flex-col">作者：黄美金</div>
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">器形：束口盏</div>
                        <div class="t2 clamp1 flex-col">釉色：油滴/鹧鸪斑</div>
                    </div>
                </div>
            </div>
            <div class="ds-item">
                <div class="pimg" style="background:url(../static/images/jianzhan_0509/ds1.png)"></div>
                <div class="flex-row" style="flex-direction: column">
                    <div class="flex-row mar-t-20" style="align-items: center;padding: 0 .13rem">
                        <div class="flex-col t1 clamp1">【小撇口金油滴】</div>
                        <img class="bt-zx" src="../static/images/jianzhan_0509/ds_zx.png" />
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">编号：67047</div>
                        <div class="t2 clamp1 flex-col">作者：黄美金</div>
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">器形：束口盏</div>
                        <div class="t2 clamp1 flex-col">釉色：油滴/鹧鸪斑</div>
                    </div>
                </div>
            </div>
            <div class="ds-item">
                <div class="pimg" style="background:url(../static/images/jianzhan_0509/ds1.png)"></div>
                <div class="flex-row" style="flex-direction: column">
                    <div class="flex-row mar-t-20" style="align-items: center;padding: 0 .13rem">
                        <div class="flex-col t1 clamp1">【小撇口金油滴】</div>
                        <img class="bt-zx" src="../static/images/jianzhan_0509/ds_zx.png" />
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">编号：67047</div>
                        <div class="t2 clamp1 flex-col">作者：黄美金</div>
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">器形：束口盏</div>
                        <div class="t2 clamp1 flex-col">釉色：油滴/鹧鸪斑</div>
                    </div>
                </div>
            </div>
            <div class="ds-item">
                <div class="pimg" style="background:url(../static/images/jianzhan_0509/ds1.png)"></div>
                <div class="flex-row" style="flex-direction: column">
                    <div class="flex-row mar-t-20" style="align-items: center;padding: 0 .13rem">
                        <div class="flex-col t1 clamp1">【小撇口金油滴】</div>
                        <img class="bt-zx" src="../static/images/jianzhan_0509/ds_zx.png" />
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">编号：67047</div>
                        <div class="t2 clamp1 flex-col">作者：黄美金</div>
                    </div>

                    <div class="flex-row pad-t-16" style="padding: 0 .13rem">
                        <div class="t2 clamp1 flex-col">器形：束口盏</div>
                        <div class="t2 clamp1 flex-col">釉色：油滴/鹧鸪斑</div>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; padding: .4rem" class="showmore">
            <div class="color_red_c9 px28">展示更多</div>
            <img style="width: 0.21rem;margin-top: 0.1rem" src="../static/images/jianzhan/more.png" alt="">
        </div>
    </div>
    <div class="part1" style="border-top:0px">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">专题推荐</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div style="height: .3rem"></div>
        <div class="swiper_container_suz2" id="pb2">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="../static/images/jianzhan_0509/zttj1.png">
                    <!-- <div>
                        <div style="height: 0.25rem"></div>
                        <div class="px30 clamp1" style="color: #373737;text-align: left;"> 【诚信315】捡漏微拍 独家巨献</div>
                        <div style="height: 0.2rem"></div>
                        <div class="px16 clamp1" style="text-align: left;color: #373737;">世界首位宋代曜变建盏复原者</div>
                    </div> -->
                </div>
                <div class="swiper-slide">
                    <img src="../static/images/jianzhan_0509/zttj2.png">
                    <!-- <div>
                        <div style="height: 0.25rem"></div>
                        <div class="px30 clamp1" style="color: #373737;text-align: left;"> 【诚信315】捡漏微拍 独家巨献</div>
                        <div style="height: 0.2rem"></div>
                        <div class="px16 clamp1" style="text-align: left;color: #373737;">世界首位宋代曜变建盏复原者</div>
                    </div> -->
                </div>
            </div>
            <div id="snext" class="swiper-button-next"></div>
            <div id="sprev" class="swiper-button-prev"></div>
        </div>
    </div>


    <div class="part1" style="border-top:0px; padding-left:0rem;padding-right:0rem;position: relative">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">连锁门店</div>
            <img style="height: 0.17rem;width: .17rem" src="../static/images/jianzhan/ic_next.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="lsmd-bg">
            <div style="height:auto;padding: .4rem 1rem 0.15rem">
                <div class="px24 color_57">客服：13888888888（xx）</div>
                <div class="px24 color_57 mar-t-20" id="address" style="line-height:.4rem">地址：厦门市思明区台东路66号宝业营运中心705室
                </div>
                <div class="px24 color_57 mar-t-20">时间：周一至周日（9.30-18.30) </div>
                <div class="px24 color_57 mar-t-20" style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（其他时间请提前联系我们）</div>
                <div class="flex-row " style="bottom: 0;height: 1rem;text-align: center;align-items: center;border-top: 1px solid #f6f6f6;width: 100%;z-index: 99;">
                    <div class="flex-col searchzx" style="background: #fff;height: .5rem;border: 1px solid #eee;">
                        <input style="height: 100%;width: 90%; background: #fff" class="px24 pad-l-30"
                            type="text" placeholder="请输入手机号码咨询详情" />
                    </div>
                    <div class="ssbtnzx px24" style="height: .5rem;margin-left: .12rem;width:1.34rem;line-height: .5rem">立即咨询</div>
                </div>
                <div class="flex-row" style="text-align: center; padding-top: .2rem">
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/2.png" />
                            <div class="px24 clamp1 pad-t-20">厂家直销</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/6.png" />
                            <div class="px24 clamp1 pad-t-20">一手资源</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/7.png" />
                            <div class="px24 clamp1 pad-t-20">原矿建盏</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/5.png" />
                            <div class="px24 clamp1 pad-t-20">破损补发</div>
                        </div>
                    </div>
                </div>
                <div class="flex-row pad-b-40 " style="text-align: center;padding-top: .4rem">
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/4.png" />
                            <div class="px24 clamp1 pad-t-20">免费拿样</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/8.png" />
                            <div class="px24 clamp1 pad-t-20">专业品牌</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/3.png" />
                            <div class="px24 clamp1 pad-t-20">来样定制</div>
                        </div>
                    </div>
                    <div class="flex-col">
                        <div style="margin: 0 .1rem">
                            <img class="ic_52" src="../static/images/jianzhan_0509/1.png" />
                            <div class="px24 clamp1 pad-t-20">15天退换</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height:.2rem"></div>
        <!-- <img style="padding: 4%;width: 92%;" class="" src="../static/images/jianzhan/banner1.png" /> -->
        <div style="position:relative;align-items: center" class="flex-row">
            <div class="flex-col"></div>
            <div id="dpprev" style="position:relative;margin-top:0" class="swiper-button-prev"></div>
        
            <div id="storeswiper0" class="swiper-container storedp" style="margin: 0px; margin-top: .2rem;margin-bottom: .2rem">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" >
                        <img  id='lunbo1'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN1.png" />
                    </div>
                    <div class="swiper-slide" >
                        <img  id='lunbo2'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN2.png" />
                    </div>
                </div>
            </div>
            <div id="storeswiper1" class="swiper-container storedp"  style="margin: 0px; margin-top: .2rem;margin-bottom: .2rem;display: none">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" >
                        <img  id='lunbo1'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN6.png" />
                    </div>
                    <div class="swiper-slide" >
                        <img  id='lunbo2'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN7.png" />
                    </div>
                </div>
            </div>
            <div id="storeswiper2" class="swiper-container storedp" style="margin: 0px; margin-top: .2rem;margin-bottom: .2rem;display: none">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" >
                        <img  id='lunbo1'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN10.png" />
                    </div>
                    <div class="swiper-slide" >
                        <img  id='lunbo2'style="width: 100%;"  src="../static/images/jianzhan_0509/lunN11.png" />
                    </div>
                </div>
            </div>
            <div id="dpnext" style="position:relative;margin-top:0" class="swiper-button-next"></div>
            <div class="flex-col"></div>
        </div>
        <div class="flex-row mar-t-40 mar-b-30">
            <div class="flex-col"></div>
            <a href="javaScript:selectStore(0)" class="dp-t1 dpact">厦门店</a>
            <div style="height:.32rem;width: 1px;background: #aaa;margin:0 .2rem"></div>
            <a href="javaScript:selectStore(1)" class="dp-t1">北京店</a>
            <div style="height:.32rem;width: 1px;background: #aaa;margin:0 .2rem"></div>
            <a href="javaScript:selectStore(2)"class="dp-t1">武夷山店</a>
            <div class="flex-col"></div>
        </div>
        <!-- <div id="dpnext" style="position:absolute;right:.3rem;top: 10rem;" class="swiper-button-next"></div>
        <div id="dpprev" style="position:absolute;left:.3rem;top: 10rem;" class="swiper-button-prev"></div> -->
        <!-- <div class="flex-row mar-t-40">
            <div class="flex-col"></div>
            <div class="px32" style="border-radius: 5px;background: #c90319;color:white;padding:.16rem .33rem">厦门店</div>
            <div class="flex-col"></div>
        </div> -->
    </div>
    <!-- 添加 -->
    <div style="background: #fbfbfb;padding: .5rem .6rem;margin-bottom: .2rem">
        <div class="flex-row" style="text-align:center">
            <img style="width:1.5rem;height:1.5rem;margin-left: 1rem" src="../static/images/jianzhan/ic_code.png" />
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
                    <div class="color_red_c9 px16">(24h在线)</div>
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
    <div style="height:1.5rem"></div>
    <!-- 底部导航栏 -->
    <div style="position: fixed;bottom:0px;width:100%;background:#fff;z-index: 98;">
        <div id="header1" class="flex-row pad-l-30 pad-r-30 pad-t-30 pad-b-40" style="text-align: center;align-items: center;">
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_home.png" alt="">
                <div style="margin-top: .1rem;height: .3rem">首页</div>
            </div>
            <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
            <div class="flex-col" onclick="moveLeft()">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_fl.png" alt="" />
                <div style="margin-top: .1rem;height: .3rem">分类</div>
            </div>
            <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
            <div class="flex-col" id="zx">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic-zx.png" alt="" />
                <div style="margin-top: .1rem;height: .3rem">咨询</div>
            </div>
            <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
            <div style="width:2rem" class="mar-l-20">
                <div class="flex-row" style="align-items: center;justify-content: center;">
                    <img style="height: .5rem;" src="../static/images/jianzhan/wxadd.jpg" alt="" />
                    <!--<div class="flex-col px16">(长按复制添加微信)</div> -->
                </div>
                <div style="margin-top: .1rem;height: .3rem">1231723876</div>
            </div>
        </div>
    </div>
    <!-- 立即质询 -->
    <div id="guanzhuweixin-s" class="flex-row " style="position: fixed;
    bottom: 0;
    display:none;
    height: 1.62rem;
    background: white;
    text-align: center;
    align-items: center;
    border-top: 1px solid #f6f6f6;
    width: 100%;z-index: 99;">
        <div class="flex-col searchzx mar-l-30">

            <div class="flex-row" style="align-items: center;height: .7rem">
                <!-- 
                <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                    alt=""> -->
                <input style="background: #f7f7f7" class="px24 pad-l-30" type="text" placeholder="请输入您的手机号码" />
            </div>
        </div>
        <div class="ssbtnzx px24 mar-r-30">立即咨询</div>
    </div>

    <!-- 分类 -->
    <div id='menumark' style="display: none"></div>
    <div id="menupart" style="display: none;left:200%;">
        <div id='menuplane' class="menuplane">
            <div id="guanzhuweixin-s-cate" class="flex-row pad-l-20 bg_color_f navheight" style="align-items: center;max-width: 750px">
                <div class="back-tag" style="align-items: center" onclick="moveRight()">

                </div>
                <div class="flex-col search">

                    <div class="flex-row" style="align-items: center;height: .56rem">

                        <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                            alt="">
                        <input style="background: #f7f7f7" class="px24" type="text" placeholder="大师或者编号" />
                    </div>
                </div>
                <div class="ssbtn px24 mar-r-30">搜索</div>
            </div>
            <div class="menu-body">
                <div class="menu-cate-part">
                    <div class="menu-cate-title">名家大师</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
                            <div>大师</div>
                        </div>
                        <div class="item">
                            <div>传承人</div>
                        </div>
                        <div class="item">
                            <div>工艺师</div>
                        </div>
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">工艺釉色</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
                            <div>油滴</div>
                        </div>
                        <div class="item">
                            <div>兔毫</div>
                        </div>
                        <div class="item">
                            <div>鹧鸪斑</div>
                        </div>
                        <div class="item">
                            <div>耀变</div>
                        </div>
                        <div class="item">
                            <div>金乌釉</div>
                        </div>
                        <div class="item">
                            <div>柿红</div>
                        </div>
                        <div class="item">
                            <div>茶叶抹</div>
                        </div>
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">经典器型</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
                            <div>大师</div>
                        </div>
                        <div class="item">
                            <div>大师</div>
                        </div>
                        <div class="item">
                            <div>大师</div>
                        </div>
                        <div class="item">
                            <div>大师</div>
                        </div>
                        <div class="item">
                            <div>大师</div>
                        </div>
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">建盏尺寸</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item w_50">
                            <div>大师</div>
                        </div>
                        <div class="item w_50">
                            <div>大师</div>
                        </div>
                        <div class="item w_50">
                            <div>大师</div>
                        </div>
                        <div class="item w_50">
                            <div>大师</div>
                        </div>
                        <div class="item w_50">
                            <div>大师</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tk-mark" id="tixing" style="display: none;">
        <div style="height:100%;width:100%;position:absolute;left:0;top:0"  onclick="hideTiXing()"></div>
        <div class="gmkuang">
            <div class="div-h-3"></div>
            <div class="flex-row" style="justify-content: center">
                <div class="flex-col"></div>
                <img style="height:0.93rem" src="../static/images/xiaojiang/logo.png">
                <div class="flex-col">
                    <!-- <div class="mar-r-40 px24" style="color:#999;display: initial;float: right;" onclick="hideTiXing()">关闭
                    </div> -->
                </div>
            </div>
            <div class="flex-row mar-t-40" style="margin-left: 1rem;align-items: baseline;justify-content: left;">
                <div  style="font-size:.26rem;">咨询建盏:</div>
                <div class="mar-l-16 px22 color_9">称心如意“看作品价格”</div>
                <div class="color_9 mar-l-16 px22">（10分钟内回复）</div>
            </div>

            <div class="flex-row mar-t-40" style="margin-left: 1rem;align-items: center;justify-content: left;">
                <div  style="font-size:.26rem;">手机号码:</div>
                <input placeholder="请输入您的手机号码" class="mar-l-20" style="width: 3.8rem;;border: 1px solid #f6f6f6;padding-left: 0.2rem;text-align: left;height: 0.6rem" />

            </div>
            <div class="div-h-2"></div>
            <div style="font-size:.26rem;color:#fff;background:#c90319;height: .7rem;margin: 0.2rem .3rem;line-height: .7rem;text-align: center">立即咨询</div>
            <div class="flex-row mar-t-30 mar-b-40" style="justify-content: center;align-items: baseline;text-align: center;">
                <div class="flex-col">
                    <div class="color_57" style="font-size:.26rem;">快速直线:<span style="font-size:.3rem;color:#c90319">4008-276-376</span></div>
                    <div class="px24 color_9 mar-t-30">福建省盏天下电子商务有限公司</div>
                </div>
            </div>
            <div class="div-h-3"></div>
        </div>
    </div>
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
        $('.bt-zx').on('click', function () {
            utils.toggleBody(1)
            $('#tixing').show()
        })
        $('#zx').on('click', function () {
            utils.toggleBody(1)
            $('#tixing').show()
        })
        
  function selectStore(i){
      var imgarray=[[1,2],[6,7],[10,11]]
      var addres=['地址：厦门市思明区观音山宝业大厦705室','地址：北京市朝阳区酒仙桥798艺术区西二门','地址：武夷山市水岸花苑小区4栋B单元']
      $($('.dp-t1')[i]).addClass('dpact').siblings().removeClass('dpact')
      $('.storedp').hide()
      $('#storeswiper'+i).show(); 
      $('#storeswiper'+i)
      $('#address').text(addres[i]);
      storeswiper = new Swiper('#storeswiper'+i, {
            loop: true,
            // 如果需要分页器
            autoplay: 5000,
            initialSlide: 1,
            nextButton: '#dpnext',
            prevButton: '#dpprev',
            observer:true,
            observeParents: true
        })
  }

        // 店铺
        var storeswiper = new Swiper('#storeswiper0', {
            loop: true,
            // 如果需要分页器
            autoplay: 5000,
            initialSlide: 1,
            nextButton: '#dpnext',
            prevButton: '#dpprev',
            observer:true,
            observeParents: true
        })
    
        // 精选
        var swiper = new Swiper('.swiper_container_suz2', {
            slidesPerView: 1.3,
            spaceBetween:3,
            nextButton: '#snext',
            prevButton: '#sprev',
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


        //点击隐藏在线咨询面板或拨号面板
        $('#menumark').click(function () {
            // if (iskuaishu) {
            //     $(".footer").animate({ bottom: '0rem' }, "slow", function () {
            //         $("#menumark").css("display", "none");
            //         $("#ksplane").css("display", "none");
            //     });
            //     iskuaishu = false;
            // }
            // if (iszaixian) {
            //     $(".footer").animate({ bottom: '0rem' }, "slow", function () {
            //         $("#menumark").css("display", "none");
            //         $("#zxplane").css("display", "none");
            //     });
            //     iszaixian = false;
            // }
            // if (ismenu) {//8.4
            moveRight();
            // }
        })
        // 隐藏分类面板
        function moveRight() {
            ismenu = false;
            // console.log("dhgsfhjsgdghj");
            $("#menupart").animate({ left: '100%' }, "slow", function () {
                $(this).css("display", "none");
                $("#menumark").css("display", "none");
                utils.toggleBody(false)
            });
        }
        //弹出分类面板
        function moveLeft() {
            ismenu = true;
            // console.log("dhgsfhjsgdghj");
            $('#menupart').css("display", "block");
            $("#menumark").css("display", "block");
            $("#menupart").animate({ left: '20%' }, "slow");//8.4
            utils.toggleBody(true)
        }
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

        isTouchDevice();
    </script>
</body>

</html>