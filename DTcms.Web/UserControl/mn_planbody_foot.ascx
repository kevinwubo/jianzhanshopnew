<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mn_planbody_foot.ascx.cs" Inherits="DTcms.Web.UserControl.mn_planbody_foot" %>
<%--<div id="planbody-foot_box">
                <div id="planbody-foot" class="planbody-foot">
                    <div class="bgc_b3">
                        <div class="planbody-foot-describe">
                            <div class='foot-describe'>
                                <p>消费者维权热线：12315</p>
                                <p>违法和不良信息举报电话：12377</p>
                                <p>法律支持：北京中伦文德律师事务所</p>
                                <p>闽ICP备17006498号-1</p>
                                <p>建盏天下 <a href="http://www.jianzhanshop.com" style="color:Green;text-decoration: underline">www.jianzhanshop.com</a></p>
                            </div>
                            <div class="foot-RQcode">
                                <img id="foot-RQcode" src="/project/Public/image/qcode-1.jpg" alt="二维码" />
                            </div>
                            <div class="foot-pay">
                                <a href="mn_zffs.html">
                                <p>支付方式</p>
                                <p>微信支付</p>
                                <p>支付宝支付</p>
                                <p>银行卡支付</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="planbody-foot-corp">
                        <p style="font-size:x-large"><a href="mn_gywm.html">福建省盏天下电子商务有限公司</a></p>                        
                    </div>
                </div>
            </div>
--%>

              <div id="header1" class="flex-row pad-l-30 pad-r-30 pad-t-30 pad-b-40" style="text-align: center;align-items: center;">
        
        <a  class="flex-col" href="m_index.html">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_home.png" alt="">
            <div style="margin-top: .1rem;height: .3rem">首页</div>
        </a>
       
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div class="flex-col" onclick="moveLeft()">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_fl.png" alt="" />
            <div style="margin-top: .1rem;height: .3rem">分类</div>
        </div>
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div class="flex-col" onclick="xunjia('','')">
            <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic-zx.png" alt="" />
            <div style="margin-top: .1rem;height: .3rem">咨询</div>
        </div>
        <div style="width:1px;height: .6rem;background: #f7f7f7"></div>
        <div style="width:2rem" class="mar-l-20">
            <div class="flex-row">
                <img style="height: .5rem;width:.55rem" src="../static/images/jianzhan/ic_wx.png" alt="" />
                <div class="flex-col px16">(长按复制添加微信)</div>
            </div>
            <div style="margin-top: .1rem;height: .3rem"><%=TELEPHONE %><input type="hidden" value="<%=TELEPHONE %>" /></div>
        </div>
    </div>
        <div id='menumark' style="display: none"></div>
     <div id="menupart" style="display: none;left:200%;">
        <div id='menuplane' class="menuplane">
            <div id="guanzhuweixin-s-cate" class="flex-row pad-l-20 bg_color_f navheight" style="align-items: center;max-width: 750px">
                <div class="back-tag" style="align-items: center" onclick="moveRight()">

                </div>
                <div class="flex-col search">

                    <div class="flex-row" style="align-items: center;height: .56rem">

                        <img class="mar-l-30 mar-r-16" style="height: .3rem;width: .25rem" src="../static/images/jianzhan/ic_search.png"
                            alt="">
                        <input style="background: #f7f7f7;width:auto"  id="keyword1"  class="px24" type="text" placeholder="大师或者编号" />
                    </div>
                </div>
                <div class="ssbtn px24 mar-r-30" id="btnSearch1">搜索</div>
            </div>
            <div class="menu-body">
                <div class="menu-cate-part">
                    <div class="menu-cate-title">名家大师</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item"><a href="/mn_shop.aspx?artisanType=业界大师">业界大师</a></div>
						<div class="item"><a href="/mn_shop.aspx?artisanType=老牌传承人">老牌传承人</a></div>
						<div class="item"><a href="/mn_shop.aspx?artisanType=名家工艺师">名家工艺师</a></div>
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">工艺釉色</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item"><a href="/mn_shop.aspx?type2=兔毫">兔毫</a></div>
						<div class="item"><a href="/mn_shop.aspx?type2=油滴/鹧鸪斑">油滴/鹧鸪斑</a></div>
						<div class="item"><a href="/mn_shop.aspx?type2=曜变">曜变</a></div>
						<div class="item"><a href="/mn_shop.aspx?type2=乌金釉">乌金釉</a></div>
						<div class="item"><a href="/mn_shop.aspx?type2=杂色釉/异毫">杂色釉/异毫</a></div>
					
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">经典器型</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
							<a href="/mn_shop.aspx?type3=束口盏">束口盏</a>
						</div>
						<div class="item">
							<a href="/mn_shop.aspx?type3=灯盏">灯盏</a>
						</div>
						<div class="item">
                             <a href="/mn_shop.aspx?type3=敞口盏/斗笠">敞口盏/斗笠</a>
						</div>
						<div class="item">
                            <a href="/mn_shop.aspx?type3=撇口盏">撇口盏</a>
                        </div>
						<div class="item">
                            <a href="/mn_shop.aspx?type3=敛口盏">敛口盏</a>
                        </div>
						<div class="item">
                            <a href="/mn_shop.aspx?type3=钵型盏">钵型盏</a>
                        </div>

                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">建盏尺寸</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
							<a href="/mn_shop.aspx?type4=小（口径9cm以下）">小（口径9cm以下）</a>	
                            </div>
						<div class="item">
							<a href="/mn_shop.aspx?type4=中（口径9-12cm）">中（口径9-12cm）</a>	
                            </div>
						<div class="item">
							<a href="/mn_shop.aspx?type4=大（口径12cm以上）">大（口径12cm以上）</a>
						</div>
                    </div>
                </div>
                <div class="menu-cate-part">
                    <div class="menu-cate-title">价格</div>
                    <div class='line'></div>
                    <div class="cate-list">
                        <div class="item">
							<a href="/mn_shop.aspx?type7=1000以下">1000以下</a>
                            	</div>
						<div class="item"><a href="/mn_shop.aspx?type7=1001~3000">1001~3000</a>	</div>
						<div class="item"><a href="/mn_shop.aspx?type7=3001~5000">3001~5000</a>	</div>
						<div class="item"><a href="/mn_shop.aspx?type7=5001~10000">5001~10000</a></div>
						<div class="item"><a href="/mn_shop.aspx?type7=10001~50000">10001~50000</a></div>
                        <div class="item"><a href="/mn_shop.aspx?type7=50000以上">50000以上</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <script>
        $("#btnSearch1").bind("click", function (e) {
            var keyword = $("#keyword1").val();
            window.location.href = "mn_shop.aspx?keyword=" + keyword;
        });

        function copyTelephone() {
            var val = document.getElementById('Telephone');
            window.getSelection().selectAllChildren(val);
            document.execCommand("Copy");
            alert("复制成功，可添加微信");
        }
        // 隐藏分类面板
        function moveRight() {
            ismenu = false;
            // console.log("dhgsfhjsgdghj");
            $("#menupart").animate({ left: '100%' }, "slow", function () {
                $(this).css("display", "none");
                $("#menumark").css("display", "none");
                utils.toggleBody(false)
            });
        }
        //弹出分类面板
        function moveLeft() {
            ismenu = true;
            // console.log("dhgsfhjsgdghj");
            $('#menupart').css("display", "block");
            $("#menumark").css("display", "block");
            $("#menupart").animate({ left: '20%' }, "slow"); //8.4
            utils.toggleBody(true)
        }
        //点击隐藏在线咨询面板或拨号面板
        $('#menumark').click(function () {
            moveRight();
            // }
        })
    </script>