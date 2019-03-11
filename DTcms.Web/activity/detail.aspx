<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="DTcms.Web.activity.detail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import namespace="DTcms.Common" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="TiXing.ascx" tagname="TiXing" tagprefix="uc1" %>
<%@ Register src="ChuJia.ascx" tagname="ChuJia" tagprefix="uc2" %>
<html>

<head>
    <meta charset="utf-8">
    <meta content="315活动" http-equiv="keywords">
    <meta name="description" content="315活动">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>作品详情</title>
    <link rel="stylesheet" href="static/css/swiper.min.css" type="text/css">
    <!--<link rel="stylesheet" href="css/register/base.css" type="text/css">-->
    <link rel="stylesheet" href="static/css/base_1_30.css" type="text/css">
    <script>
        // document.documentElement.style.fontSize = document.documentElement.clientWidth / 750 * 100 + 'px';
    </script>
    <style>
        body {
            background: #f6f6f6;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }
        input {
            float: left;
            margin: 0 5px;
            width: 0.358rem;
            height: 0.358rem;
            line-height: 0.358rem;
            text-align: center;
            background: #fff;
            border: 1px solid #ebebeb;
            outline: none;
            color: #bdbdbd;
            font-size: .2rem;
        }
        .bannner-carousel {
            background: #fff;
            padding-bottom: .24rem;
        }

        .swiper-container-1 .swiper-pagination-bullet {
            background: #d6d6d6;
        }

        .swiper-container-1 .swiper-pagination-bullet-active {
            background: #c93540;
        }

        .swiper-container-1 .swiper-slide img {
            width: 100%;
            max-height: 4.6rem;
        }

        .txt-info {
            padding-left: .25rem;
        }

        .txt-info h3 {
            font-size: .34rem;
            color: #131313;
        }

        .txt-info span {
            font-size: .24rem;
            color: #bf0000;
            margin-top: .2rem;
            display: inline-block;
        }

        .time-tab {
            width: 100%;
            height: 1.22rem;
            margin: .12rem 0;
            background: #fff;
        }

        .time-tab .time {
            color: #1f1f1f;
            font-size: .34rem;
            text-align: center;
            line-height: 1.22rem;
        }

        .time-tab .time span {
            color: #bc030f;
            font-size: .56rem;
            line-height: 1.22rem;
        }

        .des-info {
            width: 100%;
            margin: .12rem 0;
            background: #fff;
        }

        .des-info .info-wrap {
            padding: .24rem 0;
            display: flex;
            line-height: .4rem;
            margin: .24rem;
        }

        .info-l {
            display: flex;
            margin-right: .3rem;
            color: #000000;
            font-size: .26rem;
        }
        .info-wrap  p, img, span{ width:100%}
        .info-r {
            display: flex;
            flex: 1;
        }

        .info-r .r-fl {
            display: flex;
            flex-direction: column;
            color: #646464;
            font-size: .22rem;
        }

        .info-r span {
            color: #646464;
            font-size: .22rem;
            line-height: .4rem;
            margin-right: .6rem;
        }

        .img-show {
            margin-top: .12rem;
            background: #fff;
            padding: .24rem;
        }

        .show-wrap {
            padding: .3rem 0;
        }

        .img-show img {
            padding-top: .24rem;
            width: 100%;
            height: 4.64rem;
            margin: 0 auto;
        }

        .btn {
            width: 100%;
            height: .96rem;
            background: #b8030f;
            color: #fff;
            font-size: .44rem;
            line-height: .96rem;
            text-align: center;
            position: fixed;
            bottom: 0;
            max-width: 750px
        }
        .color_red_c9 {
            color: #c90319;
        }

        .timelabel {
            color: #1f1f1f;
            text-align: center;
        }

        .timelabel span {
            font-size: .46rem;
            color: #c90319;
            margin-bottom: 0.05rem;
        }

        /*弹框-说明-购买等*/
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

        .tkdel img {
            float: right;
            width: 0.3rem;
            height: 0.3rem;
            margin: 0.35rem;
        }


        .park .sm {
            color: #999;
            line-height: 0.4rem;
            margin: 0 5%;
            font-size: 0.24rem;
        }

        .park .ys {
            height: auto;
            overflow: hidden;
            margin: 0.1rem 0.3rem;
        }

        .park .ys .li {
            padding: 0.1rem;
            width: 0.8rem;
            float: left;
            border: 1px solid #999;
            text-align: center;
            border-radius: 0.06rem;
            margin-right: 0.2rem;
        }

        .park .ys .on {
            color: #B5282E;
            border: 1px solid #B5282E;
        }

        .tx_act {
            background: #c51b27;
            color: #fff;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

<div id="guanzhuweixin-s" class="flex-row bg_color_f navheight" style="align-items: center;max-width: 750px">
    <div class="flex-row pad-l-40" style="width: 1rem;align-items: center">
        <img class="mar-r-16" style="width: 0.1rem" src="static/images/315/back.png"/>
        <div class="px28 color_57"><a href="javascript:window.history.back()">返回</a></div>
    </div>
    <div class="flex-col texta-c px36 color_57">作品详情页</div>
    <div class="pad-r-40" style="width: 1rem;align-items: right">
        <a href="index.aspx?source=<%=Source %>"><img style="float: right;width:0.4rem;height: 0.3rem" src="static/images/315/menu.png"/></a>
        <!--<div class="px32 color_1e">按钮</div>-->
    </div>
</div>
<!--<div class="div-h-8" style="background-color: #c90319"></div>-->
<!--<div class="flex-row pad-r-40 bg_color_f navheight" style="align-items: center">-->
<!--<div class="flex-col texta-c px28 color_57">主会场</div>-->
<!--<div class="flex-col texta-c px28 color_57 nav_act">小匠专场</div>-->
<!--<div class="flex-col texta-c px28 color_57">小匠图录</div>-->
<!--<div style="width: .7rem;align-items: right;border-left: 1px solid #f0f0f0">-->
<!--<img style="float: right;width:0.4rem;height: 0.3rem" src="static/images/315/menu.png"/>-->
<!--&lt;!&ndash;<div class="px32 color_1e">按钮</div>&ndash;&gt;-->
<!--</div>-->
<!--</div>-->
                <input id="hid_start" type="hidden" value="<%=DetailTime %>"/>
                <input id="hid_DetailStr"  type="hidden" value="<%=DetailStr %>"/>
 <% 
             List<Product> listPro=productModelList;
             foreach (Product model in listPro)
             { %>
<div class="bannner-carousel">
    <div class="swiper-container-1 swiper-container">
        <div class="swiper-wrapper">
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
            
        </div>
        <div class="swiper-pagination-1 swiper-pagination"></div>
    </div>
    <div class="txt-info">
    <input id="hid_salePrice" type="hidden" value="<%=model.MarketPrice %>"/>
        <h3><%=model.ProductName %></h3>
        <span>ID:<%=model.ProductID %><input id="txt_ProductID" value="<%=model.ProductID %>" type="hidden" /></span>
    </div>
</div>
<div class="time-tab">
    <div class="time" id="p">距结束
                <span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒
    </div>
</div>
<div class="des-info">
    <div class="info-wrap" style="border-bottom: 1px solid #ebebeb;">
        <div class="info-l">
          <%--  信息:--%>
        </div>
        <div class="info-r">
            <div class="r-fl">
                <span>釉色：<%=model.Type2 %></span>
                <span>尺寸：<%=model.Volume%></span>
            </div>
            <div class="r-fl">
                <span>器形：<%=model.Type3 %></span>
                <span>作者：<%=model.Author %></span>
            </div>

        </div>
    </div>
    <div class="info-wrap">
<%--        <div class="info-l">
            介绍:
        </div>
        <div class="info-r">--%>
                <span> <p style="text-align:justify;text-indent:14pt;font-family:微软雅黑;font-size:14pt;">实物照及视频请联系您的专属顾问 </p>
				<%=model.summary.Replace("900","702")%> </span>
<%--        </div>--%>
    </div>
</div>
<div class="img-show">
    <div class="show-wrap">    
        <%=model.ProImageDetail%>
    </div>
</div>
<%} %>
<div style="padding-top: .96rem;">
<% if(IsShowTiXing)
{ %>
<div class="btn" onclick="showTiXing()">
        我要提醒
    </div>
<%}else{ %>

<% if(isFinish)
{%>
 <div class="btn" >
        已经结束
    </div>
<%}else{ %>
    <div class="btn" onclick="showJiajia()">
        立即出价
    </div>
    <%} 
    }%>
</div>
<!--未开开始-->
<uc1:TiXing ID="TiXing1" runat="server" />

<!--开始出价-->
<uc2:ChuJia ID="ChuJia1" runat="server" />

<script src="static/js/jquery-2.1.4.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/utils.js"></script>
<script src="static/js/swiper.min.js"></script>

<script>
    //时间为一位数时显示格式为："0X"
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    function getScond(d) {
        var oDate = new Date(); //获取日期对象
        var oldTime = oDate.getTime(); //现在距离1970年的毫秒数
        var newDate = new Date(d);
        var newTime = newDate.getTime(); //2019年距离1970年的毫秒数
        return Math.floor((newTime - oldTime) / 1000);
    }

    countDown(getScond($("#hid_start").val()), $("#hid_DetailStr").val())

    function countDown(times,type) {
        var timer = null;
        timer = setInterval(function () {
            var day = 0,
                hour = 0,
                minute = 0,
                second = 0; //时间默认值
            if (times > 0) {
                day = Math.floor(times / (60 * 60 * 24));
                hour = Math.floor(times / (60 * 60)) - (day * 24);
                minute = Math.floor(times / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(times) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (day <= 9) day = '0' + day;
            if (hour <= 9) hour = '0' + hour;
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var str = type+"<span>" + day + "</span>天 <span>" + hour + "</span>时 <span>" + minute + "</span>分 <span>" + second + "</span>秒"
            $("#p").html(str)
            $("#btime1111").html(str);
            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);
        }
    }
    </script>
<script>
    var swiper1 = new Swiper('.swiper-container-1', {
        pagination: '.swiper-pagination-1',
        paginationClickable: true,
        autoplay: 2000,
    });

    

</script>
    
    </form>
</body>

</html>