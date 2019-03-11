<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_school.aspx.cs" Inherits="DTcms.Web.m_school" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Header.ascx" tagname="M_Header" tagprefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta charset="UTF-8">
        <title>建盏学院 - 建盏天下网</title>
        <meta name="keywords" content="建盏知识,选盏技巧,建盏新闻,建盏百科,建盏文化" />
        <meta name="description" content="建盏学院是建盏天下网传播千年的建盏文化和历史，共六大板块：建盏工艺，选盏技巧，百科知识，建盏新闻，拍卖行情，建盏历史，一站式指导盏友们如何鉴赏和入门的频道。" />
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
		<uc2:M_Header ID="M_Header1" runat="server" />
&nbsp;<div class="cont">
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>新闻资讯</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("新闻资讯")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
                        <% List<articleView> lstXW = ModelArticleXWZX;
                           foreach (articleView model in lstXW)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>拍卖行情</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("拍卖行情")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
							<% List<articleView> lstPM = ModelArticlePMHQ;
                            foreach (articleView model in lstPM)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>建盏工艺</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("建盏工艺")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
							<% List<articleView> lstJZ = ModelArticleJZGY;
                           foreach (articleView model in lstJZ)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>百科知识</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("百科知识")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
							<% List<articleView> lstBK = ModelArticleBKZS;
                           foreach (articleView model in lstBK)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>选盏技巧</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("选盏技巧")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
							<% List<articleView> lstXZ = ModelArticleXZJQ;
                            foreach (articleView model in lstXZ)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
			<div class="gray_bottom_border">
				<div class="main">
					<div class="title flex flex-sb ">
						<h3>文化历史</h3>
						<a href="m_school_list.aspx?title=<%=Server.UrlEncode(Server.UrlPathEncode("文化历史")) %>">更多></a>
					</div>
					<div>
						<ul class="famous_list clearfix">
							<% List<articleView> lstWH = ModelArticleWHLS;
                            foreach (articleView model in lstWH)
                           { %>

							<li>
								<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="famPhoto"><img src="<%=model.img_url %>"/></a>
								<dl class="famIntr">
									<dt><a href="m_school_detail.aspx?articleid=<%=model.id %>"><%=model.articleTitle %></a></dt>
									
									<dd><%= model.zhaiyao.Length > 111 ? model.zhaiyao.Substring(0, 110) : model.zhaiyao%>  ......<a href="m_school_detail.aspx?articleid=<%=model.id %>" class="detail"><详情></a></dd>
								</dl>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
				
			
		</div>
		<uc1:M_Footer ID="M_Footer1" runat="server" />
		<script src="js/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
	    
        </form>
	</body>
</html>
