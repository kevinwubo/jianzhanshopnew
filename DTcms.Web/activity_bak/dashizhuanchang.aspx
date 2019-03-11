<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashizhuanchang.aspx.cs" Inherits="DTcms.Web.activity.dashizhuanchang" %>
<%@ Import namespace="DTcms.Common" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="TiXing_List.ascx" tagname="TiXing_List" tagprefix="uc1" %>
<%@ Register src="ChuJia_List.ascx" tagname="ChuJia_List" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta content="大师拍卖专场" http-equiv="keywords">
    <meta name="description" content="大师拍卖专场">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>大师拍卖专场</title>
    <!--<link rel="stylesheet" href="css/register/base.css" type="text/css">-->
    <link rel="stylesheet" href="static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="static/css/pagination.css" type="text/css">
    <style>
        body {
            background: #f6f6f6;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
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

        .titimg {
            margin: auto;
            position: relative;
            width: 60%;
            padding: 0.5rem 0;
            display: block;
        }

        .xj_search {
            height: 0.4rem;
            padding: 0.2rem;
            height: .631rem;
            border: 0px;
        }

        .itemlist {
            list-style: none;
            overflow: hidden;
        }

        .itemlist li {
            background: #f2f2f2;
            border-radius: 0.1rem;
            float: left;
            width: 48.6%;
            /*height: 5.334rem;*/
            overflow: hidden;
            margin-bottom: 0.34rem;
            padding-bottom: 0.2rem;
        }

        .itemlist li:nth-child(2n+1) {
            margin-right: 0.17rem
        }

        .active:after {
            position: absolute;
            content: '';
            width: 60%;
            height: 0rem;
            bottom: -0.273rem;
            background: #fe7e08;
            left: 20%;
        }

        .nav_act {
            color: #c90319 !important;
            font-size: 0.273rem !important;
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

        .p-r {
            line-height: 0.6rem;
            height: 0.6rem;
            width: 90%;
            margin: 0 5%;
        }

        .p-r img {
            height: 0.4rem;
            width: 0.4rem;
            vertical-align: middle;
            margin-right: 0.2rem;
            margin-top: -0.05rem;
        }

        .p-r span {
            font-size: 0.28rem;
        }

        .park .sm {
            color: #999;
            line-height: 0.4rem;
            margin: 0 5%;
            font-size: 0.24rem;
        }

        .tkhead {
            height: 1.9rem;
        }

        .left {
            width: 2rem;
            float: left;
            height: 1.6rem;
        }

        .left img {
            width: 1.3rem;
            height: 1.3rem;
            margin-left: 0.3rem;
            margin-top: 0.3rem;
        }

        .right {
            width: 3.4rem;
            float: left;
            height: 1.6rem;
        }

        .right .xq_jiaq {
            overflow: hidden;
        }

        .right .xq_jiaq p {
            float: left;
            color: #B5282E;
            font-size: 0.24rem;
        }

        .right .xq_jiaq p em {
            font-size: 0.4rem;
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
        #guanzhuweixin-s {
            position: fixed;
            width: 100%;
            top: 0;
            margin: 0;
            padding: 0;

        }
        .b_itm {
            color: #fff;
            line-height: 0.7rem;
            text-align: center;
            background: #6e0909;
        }
    </style>
</head>
<body>

<div id="guanzhuweixin-s" class="flex-row bg_color_f navheight" style="align-items: center;max-width: 750px">
    <div class="flex-row pad-l-40" style="width: 1rem;align-items: center">
        <img class="mar-r-16" style="width: 0.1rem" src="static/images/315/back.png"/>
        <div class="px28 color_57"><a href="javascript:window.history.back()">返回</a></div>
    </div>
    <div class="flex-col texta-c px36 color_57">大师拍卖专场</div>
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

<img class="w100" style="display: block" src="static/images/315/05.jpg"/>

<div class="w100" style="background-color: #c90319;">
    <div class="flex-row mar-l-20 mar-r-20 bg_color_f"
         style="overflow: hidden; align-items: center;border-radius: 0.1rem">
        <img class="mar-l-30" style="width: .3rem;height: .36rem" id="btnSearch" src="static/images/xiaojiang/ic_search.png"/>
        <input class="flex-col xj_search texta-l" id="txt_keywords" type="search" placeholder="请输入你要查找的编号（ID）"/>
    </div>
    <ul class="itemlist mar-r-20 mar-l-20 pad-t-40">
     <% List<Product> list= ModelList;
    if(list!=null&&list.Count>0)
    {
        foreach(Product model in list)
        {
     %>
        <li class="item">
            <div style="overflow: hidden;height: auto;position: relative">
                <div class="flex-row bg_color_f pad-b-16 pad-t-16 pad-l-16 pad-r-16" style="align-items: center">
                    <div style="width: 0.5rem"></div>
                    <div class="flex-col texta-c color_red_c9" style="font-size: .1877rem">ID:<%=model.ProductID.ToString() %></div>
                    <div style="width: 0.5rem" onclick="showTiXing()">
                        <div class="color_red_c9 px20" style="line-height: 0.24rem">设置</div>
                        <div class="color_red_c9 px20" style="line-height: 0.24rem">提醒</div>
                    </div>
                </div>
                <img class="w100 bg_color_f" src="<%=model.Images %>"/>

                <% if(IsFinish)
                {
                    if(Convert.ToDecimal(model.MarketPrice)>model.CustomerOffer)
                    { %>
                    
                    <img style="height:104%;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);"src="static/images/xiaojiang/lp.png"/>
                    <%}else
                    { %>
                    <img style="height:104%;position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);"src="static/images/315/cg.png"/>
                <%}
               } %>
            </div>
            <div class="flex-row" style="flex-direction: column">
                <div class="px36 clamp1 texta-c  mar-l-40 mar-r-40" style="color: #000;margin:.2rem; padding-top:2px; "><%=model.ProductName %></div>
                <div class="flex-row mar-l-40 mar-r-40">
                    <div class="flex-col px20 texta-l clamp1" style="padding-top:2px;">作者：<%=model.Author %></div>
                    <div style="width: 0.05rem"></div>
                    <div class="flex-col px20 texta-l clamp1" style="padding-top:2px;">尺寸：<%=model.Volume%></div>
                </div>

                <div class="flex-row mar-l-40 mar-r-40 mar-t-16">
                    <div class="flex-col px20 texta-l clamp1" style="padding-top:2px;">售价：<%=model.MarketPrice%>元</div>

                </div>
                
                <% if(IsShowTiXing)
                { %>
                <div class="flex-row  mar-l-40 mar-r-40 mar-t-16" style="align-items: center">
                    <div class="px24">当前价：</div>
                     <div class="color_red_c9" style="margin-left: 0.1rem;font-size: .32rem">暂未开始</div>
                </div>
                                <div class="w100 texta-c mar-t-16"
                     style="background: #ffc513;height: .5rem;color: white;line-height: .5rem" onclick="alertTiXing('<%=model.ProductID.ToString() %>','<%=model.ProductName %>','<%=model.Author %>','大师')">
                    我要提醒
                </div>
                <%}else
                { %>

                <div class="flex-row  mar-l-40 mar-r-40 mar-t-16" style="align-items: center">
                    <div class="px24">当前价：</div>
                    <% if(model.CustomerOffer>0)
                    { %>
                    <div class="px24 color_red_c9">¥</div>
                    <div class="color_red_c9" style="margin-left: 0.1rem;font-size: .32rem"><%=model.CustomerOffer %></div>
                    <%}else

                     {%>
                     <div class="color_red_c9" style="margin-left: 0.1rem;font-size: .32rem">暂未出价</div>
                    <%} %>
                </div>

                <% if(IsFinish)
                { %>
                               <div class="w100 texta-c mar-t-16"
                     style="background: #ffc513;height: .5rem;color: white;line-height: .5rem" onclick="#">
                    已经结束
                </div>
                <%}else
                { %>
                <div class="w100 texta-c mar-t-16"
                     style="background: #ffc513;height: .5rem;color: white;line-height: .5rem" onclick="alertChuJia('<%=model.ProductID.ToString() %>','<%=model.ProductName %>','<%=model.Author %>','大师','<%=model.CustomerOffer %>','<%=model.HighTelePhone %>','<%=model.MarketPrice%>')">
                    立即出价
                </div>
                <%} %>
                <%} %>

                 <div class="w100 texta-c mar-t-16 px20">当前出价最高竞拍人</div>
                <div class="w100 texta-c mar-t-16 px20 color_red_c9">
                <% if(!IsShowTiXing&&model.CustomerOffer>0)
                { %><%=model.HighTelePhone %>
                <%} %>
                </div>
            </div>
        </li>
        <%}
        } %>
       
    </ul>
        <div class="flex-row  m-style" style="justify-content: center">
        <%=PageHtml %>
    </div>
    <div class="div-h-8"></div>
    <div class="div-h-3"></div>
    <div class="div-h-8"></div>
</div>
<div class="w100" style="position: fixed;bottom:-1px;left: 0">
    <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
        <div class="flex-col" style="justify-content: center">

            <div id="btime" class="flex-row timelabel px32" style="align-items: center;justify-content: center">距结束
                <span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒
            </div>
            <div class="div-h-2"></div>
            <div style="background: #c90319;height: 1px;width: 70%;margin: auto"></div>
            <div class="div-h-2"></div>
            <div class="px32" style="text-align: center">拍品：100件（剩余99件）</div>
        </div>
    </div>
</div>

<input  id="hid_endTime" type="hidden" value="<%=EndTime13 %>"/>
<div class="w100 flex-row" style="position: fixed;height: 0.7rem;bottom:-1px;border-top: 1px solid #fff;max-width: 750px">
    <a class="flex-col b_itm" style="border-right: 1px solid #fff" href="index.aspx?source=<%=Source %>">去主会场</a>
    <a class="flex-col b_itm b_act" href="dashitulu.aspx?source=<%=Source %>">去图录页</a>
</div>

<!--商品--型号选择-->
<!--未开开始-->
<uc1:TiXing_List ID="TiXing1" runat="server" />
<input id="hid_source"  type="hidden" value="<%=Source %>" />
<!--开始出价-->
<uc2:ChuJia_List ID="ChuJia1" runat="server" />

<script src="static/js/jquery-2.1.4.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/jquery.pagination.js"></script>
<script src="static/js/utils.js"></script>
<script src="static/js/showdiv.js"></script>
<script>

    $("#btnSearch").bind("click", function (e) {
        var keyword = $("#txt_keywords").val();
        var source = $("#hid_source").val();
        window.location.href = "dashizhuanchang.aspx?source=" + source + "&keyword=" + keyword;
    });

    $('.M-box').pagination({
        mode: 'fixed'
    });

    // countDown()
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

    function hideTiXing() {
        $('#tixing').hide()
        utils.toggleBody(0)
    }

    function showTiXing() {
        utils.toggleBody(1)
        $('#tixing').show()
    }

    function hideJiajia() {
        $('#chujia').hide()
        utils.toggleBody(0)
    }

    function showJiajia() {
        utils.toggleBody(1)
        $('#chujia').show()
    }


    function getScond(d) {
        var oDate = new Date(); //获取日期对象
        var oldTime = oDate.getTime(); //现在距离1970年的毫秒数
        var newDate = new Date(d);
        var newTime = newDate.getTime(); //2019年距离1970年的毫秒数
        return Math.floor((newTime - oldTime) / 1000);
    }

    countDown(getScond($("#hid_endTime").val()));

    function countDown(times) {
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
            var str = "距结束<span>" + day + "</span>天 <span>" + hour + "</span>时 <span>" + minute + "</span>分 <span>" + second + "</span>秒";
            $("#btime").html(str);
            $("#btime1").html(str);
            $("#btime2").html(str);
            $("#btime1111").html(str);

            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);
        }
    }
    setTimeout(function () {
        window.location.reload(); //刷新当前页面.
    }, 30000)
    // stopDrop();
</script>
</body>
</html>