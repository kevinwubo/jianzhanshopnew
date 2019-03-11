<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menuplane.ascx.cs" Inherits="DTcms.Web.UserControl.menuplane" %>
<style>
    #menupart {
	        height: 100%;
	        width: 80%;
	        position: absolute;
	        top: 0;
	        left: 0;
	        z-index: 99;
        }
        #menupart .menu-body {
			width: 100%
		}
		#swiper-container-star a #headimg {
            width: 100%;
            height: 3.7rem;
        }
</style>
<div id='menuplane' class="menuplane">
			<div id="header" class="header bgc_c3" style="width:100%;right: 0;left: auto;">
				<!-- 通用头 -->
				<div id="head-page" class="head-page head-page-home">
					<div class="head-left" onclick="moveRight()">
						<div class="head-gohome">
							<span class="head-gohome-img"></span>
							<span>首页</span>
						</div>
					</div>
					<div class="head-title">
						筛选
					</div>
				</div>
			</div>
			<div class="menu-body">
				<div class="menu-cate-part">
					<div class="menu-cate-title">名家大师</div>
					<div class="cate-list">
						<div class="item">
							<div><a href="/mn_shop.aspx?artisanType=业界大师">业界大师</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?artisanType=老牌传承人">老牌传承人</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?artisanType=名家工艺师">名家工艺师</a></div>
						</div>
					</div>
				</div>
				<div class="menu-cate-part">
					<div class="menu-cate-title">工艺釉色</div>
					<div class="cate-list">
						<div class="item">
							<div><a href="/mn_shop.aspx?type2=兔毫">兔毫</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type2=油滴/鹧鸪斑">油滴/鹧鸪斑</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type2=曜变">曜变</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type2=乌金釉">乌金釉</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type2=杂色釉/异毫">杂色釉/异毫</a></div>
						</div>
					</div>
				</div>
				<div class="menu-cate-part">
					<div class="menu-cate-title">经典器型</div>
					<div class="cate-list">
						<div class="item">
							<div><a href="/mn_shop.aspx?type3=束口盏">束口盏</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type3=灯盏">灯盏</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type3=敞口盏/斗笠">敞口盏/斗笠</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type3=撇口盏">撇口盏</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type3=敛口盏">敛口盏</a></div>
						</div>
                        <div class="item">
							<div><a href="/mn_shop.aspx?type3=钵型盏">钵型盏</a></div>
						</div>
            <%--            <div class="item">
							<div><a href="/mn_shop.aspx?type3=创新器型">创新器型</a></div>
						</div>--%>
					</div>
				</div>
                 <div class="menu-cate-part">
					<div class="menu-cate-title">尺寸</div>
					<div class="cate-list">
						<div class="item">
							<div><a href="/mn_shop.aspx?type4=小（口径9cm以下）">小（口径9cm以下）</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type4=中（口径9-12cm）">中（口径9-12cm）</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type4=大（口径12cm以上）">大（口径12cm以上）</a></div>
						</div>
					</div>
				</div>
                <div class="menu-cate-part">
					<div class="menu-cate-title">价格</div>
					<div class="cate-list">
						<div class="item">
							<div><a href="/mn_shop.aspx?type7=1000以下">1000以下</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type7=1001~3000">1001~3000</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type7=3001~5000">3001~5000</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type7=5001~10000">5001~10000</a></div>
						</div>
						<div class="item">
							<div><a href="/mn_shop.aspx?type7=10001~50000">10001~50000</a></div>
						</div>
                        <div class="item">
							<div><a href="/mn_shop.aspx?type7=50000以上">50000以上</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>

        <script>
            // 隐藏分类面板
            function moveRight() {
                console.log("dhgsfhjsgdghj");
                $("#menupart").animate({ left: '100%' }, "slow", function () {
                    $(this).css("display", "none");
                    $("#menumark").css("display", "none");
                });
            }
            //弹出分类面板
            function moveLeft() {
                // console.log("dhgsfhjsgdghj");
                $('#menupart').css("display", "block");
                $("#menumark").css("display", "block");
                $("#menupart").animate({ left: '20%' }, "slow"); //8.4
            }
        </script>