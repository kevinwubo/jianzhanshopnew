<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mingjiatulu.aspx.cs" Inherits="DTcms.Web.activity.mingjiatulu" %>
<%@ Import namespace="DTcms.Common" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta content="名家图录页" http-equiv="keywords">
    <meta name="description" content="名家图录页">
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>名家图录页</title>
    <!--<link rel="stylesheet" href="css/register/base.css" type="text/css">-->
    <link rel="stylesheet" href="static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="static/css/pagination.css" type="text/css">


    <style>
        body {
            background: #f6f6f6;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .color_red_c9 {
            color: #c90319;
        }

        .timelabel {
            color: #1f1f1f;
            text-align: center;
        }

        .timelabel span {
            font-size: .46rem;
            color: #c90319;
        }

        .titimg {
            margin: auto;
            position: relative;
            width: 60%;
            padding: 0.5rem 0;
            display: block;
        }

        .xj_search {
            height: 0.4rem;
            padding: 0.2rem;
            height: .631rem;
            border: 0px;
        }

        .itemlist {
            list-style: none;
            overflow: hidden;
        }

        .itemlist li {
            background: #f2f2f2;
            border-radius: 0.1rem;
            float: left;
            width: 48.6%;
            /*height: 5.334rem;*/
            overflow: hidden;
            margin-bottom: 0.34rem;
            padding-bottom: 0.2rem;
        }

        .itemlist li:nth-child(2n+1) {
            margin-right: 0.17rem
        }

        .active:after {
            position: absolute;
            content: '';
            width: 60%;
            height: 0rem;
            bottom: -0.273rem;
            background: #fe7e08;
            left: 20%;
        }

        .nav_act {
            color: #c90319 !important;
            font-size: 0.273rem !important;
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
        #guanzhuweixin-s {
            position: fixed;
            width: 100%;
        }
    </style>
</head>
<body>

<div id="guanzhuweixin-s" class="flex-row bg_color_f navheight" style="align-items: center;max-width: 750px">
    <div class="flex-row pad-l-40" style="width: 1rem;align-items: center">
        <img class="mar-r-16" style="width: 0.1rem" src="static/images/315/back.png"/>
        <div class="px28 color_57"><a href="javascript:window.history.back()">返回</a></div>
    </div>
    <div class="flex-col texta-c px36 color_57">名家图录页</div>
    <div class="pad-r-40" style="width: 1rem;align-items: right">
        <a href="index.aspx?source=<%=Source %>"><img style="float: right;width:0.4rem;height: 0.3rem" src="static/images/315/menu.png"/></a>
        <!--<div class="px32 color_1e">按钮</div>-->
    </div>
</div>
<!--<div class="div-h-8" style="background-color: #c90319"></div>-->
<!--<div class="flex-row pad-r-40 bg_color_f navheight" style="align-items: center">-->
<!--<div class="flex-col texta-c px28 color_57">主会场</div>-->
<!--<div class="flex-col texta-c px28 color_57 nav_act">小匠专场</div>-->
<!--<div class="flex-col texta-c px28 color_57">小匠图录</div>-->
<!--<div style="width: .7rem;align-items: right;border-left: 1px solid #f0f0f0">-->
<!--<img style="float: right;width:0.4rem;height: 0.3rem" src="static/images/315/menu.png"/>-->
<!--&lt;!&ndash;<div class="px32 color_1e">按钮</div>&ndash;&gt;-->
<!--</div>-->
<!--</div>-->

<img class="w100" style="background:#c90319;padding-top:0.83rem;display: block" src="static/images/315/04.jpg"/>
<div class="w100" style="background-color: #c90319;">
    <div class="flex-row mar-l-20 mar-r-20 bg_color_f"
         style="overflow: hidden; align-items: center;border-radius: 0.1rem">
        <img class="mar-l-30" style="width: .3rem;height: .36rem" id="btnSearch" src="static/images/xiaojiang/ic_search.png"/>
        <input class="flex-col xj_search texta-l" id="txt_keywords" type="search" placeholder="请输入你要查找的编号（ID）"/>
    </div>
    <ul class="itemlist mar-r-20 mar-l-20 pad-t-40">
        <% List<Product> list= ModelList;
    if(list!=null&&list.Count>0)
    {
        foreach(Product model in list)
        {
     %>
        <li class="item">
            <div style="overflow: hidden;height: auto">
                <a href="detail.aspx?source=<%=Source %>?&productid=<%=model.ProductID.ToString() %>&type=DS"><img class="w100 bg_color_f" src="<%=model.Images %>"/></a>
            </div>
            <div class="flex-row" style="flex-direction: column">
                <a href="detail.aspx?source=<%=Source %>&productid=<%=model.ProductID.ToString() %>&type=MJ" class="w100 texta-c px36"
                     style="background: #ffc513;height: .5rem;color: white;line-height: .5rem">点击查看
                </a>
                <div class="w100 texta-c mar-t-30 px24">编号：<%=model.ProductID.ToString() %></div>
                <div class="w100 texta-c mar-t-20 px24">【<%=model.Author %>】</div>
                <div class="w100 texta-c mar-t-20 px24"><%=model.ProductName %></div>
            </div>
            <div class="div-h-1"></div>
        </li>
        <%}
        } %>        
    </ul>
        <div class="flex-row  m-style" style="justify-content: center">
        <%=PageHtml %>
    </div>

    <div class="div-h-3"></div>
    <div class="div-h-8"></div>
</div>
<div class="w100 flex-row" style="position: fixed;height: 0.7rem;bottom:-1px;border-top: 1px solid #fff;max-width: 750px">
<input id="hid_source"  type="hidden" value="<%=Source %>" />
    <a class="flex-col b_itm" style="border-right: 1px solid #fff" href="index.aspx?source=<%=Source %>">去主会场</a>
    <a class="flex-col b_itm" href="mingjiazhuanchang.aspx?source=<%=Source %>">去名家拍卖页</a>
</div>


<script src="static/js/jquery-2.1.4.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/jquery.pagination.js"></script>
<script src="static/js/utils.js"></script>
<script src="static/js/showdiv.js"></script>
<script>
    $("#btnSearch").bind("click", function (e) {
        var keyword = $("#txt_keywords").val();
        var source = $("#hid_source").val();
        window.location.href = "mingjiatulu.aspx?source=" + source + "&keyword=" + keyword;
    });
    $('.M-box').pagination({
        mode: 'fixed'
    });

    // $("#content").css("height", window.innerHeight - 0.83 * 58);
    $('#showMark1').on('click', function () {
        if ($('#mark1').css('display') == 'none') {
            utils.toggleBody(1)  //在跳出弹窗的时候
            $('#mark1').show()
        }
    })
    $('#close').on('click', function () {
        $('#mark1').hide()
        utils.toggleBody(0)
    })



</script>
</body>
</html>