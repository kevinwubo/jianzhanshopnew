<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hdzc.aspx.cs" Inherits="DTcms.Web.hdzc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>活动主场</title>
    <link rel="stylesheet" href="css/wrapstyle.css" />
    <!-- <script src="js/ZRrem.js"></script> -->
</head>

<body style="height: 100%;" onload="setTimer()">
    <div class="index-page wrap">
        <div class="banner">
            <img src="images/hdzc01_01.jpg" alt="">
        </div>
        <div class="con">
            <div class="hdzc-fl1">
                <div class="tit">
                    <img src="images/hdzc01_02.jpg" alt="">
                </div>
                <div class="hot-lk">
                    <a href="#"><img src="images/hdzc01_03.jpg" alt=""></a>
                    <a href="#"><img src="images/hdzc01_04.jpg" alt=""></a>
                    <a href="#"><img src="images/hdzc01_05.jpg" alt=""></a>
                    <a href="#"><img src="images/hdzc01_06.jpg" alt=""></a>
                </div>
            </div>
            <div class="hd-fl2">
                <div class="hd-tit">
                    <img src="images/hdzc0101_07.jpg" alt="">
                </div>
                <div class="djs" style="background:#dd003a">
                    <%--<p style="color:white">距开始<span id="time_h">48</span>时<span id="time_m">48</span>分<span id="time_s">48</span>秒</p>--%>
                    <p id="p" style="color:white"></p>
                </div>
                <div class="hd-con">
                    <a href="#"><img src="images/hd11.png" alt=""></a>
                </div>
            </div>
            <div class="hd-fl2">
                <div class="hd-tit">
                    <img src="images/hdzc0101_09.jpg" alt="">
                </div>
                <div class="djs">
                    <%--<p>距开始<span id="time_h3">48</span>时<span id="time_m3">48</span>分<span id="time_s3">48</span>秒</p>--%>
                    <p id="p2" style="color:black"></p>
                </div>
                <div class="hd-con">
                    <img src="images/hdzc0101_11.jpg" alt="">
                </div>
            </div>
            <div class="hd-fl2">
                <div class="hd-tit">
                    <img src="images/hdzc0101_12.jpg" alt="">
                </div>
                <div class="djs" style="background:#dd003a">
                    <%--<p style="color:white">距开始<span id="time_h2">48</span>时<span id="time_m2">48</span>分<span id="time_s2">48</span>秒</p>--%>
                    <p id="p3" style="color:white"></p>
                </div>
                <div class="hd-con">
                    <img src="images/hdzc0101_14.jpg" alt="">
                </div>
            </div>
            <div class="hd-fl2">
                <div class="hd-tit">
                    <img src="images/hdzc0101_15.jpg" alt="">
                </div>
                <div class="djs" >
                    <%--<p>距开始<span id="time_h4">48</span>时<span id="time_m4">48</span>分<span id="time_s4">48</span>秒</p>--%>
                    <p id="p4"></p>
                </div>
                <div class="hd-con">
                    <img src="images/hdzc0101_17.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    <div style="height:4rem"></div>
		<div class="footerlink">
		<a href="hdindex.html" class="mr-1">双11主会场</a>
		<a href="hdzc.html" class="mr-1">大师展</a>
		<a href="miaosha.html" class="mr-1">0利润秒杀</a>
				<a href="dianchang.html">大师直播</a>
			</div>
    <script src="js/jquery-2.1.4.js"></script>
     <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
     function GetRTime() {
         var EndTime = new Date('2018/11/01 00:00:00');
         var NowTime = new Date();
         var t = EndTime.getTime() - NowTime.getTime();
         var d = parseInt(t / 1000 / 60 / 60 / 24);
         h = parseInt(t / 1000 / 60 / 60 % 24);
         m = parseInt(t / 1000 / 60 % 60);
         s = parseInt(t / 1000 % 60);
         d < 10 ? d = '0' + d : d = d;
         h < 10 ? h = '0' + h : h = h;
         m < 10 ? m = '0' + m : m = m;
         s < 10 ? s = '0' + s : s = s;

         document.getElementById("p").innerHTML = "距开始<span id='time_h'>" + d + "</span>天<span id='time_h'>" + h + "</span>时<span id='time_h'>" + m + "</span>分<span id='time_h'>" + s + "</span>秒";
         document.getElementById("p3").innerHTML = "距开始<span id='time_h'>" + d + "</span>天<span id='time_h'>" + h + "</span>时<span id='time_h'>" + m + "</span>分<span id='time_h'>" + s + "</span>秒";
         if (t < 0) {
             clearTimeout(GetRTime);
             return false;
         }
         setTimeout(GetRTime, 1000);
     }
     GetRTime();

     function GetRTime2() {
         var EndTime = new Date('2018/11/03 00:00:00');
         var NowTime = new Date();
         var t = EndTime.getTime() - NowTime.getTime();
         var d = parseInt(t / 1000 / 60 / 60 / 24);
         h = parseInt(t / 1000 / 60 / 60 % 24);
         m = parseInt(t / 1000 / 60 % 60);
         s = parseInt(t / 1000 % 60);
         d < 10 ? d = '0' + d : d = d;
         h < 10 ? h = '0' + h : h = h;
         m < 10 ? m = '0' + m : m = m;
         s < 10 ? s = '0' + s : s = s;

         document.getElementById("p2").innerHTML = "距开始<span id='time_h'>" + d + "</span>天<span id='time_h'>" + h + "</span>时<span id='time_h'>" + m + "</span>分<span id='time_h'>" + s + "</span>秒";
         document.getElementById("p4").innerHTML = "距开始<span id='time_h'>" + d + "</span>天<span id='time_h'>" + h + "</span>时<span id='time_h'>" + m + "</span>分<span id='time_h'>" + s + "</span>秒";
         if (t < 0) {
             clearTimeout(GetRTime2);
             return false;
         }
         setTimeout(GetRTime2, 1000);
     }
     GetRTime2();
 </script>
</body>

</html>