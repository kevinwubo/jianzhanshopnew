<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mn_footer_HD.ascx.cs" Inherits="DTcms.Web.UserControl.mn_footer_HD" %>
<script src="/js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/public.js" type="text/javascript" charset="utf-8"></script>
<div id="ksplane" style="height: 6.5rem;background: #fff;display: none">
			<div class="zx-title"><span id="p_productname"></span>“点击询价”
				<span style="float: right;margin-right:3%">(10分钟内回复)</span>
			</div>
			<div class="head-p-search" style="width: 94%; margin-left: 3%;">
            <input type="hidden" id="hid_productid" value="Mobile" />
				<input type="text" placeholder="请输入你的手机号码" id="txt_keywords"  class="col_33">
				<!-- <label style="width: 20%; line-height: 1rem">确定</label> -->
				<img style="width: 28%; line-height: 1rem;margin-left: 0.24rem"; id="div_submit" src="/images/xunwen.png"> 
			</div>
			<div class="zx-title">快速直线:
				<span style="color: red">4008-276-376</span>
			</div>
			<div class="about-tag-plane">
				<ul id=about-tag-list class="about-tag-list">
				  <li class="about-tag-item">
					 <a href="/mn_fwbz.html"> 
					  <div class="btn-on">名家直销</div>
					 </a> 
				  </li>
				  <li class="about-tag-item">
					 <a href="/mn_fwbz.html"> 
					  <div>一手货源</div>
					 </a> 
				  </li>
				  <li class="about-tag-item">
					 <a href="/mn_fwbz.html"> 
					  <div>铁胎建盏</div>
					 </a> 
				  </li>
				  <li class="about-tag-item">
					 <a href="/mn_fwbz.html"> 
					  <div>破损补发</div>
					 </a> 
				  </li>
				  <li class="about-tag-item">
					 <a href="/mn_fwbz.html"> 
					  <div>实物视频</div>
					 </a> 
				  </li>
				  <li class="about-tag-item">
				   <a href="/mn_fwbz.html"> 
					  <div>保真承若</div>
					</a>
				  </li>
				  <li class="about-tag-item">
				   <a href="/mn_fwbz.html"> 
					  <div>赝品赔付</div>
					</a>
				  </li>
				  <li class="about-tag-item">
					<a href="/mn_fwbz.html"> 
					  <div>15天退换</div>
					</a>
				  </li>
				</ul>
			  </div>
		</div>

<script type="text/javascript">


    var tabindex = 0;
    var iskuaishu = false;
    var iszaixian = false;
    var mySwiperstop1;
    var mySwiperstop2;
    var mySwiperstop3;

    // 点击快速查询
    $('#kuaishu').click(function () {
        iskuaishu = true;
        $("#menumark").css("display", "block");
        $("#ksplane").css("display", "block");
        $("#zxplane").css("display", "none");
        $(".footer").animate({ bottom: '6.8rem' }, "slow", function () {
            // $(this).css("display", "none");
        });
    })

    function copyTelephone() {        
        var val = document.getElementById('Telephone');
        window.getSelection().selectAllChildren(val);
        document.execCommand("Copy");
        alert("复制成功，可添加微信");
    }

    //点击隐藏在线咨询面板或拨号面板
    $('#menumark').click(function () {
        
        if (iskuaishu) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#ksplane").css("display", "none");
            });
            iskuaishu = false;
        }
        if (iszaixian) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#zxplane").css("display", "none");
            });
            iszaixian = false;
        }
    })


    $('.store-title').children().each(function (index, node) {
        $(this).click(function () {
            $('.store-title').children().eq(tabindex).removeClass('initStyle');
            $('.store-title').children().eq(tabindex).children().eq(0).removeClass('initStyle');
            $('.store-detail').children().eq(tabindex).removeClass('initStyle');
            tabindex = index;
            $('.store-detail').children().eq(tabindex).addClass('initStyle');
            $(this).addClass('initStyle');
            $(this).children().eq(0).addClass('initStyle');
        })
    })

    //列表按钮询价
    function xunjia(name, productid) {
        iskuaishu = true;
        //        $("#txt_keywords").val("");
        //        $("#txt_keywords1").val("");
        //        $("#div_footer").show();
        //        $("#menumark").css("display", "block");
        //        $("#ksplane").css("display", "block");
        $("#menumark").css("display", "block");
        $("#ksplane").css("display", "block");
        $("#hid_productid").val(productid);
        $("#p_productname").text(name);
        //        $(".footer").animate({ bottom: '6.8rem' }, "slow", function () {
        // $(this).css("display", "none");
        //});
    }
    // 拨号面板取消按钮事件
    function cancle() {
        $('#lexian').hide()
    }
    //弹出拨打电话面板
    function showLeXian() {
        $('#lexian').show()
    }	
</script>


<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?e968a714e805c74070bded410d401f1b";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
			
        <script type="text/javascript">
            $.post("ajax/wxcode.aspx", function (result) {
                jQuery("#Telephone").text(result);
            });

            var arrplaceholder = "请输入您的手机号码";
            $("txt_keywords").blur(function () {
                $(this).prop("placeholder", arrplaceholder)
            });
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

            $("#div_submit").bind("click", function (e) {
                var inProductid = $("#hid_productid").val();
                var productid = inProductid != "" ? inProductid : "Mobile";
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

                $.post("ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType,SourceForm:"MB" }, function (result) {
                    tprm = "ProductID=" + productid + "&phone=" + getRandomString(1) + TelJM(txtvalue) + getRandomString(1);
                    __ozfac2(tprm, "#inquiryok");
                    alert(result);
                    $("#zxplane").hide();
                    $("#ksplane").hide();
                    $("#menumark").click();
                    $("#menumark").hide();
                    $("#txt_keywords").val("");
                });
            });
            
        </script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?20147c6539544fa3036d0d5c894132a8";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
