<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChuJia_List.ascx.cs" Inherits="DTcms.Web.activity.ChuJia_List" %>
<div class="tk-mark" id="chujia" style="display: none" >
    <div class="gmkuang">
        <div class="flex-row" style="justify-content: center">
            <div class="flex-col"></div>
            <img style="height:0.93rem" src="static/images/xiaojiang/logo.png"/>
            <div class="flex-col">
                <div class="mar-r-40 px24" style="color:#999;display: initial;float: right;" onclick="hideJiajia()">关闭
                </div>
            </div>
        </div>
        <input type="hidden" id="HID_SourceCJS" value="<%=Source %>" />
           <input type="hidden" id="Hid_Unit_cj"  />
           <input type="hidden" id="hid_salePrice"  />
           <input type="hidden" id="hid_QPPrice"  />
           <input type="hidden" id="hid_EndTime_cj" />
        <div class="flex-row mar-l-40 mar-t-40" style="align-items: baseline">
            <div class="px28">提醒建盏:</div>
               <div class="px36 mar-l-16"><label id="sp_productname_cj"></label></div>
            <div class="px28 color_9 mar-l-16">(ID:<label id="sp_productid_cj"></label>)(<label id="sp_author_cj"></label>)</div>
            <input type="hidden" id="hid_type_cj" />
        </div>
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28">当前价格:</div>
            <div class="px28 mar-l-16 color_red_c9">¥</div>
            <div class="px36 mar-l-16 color_red_c9"><label id="sp_customeroffer"></label></div>
        </div>

        <div class="flex-row bg_color_f" style="padding: 0.3rem;justify-content: center;">
            <div class="flex-col" style="justify-content: center">
                <div id="btime1111" class="flex-row timelabel px32" style="align-items: center;justify-content: center">距结束
                    <span>00</span>天 <span>00</span>时 <span>00</span>分 <span>00</span>秒
                </div>
            </div>
        </div>

        <div class="flex-row mar-l-40" style="align-items: center">
            <div class="px28">我要出价:</div>

            <input class="flex-col" id="txt_price" type="text" placeholder="请输入您的拍卖价"
                   style="padding-left: 0.2rem;text-align: left;height: 0.5rem"/>

            <div class="px28 mar-l-16 mar-r-40" style="width: 1.2rem">

            </div>
        </div>
        <div class="flex-row mar-l-40 mar-t-20" style="align-items: center">
            <div class="px28" style="width: 1rem"></div>

            <input id="txt_JJtelephone" type="text" class="flex-col" placeholder="请输入您的手机号码"
                   style="padding-left: 0.2rem;text-align: left;height: 0.5rem"/>

            <div class="px28 mar-l-16 mar-r-40">
                <div  id="btn_JJsubmit" class="bg_color_red_c5 color_f texta-c" style="line-height: 0.51rem;height: 0.51rem;width: 1.2rem">
                    立即加价
                </div>
            </div>
        </div>
        <div id="div_tele" class="flex-row mar-l-40 mar-t-30 mar-b-40"  style="align-items: baseline;justify-content: center;display:none">
            <div class="px28">当前出价最高竞拍人</div>
            <div class="px28 color_red_c9 mar-l-16"><label id="sp_hightelephone"></label></div>
        </div>

    </div>
</div>
<script src="static/js/auctionScript.js"></script>
<script type="text/javascript">
    function alertChuJia(productid, productname, author, type, CustomerOffer, HighTelePhone,salePrice,QPPrice) {
        $("#sp_productid_cj").text(productid);
        $("#sp_productname_cj").text(productname);
        $("#sp_author_cj").text(author);
        $("#hid_type_cj").val(type);
        $("#hid_salePrice").val(salePrice);
        $("#sp_customeroffer").text(CustomerOffer);
        $("#hid_QPPrice").val(QPPrice);
        if (CustomerOffer > 0) {
            $("#div_tele").show();
        }
        $("#sp_hightelephone").text(HighTelePhone);

        $("#txt_JJtelephone").val($.cookie('current_telephone'))
        showJiajia();
    }

    $("#btn_JJsubmit").bind("click", function (e) {


        var productID = $("#sp_productid_cj").text();
        var telephone = $("#txt_JJtelephone").val();
        $.cookie('current_telephone', telephone);
        var price = $("#txt_price").val();
        var source = $("#HID_SourceCJS").val();
        var unit = 50;
        var type = $("#hid_type_cj").val();
        if (type == "小匠") {
            unit = "10";
        }
        else if (type == "名家") {
            unit = "100";
        }
        else if (type == "大师") {
            unit = "100";
        }

        var qpPrice = $("#hid_QPPrice").val();
        if (parseFloat(qpPrice) > 0) {
            if (parseFloat(qpPrice) > price) {
                alert('出价必须大于起拍价。');
                return false;
            }
        }

        var salePrice = $("#hid_salePrice").val();
        if (parseFloat(price) <= parseFloat(salePrice) || parseFloat(qpPrice)) {
            ChuJia(productID, telephone, type, price, unit, source);
        }
        else {
            alert('成功！建盏顾问将很快回复！');
            window.location.reload()
            $("#txt_JJtelephone").val("");
        }
    });
    
</script>