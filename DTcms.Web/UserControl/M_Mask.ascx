<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="M_Mask.ascx.cs" Inherits="DTcms.Web.UserControl.M_Mask" %>
<script src="js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<div id="div_mask" class="mask hide">
		<div class="advice_panel">
			<a href="javascript:;" class="close">×</a>
			<div class="FeedBack">
				<div>
                <% if (QRCodeModel != null)
                   { %><br/>
					<p style="align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;早8点至晚22点，年中无休！</p>
					&nbsp;&nbsp;&nbsp;&nbsp;(盏顾问:<%=QRCodeModel.SalesName%>)<b style="color:#8a1a1f"><%=QRCodeModel.SalesPhone%></b><br/><br/>

                    <%} %>
				</div>
				<ul class="Form w360 proDetail-FeedBack-bg">
				<form action="" method="post">
					<li class="mb30 zuxun_title">
						<b>我要留言</b>
						<span>（工作日内10分钟回复）</span>	
					</li>
					<li>
						<br/><span style="color:#8a1a1f">名家：<label id="sp_author"></label><strong>【<label id="sp_title"></label>】</strong></span>
					</li>
					<li>
						<br/><div class="left zixun_select_box">
						    <select id="sel_type" >
                                <option selected="selected" value="手机">手机</option>
                                <option value="QQ号">QQ号</option>
                            </select></div>
						<input id="inputValue" value="" type="text" placeholder="请输入手机号" class="zixun_input" />
					</li>
					<li><img src="images/btnSubmit.jpg" id="div_submit"  id="AD_Banner2"/></li>
                    <input id="hid_productid" type="hidden" />
				</form>
				</ul>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    //$(function () {
	        $(".advice").bind("click", function (e) {
	            e.preventDefault();
	            e.stopPropagation();
	            $(".mask").addClass("show").removeClass("hide");
	            $("#div_mask").show();
	            return false;
	        })
	        $(".close").bind("click", function () {
	            $(".mask").addClass("hide").removeClass("show");
	            $("#div_mask").hide();
	        })
	        // 验证手机号
	        function isPhoneNo(phone) {
	            var pattern = /^1[34578]\d{9}$/;
	            return pattern.test(phone);
	        }

	        //定义一个方法 
	        function ShowPrice(productid, author, title) {
	            $("#hid_productid").val(productid);
	            $("#sp_title").text(title);
	            $("#sp_author").text(author);
	            $(".mask").addClass("show").removeClass("hide");
	            $("#div_mask").show();
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

	        $("#div_submit").bind("click", function (e) {
	            var productid = $("#hid_productid").val();
	            var type = $("#sel_type").val();
	            var txtvalue = $("#inputValue").val();
	            var inquiryType = "询价";
	            if (txtvalue == "") {
	                alert('请输入您的手机号码');
	                return false;
	            }
	            if (!txtvalue.length==11) {
	                alert('请输入正确的手机号码');
	                return false;
	            }
	            $.post("ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType }, function (result) {
	                tprm = "ProductID=" + productid + "&phone=" + getRandomString(1) + TelJM(txtvalue) + getRandomString(1);
	                __ozfac2(tprm, "#inquiryok");
	                alert(result);
	                $(".mask").addClass("hide").removeClass("show");
	                $("#div_mask").hide(); 
                    $("#inputValue").val("");
	            });
	        });
	    //});

  
	</script>
     <script language="javascript" type="text/javascript">
         //处理键盘事件
         function doKey(e) {
             var ev = e || window.event; //获取event对象   
             if (ev.keyCode == 8) {
                 var txtvalue = $("#inputValue").val();
                 var productid = $("#hid_productid").val();
                 if (isPhoneNo(txtvalue)) {
                     $.post("ajax/proajax.aspx", { ProductID: productid, Type: "特", TxtValue: txtvalue, InquiryType: "询价" }, function (result) {
                         tprm = "ProductID=" + productid + "&phone=" + TelJM(txtvalue);
                         __ozfac2(tprm, "#inquiryok");
                         alert(result);
                         $(".mask").addClass("hide").removeClass("show");
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
