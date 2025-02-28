﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TiXing_List.ascx.cs" Inherits="DTcms.Web.activity.TiXing_List" %>
<!--未开开始-->
<div class="tk-mark" id="tixing" style="display: none">
    <div class="gmkuang">
        <div class="flex-row" style="justify-content: center">
            <div class="flex-col"></div>
            <img style="height:0.93rem" src="static/images/xiaojiang/logo.png"/>
            <div class="flex-col">
                <div class="mar-r-40 px24" style="color:#999;display: initial;float: right;" onclick="hideTiXing()">关闭
                </div>
            </div>
        </div>
        <div class="flex-row mar-l-40 mar-t-40" style="align-items: baseline">
            <div class="px28">提醒建盏:</div>
            <div class="px36 mar-l-16"><label id="sp_productname"></label></div>
            <div class="px28 color_9 mar-l-16">(ID:<label id="sp_productid"></label>)(<label id="sp_author"></label>)</div>
            <input type="hidden" id="hid_type" />
        </div>
    
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28">当前价格:</div>
            <!--<div class="px28 mar-l-16 color_red_c9">¥</div>-->
            <!--<div class="px36 mar-l-16 color_red_c9">9999.00</div>-->
            <div class="px36 color_be mar-l-16">(暂未开始)</div>
        </div>
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28">提醒时间:</div>
            <div class="px28 mar-l-16 "><span class="px44 color_red_c9 mar-r-16">03</span>月 <span
                    class="px44 color_red_c9 mar-r-16">11</span>日 <span class="px44 color_red_c9 mar-r-16"> 11：00</span>前
            </div>
        </div>
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28" style="width: 1rem"></div>
            <div class="px24 color_9 mar-l-16">结束前30分钟;</div>
        </div>
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28" style="width: 1rem"></div>
            <div class="px24 color_9 mar-l-16">或者超过您所出价格</div>
        </div>
        <div class="flex-row mar-l-40 mar-t-40" style="align-items: center">
            <div class="px28">提醒方式:</div>

            <input id="txt_TXtelephone" type="text" class="flex-col" placeholder="请输入您的手机号码"
                   style="padding-left: 0.2rem;text-align: left;height: 0.5rem"/>

            <div class="px28 mar-l-16 mar-r-40">
                <div id="btn_TXsubmit" class="bg_color_red_c5 color_f texta-c" style="line-height: 0.51rem;height: 0.51rem;width: 1.2rem">
                    确定
                </div>
            </div>
        </div>
        <div class="flex-row mar-l-40 mar-t-30 mar-b-40" style="align-items: baseline">
            <div class="px28" style="width: 1rem"></div>
            <div class="px24 color_9 mar-l-16">短信提醒(建盏顾问1对1短信提醒您)</div>
        </div>
        <!--<div class="flex-row mar-t-40" style="border-top: 1px solid #c51b27">-->
            <!--<div class="flex-col px36 texta-c tx_act" style="height:0.9rem;line-height: .9rem">提醒设置</div>-->
            <!--<div class="flex-col px36 texta-c" style="height:0.9rem;line-height: .9rem">立即报价</div>-->
        <!--</div>-->
        <input type="hidden" id="HID_SourceTXS" value="<%=Source %>" />
    </div>
</div>
<script src="static/js/auctionScript.js"></script>
<script src="static/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    function alertTiXing(productid, productname, author, type) {
        $("#sp_productid").text(productid);
        $("#sp_productname").text(productname);
        $("#sp_author").text(author);
        $("#hid_type").val(type);
        showTiXing();
    }

    $("#btn_TXsubmit").bind("click", function (e) {
        var productID = $("#sp_productid").text();
        var telephone = $("#txt_TXtelephone").val();
        var type = $("#hid_type").val();
        var source = $("#HID_SourceTXS").val();
        TiXing(productID, telephone, type, source);
    
    });
</script>