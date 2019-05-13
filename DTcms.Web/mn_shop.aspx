<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_shop.aspx.cs" Inherits="DTcms.Web.mn_shop" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_footer_new.ascx" tagname="mn_footer_new" tagprefix="uc2" %>
<html>

<head>
    <title>建盏商城 - 建盏天下网</title>
    <meta name="keywords" content="曜变盏,天目盏,兔毫盏,油滴盏,束口盏" />
    <meta name="description" content="建盏商城是福建省建窑建盏首席品牌商城，提供产地大师名家直供的一手精品货源：兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏，提供建盏价格、收藏、名家押窑和私人定制服务。" />
    <meta name="viewport" content="width=device-width,user-scalable=no, initial-scale=1">
    <title>建盏商城</title>
    <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/pagination.css" type="text/css">
    <script type="text/javascript" src="../static/js/jquery-2.1.4.js"></script>
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }

        .store-con .list1 {
            height: auto;
        }

        .store-con {
            /* overflow: hidden; */
        }

        #mark0 .markitem {
            color: #999;
            font-size: .24rem;
            text-align: center;
            float: left;
            width: 24.5%;
            height: .8rem;
            line-height: .8rem;
            border-bottom: 1px solid #f6f6f6;
            border-right: 1px solid #f6f6f6;
        }



        #mark0 .markitem:nth-child(4n+4) {
            border-right: 1px solid #fff;
        }

        #mark0 .markitem:nth-child() {
            border-right: 1px solid #fff;
        }


        #mark1 .markitem {
            color: #999;
            font-size: .24rem;
            text-align: center;
            float: left;
            width: 24.5%;
            height: .8rem;
            line-height: .8rem;
            border-bottom: 1px solid #f6f6f6;
            border-right: 1px solid #f6f6f6;
        }



        #mark1 .markitem:nth-child(4n+4) {
            border-right: 1px solid #fff;
        }

        #mark1 .markitem:nth-child() {
            border-right: 1px solid #fff;
        }

        #mark2 .markitem {
            color: #999;
            font-size: .24rem;
            text-align: center;
            float: left;
            width: 24.5%;
            height: .8rem;
            line-height: .8rem;
            border-bottom: 1px solid #f6f6f6;
            border-right: 1px solid #f6f6f6;
        }



        #mark2 .markitem:nth-child(4n+4) {
            border-right: 1px solid #fff;
        }

        #mark2 .markitem:nth-child() {
            border-right: 1px solid #fff;
        }


        #mark3 .markitem {
            color: #999;
            font-size: .24rem;
            text-align: center;
            float: left;
            width: 24.5%;
            height: .8rem;
            line-height: .8rem;
            border-bottom: 1px solid #f6f6f6;
            border-right: 1px solid #f6f6f6;
        }



        #mark3 .markitem:nth-child(4n+4) {
            border-right: 1px solid #fff;
        }

        #mark3 .markitem:nth-child() {
            border-right: 1px solid #fff;
        }

        .active {
            color: #bd2727 !important
        }

        .nb {
            border-bottom: 1px solid #fff !important;
        }

        .page {
            list-style: none;
            overflow: hidden;
            background: #fff;
            padding: 0.2rem;
        }

        .page>li {
            border: 1px #999 solid !important;
            float: left;
            padding: 0.1rem 0.2rem;
            cursor: pointer;
        }

        .page .pageItem {
            border: solid thin #fff;
            margin: 0.1rem;
        }

        .page .pageItemActive {
            border: solid thin #fff;
            margin: 0.1rem;
            background-color: #fff;
            color: red;
        }

        .page .pageItem:hover {
            border: solid thin #fff;
            background-color: #fff;
            color: red;
        }

        .page .pageItemDisable {
            border: solid thin #fff;
            margin: 0.1rem;
            background-color: #fff;
        }

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <header>
            <div class="flex-row college-hd">
                <a class="back" style="color:#fff" href="m_index.html">返回</a>
                <div class="txt px36">建盏商城</div>
                <div class="menu" onclick="javascript:moveLeft()">
                    <img src="../static/images/college/menu.png" alt="">
                </div>
            </div>
        </header>
        <section class="store-wrap">
            <div class="store-tab">
                <div class="tab-item active" id="div1"><span>业界大师</span></div>
                <div class="tab-item" id="div2"><span>老牌传承人</span></div>
                <div class="tab-item" id="div3"><span>名家工艺师</span></div>
                <div class="tab-item" id="div4"><span>器形/釉色</span></div>
            </div>
            <div id="mark0" style="background: rgba(0,0,0,.5);width: 100%;position: absolute;z-index: 1;display: none">
                <div style="padding: .2rem .32rem 0.1rem; background:white;overflow: hidden;">

                    <% 
                    List<Artisan> lstArt = bllArtisan.GetArtisanList(" and artisanType='业界大师' and IsCooperation=1 ", "   Sort");
                    foreach (Artisan model in lstArt)
                    {%>
                        <a class="markitem"  href="mn_shop.aspx?name=<%=model.artisanName %>">
                            <%=model.artisanName%>
                        </a>
                    
                    <%} %>
                </div>
            </div>
            <div id="mark1" style="background: rgba(0,0,0,.5);width: 100%;position: absolute;z-index: 1;display: none">
                <div style="padding: .2rem .32rem 0.1rem; background:white;overflow: hidden;">
                    <% 
                    List<Artisan> lstArtA = bllArtisan.GetArtisanList(" and artisanType='老牌传承人' and IsCooperation=1 ", "   Sort");
                    foreach (Artisan model in lstArtA)
                    {%>
                        <a class="markitem"  href="mn_shop.aspx?name=<%=model.artisanName %>">
                            <%=model.artisanName%>
                        </a>
                   
                    <%} %>
                </div>
            </div>
            <div id="mark2" style="background: rgba(0,0,0,.5);width: 100%;position: absolute;z-index: 1;display: none">
                <div style="padding: .2rem .32rem 0.1rem; background:white;overflow: hidden;">
                    <% 
                    List<Artisan> lstArtB = bllArtisan.GetArtisanList(" and artisanType='名家工艺师' and IsCooperation=1 ", "   Sort");
                    foreach (Artisan model in lstArtB)
                    {%>
                   
                        <a class="markitem" href="mn_shop.aspx?name=<%=model.artisanName %>">
                            <%=model.artisanName%>
                        </a>
                   
                    <%} %>
                </div>
            </div>
            <div id="mark3" style="background: rgba(0,0,0,.5);width: 100%;position: absolute;z-index: 1;display: none">
                <div style="padding: .2rem .32rem 0.1rem; background:white;overflow: hidden;">
                    <a class="markitem" href="mn_shop.aspx?type2=兔毫">
                        兔毫
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type2=油滴/鹧鸪斑">
                        油滴/鹧鸪斑
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type2=曜变">
                        曜变
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type2=乌金釉">
                        乌金釉
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type2=杂色釉/异毫">
                        杂色釉/异毫
                    </a>

                    <a class="markitem" href="mn_shop.aspx?type3=束口盏">
                        束口盏
                    </a>

                    <a class="markitem" href="mn_shop.aspx?type3=灯盏">
                        灯盏
                    </a>


                    <a class="markitem" href="mn_shop.aspx?type3=敞口盏/斗笠">
                        敞口盏/斗笠
                    </a>


                    <a class="markitem" href="mn_shop.aspx?type3=撇口盏">
                        撇口盏
                    </a>

                    <a class="markitem" href="mn_shop.aspx?type3=敛口盏">
                        敛口盏
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type3=钵型盏">
                        钵型盏
                    </a>
                    <a class="markitem" href="mn_shop.aspx?type3=创新器型">
                        创新器型
                    </a>
                </div>
            </div>
            </div>


        </section>
        <div class="store-con">
            <div class="part1" style="height:100%;overflow:auto">
                <div class="list1">
                    <% List<Product> lstPro = ModelProList;
               foreach (Product model in lstPro)
               { 
                   
                   %>
                    <div class="item1">
                        <div style="margin: 0 .1rem">
                            <div class="t1 color_red_c9">ID:
                                <%=model.ProductID %>
                            </div>
                            <a href="m_<%=model.ProductID %>.html">
                                <div class="pimg" style="background:url(<%=model.Images %>)"></div>
                            </a>
                            <div class="t1 clamp1">【
                                <%=model.Author %>】
                                <%=model.ProductName %>
                            </div>
                            <img onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')" class="bt-zx" src="../static/images/jianzhan/btn_ljzx.png">
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
            <!--分页-->
            <div class="div-h-3"></div>
            <div class="flex-row M-box m-style" style="justify-content: center">
                <div id="PageContent" runat="server"></div>
            </div>
            <div class="div-h-8"></div>
        </div>
        <uc2:mn_footer_new ID="mn_footer_new1" runat="server" />
        <uc1:mn_planbody_foot ID="mn_planbody_foot1" runat="server" />


        <script src="../static/js/jquery-2.1.4.js"></script>
        <script src="../static/js/jquery-weui.js"></script>
        <script src="../static/js/jquery.pagination.js"></script>
        <script src="../static/js/utils.js"></script>
        <script src="../static/js/showdiv.js"></script>
        <script>

            // $(".store-con").css("height", window.innerHeight - $('.store-con').offset().top-$('#foot').height());
            $(".tab-item").click(function () {
                var index = $(this).index();
                globalType = index;
                $(this).addClass("active").siblings().removeClass("active");
                $(".store-con .con-item").eq(index).addClass("active").siblings().removeClass("active");
                $("#mark" + index).show();
                utils.toggleBody(true)



                $("#mark" + index).css("height", $('body').height() - $('.college-hd').height() - $('.store-wrap').height());

                $("#mark" + index).on("click", function () {
                    $(this).hide()
                    utils.toggleBody(false)
                });

                for (var i = 0; i < 4; i++) {
                    if (index == i) {

                    }
                    else {
                        $("#mark" + i).hide();
                    }
                }
            });

        </script>

    </form>
</body>

</html>