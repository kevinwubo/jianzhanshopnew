<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="miaosha.aspx.cs" Inherits="DTcms.Web.miaosha" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer_HD.ascx" tagname="mn_footer_HD" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>0利润秒杀</title>
	<link rel="stylesheet" href="css/wrapstyle.css" />
	<script src="js/ZRrem.js"></script>
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    <script src="js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
	<style>
	.time-bar{
		color: #999;
    font-size: 12px;
    width: 3rem;
    text-align: center;
    position: absolute;
    left: 1.2rem;
    top: 1rem;
	}
	.time-bar span{
		color: #ae002b;
		margin:0 0.1rem
	}
	.auth-bar{
		width: 50%;
    position: absolute;
    right: 0;
    top: 1rem;
    color: #666;
	}
	.auth-bar span{
		margin-right: 0.5rem;
		font-size: 0.3rem;
		color:#999
	}
	</style>
</head>

<body style="height: 100%;background:#ae002b">
	<div class="index-page wrap">
		<div class="banner">
			<img src="images/ms0.jpg" alt="">
		</div>
        <% if(Model!=null)
        {
         %>
		<div class="con">
			<div class="con-fl1">
				<img src="images/ms1.png" alt="">
			</div>
			<div class="con-fl3">
				<div class="tit" style="overflow: hidden;height: 6.6rem;width: 100%;background: url(./images/ms3.png);background-size: 100%;position: relative;">
					<div class="time-bar" style="color:#999;font-size: 12px;width: 3rem; text-align: center">
						<div>距离开始</div>
						<div id="p"></div>
					</div>
					<div class="auth-bar">
						<div><%=Model.ProductName %></div>
						<div>作者：<%=Model.Author %></div>
						<div style="height:1px;width:2.4rem;background: #999"></div>
						<div style="margin-top:0.1rem"><span>ID: <%=Model.ProductID %></span><span>口径: <%=Model.Volume %></span></div>
						<div><span>器型: <%=Model.Type3 %></span><span>釉色: <%=Model.Type2 %></span></div>
							<div style="margin-top: 0.05rem;color: #ae002b;font-size: 0.45rem;text-decoration:line-through">原价 : <%=Model.MarketPrice %>元</div>
					</div>
					<img style="height: 2.8rem;width: auto;position: absolute;top: 1.7rem;left: 0.8rem;" src="<%=Model.Images %>"/>
	
					<div style="position: absolute;width: 4rem;bottom:0.8rem;margin: auto;left: 0;right: 0;height:auto;"  >
                    <input type="text" placeholder="输入手机号 点击看秒杀价" id="txt_keywords" style="width:137px;height:23px;border:1px solid #ff6a00;padding:0px;margin-top:40px;margin-left:5px;" >
                    <img onclick="javascript:xunjia('<%=Model.ProductName %>','<%=Model.ProductID %>')" src="./images/ms2.png" /></div>
					<div style="color: black;text-align: center;font-size: 10px;bottom: 0.4rem;position: absolute;width: 100%;">0利润价格太低，不便公开，留言后1分钟内回复</div>
				</div>
			</div>
			<div class="con-fl1">
					<img src="images/ms4.png" alt="">
			</div>
			<div style="background:#ae002b">
				<div style="background: white;margin:0 0.2rem 0.2rem;padding: -0.8rem;font-size: 0.2rem"> <%=Model.summary.Replace("900","720")%>             
                    <%=Model.ProImageDetail%></div>
				
			</div>
			<div class="con-fl1">
<%--					<img style="padding:0rem 2%;width: 96%;" src="./images/ms5.png"/>
					<img style="padding:0rem 2%;width: 96%;" src="./images/ms6.png"/>
					<img style="padding:0rem 2%;width: 96%;" src="./images/ms5.png"/>--%>
					<div style="color:white;text-align: center;font-size: 12px;height: 1rem;line-height: 1rem">查看实物视频请联系客服</div>
			</div>
		</div>
        <%}else
        { %>
        		<div class="con">
			<div class="con-fl1">
				<img src="images/ms1.png" alt="">
			</div>
			<div class="con-fl3">
				<div class="tit" style="overflow: hidden;height: 6.6rem;width: 100%;background: url(./images/ms3.png);background-size: 100%;position: relative;">
					<div class="time-bar" style="color:#999;font-size: 12px;width: 3rem; text-align: center">
						<div>距离开始</div>
						<div id="p"></div>
					</div>
					<div class="auth-bar">
						<div>【建盏名称】</div>
						<div>作者：-----</div>
						<div style="height:1px;width:2.4rem;background: #999"></div>
						<div style="margin-top:0.1rem"><span>ID: -----</span><span>口径: -----</span></div>
						<div><span>器型: -----</span><span>釉色: -----</span></div>
							<div style="margin-top: 0.05rem;color: #ae002b;font-size: 0.45rem;text-decoration:line-through">原价 : XXXX元</div>
					</div>
					<img style="height: 2.5rem;width: auto;position: absolute;top: 1.8rem;left: 0.7rem;" src="images/14746.png"/>
	
					<div style="position: absolute;width: 4rem;bottom:0.8rem;margin: auto;left: 0;right: 0;height:auto;"  >
                    <input type="text" placeholder="输入手机号 点击看秒杀价" id="Text1" style="width:137px;height:23px;border:1px solid #ff6a00;padding:0px;margin-top:40px;margin-left:5px;" >
                    <img onclick="javascript:xunjia('秒杀','0')" src="./images/ms2.png" /></div>
					<div style="color: black;text-align: center;font-size: 10px;bottom: 0.4rem;position: absolute;width: 100%;">0利润价格太低，不便公开，留言后1分钟内回复</div>
				</div>
			</div>
			<div class="con-fl1">
					<img src="images/ms4.png" alt="">
			</div>
			<div style="background:#ae002b">
            <% if(Model!=null)
            { %>
				<div style="background: white;margin:0 0.2rem 0.2rem;padding: -0.8rem;font-size: 0.2rem"> <%=Model.summary.Replace("900","720")%>             
                    <%=Model.ProImageDetail%></div>
			<%} %>	
			</div>
			<div class="con-fl1">
<%--					<img style="padding:0rem 2%;width: 96%;" src="./images/ms5.png"/>
					<img style="padding:0rem 2%;width: 96%;" src="./images/ms6.png"/>
					<img style="padding:0rem 2%;width: 96%;" src="./images/ms5.png"/>--%>
					<div style="color:white;text-align: center;font-size: 12px;height: 1rem;line-height: 1rem">查看实物视频请联系客服</div>
			</div>
		</div>
        <%} %>
	</div>
	<div style="height:4rem"></div>
	<div class="footerlink-ms">
		<a href="1111.html" class="mr-1">双11主会场</a>
		<a href="guzhe.html" class="mr-1">骨折活动</a>
		<a href="dashi.html" class="mr-1">大师展</a>
		<a href="zhibo.html" class="mr-1">大师直播</a>
	</div>
    <%--<div class="footer" style="height: 18rem;
    bottom: 0;
    position: fixed;z-index: 999">
		<!-- 快速查询 -->
		<uc1:mn_footer_HD ID="mn_footer_HD1" runat="server" />
	</div>--%>
    <div id='menumark' style="display: none"></div>
    <script>

        function xunjia(ProductName, ProductID) {
            var productid = ProductID;
            var type = "Tel";
            var txtvalue = $("#txt_keywords").val();
            var inquiryType = "询价";
            if (txtvalue == "") {
                alert('请输入您的手机号码');
                return false;
            }
            if (!isPhoneNo(txtvalue)) {
                alert('请输入正确的手机号码');
                return false;
            }

            $.post("ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType, SourceForm: "MB" }, function (result) {
                tprm = "ProductID=" + productid + "&phone=" + getRandomString(1) + TelJM(txtvalue) + getRandomString(1);
                __ozfac2(tprm, "#inquiryok");
                alert(result);
            });
        }

        // 验证手机号
        function isPhoneNo(phone) {
            var pattern = /^1[34578]\d{9}$/;
            return pattern.test(phone);
        }

        // 获取长度为len的随机字符串
        function getRandomString(len) {
            len = len || 32;
            var $chars = 'ABCDEFGHJKMNPQRSTWXYZ'; // 默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1
            var maxPos = $chars.length;
            var pwd = '';
            for (i = 0; i < len; i++) {
                pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
            }
            return pwd;
        }

        $('#menumark').click(function () {
            // $(".footer").animate({ bottom: '0rem' }, "slow", function () {
            $("#menumark").css("display", "none");
            $("#ksplane").css("display", "none");
            // });

        })

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

         document.getElementById("p").innerHTML = "<span id='time_h'>" + d + "</span>天<span id='time_h'>" + m + "</span>分<span id='time_h'>" + s + "</span>秒";
         if (t < 0) {
             clearTimeout(GetRTime);
             return false;
         }
         setTimeout(GetRTime, 1000);
     }
     GetRTime();
     </script>
</body>

</html>