<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_jdlist.aspx.cs" Inherits="DTcms.Web.mn_jdlist" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer_new.ascx" tagname="mn_footer_new" tagprefix="uc2" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc1" %>
<head>
    <meta charset="utf-8">
    <meta content="建盏商城" http-equiv="keywords">
    <meta name="description" content="建盏商城">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>经典釉色</title>
    <link rel="stylesheet" href="../static/css/jquery-weui.css" type="text/css">
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
    <script type="text/javascript" src="../static/js/jquery-2.1.4.js"></script>
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .store-con .list1 {
            height: auto;
        }

        .store-con {
            /* overflow: hidden; */
        }

        #mark .markitem {
            color: #999;
            font-size: .24rem;
            text-align: center;
            float: left;
            width: 24.5%;
            height: .8rem;
            line-height: .8rem;
            border-bottom: 1px solid #f6f6f6;
            border-right: 1px solid #f6f6f6;
        }



        #mark .markitem:nth-child(4n+4) {
            border-right: 1px solid #fff;
        }

        #mark .markitem:nth-child() {
            border-right: 1px solid #fff;
        }

        .active {
            color: #bd2727 !important
        }

        .nb {
            border-bottom: 1px solid #fff !important;
        }
        .swiper-container {
            width: 5.32rem;
            height: 3.26rem;
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
            background:#fafafa;
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
    <header>
        <div class="flex-row college-hd">
            <a class="back" style="color:#fff" href="m_index.html">返回</a>
            <div class="txt px36">经典<%=type %></div>
            <div class="menu"  onclick="javascript:moveLeft()">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="about-wrap">
            <div class="about-tab">
                    <div class="tab-item active"><span><a style="color:White" href="mn_jdlist.aspx?type=器型">经典器形</a></span></div>
                    <div class="tab-item  active"><span><a style="color:White" href="mn_jdlist.aspx?type=釉色">经典釉色</a></span></div>
            </div>
    </section>
    <div class="colList-wrap">

       <div class="flex-row" style="padding:.3rem .3rem 0;color:#999;align-items: center">
           <%--<a  style="color:#999;margin-right: .1rem" href="#">业界大师</a>><a href="#"  style="margin-left: .1rem;color:#999">孙圣性</a>--%>
       </div>
        <div class="list-box ">
           <% List<Artisan> listqxys = listArtisanQXYS;
              if (listqxys != null && listqxys.Count > 0)
              {
                  foreach (Artisan item in listqxys)
                  { %>
            <div class="list-con">
                <div class="con-img">
                    <img src="<%=item.IDHead %>" alt="">
                </div>
                <div class="con-txt">
                    <h1><%= item.introduction.Length > 12 ? item.introduction.Substring(0, 11) : item.introduction%> ...</h1>
                    <span>【<%=item.Adddate.ToShortDateString()%>】</span>
                    <p>
                    <%= item.DetailedIntroduction.Length > 105 ? item.DetailedIntroduction.Substring(0, 104) : item.DetailedIntroduction%> ......
                        <a href="mn_jddetail.aspx?artisanid=<%=item.artisanID %>">查看更多></a>
                    </p>
                </div>
            </div>
            <%}
              } %>
        </div>
    </div>


<%--    <div class="part1" style="border-top:0px; padding-left:0rem;padding-right:0rem;position: relative">
        <div class="flex-row" style="align-items: center;padding:.25rem 0">
            <div class="flex-col"></div>
            <div class="px32 color_57 mar-r-16">连锁门店</div>
            <img style="height: 0.17rem;width: .17rem" src="/static//images/jianzhan/banner1.png" alt="" />
            <div class="flex-col"></div>
        </div>
        <div class="lsmd-bg">
            <div style="height:auto;padding: .4rem 1.1rem 0">
                <div class="px24 color_57">客服：4008-276-376</div>
                <div class="px24 color_57 mar-t-20" style="line-height:.4rem">地址：厦门市思明区台东路66号宝业营运中心705室
                </div>
                <div class="px24 color_57 mar-t-20">时间：周一至周日（9.30-18.3 </div>
                <div class="px24 color_57 mar-t-20">（其他时间请提前联系我们）</div>
                <div class="flex-row " style="bottom: 0;height: 1rem;text-align: center;align-items: center;border-top: 1px solid #f6f6f6;width: 100%;z-index: 99;">
                    <div class="flex-col searchzx" style="background: #fff;height: .5rem;border: 1px solid #eee;">
                        <input style="height: 100%;width: 90%; background: #fff" class="px24 pad-l-30"
                            type="text" placeholder="请输入手机号码咨询详情" />
                    </div>
                    <div class="ssbtnzx px24" style="height: .5rem;margin-left: .12rem;width:1.34rem;line-height: .5rem">立即咨询</div>
                </div>
                <div class="flex-row" style="text-align: center; padding-top: .4rem">
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">艺人直销</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">一手货源</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">原矿铁胎</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">实物视频</a></div>
                    </div>
                </div>
            </div>
                <div class="flex-row pad-b-40 " style="text-align: center;padding-top: .4rem">
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">实体门店</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">1对1客服</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">赝品赔付</a></div>
                    </div>
                </div>
                <div class="flex-col">
                    <div style="margin: 0 .1rem">
                        <img class="ic_60" src="/static/images/jianzhan/ic_15.png" />
                        <div class="px24 clamp1 pad-t-20"><a href="mn_fwbz.html">15天退换</a></div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div style="height:.4rem"></div>
        <!-- <img style="padding: 4%;width: 92%;" class="" src="../static//images/jianzhan/banner1.png" /> -->
        <div style="position:relative;align-items: center" class="flex-row">
            <div class="flex-col"></div>
            <div id="dpprev" style="position:relative;margin-top:0" class="swiper-button-prev"></div>
        
            <div id="storeswiper" class="swiper-container" style="margin: 0px; margin-top: .2rem;margin-bottom: .2rem">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img style="width: 100%;" class="" src="/static//images/jianzhan/banner1.png" />
                    </div>
                    <div class="swiper-slide">
                        <img style="width: 100%;" class="" src="/static//images/jianzhan/banner1.png" />
                    </div>
                    <div class="swiper-slide">
                        <img style="width: 100%;" class="" src="/static//images/jianzhan/banner1.png" />
                    </div>
                </div>
                <!-- 如果需要分页器 -->
                <!-- <div class="swiper-pagination"></div> -->
            </div>
            <div id="dpnext" style="position:relative;margin-top:0" class="swiper-button-next"></div>
            <div class="flex-col"></div>
        </div>
        <div class="flex-row mar-t-40 mar-b-30">
            <div class="flex-col"></div>
            <a href="#" class="dp-t1 dpact">厦门店</a>
            <div style="height:.32rem;width: 1px;background: #eee;margin:0 .2rem"></div>
            <a href="#" class="dp-t1">北京店</a>
            <div style="height:.32rem;width: 1px;background: #eee;margin:0 .2rem"></div>
            <a href="#" class="dp-t1">武夷山店</a>
            <div class="flex-col"></div>
        </div>
        <!-- <div id="dpnext" style="position:absolute;right:.3rem;top: 10rem;" class="swiper-button-next"></div>
        <div id="dpprev" style="position:absolute;left:.3rem;top: 10rem;" class="swiper-button-prev"></div> -->
        <!-- <div class="flex-row mar-t-40">
            <div class="flex-col"></div>
            <div class="px32" style="border-radius: 5px;background: #c90319;color:white;padding:.16rem .33rem">厦门店</div>
            <div class="flex-col"></div>
        </div> -->
    </div>--%>
    <!-- 添加 -->
     <div style="background: #f7f7f7;padding: .5rem .6rem;margin-bottom: .2rem">
        <div class="flex-row" style="text-align:center">
            <img style="width:1.5rem;height:1.5rem;margin-left: .3rem" src="/static//images/jianzhan/ic_code.png" />
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
    <div style="height:1.5rem"></div>
             <uc2:mn_footer_new ID="mn_footer_new1" runat="server" />
        <uc1:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />


    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <!-- <script src="../static/js/jquery.pagination.js"></script> -->
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/swiper.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script>
        $("#mark").css("height", $('body').height() - $('.college-hd').height() - $('.store-wrap').height());
        // $(".store-con").css("height", window.innerHeight - $('.store-con').offset().top-$('#foot').height());
        $(".tab-item").click(function () {
            var index = $(this).index();
            // globalType = index;
            $(this).addClass("active").siblings().removeClass("active");
            $(".store-con .con-item").eq(index).addClass("active").siblings().removeClass("active");
            // $("#mark").show()
            // utils.toggleBody(true)
        });
       
          // 店铺
          var storeswiper = new Swiper('#storeswiper', {
            loop: true,
            // 如果需要分页器
            autoplay: 5000,
            initialSlide: 1,
            nextButton: '#dpnext',
            prevButton: '#dpprev',
            // pagination: '.swiper-pagination',//分页容器的css选择器
            // paginationType: 'custom',
            // paginationCustomRender: function (swiper, current, total) {
            //     var _html = '';
            //     for (var i = 1; i <= total; i++) {
            //         if (current == i) {
            //             _html += '<li class="px32 swiper-custom-active" style=" display: inline-block;border-radius: 5px;background: #c90319;color:white;padding:.16rem .33rem;width:1rem">厦门店</li>';
            //         } else {
            //             _html += '<li class="swiper-custom"></li>';
            //         }
            //     }
            //     return _html;//返回所有的页码html
            // }
        })
    </script>
</body>

</html>