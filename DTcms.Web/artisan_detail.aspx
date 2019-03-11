<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artisan_detail.aspx.cs" Inherits="DTcms.Web.web.artisan_detail" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/LeaveMessage.ascx" tagname="LeaveMessage" tagprefix="uc4" %>
<%@ Register src="UserControl/HotProduct_Right.ascx" tagname="HotProduct_Right" tagprefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <% List<Artisan> lstArt = ModelArtisanList;
    foreach (Artisan model in lstArt)
    {
         %>
<title>建盏名家大师【<%=model.artisanName %>】 - 建盏天下网</title>
 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,建盏老师,<%=model.artisanName %>,建盏品牌" />
<meta name="Description" content="【<%=model.artisanName %>】<%=NoHTML(model.introduction) %>" />
<%} %>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
</head>
 
<body style="background:#F8F8F8;">
    <form id="form1" runat="server">
<uc1:Header ID="Header1" runat="server" /> 
<!---Pos start-->
<div class="wrap Pos mt10"><a href="default.html">首页</a> > <a href="artisan_list.html">名家名堂</a> > 艺人详情</div>
 
<ul class="wrap mt10">
	<li><img src="UpFile/Ad/Ad_M_0.jpg" /></li>
</ul>
 
 <% List<Artisan> lstArt = ModelArtisanList;
    foreach (Artisan model in lstArt)
    { %>
<!---proIntr start-->
<section class="wrap clearfix proIntr Flex mt10">
	<!---Pic start-->
	<div class="famLeft">
		<div class="famDetail clearfix">
			<a href="#" class="famDetailPhoto"><img src="<%=model.IDHead %>"/></a>
			<dl class="famDetailIntr">
				<dt><%=model.artisanName %>简介</dt>
				<dd class="famDetailCont">
					<%=model.introduction %>
				</dd>
			</dl>
		</div>
		
		<h1 class="TitleH1 colorRedBrown">名家推荐</h1>
		<div class="famDetailList">
			<ul class="clearfix">
            <% List<Artisan> lstHotArt = ModelHotList;
               foreach (Artisan model1 in lstHotArt)
               { %>
				<li>
					<dl class="famDetailDes">
						<dt><img src="<%=model1.IDHead %>" /></dt>
						<dt><a href="artisan_<%=model1.artisanID %>.html"><%=model1.artisanName %></a></dt>
						<dd><%=model1.artisanTitle%><br />
						／<%=model1.artisanType%></dd>
					</dl>
				</li>	
                <%} %>			
			</ul>
		</div>
		<div class="mb30">
			<h1 class="TitleH1 colorRedBrown">个人介绍</h1>
			<div class="famDetailCont mt100">
				<%=model.DetailedIntroduction %>
			</div>
		</div>
		<div class="mb30 pt10">
			<h1 class="TitleH1 colorRedBrown">
				名家作品
				<span class="more"><a href="product_list.html">更多>></a></span>
			</h1>
			<div>
				<ul class="list-proList5 famDetail-proList  mt20">
				<%
                    List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 5);
                    foreach (Product modelPro in lstPro)
                    {                        
                     %>
					<li>
						<a href="<%=modelPro.ProductID %>.html">
						<div><img src="<%=modelPro.Images %>" /></div>
						<h2>【<%=modelPro.Author %>】<%=modelPro.ProductName %></h2>
						<b>NO.<%=modelPro.ProductID %></b>
						<i>点击询价</i>
						</a>
					</li>						
				<%} %>
				</ul>
			</div>
		</div>
		
		<div class="FeedBack p30 FeedBackBorder">
			<ul class="Form w550">
			&nbsp;<uc4:LeaveMessage ID="LeaveMessage1" runat="server" />
			</ul>
            <% if (QRCodeModel != null)
               { %>
			<div class="proDetail-FeedBack-bg">
				拨打热线，直接沟通<br><b><%=QRCodeModel.HotLine%></b>
				<br/>
				<br/>24小时客服手机号码！<br/><b><%=QRCodeModel.SalesPhone%></b>（<%=QRCodeModel.SalesName%>）
				<div class="famDetailQRCode">
					<img src="<%=QRCodeModel.QRImage%>" />
					<p><span><%=QRCodeModel.Remark%></span></p>
				</div>
			</div>
            <%} %>
		</div>
	</div>
	<!---insLeft start-->
	<div class="famRight noBorder">
	
	<div>
			<h1 class="TitleH1 colorRedBrown TitleSideH1">相关资讯
				<span class="more"><a href="/artisan_list.html">更多>></a></span>
			</h1>
			<ul class="famSideInfo">
            <% List<articleView> lstV = ModelArticleList;
               foreach (articleView modelV in lstV)
               { %>
				<li><a href="article_detail.aspx?articleid=<%=modelV.id %>"><%=modelV.articleTitle %></a></li>
                <%} %>
			</ul>
		</div>
		
        <div>
		    <uc5:HotProduct_Right ID="HotProduct_Right1" runat="server" />
		</div>
				
	</div><!---insLeft end-->
	
	<!---insRight start-->
	<%} %>
 
</section><!---proIntr end-->
 
<!---proDetail start-->
 
<section class="wrap mt30">
	
</section><!---FeedBack end-->
 
 <uc3:Zhuanti ID="Zhuanti1" runat="server" />
<uc2:Footer ID="Footer1" runat="server" /> 
 
</form>
 
</body>
</html>
