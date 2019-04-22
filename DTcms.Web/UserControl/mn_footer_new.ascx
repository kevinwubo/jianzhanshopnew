<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mn_footer_new.ascx.cs" Inherits="DTcms.Web.UserControl.mn_footer" %>
<script src="/js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/public.js" type="text/javascript" charset="utf-8"></script>
<style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .color_red_c9 {
            color: #c90319;
        }

        .ssbtn {
            width: 1rem;
            background: #c90319;
            color: white;
            height: .56rem;
            line-height: .56rem;
            text-align: center;
            border-radius: 0 3px 3px 0;
        }

        .search {
            background: #f7f7f7;
            height: 0.56rem;
            border-radius: 3px;
        }

        .ssbtnzx {
            width: 2rem;
            background: #c90319;
            color: white;
            height: .7rem;
            line-height: .7rem;
            text-align: center;
            border-radius: 0 3px 3px 0;
        }

        .searchzx {
            background: #f7f7f7;
            height: 0.7rem;
            border-radius: 3px;
        }

        .banner {
            overflow: hidden;
            border-radius: 5px;
            margin: .256rem;
        }

        .banner img {
            width: 100%;
        }

        .part1 {
            background: white;
            padding: 0.256rem;
            border-top: .1rem solid #f7f7f7;
        }

        .list {
            overflow: hidden;
            height: 7rem;
            position: relative;
        }

        .list .item {
            text-align: center;
            width: 33.3%;
            float: left;
            height: 3.3rem;
            margin-top: .2rem
        }

        .list .item .t1 {
            margin-top: .2rem;
            font-size: .18rem;
        }

        .list .item .pimg {
            height: 1.4rem;
            margin-top: .1rem;
            width: 100%;
            background-size: 128% !important;
            background-position: center !important;
        }

        .bt-zx {
            margin-top: .2rem;
            width: 1.34rem;
            height: .5rem;
        }
        /* 大师推荐 */
        .list1 {
            overflow: hidden;
            height: 14.1rem;
            position: relative;
        }

        .list1 .item1 {
            text-align: center;
            width: 50%;
            float: left;
            height: 4.5rem;
            margin-top: .2rem
        }

        .list1 .item1 .t1 {
            margin-top: .2rem;
            font-size: .18rem;
        }

        .list1 .item1 .pimg {
            height: 2.5rem;
            /* margin-top: .1rem; */
            width: 100%;
            background-size: 128% !important;
            background-position: center !important;
        }
        .swiper_container_suz2 {
            width: 100%;
            /* padding-left:3%; */
            height: 4.2rem;
            overflow: hidden;
            position: relative;
            background: white;
        }

        .swiper_container_suz2 .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            line-height: 1.3rem;
            height: 4.2rem;
            margin-top: 0rem;
            position: relative;
            /*-webkit-transform:scale(0.8);*/
        }
        .swiper_container_suz2 .swiper-slide img {
            width: 100%;
            height:auto;
            display: block;
        }
        /* 名家 */
    
		#swiper-container-star {
			width: 100%;
			height: 3.6rem;
		}

		#swiper-container-star a {
			display: inline-block;
			width: 100%;
			height: 100%;
		}

		#swiper-container-star a img {
			width: 100%;
			height: 2.6rem;
		}
		#swiper-container-star a #headimg {
			width: 100%;
			height: 2.6rem;
		}

		.star-describe {
			width: 100%;
			height: 1rem;
			background-color: white;
			text-align: center;
			overflow: hidden;
		}

		.star-describe p:nth-child(1) {
			font-size: 0.37rem;
			line-height: 0.37rem;
			color: #cc3333;
			padding-top: 0.106rem;
			padding-bottom: 0.106rem;
		}

		.star-describe p:nth-child(2) {
			font-size: 0.26rem;
			line-height: 0.26rem;
			color: #333333;
		}

		.store{
            margin-top: .35rem;
            height: auto;
            border: 1px solid #ccc;
            background: #f7f7f7;
            border-radius: 15px;
        }
        #menupart {
			height: 100%;
			width: 80%;
			position: fixed;
			top: 0;
			left: 0;
			z-index: 99;
		}

        #menumark{
            height: 100%;
            width: 100%;
            position: fixed;
            top: 0;
            left:0;
            background: rgba(99, 99, 99, 0.5);
            z-index: 98;
        }
        #menupart .menu-body{
            position: absolute;
            right: 0;
            top: 0;
            background: #fff;
            width: 100%;
            height: 100%;
            overflow: auto;
            padding-top: 1.2rem;
            padding-bottom: 1.06rem;
            box-sizing: border-box;
            padding-left: .2rem;
            padding-right: .2rem;
        }
        .menu-cate-part{
            width: 100%;
            position: relative;
            text-align: center;
        }
        .menu-cate-title{
            height: .7rem;
            position: relative;
            line-height: .7rem;
            font-size: 0.24rem;
            background: white;
            margin: auto;
            width: 1.5rem;
            z-index: 1;
        }
        .cate-list{
            background: #fff;
            overflow: hidden;
        }
        .cate-list .item{
            float: left;
            width: 33.3%;
        }
        .cate-list .item div{
            height: 0.6rem;
            line-height: 0.6rem;
            text-align: center;
            font-size: 0.22rem;
            color: #666;
            margin: .15rem;
            background: #f6f6f6;
            border: 1px solid #e6e6e6;
        }
        .back-tag {
            border-top: 1px solid #c90319;
            border-left: 1px solid #c90319;
            height: 0.15rem;
            width: 0.15rem;
            float: right;
            margin: .15rem .15rem;
            transform: rotate(315deg);
            -o-transform: rotate(315deg);
            -webkit-transform: rotate(315deg);
            -moz-transform: rotate(315deg);
        }   
        .line{
            width: 100%;
            height: 1px;
            background: #f0f0f0;
            position: absolute;
            top: 16px;
        }
        .w_50{
            width: 50% !important;
        }
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
        .px22{
            font-size: .22rem
        }
        .totop {
            position: fixed;
            height: auto;
            z-index: 99999;
            top: 8.5rem;
            right: 0.4rem;
        }
        .swiper-container {
            width: 100%;
            height: 8.5rem;
        } 
        /*包裹自定义分页器的div的位置等CSS样式*/
        .swiper-pagination-custom {
bottom: .3rem
        }
        /*自定义分页器的样式，这个你自己想要什么样子自己写*/
        .swiper-custom {
            width: .1rem;
            height: .1rem;
            display: inline-block;
            background: #666;
            opacity: .3;
            margin: 0 5px;
            border-radius: 50%;
            margin: 0 .3rem
        }
        /*自定义分页器激活时的样式表现*/
        .swiper-custom-active {
            opacity: 1;
            width: 1.2rem;
            background-color: #F78E00;
        }
    </style>

<div class="tk-mark" id="tixing" style="display:none">
        <div class="gmkuang">
            <div class="flex-row" style="justify-content: center">
                <div class="flex-col"></div>
                <img style="height:0.93rem" src="../static/images/xiaojiang/logo.png">
                <div class="flex-col">
                    <div class="mar-r-40 px24" style="color:#999;display: initial;float: right;" onclick="hideTiXing()">关闭
                    </div>
                </div>
            </div>
            <div class="flex-row mar-t-40" style="margin-left: 1rem;align-items: baseline;justify-content: left;">
                <div class="px24">咨询建盏:</div>
                <div class="mar-l-16 px22 color_9"><span id="p_productname"></span>“看作品价格”</div>
                <div class="color_9 mar-l-16 px22">（10分钟内回复）</div>
            </div>

            <div class="flex-row mar-t-40" style="margin-left: 1rem;align-items: center;justify-content: left;">
                <div class="px24">手机号码:</div><input type="hidden" id="hid_productid" value="Mobile" />
                <input placeholder="请输入您的手机号码"   id="txt_telephone" class="mar-l-20" style="width: 3.8rem;;border: 1px solid #f6f6f6;padding-left: 0.2rem;text-align: left;height: 0.5rem">

            </div>
            <div id="div_submit" style="color:#fff;background:#c90319;height: .6rem;margin: 0.2rem .3rem;line-height: .6rem;text-align: center">立即咨询</div>
            <div class="flex-row mar-t-30 mar-b-40" style="justify-content: center;align-items: baseline;text-align: center;">
                <div class="flex-col">
                    <div class="color_57" style="font-size:.26rem;">快速直线:<span style="font-size:.3rem;color:#c90319">4008-276-376</span></div>
                    <div class="px24 color_9 mar-t-30">福建省盏天下电子商务有限公司</div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    //列表按钮询价
    function xunjia(name, productid) {
        showTiXing();
        $("#p_productname").text(name);
        $("#hid_productid").val(productid);
    }
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

 <script type="text/javascript">
     function hideTiXing() {
         $('#tixing').hide()
         utils.toggleBody(0)
     }

//     $("#tixing").bind("click", function () {
//         $('#tixing').hide()
//         utils.toggleBody(0)
//     });

     function showTiXing() {
         utils.toggleBody(1)
         $('#tixing').show()
     }

     $.post("ajax/wxcode.aspx", function (result) {
         jQuery("#Telephone").text(result);
     });

     var arrplaceholder = "请输入您的手机号码";
     $("txt_keywords").blur(function () {
         $(this).prop("placeholder", arrplaceholder)
     });
//     // 验证手机号
//     function isPhoneNo(phone) {
//         var pattern = /^1[34578]\d{9}$/;
//         return pattern.test(phone);
//     }

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
         var txtvalue = $("#txt_telephone").val();
         var inquiryType = "询价";
         if (txtvalue == "") {
             alert('请输入您的手机号码');
             return false;
         }
         if (txtvalue.length != 11) {
             alert('请输入正确的手机号码');
             return false;
         }

         $.post("ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType, SourceForm: "MB" }, function (result) {
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
