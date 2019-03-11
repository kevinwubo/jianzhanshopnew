<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_indexn.aspx.cs" Inherits="DTcms.Web.m_indexn" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/M_Mask.ascx" tagname="M_Mask" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/M_Header.ascx" tagname="M_Header" tagprefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
    <meta charset="UTF-8">
    <title>建盏天下网(JianZhanShop.com) - 建窑建盏首席品牌商城</title>
    <meta name="keywords" content="建盏,建窑,天目盏,兔毫盏,油滴盏" />
    <meta name="description" content="建盏天下(JianZhanShop.com)是国内首家专注于建窑建盏的专业门户，提供产地艺人直供的精品兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏。建盏天下传播千年的建盏文化和历史，大师名家，老盏等权威信息，提供建盏品鉴、收藏和定制服务。" />
    <meta name="author" content="jianzhan team" />  
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">  
    <meta name="format-detection" content="telephone=no"> 
    <meta http-equiv="x-rim-auto-match" content="none">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
    <script src="js/layer/layer.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/m_base-n.css"/>
	<link rel="stylesheet" type="text/css" href="css/m_main-n.css"/>
    <link href="css/m_style.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form id="form1" runat="server">
        <uc1:M_Mask ID="M_Mask1" runat="server" />
		<uc3:M_Header ID="M_Header1" runat="server" />
&nbsp;<div class="cont">
			<div class="main flex flex-hc school_ad">
				<a href="m_product_list.aspx?name=陆金喜"><img src="m_images/school-product1.jpg"/></a>
				<a href="m_product_list.aspx?name=李达"><img src="m_images/school-product2.jpg"/></a>
			</div>
			<div class="gray_border">
				<div class="main">
					<div class="title flex flex-sb">
						<h3>今日新品</h3>
						
						<a href="m_product_list.html">更多></a>
					</div>
					<ul class="product1 flex flex-sb">
                    <% List<Product> lstNew = ModelListNEW;
                       for (int i=0;i<3;i++)
                       {%>
						<li>
							<dl class="product_list_info">								
                                <% if (!string.IsNullOrEmpty(lstNew[i].InventoryCount) && Convert.ToInt32(lstNew[i].InventoryCount) > 0)
                                   { %>
								    
                                    <dt class="rel product_img"><a href="m_<%=lstNew[i].ProductID %>.html"><img src="<%=lstNew[i].Images %>"></a></dt>
                                <%}
                                   else
                                   { %>
                                   <dt class="rel"><a href="m_<%=lstNew[i].ProductID %>.html" ><img src="<%=lstNew[i].Images %>"/></a>
                                     <div class="sold"></div>
                                    </dt>
                                   <%} %>
								<dt class="product_list_title"><a href="m_artisan_detail.aspx?artisanname=<%=lstNew[i].Author %>" >【<%=lstNew[i].Author%>】<%=lstNew[i].ProductName%></a></dt>
								
								<dd><a  name="inquiry" href="javascript:ShowPrice(<%=lstNew[i].ProductID %>,'<%=lstNew[i].Author %>','<%=lstNew[i].ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
							</dl>
						</li>
                        <%} %>
					</ul>
                    <ul class="product1 flex flex-sb">
                    <% 
                        for (int i = 3; i < 6; i++)
                       {%>
						<li>
							<dl class="product_list_info">								
                                <% if (!string.IsNullOrEmpty(lstNew[i].InventoryCount) && Convert.ToInt32(lstNew[i].InventoryCount) > 0)
                                   { %>
								    
                                    <dt class="rel product_img"><a href="m_<%=lstNew[i].ProductID %>.html"><img src="<%=lstNew[i].Images %>"></a></dt>
                                <%}
                                   else
                                   { %>
                                   <dt class="rel"><a href="m_<%=lstNew[i].ProductID %>.html" ><img src="<%=lstNew[i].Images %>"/></a>
                                     <div class="sold"></div>
                                    </dt>
                                   <%} %>
								<dt class="product_list_title"><a href="m_artisan_detail.aspx?artisanname=<%=lstNew[i].Author %>" >【<%=lstNew[i].Author%>】<%=lstNew[i].ProductName%></a></dt>
								
								<dd><a  name="inquiry" href="javascript:ShowPrice(<%=lstNew[i].ProductID %>,'<%=lstNew[i].Author %>','<%=lstNew[i].ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
							</dl>
						</li>
                        <%} %>
					</ul>
                    <ul class="product1 flex flex-sb">
                    <% 
                        for (int i = 6; i < lstNew.Count; i++)
                       {%>
						<li>
							<dl class="product_list_info">								
                                <% if (!string.IsNullOrEmpty(lstNew[i].InventoryCount) && Convert.ToInt32(lstNew[i].InventoryCount) > 0)
                                   { %>
								    
                                    <dt class="rel product_img"><a href="m_<%=lstNew[i].ProductID %>.html"><img src="<%=lstNew[i].Images %>"></a></dt>
                                <%}
                                   else
                                   { %>
                                   <dt class="rel"><a href="m_<%=lstNew[i].ProductID %>.html" ><img src="<%=lstNew[i].Images %>"/></a>
                                     <div class="sold"></div>
                                    </dt>
                                   <%} %>
								<dt class="product_list_title"><a href="m_artisan_detail.aspx?artisanname=<%=lstNew[i].Author %>" >【<%=lstNew[i].Author%>】<%=lstNew[i].ProductName%></a></dt>
								
								<dd><a  name="inquiry" href="javascript:ShowPrice(<%=lstNew[i].ProductID %>,'<%=lstNew[i].Author %>','<%=lstNew[i].ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
							</dl>
						</li>
                        <%} %>
					</ul>
				</div>
			</div>
			<div class="main">
				<div class="title flex flex-sb ">
					<h3>热卖产品</h3>
					<a href="m_product_list.html">更多></a>
				</div>
				<div>
					<ul class="product2 flex flex-sb flex-hw">
                    <%  List<Product> lstHot = ModelListHOT;
                        foreach (Product model in lstHot)
                        { %>
						<li>
							<a href="m_<%=model.ProductID %>.html" class="product2_img"><img src="<%=model.Images %>"></a>
							<dl class="product_list_info2">
								<dt class="product_list_title2"><a href="m_<%=model.ProductID %>.html"><%=model.ProductName %></a></dt>
								<dd class="product_number2">编号：<%=model.ProductID %></dd>
								<dd>作者：<%=model.Author %></dd>
								<dd>釉色：<%=model.Type2 %></dd>
								
								<dd class="product_inquiry"><a  name="inquiry" href="javascript:ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')" >点击询价</a></dd>
							</dl>
						</li>
                        <%} %>
					</ul>
				</div>
			</div>
			<div class="main">
				<div class="title flex flex-sb ">
					<h3>名家推荐</h3>
					<a href="m_artisan_list.html">更多></a>
				</div>
				<div>
					<ul class="famous_list clearfix">
                    <% List<Artisan> lstArt = ModelArticleList;
                       foreach (Artisan model in lstArt)
                       { %>
						<li>
							<a href="" class="famPhoto"><img src="<%=model.IDHead %>"/></a>
							<dl class="famIntr">
								<dt><a href="m_art<%=model.artisanID %>.html">【<%=model.artisanName %>】</a></dt>
								<dd><%= model.introduction.Length>86?model.introduction.Substring(0,85):model.introduction %> ......<a href="m_art<%=model.artisanID %>.html"></详情></a></dd>
							</dl>
							<dl class="famPro">
								<dt>代表作品：</dt>
								<dd class="flex flex-sb">									
									<% 
                                        List<Product> lstPro = bll.GetProductList(" and Author= '" + model.artisanName + "'", 3);
                                        foreach (Product modelPro in lstPro)
                                        {
                                         %>
							                <a href="m_<%=modelPro.ProductID %>.html"  target="_blank"><img height="74px" width="102px" src="<%=modelPro.Images %>"></a>
                                        <%} %>	
								</dd>
							</dl>
						</li>
						<%} %>
					</ul>
				</div>
			</div>
		</div>
        <uc2:M_Footer ID="M_Footer1" runat="server" />
        <script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
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
