<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderCO.ascx.cs" Inherits="DTcms.Web.UserControl.HeaderCO" %>
<script src="js/o_code.js" type="text/javascript" charset="utf-8"></script>
<header>
	<div class="top">
		<div class="wrap clearfix">
			<h2 class="left" style="letter-spacing:0.2em;">建盏天下，中国建盏业内精品零售平台</h2>
			<div class="right">	
			
				<span style="letter-spacing:1px;">贴心服务热线：<i class="red">4008-276-376</i> </span>
				
			</div>
		</div>
	</div>
	<div class="witBg">
		<div class="wrap clearfix">
			<a href="" class="left"><img src="images/Logo.png"></a>
			<div class="searchWrap left">
				<div class="Search"><input name="keyword" id="keyword" type="text"><input name="btnSearch" id="btnSearch" type="button" value="搜索"></div>
				<div class="keyword">
				    <a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("李达")) %>">李达</a>	
					<a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("孙建兴")) %>">孙建兴</a>
					<a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("陆金喜")) %>">陆金喜</a>
					<a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("陈大鹏")) %>">陈大鹏</a>
					<a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("卓立旗")) %>">卓立旗</a>
					<a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("杨义东")) %>">杨义东</a>
				</div>
			</div>
			<div class="right Bz">
				<dl><dt><img src="images/B_Icon_1.png"></dt><dd>纯手工品质保证</dd></dl>
				<dl><dt><img src="images/B_Icon_2.png"></dt><dd>15天无理由退换</dd></dl>
				<dl><dt><img src="images/B_Icon_3.png"></dt><dd>艺人直供 赝品赔付</dd></dl>
			</div>
		</div>
	</div>

	<div class="navBg">
		<nav class="wrap">
			<ul>
				<li class="Cate">建盏主要分类
					<div class="allProductList CateList hide">
						<div><%--<% Server.UrlEncode %>--%>
							<h2>名家品牌</h2>
								 <a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("陆金喜")) %>">业界大师</a>
								 <a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("裴春元")) %>">老牌传承人</a> 
								 <a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("徐国清")) %>">名家艺师</a>
						</div>
						<div>
							<h2>工艺釉色</h2>						
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("油滴/鹧鸪斑")) %>">油滴</a> 
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("兔毫")) %>">兔毫</a>
                                 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("油滴/鹧鸪斑")) %>">鹧鸪斑</a> 
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("曜变")) %>">曜变</a> 
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("乌金釉")) %>">乌金釉</a>
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("杂色釉/异毫")) %>">柿红</a>
								 <a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("杂色釉/异毫")) %>">茶叶末</a>
						</div>
						<div>
							<h2>经典器型</h2>
								<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("束口盏")) %>">束口盏</a>
								 <a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("撇口盏")) %>">撇口盏</a> 
								 <a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敞口盏/斗笠")) %>">敞口盏/斗笠</a> 
								 <a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敛口盏")) %>">敛口盏</a> 
								 <a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("灯盏")) %>">灯盏</a>
								 <a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("钵型盏")) %>">钵型盏</a>	
						</div>
						<div>
							<h2>功能用途</h2>
								<a href="product_list.aspx?type5=<%=Server.UrlEncode(Server.UrlPathEncode("新手入门")) %>">新手入门</a>
								<a href="product_list.aspx?type5=<%=Server.UrlEncode(Server.UrlPathEncode("客人杯")) %>">客人杯</a>
								 <a href="product_list.aspx?type5=<%=Server.UrlEncode(Server.UrlPathEncode("私享主人杯")) %>">私享主人杯</a> 								 
                                 <a href="product_list.aspx?type5=<%=Server.UrlEncode(Server.UrlPathEncode("收藏投资")) %>">收藏投资</a>								 
								 <a href="product_list.aspx?type5=<%=Server.UrlEncode(Server.UrlPathEncode("套装/送礼")) %>">套装/送礼</a> 
						</div>
						<div>
							<h2 style="line-height:30px;">传世老盏</h2>
								 <a href="product_list.aspx?type6=<%=Server.UrlEncode(Server.UrlPathEncode("全品整器")) %>">全品整器</a> 
								 <a href="product_list.aspx?type6=<%=Server.UrlEncode(Server.UrlPathEncode("残缺瑕疵")) %>">残缺瑕疵</a>
								 <a href="product_list.aspx?type6=<%=Server.UrlEncode(Server.UrlPathEncode("标本残片")) %>">标本残片</a> 	
						</div>
					</div>
				</li>
				<li><a href="index.html" target="_self">首页</a></li>
				<li><a href="product_list.html" target="_self">建盏商城</a></li>
				<li><a href="artisan_list.html" target="_self">名家名堂</a></li>
				<li><a href="article_list2.html" target="_self">建盏学院</a></li>
				<li><a href="collection.html" target="_self">收藏阁</a></li>
				<li><a href="/mn_fwbz.html">实体店</li>
				<li><a href="/mn_gywm.html">关于我们</li>
			</ul>
		</nav>
	</div>	
</header>
<script type="text/javascript">
    $(function () {
        $("#btnSearch").bind("click", function (e) {
            var keyword = encodeURIComponent($("#keyword").val());
            window.location.href = "product_list.aspx?keyword=" + keyword;
        });
    });
</script>