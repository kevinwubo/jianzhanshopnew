<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_product_detail.aspx.cs" Inherits="DTcms.Web.m_product_detail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/M_Mask.ascx" tagname="M_Mask" tagprefix="uc3" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
 <% 
     List<Product> listProA=productModelList;
     foreach (Product model in listProA)
     { %>
<title>【<%=model.Author %>】<%=model.ProductName %>—建盏天下</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,<%=model.Author %>,<%=model.Type2 %>,<%=model.Type3 %>,<%=model.MarketPrice %>" />
<meta name="Description" content="【<%=model.Author %>】<%=model.ProductName %>,<%=model.Volume %><%=NoHTML(model.summary) %>" />
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
<link href="css/m_style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
	</head>
	<body>
        <form id="form1" runat="server">
        <uc3:M_Mask ID="Mask1" runat="server" />
 <% 
     List<Product> listPro=productModelList;
     foreach (Product model in listPro)
     { %>
		<div class="product_header flex flex-sb flex-align">
			<a href="javascript:history.back();">返回</a>
		
            <h1>
                【<%=model.Author %>】</span><span><%=model.ProductName %></span></h1>
			<a href="m_index.html">首页</a>
		</div>
		<div class="main">
			<div class="swiper-container" id="indexBanner">
		        <div class="swiper-wrapper">
                <% List<string> strLst = model.lstImages;
                   for (int i = 0; i < strLst.Count; i++)
                   {
                        %>
		            <div class="swiper-slide">
		            	<a href="" target="_blank"><%=strLst[i]%></a>
		            </div>
					<%} %>
		        </div>
		         <div class="swiper-pagination" id="indexPagination"></div>
			</div>
			<div class="cont product_info_border">
				<dl class="product_info">
					<dt>【<%=model.Author %>】<%=model.ProductName %></dt>
					<dd class="line_height40"><span>编号：<%=model.ProductID %></span><a  name="inquiry" href="javascript:ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
					<dd>描述：<%=model.summary %></dd>
				</dl>
			</div>
			<div class="cont">

				<div class="product_img">
					<img src="<%=model.ProImageDetail%>" align="absmiddle" /> 
				</div>
			</div>
		</div>

        <div class="infoplane" style="margin-top: 0.3rem">
                <div class="flex-row info-title">
                    <div class="flex-col">漱口凤凰</div>
                    <div class="flex-col red-word">编号：18028</div>
                </div>
                <div class="flex-row auther-info">
                    <div class="flex-col">
                        <div class="text">作者：阿舍</div>
                        <div class="text">尺寸：9.2*1.2</div>
                    </div>
                    <div class="flex-col">
                        <div class="text">釉色：土豪</div>
                        <div class="text">器形：速口赞</div>
                    </div>
                    <div style="line-height: 2rem;margin-right: 0.4rem;">
                        <img style="vertical-align: middle" src="project/Public/image/xunwen.png">
                    </div>
                </div>
                <div class="infoplane-foot-part">
                    啊就是看疗法介绍了科技啊反馈阿里分开就拉上看
                </div>
                <div id="detailcontent" style="margin-top: 0.3rem;width:100%;">
                    <img src="project/Public/image/xiamendian.jpg">
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
	    </form>
	</body>
</html>
