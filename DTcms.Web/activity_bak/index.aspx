<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DTcms.Web.activity.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta content="315活动" http-equiv="keywords">
    <meta name="description" content="315活动">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>诚信315 捡漏微拍</title>
<%--    <link rel="stylesheet" href="css/register/base.css" type="text/css">--%>
    <link rel="stylesheet" href="static/css/base_1_30.css" type="text/css">
    <style>
        body {
            background: #f6f6f6;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .timelabel {
            color: #1f1f1f;
            text-align: center;
        }

        .timelabel span {
            font-size: .34rem;
            color: #c90319;
        }

        .titimg {
            margin: auto;
            position: relative;
            width: 60%;
            padding: 0.5rem 0;
            display: block;
        }
        .b_act {
            color: #c90319 !important;
            background: #fff !important;
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

<div class="flex-row pad-l-40 pad-r-40 bg_color_f navheight" style="align-items: center">

    <div class="flex-col texta-c px36 color_57">微拍首页</div>

</div>
<div>
    <img class="w100" src="static/images/315/img1.jpg"/>
</div>
<div>
    <img class="w100" src="static/images/315/img2.jpg"/>
</div>
<!--捡漏拍卖-->
<div class="w100 pad-b-40" style="overflow: hidden;background: #c90319">

    <img class="titimg" src="static/images/315/title1.png">
    <div class="flex-row mar-l-20 mar-r-20 mar-b-20" style="flex-direction: column">
        <a href="xiaojiangzhuanchang.aspx?source=<%=Source %>">
            <img class="w100" style="display: block" src="static/images/315/item1.png"/>
        </a>
        <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
            <div class="flex-col" style="justify-content: center">
                <div class="px32" style="text-align: center">03/10/11:00 ~ 03/11/10:59</div>
                <div class="div-h-3"></div>
                <div id="p" class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                    距结束<span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒
                </div>
                <input id="hid_start" type="hidden" value="<%=XJTime %>"/>
                <input id="hid_xjstr" type="hidden" value="<%=XJStr %>"/>
            </div>
            <div style="width: 1.6rem">
                <a href="xiaojiangzhuanchang.aspx?source=<%=Source %>">
                    <div style="background:#c90319;color: white;font-size: 0.3rem; width: 1.5rem; height: 0.48rem; border-radius: 0.1rem; line-height: 0.5rem; text-align: center">
                        点击查看
                    </div>
                </a>
                <div class="div-h-2"></div>
                <div class="px20 w100" style="text-align: center;color: #404040;text-decoration-line: underline">
                    <a href="xiaojiangtulu.aspx?source=<%=Source %>">查看拍卖作品</a>
                </div>
            </div>
        </div>
    </div>
    <div class="flex-row mar-l-20 mar-r-20 mar-b-20" style="flex-direction: column">
        <a href="mingjiatulu.aspx?source=<%=Source %>">
            <img class="w100" style="display: block" src="static/images/315/mj_item.png"/>
        </a>
        <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
            <div class="flex-col" style="justify-content: center">
                <div class="px32" style="text-align: center">03/11/11:00 ~ 03/12/10:59</div>
                <div class="div-h-3"></div>
                <div id="p2" class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                    距结束<span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒
                </div>
                 <input id="hid_start12" type="hidden" value="<%=MJTime %>"/>
                <input id="hid_xjstr2" type="hidden" value="<%=MJStr %>"/>
            </div>
            <div style="width: 1.6rem">
                <a href="mingjiazhuanchang.aspx?source=<%=Source %>">
                    <div style="background:#c90319;color: white;font-size: 0.3rem;width: 1.5rem;height: 0.48rem;border-radius: 0.1rem;line-height: 0.5rem;text-align: center">
                        点击查看
                    </div>
                </a>
                <div class="div-h-2"></div>
                <div class="px20 w100" style="text-align: center;color: #404040;text-decoration-line: underline">
                    <a href="mingjiatulu.aspx?source=<%=Source %>">查看拍卖作品</a>
                </div>
            </div>
        </div>
    </div>
    <div class="flex-row mar-l-20 mar-r-20 mar-b-20" style="flex-direction: column">
        <a href="dashitulu.aspx?source=<%=Source %>">
            <img class="w100" style="display: block" src="static/images/315/ds_item.png"/>
        </a>
        <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
            <div class="flex-col" style="justify-content: center">
                <div class="px32" style="text-align: center">03/12/11:00 ~ 03/13/10:59</div>
                <div class="div-h-3"></div>
                <div id="p3" class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                距结束<span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒                
                </div>
                 <input id="hid_start13" type="hidden" value="<%=DSTime %>"/>
                <input id="hid_xjstr3" type="hidden" value="<%=DSStr %>"/>
            </div>
            <div style="width: 1.6rem">
                <a href="dashizhuanchang.aspx?source=<%=Source %>">
                    <div style="background:#c90319;color: white;font-size: 0.3rem;width: 1.5rem;height: 0.48rem;border-radius: 0.1rem;line-height: 0.5rem;text-align: center">
                        点击查看
                    </div>
                </a>
                <div class="div-h-2"></div>
                <div class="px20 w100" style="text-align: center;color: #404040;text-decoration-line: underline">
                    <a href="dashitulu.aspx?source=<%=Source %>">查看拍卖作品</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--拍卖好礼-->
<div id="pmhl" class="w100 pad-b-40" style="overflow: hidden;background: #fff">
  <img src="static/images/315/di.jpg">
</div>  

<div class="w100 flex-row" style="position: fixed;height: 0.7rem;bottom:-1px;border-top: 1px solid #fff;max-width: 750px">
    <a class="flex-col b_itm" style="border-right: 1px solid #fff" href="xiaojiangzhuanchang.aspx?source=<%=Source %>">小匠拍卖页</a>
    <a class="flex-col b_itm" style="border-right: 1px solid #fff" href="mingjiatulu.aspx?source=<%=Source %>">名家图录页</a>
    <a class="flex-col b_itm" href="dashitulu.aspx?source=<%=Source %>">大师图录页</a>
</div>
<script src="static/js/jquery-2.1.4.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/utils.js"></script>
<script>
    //时间为一位数时显示格式为："0X"
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    //显示浏览器现在的时间
    function formatTime(timeVal) {
        var datePara = new Date(timeVal); //定义日期对象
        var yyyy = datePara.getFullYear(); //通过日期对象的getFullYear()方法返回年
        var MM = datePara.getMonth() + 1; //通过日期对象的getMonth()方法返回月
        var dd = datePara.getDate(); //通过日期对象的getDate()方法返回日
        var hh = datePara.getHours(); //通过日期对象的getHours方法返回时
        var mm = datePara.getMinutes(); //通过日期对象的getMinutes方法返回分
        var ss = datePara.getSeconds(); //通过日期对象的getSeconds方法返回秒
        // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
        MM = checkTime(MM);
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        //用于保存星期（getDay()方法得到星期编号）
        var day;
        if (datePara.getDay() == 0) day = "星期日 "
        if (datePara.getDay() == 1) day = "星期一 "
        if (datePara.getDay() == 2) day = "星期二 "
        if (datePara.getDay() == 3) day = "星期三 "
        if (datePara.getDay() == 4) day = "星期四 "
        if (datePara.getDay() == 5) day = "星期五 "
        if (datePara.getDay() == 6) day = "星期六 "

        //document.getElementById('start').value = yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss + " " + day;
        //setTimeout('formatTime()', 1000);//每一秒中重新加载formatTime()方法
        return yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss; //+ " " + day;
    }

    function getScond(d) {
        var oDate = new Date(); //获取日期对象
        var oldTime = oDate.getTime(); //现在距离1970年的毫秒数
        var newDate = new Date(d);
        var newTime = newDate.getTime(); //2019年距离1970年的毫秒数
        return Math.floor((newTime - oldTime) / 1000);
    }

    countDown(getScond($("#hid_start").val()), $("#hid_xjstr").val());

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
            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);            
        }
    }


    countDown2(getScond($("#hid_start12").val()), $("#hid_xjstr2").val());

    function countDown2(times,type) {
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
            $("#p2").html(str)
            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);
        }
    }

    countDown3(getScond($("#hid_start13").val()), $("#hid_xjstr3").val());

    function countDown3(times,type) {
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
            $("#p3").html(str)
            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);
        }
    }
    </script>
<script>
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
    // document.body.addEventListener('touchmove' , function(e){
    //     var e=e||window.event;
    //     e.preventDefault();
    // },false)
    function stopDrop() {
        var lastY; //最后一次y坐标点
        $(document.body).on('touchstart', function (event) {
            lastY = event.originalEvent.changedTouches[0].clientY; //点击屏幕时记录最后一次Y度坐标。
        });
        $(document.body).on('touchmove', function (event) {
            var y = event.originalEvent.changedTouches[0].clientY;
            var st = $(this).scrollTop(); //滚动条高度  
            if (y >= lastY && st <= 10) {//如果滚动条高度小于0，可以理解为到顶了，且是下拉情况下，阻止touchmove事件。
                lastY = y;
                event.preventDefault();
            }
            lastY = y;

        });
    }

    stopDrop();
</script>
</body>
</html>


