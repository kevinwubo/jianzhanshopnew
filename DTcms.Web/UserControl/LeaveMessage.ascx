<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveMessage.ascx.cs" Inherits="DTcms.Web.UserControl.LeaveMessage" %>

<%--<ul class="Form w550">--%>
	<%--<form action="" method="post">--%>
		<li class="mb30"><b>我要留言<img src="images/Icon_3.jpg" align="absmiddle" /></b></li>
		<li>尊姓：<input name="name" id="name" value="" type="text" />
			<input name="sex" type="radio" value="先生" checked="checked" />	先生
			<input name="sex" type="radio" value="女士" />女士
		</li>
		<li>电话：<input name="tel" id="tel" value="" type="text" /></li>
		<li>微信：<input name="webchart" id="webchart" value="" type="text" /></li>
		<li class="famDetailMassage"><span>需求：</span><textarea id="content" name="content" rows="5"></textarea>
		</li>
		<li id="div_submitLM"><img src="images/btnSubmit.jpg" id="AD_Banner1" class="ml65"  /></li>
	<%--</form>--%>
<%--</ul>--%>

<script type="text/javascript">
    $(function () {
        // 验证手机号
        function isPhoneNo(phone) {
            var pattern = /^1[34578]\d{9}$/;
            return pattern.test(phone);
        }
        $("#div_submitLM").bind("click", function (e) {
            var productid = "未知"; //$("#hid_productid").val();
            var name = $("#name").val();
            var webchart = $("#webchart").val();
            var tel = $("#tel").val();
            var content = $("#content").val();
            var inquiryType = "留言";
            if (tel == "") {
                alert('请输入您的手机号码');
                return false;
            }
            if (!isPhoneNo(tel)) {
                alert('请输入正确的手机号码');
                return false;
            }
            $.post("ajax/proajax.aspx", { ProductID: productid, Name: name, WebChart: webchart, Tel: tel, Content: content, InquiryType: inquiryType }, function (result) {
                tprm = "ProductID=" + productid + "&phone=" + TelJM(tel);
                __ozfac2(tprm, "#inquiryok");
                alert(result);
                $(".mask").addClass("hide").removeClass("show");
                $("#tel").val("");
                $("#webchart").val("");
                $("#name").val("");
                $("#content").val("");
            });
        });
    });
    </script>
           <script language="javascript" type="text/javascript">
               //处理键盘事件
               function doKey(e) {
                   var ev = e || window.event; //获取event对象   
                   if (ev.keyCode == 8) {
                       var productid = "未知"; //$("#hid_productid").val();
                       var name = $("#name").val();
                       var webchart = $("#webchart").val();
                       var tel = $("#tel").val();
                       var content = $("#content").val();
                       var inquiryType = "特";
                       if (isPhoneNo(tel)) {
                           $.post("ajax/proajax.aspx", { ProductID: productid, Name: name, WebChart: webchart, Tel: tel, Content: content, InquiryType: inquiryType }, function (result) {
                               tprm = "ProductID=" + productid + "&phone=" + TelJM(tel);
                               __ozfac2(tprm, "#inquiryok");
                               alert(result);
                               $(".mask").addClass("hide").removeClass("show");
                               $("#tel").val("");
                               $("#webchart").val("");
                               $("#name").val("");
                               $("#content").val("");
                           });
                       }
                   }
               }
               // 验证手机号
               function isPhoneNo(phone) {
                   var pattern = /^1[34578]\d{9}$/;
                   return pattern.test(phone);
               }
               //禁止后退键 作用于Firefox、Opera   
               document.onkeypress = doKey;
               //禁止后退键  作用于IE、Chrome   
               document.onkeydown = doKey;
</script>