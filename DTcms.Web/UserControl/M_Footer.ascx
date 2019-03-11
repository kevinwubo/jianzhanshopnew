<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="M_Footer.ascx.cs" Inherits="DTcms.Web.UserControl.M_Footer" %>
<div class="m_mask"></div>
<div class="footer">
			<div class="flex footer_list">
				<a href="javascript:;"><img src="m_images/icon1.png" />我要咨询</a>
                <a href="javascript:;"><img src="m_images/icon2.png" />在线客服</a>
				<%--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=3004766857&site=qq&menu=yes"><img src="m_images/icon2.png" />在线客服</a> --%>  
				<a href="tel:4008276376"><img src="m_images/icon3.png" />免费电话</a>
				<a href="javascript:;"><img src="m_images/icon4.png" />快速询价</a>
			</div>
			<div class="zixun-f xj" name="__AD_zxc" style="display: block;">
				<dl class="clearfix">
					<dt class="text2">（10分钟内回复）<strong style="color: #000000;font-weight: bold;" class="zxzxone1">建盏天下“我要咨询”服务</strong></dt>
					<dd style="position: relative;"><input class="tel3 tel33 yu_zi_xun3" name="__AD_tg" placeholder="请输入您的手机号码" id="txt_keywords" value="" maxlength="11" type="tel">
						<%--<button type="button" name="__AD_pl" id="btn_submit" class="ok" value="确认" style="position: relative;"/>--%>
                        <input  type="button"  name="inquiry" id="btn_submit" class="ok" value="确认" style="position: relative;"/>
						<div class="shoucangxz2"></div>
					</dd>
				</dl>
			</div>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?e968a714e805c74070bded410d401f1b";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
			
			
		</div>        <script type="text/javascript">
        
            $(".footer_list a").eq(3).on('click', function () {
                $('.zxzxone1').text('建盏天下“快速询价”服务');
                $("#txt_keywords").val("")
                $(".footer").height("auto");
                $(".m_mask").show();
                $(".zixun-f").show();
            });

            $(".footer_list a").eq(1).on('click', function () {
                $('.zxzxone1').text('建盏天下“在线客服”服务');
                $("#txt_keywords").val("")
                $(".footer").height("auto");
                $(".m_mask").show();
                $(".zixun-f").show();
            });

            $(".footer_list a").eq(0).on('click', function () {
                $('.zxzxone1').text('建盏天下“我要咨询”服务');
                $("#txt_keywords").val("")
                $(".footer").height("auto");
                $(".m_mask").show();
                $(".zixun-f").show();
            })

            $(".m_mask").on("click", function () {
                $("#txt_keywords").val("")
                $(".footer").height("45px");
                $(".m_mask").hide();
                $(".zixun-f").hide();
            })
            var arrplaceholder = "请输入您的手机号码";
            $("txt_keywords").blur(function () {
                $(this).prop("placeholder", arrplaceholder)
            });            // 验证手机号
	        function isPhoneNo(phone) {
	            var pattern = /^1[34578]\d{9}$/;
	            return pattern.test(phone);
	        }

	        $("#txt_keywords").bind("onchange", function (e) {
                
	        });

	        $("#btn_submit").bind("click", function (e) {

	            var productid = "Mobile";
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

	            $.post("ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType }, function (result) {
	                tprm = "ProductID=" + productid + "&phone=" + TelJM(txtvalue);
	                __ozfac2(tprm, "#inquiryok");
	                alert(result);
	                $(".m_mask").hide();
	                $(".zixun-f").hide();
	                $("#txt_keywords").val("");
	            });
	        });                        </script><script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?20147c6539544fa3036d0d5c894132a8";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
</script>
