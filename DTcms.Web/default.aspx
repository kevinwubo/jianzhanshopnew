<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="DTcms.Web._default" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc1" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/HeaderSY.ascx" tagname="HeaderSY" tagprefix="uc2" %>
<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>建盏天下网(JianZhanShop.com) - 建窑建盏首席品牌商城</title>
<meta name="keywords" content="建盏,建窑,天目盏,兔毫盏,油滴盏" />
<meta name="description" content="建盏天下(JianZhanShop.com)是国内首家专注于建窑建盏的专业门户，提供产地艺人直供的精品兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏。建盏天下传播千年的建盏文化和历史，大师名家，老盏等权威信息，提供建盏品鉴、收藏和定制服务。" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/swiper.css"/>
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
<!--<script src="js/swiper3.js" type="text/javascript"></script>-->
<script src="js/idangerous.swiper.min.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

// JavaScript Document
function urlredirect() {
    var sUserAgent = navigator.userAgent.toLowerCase(); 
    if ((sUserAgent.match(/(ipod|iphone os|midp|ucweb|android|windows ce|windows mobile)/i))) {
        // PC跳转移动端
        var thisUrl = window.location.href;
        window.location.href = "/m_index.html";; //跳转为网址后面加mobile的路径
    }
}
urlredirect();

</script>

</head>

<body>
<form id="form1" runat="server">
<!--<div style="height:500px; background:url(UpFile/Banner/Banner.jpg) center top no-repeat;">
</div>-->
<uc2:HeaderSY ID="HeaderSY1" runat="server" />  
<uc4:Mask ID="Mask1" runat="server" />  
<div class="swiper-container" id="indexBanner">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            	<a href="/product_list.aspx?keyword=李达" target="_blank"><img src="UpFile/Banner/Banner1.jpg" width="100%" /></a>
            </div>
			<div class="swiper-slide">
            	<a href="/product_list.aspx?keyword=孙建兴" target="_blank"><img src="UpFile/Banner/Banner2.jpg" width="100%" /></a>
            </div>
        </div>
</div>
        <!-- Add Pagination -->
        <div class="swiper-pagination" id="indexPagination"></div>
    </div>
<div class="wrap">
	<ul class="index-side-banner mt20 clearfix">
	<li><a href="/collection.html" target="_blank"><img src="UpFile/Ad/Ad_T_1.jpg" width="235" height="200" /></a></li>
	<li><a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("老盏")) %>" target="_blank"><img src="UpFile/Ad/Ad_T_2.jpg" width="325" height="200" /></a></li>
	<li><a href="/product_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("卓立旗")) %>" target="_blank"><img src="UpFile/Ad/Ad_T_3.jpg" width="325" height="200" /></a></li>
	<li><a href="/artisan_33.html" target="_blank"><img src="UpFile/Ad/Ad_T_4.jpg" width="235" height="200" /></a></li>
</ul>
</div>


<!---section start-->
<section class="wrap mt20 clearfix">
	<!---w860 start-->
	<div class="w860 left">
		<h1 class="TitleH1"><a href="product_list.aspx?type1=<%=Server.UrlEncode(Server.UrlPathEncode("业界大师")) %>">更多></a>
		</h1>
		<ul class="index-proList mt10 clearfix">
        <% List<Product> lstP = ModelListA1;//大师精品
            foreach(Product model in lstP)
            { %>
			<li><a href="<%=model.ProductID.ToString() %>.html" target="_blank"><h2>【<%=model.Author %>】<%=model.ProductName %></h2>
            <b>编号：<%=model.ProductID.ToString() %></b></a>
            <i name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">快速询价</i>
			<a href="<%=model.ProductID.ToString() %>.html" target="_blank">			
            <div>
            <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                  <img src="<%=model.Images %>" /><%}else{ %>
                  <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
            </div>
                    </li>
            <%} %>
		</ul>
	</div><!---w860 end-->
	
	<!---w300 start-->
	<div class="w300 right">
		<div>
			<div class="DtTitle tab_nav">
				<span class="tabCur">最新消息<i>Notice</i></span>
			</div>
			<div class="tab_box">
				<div style="display: none;">
					<ul class="newsList1 mt10">
					</ul>
				</div>
				<div class="none" >
					<ul class="newsList1 mt10">
                    <% List<articleView> lstArtGG = ModelArticleGGList;
                       foreach (articleView model in lstArtGG)
                       { %>
						<li><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank"><%=model.articleTitle%></a></li>
                        <%} %>
					</ul>
				</div>
			</div>
		</div>
		<div class="mt200"><img src="UpFile/Ad/Ad_R_0.jpg"></div>
	</div>
    <!---w300 end-->
	
</section><!---section end-->

<!---section2 start-->
<section class="wrap mt10 clearfix">
	<!---w225 start-->
	<div class="w225 left">
		<h1 class="TitleH1"><a href="product_list.html">更多></a></h1>
		<div class="mt10">
			<img src="UpFile/Ad/Ad_L_1.jpg" />
			<div class="keyword">
				<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("油滴/鹧鸪斑")) %>" class="Cur">油滴盏</a>
				<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("兔毫")) %>">兔毫盏</a>
				<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("曜变")) %>">曜变盏</a>
				<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("油滴/鹧鸪斑")) %>">鹧鸪斑</a>
				<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("杂色釉/异毫")) %>">柿红</a>
			</div>
		</div>
	</div><!---w225 end-->

	<!---w940 start-->
	<div class="w940 right">
		<h1 class="TitleH1 tab_nav">
			<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("油滴/鹧鸪斑")) %>" class="tabCur">油滴</a>
			<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("兔毫")) %>">兔毫</a>
			<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("曜变")) %>">曜变</a>
			<%--<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("乌金釉")) %>">乌金釉</a>--%>
			<a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode("杂色釉/异毫")) %>">杂色釉</a>

		</h1>
		<div class="tab_box">
				<div>
					<ul class="index-proList2 mt10 clearfix">
					 <% List<Product> lstP2 = ModelListA2;//工艺精品-油滴
                        foreach(Product model in lstP2)
                        { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
                                <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
							    
						    </li>
                        <%} %>						
					</ul>
				</div>
				<div class="hide">
						<ul class="index-proList2 mt10">
						 <% List<Product> lstP3 = ModelListA3;//工艺精品-兔毫
                            foreach(Product model in lstP3)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
							    
						    </li>
                        <%} %>	
					</ul>
				</div>
				<div class="hide">
					<ul class="index-proList2 mt10">
												 <% List<Product> lstP4 = ModelListA4;//工艺精品-曜变
                            foreach(Product model in lstP4)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
						    </li>
                        <%} %>	
					</ul>
				</div>
				<div class="hide">
                <ul class="index-proList2 mt10">
                        <% List<Product> lstP6 = ModelListA6;//工艺精品-杂色釉
                            foreach(Product model in lstP6)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    <div><img src="<%=model.Images %>" /></div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>							    
						    </li>
                        <%} %>	
					</ul>
                </div>
		</div>
	</div><!---w940 end-->

</section><!---section2 end-->

<!---section3 start-->
<section class="wrap mt10 clearfix">
	<!---w225 start-->
	<div class="w225 QiXing left">
		<h1 class="TitleH1"><a href="product_list.html">更多></a></h1>
		<div class="mt10">
			<img src="UpFile/Ad/Ad_L_2.jpg" />
			<div class="keyword">
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("束口盏")) %>" class="Cur">束口盏</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敛口盏")) %>">敛口盏</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("撇口盏")) %>">撇口盏</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敞口盏/斗笠")) %>">敞口盏</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("钵型盏")) %>">钵型盏</a>
			</div>
		</div>
	</div><!---w225 end-->

	<!---w940 start-->
	<div class="w940 right">
		<h1 class="TitleH1 tab_nav">
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("束口盏")) %>" class="tabCur">束口</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敛口盏")) %>">敛口</a>
			<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("撇口盏")) %>">撇口</a>
			<%--<a href="product_list.aspx?type3=<%=Server.UrlEncode(Server.UrlPathEncode("敞口盏/斗笠")) %>">敞口</a>--%>

		</h1>
		<div class="tab_box">
				<div>
					<ul class="index-proList2 mt10">
					<% List<Product> lstP7 = ModelListA7;//经典器型-束口
                            foreach(Product model in lstP7)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    						    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
						    </li>
                        <%} %>	
					</ul>
				</div>
				<div class="hide">
						<ul class="index-proList2 mt10">
					<% List<Product> lstP8 = ModelListA8;//经典器型-敛口
                            foreach(Product model in lstP8)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    						    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>							    
						    </li>
                        <%} %>	
					</ul>
				</div>
				<div class="hide">
					<ul class="index-proList2 mt10">
					<% List<Product> lstP9 = ModelListA9;//经典器型-撇口
                            foreach(Product model in lstP9)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    						    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
						    </li>
                        <%} %>	
					</ul>
				</div>
				<div class="hide">
                    <ul class="index-proList2 mt10">
					<%--<% List<Product> lstP10 = ModelListA10;//经典器型-敞口
                    foreach (Product model in lstP10)
                            { %>			
                            <li>
							    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
							    <div><img src="<%=model.Images %>" /></div>
							    <h2>【<%=model.Author %>】<%=model.ProductName %></h2>
							    <div><b>编号：<%=model.ProductID.ToString() %></b></a><i onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点此询价</i></div>
						    </li>
                        <%} %>	--%>
					</ul>
                </div>
		</div>
	</div><!---w940 end-->
</section><!---section3 end-->

<div class="wrap mt10"><img src="UpFile/Ad/Ad_M_0.jpg" width="100%" /></div>

<!---section4 start-->
<section class="wrap mt20 MingJia">
		<h1 class="TitleH1 tab_nav">
			<a href="product_list.aspx?type1=<%=Server.UrlEncode(Server.UrlPathEncode("业界大师")) %>" class="tabCur">业界大师</a>
			<a href="product_list.aspx?type1=<%=Server.UrlEncode(Server.UrlPathEncode("老牌传承人")) %>">老牌传承人</a>
			<a href="product_list.aspx?type1=<%=Server.UrlEncode(Server.UrlPathEncode("名家工艺师")) %>">名家工艺师</a>
			<span class="more" onclick="artisan_list.aspx">更多>></span>
		</h1>
		<div class="tab_box clearfix">
			<div>
				<ul class="index-proList3 mt10">
					<% List<Artisan> lstA1 = ModelArtisanListA1;//名家名堂-业界大师
                        foreach (Artisan model in lstA1)
                    { %>			
                        <li>
						    <a href="artisan_<%=model.artisanID %>.html" target="_blank">
						    <div><img src="<%=model.IDHead %>" /></div>
						    <div><b><%=model.artisanName %></b><i><%=model.artisanTitle %></i></div>
						    </a>
					    </li>
                    <%} %>	  			
				</ul>
			</div>
			<div class="hide">
				<ul class="index-proList3 mt10">
					<% List<Artisan> lstA2 = ModelArtisanListA2;//名家名堂-老牌传承人
                        foreach (Artisan model in lstA2)
                    { %>			
                        <li>
						    <a href="artisan_<%=model.artisanID %>.html" target="_blank">
						    <div><img src="<%=model.IDHead %>" /></div>
						    <div><b><%=model.artisanName %></b><i><%=model.artisanTitle %></i></div>
						    </a>
					    </li>
                    <%} %>	
				</ul>
			</div>
			<div class="hide">
                <ul class="index-proList3 mt10">
					<% List<Artisan> lstA3 = ModelArtisanListA3;//名家名堂-名家工艺师
                        foreach (Artisan model in lstA3)
                    { %>			
                        <li>
						    <a href="artisan_<%=model.artisanID %>.html" target="_blank">
						    <div><img src="<%=model.IDHead %>" /></div>
						    <div><b><%=model.artisanName %></b><i><%=model.artisanTitle %></i></div>
						    </a>
					    </li>
                    <%} %>	
				</ul>
            </div>
		</div>
</section>
<!---section4 end-->


<!---section4 start-->
<section class="wrap mt20 clearfix">
	<!---ChuangShi start-->
	<div class="ChuangShi left">
		<h1 class="TitleH1 tab_nav">
			<a href="product_list.aspx?type6=<%=Server.UrlEncode(Server.UrlPathEncode("全品整器")) %>" class="tabCur">全品整器</a>
			<a href="product_list.aspx?type6=<%=Server.UrlEncode(Server.UrlPathEncode("残缺瑕疵")) %>">残缺瑕疵</a>
			<span class="more" onclick="product_list.aspx">更多>></span>
		</h1>
        <div class="tab_box clearfix">
        <div >
		<ul class="index-proList mt10">
		<% List<Product> lstP11 = ModelListA11;//传世老盏-全品整器	
            foreach (Product model in lstP11)
                { %>			
                <li>
                    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
                    <h2><%=model.ProductName %></h2>
                    <b>编号：<%=model.ProductID.ToString() %></b>
                    </a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'','<%=model.ProductName %>')">点此询价</i>
                    <a href="<%=model.ProductID.ToString() %>.html">
                    						    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
                    </a>
                 </li>
            <%} %>	            
		</ul>
        </div>
        <div class="hide">
		<ul class="index-proList mt10">
		<% List<Product> lstP12 = ModelListA12;//传世老盏-残缺瑕疵
     foreach (Product model in lstP12)
                { %>			
                <li>
                    <a href="<%=model.ProductID.ToString() %>.html" target="_blank">
                    <h2><%=model.ProductName %></h2>
                    <b>编号：<%=model.ProductID.ToString() %></b>
                    </a><i  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'','<%=model.ProductName %>')">点此询价</i>
                    <a href="<%=model.ProductID.ToString() %>.html"  target="_blank">
                    						    <div>
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0){ %>
                                      <img src="<%=model.Images %>" /><%}else{ %>
                                      <div class="rel"><img src="<%=model.Images %>"><div class="sold"></div></div><%} %>
                                </div>
                    </a>
                 </li>
            <%} %>	            
		</ul>
        </div>        
        <div class="hide">
		<ul class="index-proList mt10">
		            
		</ul>
        </div>
        </div>
	</div><!---ChuangShi end-->
	
	<!---XueYuan start-->
	<div class="XueYuan right">
		<h1 class="TitleH1">
			<span class="more" onclick="location.href='index.html'">更多>></span>
		</h1>
		<div class="HotNews clearfix mt10">
			<ul class="newsList2">
            <% List<articleView> lstArt = ModelArticleListA;
               foreach (articleView model in lstArt)
               {%>
				<li>
					<dl class="newsList2-des clearfix">
						<dt class="newsList2-img"><a href=""><img src="<%=model.img_url %>" width="100%" /></a></dt>
						<dt><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank"><%=model.articleTitle %></a></dt>
						<dd><%= model.zhaiyao.Length > 62 ? model.zhaiyao.Substring(0, 61) : model.zhaiyao%> </dd>
					</dl>
				</li>
                <%} %>			
			</ul>
			<div class="ml10 right"><img src="UpFile/Ad/Ad_R_2.jpg" /></div>
		</div>
		<div class="News mt5">
			<ul class="newsList1">
            <% List<articleView> lstArtL = ModelArticleList;
                foreach (articleView model in lstArtL)
                {%>
				<li><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank"><%=model.articleTitle %></a></li>
                <%} %>
			</ul>
		</div>
		
		<div class="QickLink mt10">
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("行业新闻")) %>" class="Cur">行业新闻</a>
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("拍卖行情")) %>">拍卖行情</a>
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("选盏技巧")) %>">选盏技巧</a>
			<a href="artisan_list.html">守艺人</a>
			<a href="#">促销活动</a>
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("百科知识")) %>">百科知识</a>
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("建盏工艺")) %>">建盏工艺</a>
			<a href="product_list.html">建盏商城</a>
			<a href="#">排行榜</a>
			<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("文化历史")) %>">文化历史</a>
		</div>
	</div><!---XueYuan end-->
	
</section><!---section4 end-->
<uc3:Zhuanti ID="Zhuanti1" runat="server" />
<uc1:Footer ID="Footer1" runat="server" />
<script type="text/javascript">
	var mySwiper = new Swiper('#indexBanner',{
		mode:'horizontal',
	    loop: true,
		autoplay:5000,
		pagination: '#indexPagination',
		paginationClickable: true,
		grabCursor : true,
	  });  
</script>
    
    </form>
</body>
</html>