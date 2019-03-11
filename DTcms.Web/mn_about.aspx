<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_about.aspx.cs" Inherits="DTcms.Web.mn_about" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/menuplane.ascx" tagname="menuplane" tagprefix="uc3" %>
<html>

<head>
  <title>建盏商城 - 建盏天下网</title>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=750, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta content="telephone=no" name="format-detection">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta http-equiv="Access-Control-Allow-Origin" content="*">
  <link rel="stylesheet" type="text/css" href="project/Public/base/css/reset.css?d=" />
  <link rel="stylesheet" type="text/css" href="project/Public/base/css/bass.css" />
  <link rel="stylesheet" type="text/css" href="project/Public/base/css/swiper-4.3.3.min.css" />
  <link rel="stylesheet" type="text/css" href="project/Public/page/css/about.css" />
  <link rel="stylesheet" type="text/css" href="project/Public/page/css/index.css" />
  <link rel="stylesheet" type="text/css" href="project/Public/iconfont/iconfont.css" />
  <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
  <script type="text/javascript" src="project/Public/base/js/ZRrem.js"></script>
  <%--<script type="text/javascript" src="project/Public/base/js/core.js"></script>--%>
  <!-- <script type="text/javascript" src="project/Public/page/js/about.js"></script> -->
  <style type="text/css">
    #swiper-container-banner {
      width: 100%;
      height: 5.2rem;
    }

    #swiper-container-banner a {
      display: inline-block;
      width: 100%;
      height: 100%;
    }

    #swiper-container-banner a img {
      width: 100%;
      height: 100%;
    }
  </style>
</head>

<body>
  <div id="app">
  <input type="hidden" id="hid_about" value="<%=Type %>" />
    <div id="header" class="header bgc_c3">
      <!-- 通用头 -->
      <div id="head-page" class="head-page head-page-home">
        <div class="head-left">
          <div class="head-backpage">
            <a href="javascript:window.history.back()">
                <span class="head-backpage-img"></span>
                <span>返回上页</span>
            </a>
          </div>
          <div class="head-gohome">
            <a href="m_index.html">
                <span class="gohome-bor"></span>
                <span class="head-gohome-img"></span>
                
            </a>
          </div>
        </div>
        <div class="head-title">
          关于我们
        </div>
        <div class="head-p-sides head-p-sides-side"  onclick="moveLeft()">
          <img src="project/Public/image/side.png">
        </div>
      </div>
    </div>
    <div class="planbody bgc_cc">

      <!-- 关于我们-导航栏-->

      <div class="weui-tab">
        <div class="weui-navbar">
          <div class="weui-navbar__item weui-navbar__item--on" href="#tab1">
            <span>关于我们 </span>
          </div>
          <div class="weui-navbar__item" href="#tab2">
            <span>服务保障</span>
          </div>
          <div class="weui-navbar__item" href="#tab3">
            <span>支付方式</span>
          </div>
          <div class="weui-navbar__item" href="#tab4">
            <span>实体店</span>
          </div>
        </div>
        <div class="weui-tab__bd">
          <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <div class="about-text-plane">
              <!-- 头部标题-->
              <div class="detail-title-plane">
                <div class="title">关于建盏天下</div>
                <div class="desc">
                  <span>日期：2017-12-16</span>
                  <span style="margin-left: 0.2rem">板块：
                    <span style="color: #b32b2b">关于我们</span>
                  </span>
                </div>
              </div>
              <div style="height: 1px;background-color: #999;width: 90%;margin:0 5%"></div>
              <div class="content-padded">
                <img src="project/Public/image/we.png" />
              </div>
              <!-- 富文本内容 -->
              <!-- <div class="content">
                “建盏天下”由腾讯大闽网、登嘉资本、建盏君、武夷山国际
                  会展中心，及业内诸位实力名家联合发起并投资的首席建盏品牌商
                  城，品牌隶属于福建省盏天下电子商务有限公司。
                              福建省盏天下电子商务有限公司致力于为广大建盏爱好者，
                  提供原产地、名家大师直供的兔毫盏、油滴盏、曜变盏、鹧鸪斑、
                  金油滴、黑釉银斑等精品建盏。
                              建盏天下传播千年的建盏文化和历史，第一手的艺人权威资
                  料，提供建盏品鉴、投资收藏、名家押窑和私人定制服务！
              </div> -->
            </div>
            <!-- 作品 -->
            <div class="bgc_ff">
              <div class="planbody-shop">
                <div class="shop-title">
                  <span class="bgc_ff">热门推荐</span>
                </div>
                <div class="shop-describe flex_around">
                  <% List<Product> lstProHot = ModelListHOT;
                           if (lstProHot != null && lstProHot.Count > 0)
                           {
                               foreach (Product model in lstProHot)
                               { %>
                               <div class="show-view shop-view-state-a">
							
								<p><%=model.ProductID%></p>
								<p>
                                    <a href="m_<%=model.ProductID %>.html">
									    <img class="list-item-img" src="<%=model.Images %>">
                                    </a>
								</p>
								<p>[<%=model.Author%>]</p>
								<p><%=model.ProductName%></p>
								<p>尺寸：<%=model.Type3%></p>
								<p onclick="xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">
									<span></span>
									<button class="shop-query">立即咨询</button>
								</p>
							</div>	
                            <%}
                           }%>
                </div>
                <div class="shop-controll">
                  <button class="load-surplus">再显示3款新品
                    <i class="iconfont icon-xiala1"></i>
                  </button>
                </div>
              </div>
            </div>
            <!-- 通用底部元素 片段截取 -->
            <div id="planbody-foot_box">
              <div id="planbody-foot" class="planbody-foot">
                <div class="bgc_b3">
                  <div class="planbody-foot-describe">
                    <div class='foot-describe'>
                      <p>消费者维权热线：12315</p>
                      <p>违法和不良信息举报电话：12377</p>
                      <p>法律支持：北京中伦文德律师事务所</p>
                      <p>闽ICP备17006498号-1</p>
                      <p>建盏天下 <a href="http://www.jianzhanshop.com">www.jianzhanshop.com</a></p>
                    </div>
                    <div class="foot-RQcode">
                      <img id="foot-RQcode" src="project/Public/image/qcode-1.jpg" alt="二维码" />
                    </div>
                    <div class="foot-pay">
                      <p>支付方式</p>
                      <p>微信支付</p>
                      <p>支付宝支付</p>
                      <p>银行卡支付</p>
                    </div>
                  </div>
                </div>
                <div class="planbody-foot-corp">
                  <p>福建省盏天下电子商务有限公司</p>
                </div>
              </div>
            </div>
          </div>
          <div id="tab2" class="weui-tab__bd-item ">
            <div class="about-tag-plane">
              <ul id=about-tag-list class="about-tag-list">
                <li class="about-tag-item">
                  <!-- <a href="index.html"> -->
                    <div class="btn-on">艺人直销</div>
                  <!-- </a> -->
                </li>
                <li class="about-tag-item">
                  <!-- <a href="index.html"> -->
                    <div>一手货源</div>
                  <!-- </a> -->
                </li>
                <li class="about-tag-item">
                  <!-- <a href="index.html"> -->
                    <div>铁胎建盏</div>
                  <!-- </a> -->
                </li>
                <li class="about-tag-item">
                  <!-- <a href="index.html"> -->
                    <div>实体门店</div>
                  <!-- </a> -->
                </li>
                <li class="about-tag-item">
                  <!-- <a href="index.html"> -->
                    <div>实物视频</div>
                  <!-- </a> -->
                </li>
                <li class="about-tag-item">
                 
                    <div>保真承若</div>
                  
                </li>
                <li class="about-tag-item">
                 
                    <div>赝品赔付</div>
                  
                </li>
                <li class="about-tag-item">
                  
                    <div>15天退换</div>
                  
                </li>
              </ul>
            </div>
            <div class="about-text-plane">
              <div id="fuwucontent" class="content-padded">
                <img src="project/Public/image/mjzx.png" style="display: block"/>
                <img src="project/Public/image/mjzx.png" style="display: none"/>
                <img src="project/Public/image/mjzx.png" style="display: none"/>
                <img src="project/Public/image/mjzx.png" style="display: none"/>
                <img src="project/Public/image/ship.png" style="display: none"/>
                <img src="project/Public/image/bzcl.png" style="display: none"/>
                <img src="project/Public/image/mjzx.png" style="display: none"/>
                <img src="project/Public/image/15tian.png" style="display: none"/>
              </div>
            </div>
               <!-- 通用底部元素 片段截取 -->
               <div id="planbody-foot_box">
                <div id="planbody-foot" class="planbody-foot">
                  <div class="bgc_b3">
                    <div class="planbody-foot-describe">
                      <div class='foot-describe'>
                        <p>消费者维权热线：12315</p>
                        <p>违法和不良信息举报电话：12377</p>
                        <p>法律支持：北京中伦文德律师事务所</p>
                        <p>闽ICP备17006498号-1</p>
                        <p>建盏天下 <a href="http://www.jianzhanshop.com">www.jianzhanshop.com</a></p>
                      </div>
                      <div class="foot-RQcode">
                        <img id="foot-RQcode" src="project/Public/image/qcode-1.jpg" alt="二维码" />
                      </div>
                      <div class="foot-pay">
                        <p>支付方式</p>
                        <p>微信支付</p>
                        <p>支付宝支付</p>
                        <p>银行卡支付</p>
                      </div>
                    </div>
                  </div>
                  <div class="planbody-foot-corp">
                    <p>福建省盏天下电子商务有限公司</p>
                  </div>
                </div>
              </div>
          </div>
          <div id="tab3" class="weui-tab__bd-item ">
            <div class="content-padded">
              <img src="project/Public/image/zffs.png" />
            </div>
             <!-- 通用底部元素 片段截取 -->
             <div id="planbody-foot_box">
              <div id="planbody-foot" class="planbody-foot">
                <div class="bgc_b3">
                  <div class="planbody-foot-describe">
                    <div class='foot-describe'>
                      <p>消费者维权热线：12315</p>
                      <p>违法和不良信息举报电话：12377</p>
                      <p>法律支持：北京中伦文德律师事务所</p>
                      <p>闽ICP备17006498号-1</p>
                      <p>建盏天下 <a href="http://www.jianzhanshop.com">www.jianzhanshop.com</a></p>
                    </div>
                    <div class="foot-RQcode">
                      <img id="foot-RQcode" src="project/Public/image/qcode-1.jpg" alt="二维码" />
                    </div>
                    <div class="foot-pay">
                      <p>支付方式</p>
                      <p>微信支付</p>
                      <p>支付宝支付</p>
                      <p>银行卡支付</p>
                    </div>
                  </div>
                </div>
                <div class="planbody-foot-corp">
                  <p>福建省盏天下电子商务有限公司</p>
                </div>
              </div>
            </div>
          </div>
          <div id="tab4" class="weui-tab__bd-item ">
            <div class="content-padded">
              <img src="project/Public/image/xiamendian.jpg" />
            </div>
             <!-- 通用底部元素 片段截取 -->
             <div id="planbody-foot_box">
              <div id="planbody-foot" class="planbody-foot">
                <div class="bgc_b3">
                  <div class="planbody-foot-describe">
                    <div class='foot-describe'>
                      <p>消费者维权热线：12315</p>
                      <p>违法和不良信息举报电话：12377</p>
                      <p>法律支持：北京中伦文德律师事务所</p>
                      <p>闽ICP备17006498号-1</p>
                      <p>建盏天下 <a href="http://www.jianzhanshop.com">www.jianzhanshop.com</a></p>
                    </div>
                    <div class="foot-RQcode">
                      <img id="foot-RQcode" src="project/Public/image/qcode-1.jpg" alt="二维码" />
                    </div>
                    <div class="foot-pay">
                      <p>支付方式</p>
                      <p>微信支付</p>
                      <p>支付宝支付</p>
                      <p>银行卡支付</p>
                    </div>
                  </div>
                </div>
                <div class="planbody-foot-corp">
                  <p>福建省盏天下电子商务有限公司</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<uc1:mn_footer ID="mn_footer1" runat="server" />
        <div id="menupart" style="display: none;left:200%;">
            <uc3:menuplane ID="menuplane1" runat="server" />
        </div>
  </div>
  <!-- 筛选 -->
<div id='menumark' style="display: none"></div>

<script type="text/javascript">

    Init();
    function Init() {
        var type = $("#hid_about").val();
        if (type == "bz") {
            $("#tab1").removeClass("weui-navbar__item--on");
            $("#tab22").addClass("weui-navbar__item--on");
        }
    }

    // 点击展开列表
    $('.load-surplus').click(function () {
        // console.log($(this).parent().parent().children().eq(1))
        $(this).parent().parent().children().eq(1).height('auto');
        $(this).html('<a href="mn_shop.aspx">查看更多产品</a>');
    })
    //点击隐藏在线咨询面板或拨号面板
    $('#menumark').click(function () {
        if (iskuaishu) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#ksplane").css("display", "none");
            });
            iskuaishu = false;
        }
        if (iszaixian) {
            $(".footer").animate({ bottom: '0rem' }, "slow", function () {
                $("#menumark").css("display", "none");
                $("#zxplane").css("display", "none");
            });
            iszaixian = false;
        }
        moveRight();
    })
</script>
  <script>
      // 点击展开列表
      $('.load-surplus').click(function () {
          // console.log($(this).parent().parent().children().eq(1))
          $(this).parent().parent().children().eq(1).height('auto');
          $(this).html('<a href="mn_shop.aspx">查看更多产品</a>');
      })
      var tabindex = 0, tagindex = 0;
      $('.weui-navbar').children().each(function (index, node) {
          $(this).click(function () {
              $('.weui-navbar').children().eq(tabindex).removeClass('weui-navbar__item--on');
              // $('.weui-navbar').children().eq(_self.data.tabindex).children().eq(0).removeClass('initStyle') ;
              $('.weui-tab__bd').children().eq(tabindex).removeClass('weui-tab__bd-item--active');
              tabindex = index;
              $('.weui-tab__bd').children().eq(tabindex).addClass('weui-tab__bd-item--active');
              $(this).addClass('weui-navbar__item--on');
          })
      })
      $('#about-tag-list').children().each(function (index, node) {
          $(this).click(function () {
              $('#about-tag-list').children().eq(tagindex).children().removeClass('btn-on');
              // $('.weui-navbar').children().eq(_self.data.tabindex).children().eq(0).removeClass('initStyle') ;
              $('#fuwucontent').children().eq(tagindex).css('display', 'none')
              tagindex = index;
              $('#fuwucontent').children().eq(tagindex).css('display', 'block')
              $(this).children().addClass('btn-on');
          })
      })

  </script>
</body>

</html>
