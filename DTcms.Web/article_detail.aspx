<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_detail.aspx.cs" Inherits="DTcms.Web.web.article_detail" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>
<%@ Register src="UserControl/LeaveMessage.ascx" tagname="LeaveMessage" tagprefix="uc4" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc5" %>
<%@ Register src="UserControl/HotProduct_Right.ascx" tagname="HotProduct_Right" tagprefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <% article model = Model;
       if (model != null)
       {%>
<title><%=model.title%>—建盏学院<%=acate.GetTitle(model.category_id) %></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=model.title%>,建盏天下" />
<meta name="Description" content="<%=model.zhaiyao.Length > 150 ? model.zhaiyao.Substring(0, 149) : model.zhaiyao %>" />
<%} %>

<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<script src="js/public.js" type="text/javascript"></script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
</head>
 
<body style="background:#F8F8F8;">
    <form id="form1" runat="server"> 
<!---Pos start-->
    <uc1:Header ID="Header1" runat="server" />
    <uc5:Mask ID="Mask1" runat="server" />
<div class="wrap Pos mt10"><a href="/index.html">首页</a> > <a href="/article_list.html">建盏学院</a> > 文章详情</div>
 
<ul class="wrap mt10">
	<li><img src="UpFile/Ad/Ad_M_0.jpg" /></li>
</ul>
 
<!---proIntr start-->
<section class="wrap clearfix Flex proIntr mt10">
	<!---Pic start-->
	<div class="famLeft">
    <% article model = Model;
       if (model != null)
       {
           string Title=acate.GetTitle(model.category_id);
           Random rad = new Random();
           %>
		<div class="artDetail-border">
			<h1 class="artDetail-title">&nbsp;
            <p><%=model.title %></p></h1>
			<p class="align-center">
				<span>时间：<%=model.add_time %></span>&nbsp;
				<span>版块：<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode(Title)) %>" style="text-decoration:underline;color:#FF0000;"><%=Title %></a></span>&nbsp;
                <span>访问量：<%=rad.Next(20, 50) %>次</span>
			</p>
			<br/><br/>
			<div class="artDetail-content">
				<%=model.content %>
			</div>
		<div class="artDetail-recommend">
				<dl class="artDetail-pro clearfix">
					<dt class="artDetail-proImg"><a href="<%=ModelPro.ProductID %>.html"><img src="<%=ModelPro.Images %>" width="390px" height="260px" /></a></dt>
					<dt class="artDetail-proTitle"><h2><%=ModelPro.ProductName%></h2></dt>
					<dd class="artDetail-proSummary"><%=NoHTML(ModelPro.summary)%>......</dd>
					<dd class="artDetail-proTag">
						<span>作者：<strong><%=ModelPro.Author%></strong></span>
						<span>器形：<strong><%=ModelPro.Type3%></strong></span>
						<span>釉色：<strong><%=ModelPro.Type2%></strong></span>
						<span>口径：<strong><%=ModelPro.Volume%></strong></span>
					</dd>
					<dd class="artDetail-proNum">
						编号：<span><%=ModelPro.ProductID %></span>
						<a  name="inquiry" href="javascript:$.windowbox.ShowPrice(<%=ModelPro.ProductID %>,'<%=ModelPro.Author %>','<%=ModelPro.ProductName %>')"><img src="images/AskPrice.jpg" /></a>
					</dd>
				</dl>
			</div>	
		</div>
		<div class="FeedBack p30 FeedBackBorder">
			<ul class="Form w550">
				<uc4:LeaveMessage ID="LeaveMessage1" runat="server" />
			</ul>
            <% if (QRCodeModel != null)
               { %>
			<div class="pl20 proDetail-FeedBack-bg">
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
        <%} %>
	</div>
	<!---insLeft start-->
	<div class="famRight noBorder">

		<div>
			<h1 class="TitleH1 colorRedBrown TitleSideH1">相关资讯
				<span class="more"><a href="/article_list.aspx?keyword=新闻资讯">更多>></a></span>
			</h1>
			<ul class="famSideInfo">
                <% List<articleView> lstArt = ModelArticleList;
                   foreach (articleView modelL in lstArt)
                   {
                     %>                
				    <li><a href="article_detail.aspx?articleid=<%=modelL.id %>"><%=modelL.articleTitle%></a></li>
                <%} %>
				
			</ul>
		</div>
		<br /><br />
		<div>
		    <uc6:HotProduct_Right ID="HotProduct_Right1" runat="server" />
		</div>				
	</div><!---insLeft end-->
	<!---insRight start-->	 
</section><!---proIntr end-->
 
<!---proDetail start-->
<uc3:Zhuanti ID="Zhuanti1" runat="server" /> 
<uc2:Footer ID="Footer1" runat="server" />
</form> 
</body>
</html>
