<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="B1_index.aspx.cs" Inherits="DTcms.Web.Bd01.B1_index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta content="正宗建盏报价" http-equiv="keywords">
    <meta name="description" content="正宗建盏报价">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>正宗建盏报价</title>
    <link rel="stylesheet" href="/css/1905_swiper.min.css">
    <link rel="stylesheet" href="/css/1905_base_1_30.css" type="text/css">
    <link rel="stylesheet" href="/css/1905_style.css">
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
        }

        .svelte-6je8b9 {
            margin-bottom: 0.64rem;
            margin: 0 5%;
            padding: 0 5%;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            -webkit-flex-wrap: nowrap;
            flex-wrap: nowrap;
            width: 80%;
            height: .8rem;
            background: #FFFFFF;
            box-shadow: 0 1px 0.13333333rem 0 rgba(0, 0, 0, 0.15);
            border-radius: 0.48rem;
            color: #333;
            font-family: PingFangSC-Regular;
            font-size: 0.37333333rem;
        }

        .number.svelte-6je8b9 {
            font-weight: bold;
            font-size: 0.48rem;
            color: #D0021B;
        }

        .msg.svelte-6je8b9 {
            -webkit-box-flex: 0;
            -webkit-flex: none;
            flex: none;
            display: -webkit-inline-box;
            display: -webkit-inline-flex;
            display: inline-flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            -webkit-user-select: none;
            user-select: none;
        }
        .forminput{
            height: .96rem;
            width: 80%;
            margin: 0 5% 0 0;
            padding: 0 5%;
            border: 1px solid #ddd;
        }
        .forminput input{
            line-height: .96rem;
            font-size: .25rem;
            width: 100%;
        }
        .forminput select{
            line-height: .96rem;
            font-size: .25rem;
            width: 100%;
            background: #fff
        }
        .textline{
            height: .8rem;
            width: 90%;
            margin: 0;
            padding: 0 5%; 
        }
        .pradio{
            width: .25rem;
            height: .25rem;
            -webkit-appearance: radio;
            margin-right: .1rem
        }
        .submitbtn.svelte-a6af2v {
            margin: 0 auto;
            padding: 0;
            width: 100%;
            height: 1rem;
            color: #fff;
            background-color: #3B9AFF;
            border-radius: 0.74666667rem;
            font-family: PingFangSC-Regular;
            font-weight: bold;
            font-size: 0.48rem;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            cursor: pointer;
            border: none;
            outline: none;
            -webkit-user-select: none;
            user-select: none;
            cursor: pointer;
            -webkit-tap-highlight-color: transparent;
}

 ::-webkit-calendar-picker-indicator { 
display: none
}

    </style>
    <style id="svelte-1mz3y46-style">.phone_agreement_link_wrapper.svelte-1mz3y46{font-size:0.32rem;font-family:PingFangSC-Regular;line-height:0.48rem;color:#999}.icon.svelte-1mz3y46{display:inline-block;content:'';width:0.32rem;height:0.32rem;margin-right:0.2rem;line-height:inherit;vertical-align:middle;background-repeat:no-repeat;background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 16 16' xmlns='http://www.w3.org/2000/svg'%3E%3Crect x='24.5' y='932.5' width='15' height='15' rx='2' transform='translate(-24 -932)' fill='%23FFF' stroke='%23D7D7D7' fill-rule='evenodd'/%3E%3C/svg%3E")}:checked+.icon.svelte-1mz3y46{background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 16 16' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Crect fill='%233B9AFF' width='16' height='16' rx='2'/%3E%3Cpath d='M7.024 10.67l5.297-5.297a.51.51 0 0 1 .714-.007.501.501 0 0 1-.007.714l-5.643 5.643-.007.007a.5.5 0 0 1-.7.006L3.128 8.188a.5.5 0 0 1 .707-.707l3.188 3.188z' fill='%23FFF'/%3E%3C/g%3E%3C/svg%3E")}.phone_agreement_checker.svelte-1mz3y46{margin-right:0.21333333rem}.phone_agreement_link.svelte-1mz3y46{color:#3B9AFF;text-decoration:none}.body.svelte-1mz3y46{padding:0 0.8rem;height:100%;overflow-x:hidden;overflow-y:auto;overflow:hidden auto;font-family:PingFangSC-Regular;font-size:0.32rem;color:#333333;line-height:0.64rem}.body.svelte-1mz3y46 .head.svelte-1mz3y46{font-family:PingFangSC-Semibold;font-size:0.53333333rem;text-align:center}.body.svelte-1mz3y46 .content.svelte-1mz3y46{margin-top:0.48rem;font-family:PingFangSC-Regular;font-size:0.32rem;color:#333333;line-height:0.64rem}</style>
    <script type="text/javascript">
        window._agl = window._agl || [];
        (function () {
            _agl.push(
                ['production', '_f7L2XwGXjyszb4d1e2oxPybgD']
            );
            (function () {
                var agl = document.createElement('script');
                agl.type = 'text/javascript';
                agl.async = true;
                agl.src = 'https://fxgate.baidu.com/angelia/fcagl.js?production=_f7L2XwGXjyszb4d1e2oxPybgD';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(agl, s);
            })();
        })();

        window._agl && window._agl.push(['track', ['success', { t: 3}]])
    </script>

</head>

<body>

    <img class="w100" src="/images/01.jpg" alt="">
    <span id="top" name="top"><img class="w100" src="/images/noop.jpg" alt=""></span>
    
    <form class="
        clue-form svelte-7b7rbn" novalidate="" style="color: rgb(128, 128, 128);">
    <div class="div-h-3"></div>
    <div class="counter svelte-6je8b9">
        <img style="height: .3rem;width:.3rem" src="/images/ic-zx.png" alt="" />
        <div style="margin-left:.2rem">
            <span style="font-size:.3rem">目前已经有</span>
            <span style="font-size:.32rem;color: #D0021B">1608</span>
            <span style="font-size:.3rem">人申请定价</span>
        </div>
    </div>
    <div class="div-h-4"></div>
    <div class="div-h-2"></div>
    <div class="flex-row">
        <div class="textline" style="line-height: .8rem;align-items: center;font-size:.32rem;width: 1.6rem;font-size: .25rem;padding-right:0">建盏级别</div>
        <div class="flex-col">
            <div class="textline flex-row" style="align-items: center;justify-content: center;padding-left:0">
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="level" value="入门" />入门
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="level" value="初级" />初级
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="level" value="中级" />中级
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="level" value="高级" />高级
                </div>
            </div>
        </div>
    </div>

    <div class="div-h-2"></div>
    <div class="flex-row">
        <div class="textline" style="line-height: .8rem;align-items: center;font-size:.32rem;width: 1.6rem;font-size: .25rem;padding-right:0">建盏预算</div>
        <div class="flex-col">
            <div class="textline flex-row" style="align-items: center;justify-content: center;padding-left:0">
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="200-500" />200-500
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="500-1000" />500-1000
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="1千-3千" />1千-3千
                </div>
            </div>
            <div class="textline flex-row" style="align-items: center;justify-content: center;padding-left:0">
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="3千-1万" />3千-1万
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="1万-3万" />1万-3万
                </div>
                <div class="flex-col" style="font-size:.3rem;text-align: center;">
                    <input class="pradio" type="radio" name="radioys" value="3万+" />3万+
                </div>
            </div>
        </div>
    </div>   
    <div class="div-h-2"></div>
    <!-- <div class="forminput">
        <input type="text" placeholder="请输入您到称呼" />
    </div> -->
    <div class="flex-row" style="align-items: center;margin: 0 0 0 5%;">
        <div style="width: 1.6rem;font-size: .25rem">手机号码</div>
        <div class="forminput flex-row" style="align-items: center;">
            <input type="text" id="txt_keywords" placeholder="请输入手机号码_申请结果将发送到手机上" />

        </div>
    </div>
    <div class="div-h-2"></div>
    <!-- <div class="forminput">
        <input type="number" placeholder="请输入手机号码_申请结果将发送到手机上" />
    </div> -->
    <div class="flex-row" style="align-items: center;margin: 0 0 0 5%;">
        <div style="width: 1.6rem;font-size: .25rem">如何称呼</div>
        <div class="forminput flex-row" style="align-items: center;">
            <input type="text" id="txt_name" placeholder="请输入您的称呼" />
        </div>
    </div>
    <div class="div-h-3"></div>
    <!-- <div class="flex-row textline">
        <label style="font-size:.24rem"><input class="phone_agreement_checker svelte-1mz3y46" type="checkbox" style="display: none;">
            <div class="icon svelte-1mz3y46"></div> 自动输入历史手机号
        </label>
        <a style="font-size:.24rem" href="javascript:void(0);" class="phone_agreement_link svelte-1mz3y46">《个人信息授权书》</a>
    </div> -->

    <div class="textline" style="height:1rem">
        <button class="submitbtn svelte-a6af2v" type="button" id="div_submit" style="border-radius: 0.186667rem; background-color: rgb(178, 34, 34); color: rgb(255, 255, 255);">
            <span style="font-size:.4rem">申请咨询报价</span>
        </button>
    </div>
    <div class="div-h-4"></div>
    <div style="text-align: center;
    font-size: .3rem;">（3分钟，搞懂建盏价格，让您收藏不吃亏）</div>
    <div class="div-h-4"></div>
    </form>
    <img class="
        w100" src="/images/02.jpg" alt="">

    <div class="swiper-container-1 swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"> <img class="w100" src="/images/03a.jpg" alt=""></div>
            <div class="swiper-slide"> <img class="w100" src="/images/03b.jpg" alt=""></div>
            <div class="swiper-slide"> <img class="w100" src="/images/03c.jpg" alt=""></div>
            <div class="swiper-slide"> <img class="w100" src="/images/03d.jpg" alt=""></div>
            <div class="swiper-slide"> <img class="w100" src="/images/03e.jpg" alt=""></div>
        </div>
        <div class="swiper-pagination-1 swiper-pagination"></div>
    </div>
    <img class="w100" src="/images/04.jpg" alt="">
    <img class="w100" src="/images/05.jpg" alt="">

    <div style="position: fixed;bottom:0px;width:100%;background:#fff;z-index: 98;max-width: 750px;">
        <div id="header1" class="flex-row" style="text-align: center;align-items: center;">

            <!-- <div style="width:25%;" id="zx">
                <img style="height: .3rem;width:.3rem" src="/images/ic-zx.png" alt="" />
                <div style="margin-top: .1rem;height: .3rem">咨询热线</div>
            </div> -->

            <div class="flex-col" style="height: 1rem;background: rgb(210, 180, 140);
                color: rgb(255, 255, 255);">
                <div class="flex-row" style="align-items: center;justify-content: center;height: 1rem">
                    <img style="height: .4rem;" src="/images/ic_wx.png" alt="" />
                    <div><a href="#top" style="margin-left:.2rem;height: .39rem;font-size: .39rem">申请·建盏鉴别+获取报价</a></div>
                </div>
            </div>
        </div>
    </div>
    <div style="height: 3.33333rem;">
        <div class="div-h-4"></div>
        <p style="text-align:center;"><span style="font-size:0.25rem;">——
                福建省盏天下电子商务有限公司 ——</span></p>
        <div class="div-h-3"></div>
        <p style="text-align:center;"><span style="font-size:0.25rem;">闽ICP备17006498号-1</span></p>
        <div class="div-h-3"></div>
        <p style="text-align:center;"><span style="font-size:0.25rem;">Copyright ©
                jianzhanshop.com</span></p>
    </div>
    <script src="/js/jquery-2.1.4.js"> </script>
    <script src="/js/jquery-weui.js"></script>
    <script src="/js/jquery.pagination.js"></script>
    <script src="/js/utils.js"></script>
    <script src="/js/swiper.min.js"></script>
    <script src="/js/showdiv.js"></script>
    <script src="/js/public.js"></script>
    <script src="/js/code.js"></script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?e968a714e805c74070bded410d401f1b";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
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
    <script>
        isTouchDevice();
        var swiper1 = new Swiper('.swiper-container-1', {
            // pagination: '.swiper-pagination-1',
            paginationClickable: true,
            autoplay: 2000,
        });
        function hideTiXing() {
            $('#tixing').hide()
            utils.toggleBody(0)
        }
        $('.bt-zx').on('click', function () {
            utils.toggleBody(1)
            $('#tixing').show()
        })
        $('#zx').on('click', function () {
            utils.toggleBody(1)
            $('#tixing').show()
        })

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
                var productid = "Mobile";
                var type = "Tel";
                var txtvalue = $("#txt_keywords").val();
                var name=$("#txt_name").val();
                var inquiryType = "询价";
                var content=$("input[name='level']:checked").val()+$("input[name='radioys']:checked").val();;
                if (txtvalue == "") {
                    alert('请输入您的手机号码');
                    return false;
                }
                if (!txtvalue.length==11) {
                    alert('请输入正确的手机号码');
                    return false;
                }

                $.post("/ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType,SourceForm:"AD",Name:name,Content:content }, function (result) {
                    tprm = "ProductID=" + productid + "&phone=" + getRandomString(1) + TelJM(txtvalue) + getRandomString(1);
                    __ozfac2(tprm, "#inquiryok");
                    alert(result);                   
                    window._agl && window._agl.push(['track', ['success', {t: 3}]])
                    $("#txt_keywords").val("");
                });
            });
    </script>
</body>

</html>
