<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="02A1.aspx.cs" Inherits="DTcms.Web.M0.Tt01._02A1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta content="315活动" http-equiv="keywords">
    <meta name="description" content="315活动">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>诚信315 捡漏微拍</title>
<%--    <link rel="stylesheet" href="css/register/base.css" type="text/css">--%>
    <link rel="stylesheet" href="/activity/static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="/activity/static/css/pagination.css" type="text/css">
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
    <!-- Bytedance Tracking -->
<script>
    (function (r, d, s, l) {
        var meteor = r.meteor = r.meteor || []; meteor.methods = ["track", "off", "on"]; meteor.factory = function (method) {
            return function () {
                var args = Array.prototype.slice.call(arguments); args.unshift(method); meteor.push(args); return meteor
            } 
        }; for (var i = 0; i < meteor.methods.length; i++) {
            var key = meteor.methods[i]; meteor[key] = meteor.factory(key)
        } meteor.load = function () {
            var js, fjs = d.getElementsByTagName(s)[0]; js = d.createElement(s);
            js.src = "https://analytics.snssdk.com/meteor.js/v1/" + l + "/sdk"; fjs.parentNode.insertBefore(js, fjs)
        }; meteor.load(); if (meteor.invoked) { return }
        meteor.invoked = true; meteor.track("pageview")
    })(window, document, "script", "81787640763");
</script>
<!-- End Bytedance Tracking -->
</head>
<body>

<%--<div class="flex-row pad-l-40 pad-r-40 bg_color_f navheight" style="align-items: center">

    <div class="flex-col texta-c px36 color_57">微拍首页</div>

</div>--%>
<div>
    <img class="w100" src="/activity/static/images/315/a1.jpg">
</div>
<!--捡漏拍卖-->
<div class="w100 pad-b-40" style="overflow: hidden;background: #c90319">
    <div class="flex-row mar-l-20 mar-r-20 mar-b-20" style="flex-direction: column">
        <div class="flex-row bg_color_f" style="padding: 0.1rem;justify-content: center;">
            <span style="color:Gray">挑选一尊精美的建盏要花多少钱？</span>
            <br />
             <span style="color:Olive">建盏鉴别+建盏定价</span>
        </div>
        <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
            <div class="flex-col" style="justify-content: center">
                <div class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                    <input  type="text" id="txt_City" placeholder="所在城市" class="flex-col"  style="padding-left: 0.2rem;text-align: left;height: 0.6rem;width:20rem;"/>
                </div>
               <div  class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                    <input  type="text" id="txt_name" placeholder="如何称呼" class="flex-col" style="padding-left: 0.2rem;text-align: left;height: 0.6rem;width:20rem;"/>
                </div>
                <div  class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                   <input  type="text" id="txt_telephone"  placeholder="手机号码_申请结果将发送到手机上" class="flex-col" style="padding-left: 0.2rem;text-align: left;height: 0.6rem;width:20rem;"/>
                </div>
                <div class="flex-row timelabel px24" style="align-items: center;justify-content: center">
                    <div id="btn_submit" class="bg_color_red_c5 color_f texta-c" style="line-height: 0.51rem;height: 0.51rem;width: 2.2rem">
                        申请获取报价
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!--拍卖好礼-->
<div id="Div1" class="w100 pad-b-40" style="overflow: hidden;background: #fff;text-align:center;font-size:large">
<br />
    (3分钟,搞懂建盏价格,让您不吃亏)
</div>
<div id="pmhl" class="w100 pad-b-40" style="overflow: hidden;background: #fff">
  <img src="/activity/static/images/315/a2.jpg">
  <img src="/activity/static/images/315/a3.jpg">
<img src="/activity/static/images/315/a4.jpg">
<img src="/activity/static/images/315/a5.jpg">
  <img src="/activity/static/images/315/a6.jpg">
</div>  
<div class="w100 flex-row" style="position: fixed;height: 0.7rem;bottom:-1px;border-top: 1px solid #fff;max-width: 750px">
    <a class="flex-col b_itm" style="border-right: 1px solid #fff" href="">免费获取报价</a>
</div>
<script src="/activity/static/js/jquery-2.1.4.js"></script>
<script src="/activity/static/js/jquery-weui.js"></script>
<script src="/activity/static/js/utils.js"></script>
<script>
    $("#btn_submit").bind("click", function (e) {
        var productid = "头条";
        var type = "Tel";
        var txtvalue = $("#txt_telephone").val();
        var city = $("#txt_City").val();
        var name = $("#txt_name").val();
        var inquiryType = "头条询价";
        if (txtvalue == "") {
            alert('请输入您的手机号码');
            return false;
        }
        if (!txtvalue.length == 11) {
            alert('请输入正确的手机号码');
            return false;
        }
        $.post("/ajax/proajax.aspx", { ProductID: productid, Type: type, TxtValue: txtvalue, InquiryType: inquiryType, City: city, Name: name }, function (result) {
            alert(result);
            $("#txt_telephone").val("");
            meteor.track("form", { convert_id: "1627512239808515" })
        });
    });
</script>
</body>
</html>

