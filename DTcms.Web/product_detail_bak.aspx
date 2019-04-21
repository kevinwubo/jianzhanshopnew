<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_detail_bak.aspx.cs" Inherits="DTcms.Web.web.product_detail_bak" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>

<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<%@ Register src="UserControl/LeaveMessage.ascx" tagname="LeaveMessage" tagprefix="uc4" %>

<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <% 
     List<Product> listPro=productModelList;
     foreach (Product model in listPro)
     { %>
<title>【<%=model.Author %>】<%=model.ProductName %>—建盏天下</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏名家,<%=model.Author %>,<%=model.Type2 %>,<%=model.Type3 %>,<%=model.MarketPrice %>" />
<meta name="Description" content="【<%=model.Author %>】<%=model.ProductName %>,<%=model.Volume %><%=NoHTML(model.summary) %>" />
<%} %>
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/swiper.css"/>
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<%--<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>--%>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
<%--<script src="js/switch.js" type="text/javascript"></script>--%>
<script src="js/idangerous.swiper.min.js" type="text/javascript" charset="utf-8"></script>
</head>
 
<body style="background:#F8F8F8;">
    <form id="form1" runat="server">
<uc1:Header ID="Header1" runat="server" /> 
<!---Pos start-->
<div class="wrap Pos mt10"><a href="/default.html">首页</a> > <a href="/product_list.html">建盏商城</a> > 商品详情</div>
 
<ul class="wrap mt10">
	<li><img src="UpFile/Ad/Ad_M_0.jpg" /></li>
</ul>
 <% 
     List<Product> listPro=productModelList;
     foreach (Product model in listPro)
     { %>
<!---proIntr start-->
<section class="wrap proIntr clearfix mt10">
	<!---Pic start-->

	<div class="Pic">
	
	  <div class="ui-zoom-plugin">

       <div><img id="img_urls" src="<%=model.Images %>" ></div>
	   <div class="ui-zoom-small proDetail-listWrap">
		   <div class="ui-ico-bg ui-zoom-small-btn ui-zoom-small-btn-prev pre">&lt;</div>
		   <div class="ui-zoom-small-scroll">
			<ul id="list" class="proDetail-sideList">
            <% List<string> strLst = model.lstImages;
               List<string> strLstUrl = model.lstImagesUrl;
               for (int i = 0; i < strLst.Count;i++ )
               {                      
                        %>
                <li class="ui-zoom-small-list" onclick="javascript:ShowImage('<%=strLstUrl[i] %>')"><%=strLst[i]%></li>
                <%} %>
                <li class="ui-zoom-small-list" onclick="javascript:ShowImage('<%=model.Images %>')"><img id="img1" src="<%=model.Images %>" ></li>
			</ul>
		</div>
		<div class="ui-ico-bg ui-zoom-small-btn ui-zoom-small-btn-next next">&gt;</div>
		</div>
            <div class="ui-zoom-cloud"></div>
        </div>
	</div><!---Pic end-->
	<script type="text/javascript">
	    $('.ui-zoom-plugin').Bzoom();
	    $('.ui-zoom-small').BswitchMove({
	        scrollPrevBtn: 'ui-zoom-small-btn-prev',
	        scrollNextBtn: 'ui-zoom-small-btn-next',
	        scrollPrevDisabledBtn: 'ui-zoom-small-btn-prev-disabled',
	        scrollNextDisabledBtn: 'ui-zoom-small-btn-next-disabled',
	        scrollBox: 'ui-zoom-small-scroll',
	        number: 4
	    });	
	</script>
	<!---Intr start-->
	<div class="Intr">
		<dl>
			<dt><h1><%=model.ProductName %></h1></dt>
			<dd class="proDetail-number RedBrown">编号：<%=model.ProductID %></dd>
			<dd class="gray"><%=model.SubTitle %>......</dd>
			<dd>
				<ul class="proDetail-infoList clearfix mt20">
					<li><span>作者：</span><a href="artisan_detail.aspx?artisanname=<%=Server.UrlEncode(Server.UrlPathEncode(model.Author )) %>"><%=model.Author %></a></li>
					<li><span>釉色：</span><a href="product_list.aspx?type2=<%=Server.UrlEncode(Server.UrlPathEncode(model.Type2 )) %>"><%=model.Type2 %></a></li>
					<li><span>器形：</span><a href="product_list.aspx?Type3=<%=Server.UrlEncode(Server.UrlPathEncode(model.Type3 )) %>"><%=model.Type3 %></a></li>
					<li><span>口径尺寸：</span><%=model.Volume%></li>
				    <uc5:Mask ID="Mask1" runat="server" />
				</ul>
			</dd>
		</dl>
		<div class="mt20 clearfix">
			<div class="left proDetail-tel ">
                <div style="width:380px; margin-bottom:10px;">
                <img src="UpFile/Pic/adddd.jpg" width="370" height="110" alt="">
                </div>
				<img src="images/Ask.png" id="AD_Banner6"  onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')" >
			  	<div style="width:150px;">
			  		<span style="font-size:1.5em; font-weight:700;">4008-276-376</span><br>
			  		<span style="font-size:14px;letter-spacing:1px; line-height:20px;">(在线 8:30~22:00)</span>
			  	</div>
			</div>
			<div class="right">  <% if (QRCodeModelONE != null)
                   { %><img src="<%=QRCodeModelONE.QRImage %>"><%} %></div>
		</div>
		<div class="mt70"><img src="images/Bz.jpg"></div>
	</div><!---Intr end-->

</section><!---proIntr end-->
  <div class="mt20 wrap mb70"><img src="images/fuwu.jpg"></div>
<!---proDetail start-->
<section class="wrap proDetail mt10">
		<div class="clearfix proDetail-list">
			<h1 class="DetailH1 tab_nav">
				<a href="javascript:ShowDIV('spxq')" class="tabCur">商品详情</a>
				<a href="javascript:ShowDIV('syff')"  >建盏价值</a>
				<a href="javascript:ShowDIV('fkfs')"  >购买流程</a>
			</h1>
			<div class="AskPrice">
			<a href="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>') "><img src="images/AskPrice.png" id="AD_Banner5"  /></a>
			<img src="images/Icon_Tel.jpg" align="absmiddle" />
			</div>		
		</div>
 
		<div class="tab_box p30">
			<div id="div_spxq">
					<%=model.summary%>
                    <img src="<%=model.ProImageDetail %>" align="absmiddle" />                    
			</div>
			<div id="div_syff" style="display:none" class="none"><img src="images/jiazhi.jpg"  /></div>

			<div id="div_fkfs" style="display:none"  class="none"><img src="images/buy.jpg"  /></div>
		</div>
</section><!---proDetail end-->
 
<!---FeedBack start-->
<section class="wrap mt30">
	<div class="FeedBack  p30">
		<ul class="Form left">
			<uc4:LeaveMessage ID="LeaveMessage1" runat="server" />
         </ul>	
         <% if (QRCodeModel != null)
            { %>	
		<div class="proDetail-FeedBack-bg pl30">
			拨打热线，直接沟通<br><br/><b><%=QRCodeModel.HotLine%></b>
			<br/><img src="images/Tel2.jpg" />
			<br/>24小时客服手机号码！<br/><br/><b><%=QRCodeModel.SalesPhone%></b>（<%=QRCodeModel.SalesName%>）
		</div>
		<div class="proDetail-FeedBack-bg"><img src="<%=QRCodeModel.QRImage %>" /></div>
        <%} %>
	</div>
</section><!---FeedBack end-->
 <%} %>
 <uc3:Zhuanti ID="Zhuanti1" runat="server" />
 <uc2:Footer ID="Footer1" runat="server" /> 
<script type="text/javascript">
    $(function () {
        $('.Cate').mouseover(function () {
            //	$(this).addClass('cateHover');
            $(this).find('.CateList').show();
        });
        $('.Cate').mouseleave(function () {
            //	$(this).removeClass('cateHover');
            $(this).find('.CateList').hide();
        });
    });

    function ShowDIV(type) {
        if (type == "spxq") {
            $("#div_spxq").show();
            $("#div_syff").hide();
            $("#div_fkfs").hide();
        }
        else if (type == "syff") {
            $("#div_spxq").hide();
            $("#div_syff").show();
            $("#div_fkfs").hide();
        }
        else if (type == "fkfs") {
            $("#div_spxq").hide();
            $("#div_syff").hide();
            $("#div_fkfs").show();
        }
    }
    function ShowImage(url) {
        $("#img_urls").attr('src', url);
    }
</script>
 
    
    </form>
 
</body>
</html>
