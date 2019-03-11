<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_artisan_detail.aspx.cs" Inherits="DTcms.Web.m_artisan_detail" %>
<%@ Register src="UserControl/M_Header.ascx" tagname="M_Header" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <% List<Artisan> lstArtA = ModelArtisanList;
    foreach (Artisan model in lstArtA)
    {
         %>
<title>建盏名家大师【<%=model.artisanName %>】 - 建盏天下网</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,建盏老师,<%=model.artisanName %>,建盏品牌" />
<meta name="Description" content="【<%=model.artisanName %>】<%=NoHTML(model.introduction) %>" />
<%} %>
<meta name="author" content="jianzhan team" />  
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">  
<meta name="format-detection" content="telephone=no"> 
<meta http-equiv="x-rim-auto-match" content="none">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="css/m_base.css"/>
<link rel="stylesheet" type="text/css" href="css/m_main.css"/>
</head>
<body>
		<uc1:M_Header ID="M_Header2" runat="server" />
         <% List<Artisan> lstArt = ModelArtisanList;
            foreach (Artisan model in lstArt)
            { %>
		<div class="main">
			<div class="swiper-container" id="indexBanner">
              <br /><h1>&nbsp;&nbsp;<u><a href="javascript:history.back();">返回上页</a></u></h1>
		         <div class="swiper-pagination" id="indexPagination"></div>
			</div>
			<div class="cont mt20">
				<div class="famous_info">
					<img src="<%=model.IDHead %>" />
					<h3><span>【<%=model.artisanName %>】</span><%=model.artisanName2 %></h3>
					<p><%=model.DetailedIntroduction %></p>
				</div>
			</div>
			<div class="cont mt20">
				<div class="title"><h2>名家作品</h2></div>
				<div>
					<ul class="product_list product_list_2 flex flex-hw flex-sb">
                    <%
                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 3);
                        foreach (Product modelPro in lstPro)
                        {
                    %>
						<li>
							<dl class="product_list_info">
								<dt><a href="m_<%=modelPro.ProductID %>.html" ><img src="<%=modelPro.Images %>"/></a></dt>
								<dt class="product_list_title"><a href="" >【<%=modelPro.Author %>】<%=modelPro.ProductName %></a></dt>
								<dd>编号：<%=modelPro.ProductID %></dd>
								<dd><a  name="inquiry" href="" class="product_inquiry_btn">点击询价</a></dd>
							</dl>
						</li>
                        <%} %>
					</ul>
				</div>
			</div>
		</div>
        <%} %>
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
	</body>
</html>
