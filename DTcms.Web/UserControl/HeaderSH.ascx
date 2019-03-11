<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderSH.ascx.cs" Inherits="DTcms.Web.UserControl.HeaderSH" %>
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
    <div style="border-bottom:#CCCCCC 1px solid; height:2px;"></div>
	<div class="navBg">
		<nav class="wrap">
			<ul>
				<li>建盏主要分类</li>
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