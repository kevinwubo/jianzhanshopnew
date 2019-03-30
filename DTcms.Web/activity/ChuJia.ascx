<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChuJia.ascx.cs" Inherits="DTcms.Web.activity.ChuJia" %>
<div class="tk-mark" id="chujia" style="display: none" >
    <div class="gmkuang">
        <div class="flex-row" style="justify-content: center">
            <div class="flex-col"></div>
            <img style="width:2.73rem;height:0.93rem" src="static/images/xiaojiang/logo.png"/>
            <div class="flex-col">
                <div class="mar-r-40 px24" style="color:#999;display: initial;float: right;" onclick="hideJiajiaX()">关闭
                                <script>
                                    function hideJiajiaX() {
                                        $('#chujia').hide()
                                        utils.toggleBody(0)
                                    }
                </script>
                </div>
            </div>
        </div>
        
           <input type="hidden" id="Hid_Unit" value="<%=Unit %>" />
           <input type="hidden" id="HID_SourceS" value="<%=Source %>" />
           <input type="hidden" id="hid_EndTime" value="<%=endTime %>" />
        <div class="flex-row mar-l-40 mar-t-40" style="align-items: baseline">
            <div class="px28">提醒建盏:</div>
            <div class="px36 mar-l-16"><%=ProductName %></div>
            <div class="px28 color_9 mar-l-16">(ID:<%=ProductID %>)(<%=Author %>)</div>
        </div>
        <div class="flex-row mar-l-40 mar-t-30" style="align-items: baseline">
            <div class="px28">当前价格:</div>
            <div class="px28 mar-l-16 color_red_c9">¥</div>
            <div class="px36 mar-l-16 color_red_c9"><%=CustomerOffer.ToString("f2") %></div>
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

            <input id="txt_JJtelephone" type="text" class="flex-col" placeholder="请输入您的手机号"
                   style="padding-left: 0.2rem;text-align: left;height: 0.5rem"/>

            <div class="px28 mar-l-16 mar-r-40">
                <div  id="btn_JJsubmit" class="bg_color_red_c5 color_f texta-c" style="line-height: 0.51rem;height: 0.51rem;width: 1.2rem">
                    立即加价
                </div>
            </div>
        </div>
        <% if(CustomerOffer>0)
        { %>
        <div class="flex-row mar-l-40 mar-t-30 mar-b-40" style="align-items: baseline;justify-content: center">
            <div class="px28">当前出价最高竞拍人</div>
            <div class="px28 color_red_c9 mar-l-16"><%=HighTelePhone %></div>
        </div>
        <%} %>
    </div>
</div>
<script src="static/js/auctionScript.js"></script>
<script src="static/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $("#btn_JJsubmit").bind("click", function (e) {
        var productID = $("#txt_ProductID").val();
        var telephone = $("#txt_JJtelephone").val();
        var price = $("#txt_price").val();
        var unit = $("#Hid_Unit").val();
        var type = $("#hid_type").val();
        var source = $("#HID_SourceS").val();
        var qpPrice = $("#hid_CostPrice").val();
        var salePrice = $("#hid_salePrice").val();
        
        if (parseFloat(qpPrice) > 0) {
            if (parseFloat(qpPrice) > price) {
                alert('出价必须大于起拍价。');
                return false;
            }
            if (parseFloat(price) <= parseFloat(salePrice)) {
                ChuJia(productID, telephone, type, price, unit, source);
            }
            else {
                alert('成功！建盏顾问将很快回复！');
            }
        }
        else {

            if (parseFloat(price) <= parseFloat(salePrice)) {
                ChuJia(productID, telephone, type, price, unit, source);
            }
            else {
                alert('成功！建盏顾问将很快回复！');
            }
        }

    });

    function getScond(d) {
        var oDate = new Date(); //获取日期对象
        var oldTime = oDate.getTime(); //现在距离1970年的毫秒数
        var newDate = new Date(d);
        var newTime = newDate.getTime(); //2019年距离1970年的毫秒数
        return Math.floor((newTime - oldTime) / 1000);
    }

    countDown(getScond($("#hid_EndTime").val()))

    function countDown(times) {
        var timer = null;
        timer = setInterval(function () {
            var day = 0,
                hour = 0,
                minute = 0,
                second = 0; //时间默认值
            if (times > 0) {
                day = Math.floor(times / (60 * 60 * 24));
                hour = Math.floor(times / (60 * 60)) - (day * 24);
                minute = Math.floor(times / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(times) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (day <= 9) day = '0' + day;
            if (hour <= 9) hour = '0' + hour;
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var str = "距结束<span>" + day + "</span>天 <span>" + hour + "</span>时 <span>" + minute + "</span>分 <span>" + second + "</span>秒"
            $("#btime1111").html(str)
            // console.log(day+"天:"+hour+"小时："+minute+"分钟："+second+"秒");
            times--;
        }, 1000);
        if (times <= 0) {
            clearInterval(timer);
        }
    }
</script>