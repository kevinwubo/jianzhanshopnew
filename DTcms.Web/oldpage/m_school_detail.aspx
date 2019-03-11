<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_school_detail.aspx.cs" Inherits="DTcms.Web.school_detail" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/M_Mask.ascx" tagname="M_Mask" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta charset="UTF-8">
    <% article model = Model;
       if (model != null)
       {%>
<title><%=model.title%>—建盏学院<%=acate.GetTitle(model.category_id) %></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=model.title%>,建盏天下" />
<meta name="Description" content="<%=model.zhaiyao.Length > 150 ? model.zhaiyao.Substring(0, 149) : model.zhaiyao %>" />
<%} %>
		<meta name="title" content="建盏天下" />  
		<meta name="author" content="jianzhan team" />  
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">  
		<meta name="format-detection" content="telephone=no"> 
		<meta http-equiv="x-rim-auto-match" content="none">
		<meta name="apple-touch-fullscreen" content="yes">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" type="text/css" href="css/m_base-n.css"/>
	<link rel="stylesheet" type="text/css" href="css/m_main-n.css"/>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
	</head>
	<body>

        <form id="form1" runat="server">
        <uc1:M_Mask ID="M_Mask1" runat="server" />
    <% article modelShow = Model;
       if (modelShow != null)
       { %>
		<div class="product_header flex flex-sb flex-align">
			<a href="javascript:history.back();">返回</a>
			<h1><span><i class="news_icon"></i><a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("新闻资讯")) %>"><%=acate.GetTitle(modelShow.category_id)%></a></span></h1>
			<a href="m_index.html">首页</a>
		</div>
		<div class="main news_box">
			<h2 class="news_title"><%=modelShow.title %></h2>
			<div class="news_cont">
				<%=modelShow.content%>
			</div>
		</div>
        <%} %>
		<div class="white_border pb20">
			<div class="main">
				<div class="title flex flex-sb">
					<h3>今日新品</h3>
					<a href="/m_product_list.html">更多></a>
				</div>
				<ul class="product1 flex flex-sb flex-hw">

                <% List<Product> lstNew = ModelListNEW;
                   foreach (Product modelP in lstNew)
                   { %>
					<li>
						<dl class="product_list_info">
							<dt class="product_img"><a href="m_<%=modelP.ProductID %>.html"><img src="<%=modelP.Images %>"></a></dt>
							<dt class="product_list_title"><a href="m_<%=modelP.ProductID %>.html">【<%=modelP.Author %>】<%=modelP.ProductName %></a></dt>
							
							<dd><a href="javascript:ShowPrice(<%=modelP.ProductID %>,'<%=modelP.Author %>','<%=modelP.ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
						</dl>
					</li>
					<%} %>
				        
				</ul>
			</div>
		</div>
		<uc2:M_Footer ID="M_Footer1" runat="server" />
        <script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>	    
	    </form>
	</body>
</html>
