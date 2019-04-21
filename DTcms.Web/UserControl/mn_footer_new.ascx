<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mn_footer_new.ascx.cs" Inherits="DTcms.Web.UserControl.mn_footer" %>
<script src="/js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/public.js" type="text/javascript" charset="utf-8"></script>


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
                <div class="px24">手机号码:</div>
                <input placeholder="请输入您的手机号码" class="mar-l-20" style="width: 3.8rem;;border: 1px solid #f6f6f6;padding-left: 0.2rem;text-align: left;height: 0.5rem">

            </div>
            <div style="color:#fff;background:#c90319;height: .6rem;margin: 0.2rem .3rem;line-height: .6rem;text-align: center">立即咨询</div>
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
        $("#p_productname").text(name);
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
