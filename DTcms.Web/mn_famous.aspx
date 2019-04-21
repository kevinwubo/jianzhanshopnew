<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_artisan_list.html.cs" Inherits="DTcms.Web.mn_famous1" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <meta charset="utf-8">
    <title>名家名堂 - 建盏天下网</title>
    <meta name="keywords" content="建盏名家,卓立旗,李达,孙建新,黄美金,陈大鹏" />
    <meta name="description" content="名家名堂是建盏天下网第一手发布建窑建盏大师名家资讯和个人介绍，业界大师：孙建新、李达、黄美金、陈大鹏、卓立旗、陆金喜；老牌传承人：蔡炳盛、蔡炳昆、叶礼旺、叶礼忠；知名品牌：飞惺、吉玉坊、芦花坪......" />
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/pagination.css" type="text/css">
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .famous-list .list {
            height: auto;
            display: none;
        }

        .famous-list .ssbtn {
            width: 1.2rem;
            height: .56rem;
            line-height: .56rem;
            background: #B32735;
        }
    </style>
</head>

<body>
    <header>
        <div class="flex-row college-hd">
            <div class="back" href="javascript:window.history.back()">
                返回
            </div>
            <div class="txt px36">名家名堂</div>
            <div class="menu">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="famous-list">
        <!-- <div id="guanzhuweixin-s" class="flex-row bg_color_f navheight"
            style="align-items: center;max-width: 750px;margin: 0 .24rem;border-bottom: none;">
            <div class="flex-col search" style="border-bottom: 1px solid #E6E6E6;border-radius:.1rem;">
                <div class="flex-row" style="align-items: center;height: .58rem;background: #F7F7F7;">
                    <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem"
                        src="../static/images/jianzhan/ic_search.png" alt="">
                    <input style="background: #F7F7F7;" class="px24" type="text" placeholder="大师或者编号" />
                </div>
            </div>
            <div class="ssbtn px24">搜索</div>
        </div> -->
        <div class="flex-row bg_color_f navheight" style="align-items: center;max-width: 750px;">
            <!-- <div class="flex-row" style="align-items: center">
                <img class="mar-r-16" style="width: .5rem" src="../static/images/jianzhan/logo.png" />
            </div> -->
            <div class="flex-col search  mar-l-30">

                <div class="flex-row" style="align-items: center;height: .56rem">

                    <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                        alt="">
                    <input style="background: #f7f7f7" class="px24" type="text" placeholder="大师或者编号" />
                </div>
            </div>
            <div class="ssbtn px24 mar-r-30">搜索</div>
        </div>
        <div class="list-box">
         <%
                List<Artisan> lstArt = ModelArticleList;
                if (lstArt != null && lstArt.Count > 0)
                {
                    foreach (Artisan model in lstArt)
                    {
                    %>
            <div class="list-con-wrap">
                <div class="list-con">
                    <div class="con-img">
                        <a href="m_art<%=model.artisanID %>.html">
                            <img src="<%=model.IDHead %>" alt="">
                        </a>
                    </div>
                    <div class="con-txt">
                        <h1><%=model.artisanName %><span><%--【<%=model.reviewDate %>】--%></span></h1>
                        <p>简介：<%= model.introduction.Length>86?model.introduction.Substring(0,85):model.introduction %> ......
                        </p>
                        <div class="morebtn">代表作品</div>
                    </div>
                </div>
                <div class="list">
                <% 
                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 3);
                        foreach (Product modelPro in lstPro)
                        {
                            %>
                    <div class="item">
                        <div style="margin: 0 .1rem">
                        <a href="m_<%=modelPro.ProductID %>.html">
                            <div class="t1 color_red_c9">ID:<%=modelPro.ProductID %></div>
                            <div class="pimg" style="background:url(<%=modelPro.Images %>)"></div>
                            </a>
                        </div>
                        <div class="t1 clamp1">【<%=modelPro.Author %>】<%=modelPro.ProductName %></div>
                        <img class="bt-zx" onclick="xunjia('<%=modelPro.ProductName %>','<%=modelPro.ProductID %>')" src="../static/images/jianzhan/btn_ljzx.png" />
                    </div>
                    <%} %>
                </div>
            </div>
            <%}
                } %>

                        <!--分页-->
      <div class="div-h-3"></div>
        <div class="flex-row M-box m-style" style="justify-content: center">
        <div id="PageContent" runat="server" ></div></div>
        <div class="div-h-8"></div>
        </div>

        <div style="background: #f7f7f7;padding: .5rem .6rem">
            <div class="flex-row" style="text-align:center">
                <img style="width:1.5rem;height:1.5rem;margin-left: .3rem" src="../static//images/jianzhan/ic_code.png" />
                <div class="flex-col">
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20">关于我们</div>
                        <div class="mar-l-30 color_3 px20">售后服务</div>
                    </div>
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20">服务保障</div>
                        <div class="mar-l-30 color_3 px20">在线支付</div>
                    </div>
                    <div class="flex-row" style="height:.43rem;align-items:center">
                        <div class="color_red_c9 px30 mar-l-30">4008-2313-2321</div>
                        <div class="color_red_c9 px16">(24小时在线)</div>
                    </div>
                    <div class="flex-row" style="height:.35rem;align-items:center">
                        <div class="mar-l-30 color_3 px20" style="text-align:left">(识别二维码了解更多)</div>
                    </div>
                </div>
            </div>
            <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center">闽ICP备17006498号-1 Copyright 2015 建盏天下网
                版权所有</div>
            <div class="color_3 px16 clamp1 mar-t-16" style="text-align:center"> 福建省盏天下电子商务有限公司</div>
        </div>
    </section>
    <div id="header1" class="flex-row pad-l-30 pad-r-30 pad-t-30 pad-b-40" style="text-align: center;align-items: center;">
        <div class="flex-col">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_home.png" alt="">
            <div style="margin-top: .1rem;height: .3rem">首页</div>
        </div>
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div class="flex-col" onclick="moveLeft()">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_fl.png" alt="" />
            <div style="margin-top: .1rem;height: .3rem">分类</div>
        </div>
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div class="flex-col">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic-zx.png" alt="" />
            <div style="margin-top: .1rem;height: .3rem">咨询</div>
        </div>
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div style="width:2rem" class="mar-l-20">
            <div class="flex-row">
                <img style="height: .5rem;width:.55rem" src="../static/images/jianzhan/ic_wx.png" alt="" />
                <div class="flex-col px16">(长按复制添加微信)</div>
            </div>
            <div style="margin-top: .1rem;height: .3rem">1231723876</div>
        </div>
    </div>


    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <script src="../static/js/jquery.pagination.js"></script>
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script>
        $('.morebtn').click(function () {
            var list = $(this).parents('.list-con-wrap').find('.list')
            if (list.is(':hidden')) {
                list.show()
            } else {
                list.hide();
            }
        })
    </script>
</body>

</html>