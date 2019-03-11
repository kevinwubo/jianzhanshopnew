<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_product_list.aspx.cs" Inherits="DTcms.Web.m_product_list" %>
<%@ Register src="UserControl/M_Header.ascx" tagname="M_Header" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/M_Mask.ascx" tagname="M_Mask" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>建盏商城 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,天目盏,兔毫盏,油滴盏,束口盏" />
<meta name="description" content="建盏商城是福建省建窑建盏首席品牌商城，提供产地大师名家直供的一手精品货源：兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏，提供建盏价格、收藏、名家押窑和私人定制服务。" />
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
<uc3:M_Mask ID="M_Mask1" runat="server" />
<uc1:M_Header ID="M_Header1" runat="server" />
&nbsp;<div class="main">
			<div class="cont mt20">
				<ul class="artist_list clearfix">
					<li class="strong">【作者】</li>
					<li><a href="m_product_list.aspx">全部</a></li>
                    <% List<Artisan> lstArtC = bllArtisan.GetArtisanList(" and IsCooperation=1", " Sort,artisanName desc");        
                   foreach (Artisan model in lstArtC)
                   { %>
				    <li><a href="m_product_list.aspx?name=<%=model.artisanName %>"><%=model.artisanName %></a></li>
                <%} %>	
					
				</ul>
			</div>
<%--			<div class="cont border_bottom pb20">
				<div  class="title title2"><h2>名师精品推荐</h2></div>
				<div class="flex">
					<a href="" class="shop_product_img"><img src="m_images/product.jpg"/></a>
					<dl class="shop_product_info">
						<dt><a href="">【卓立旗】黑釉银斑束口盏</a></dt>
						<dd>编号：11520</dd>
						<dd>器形：束口盏</dd>
						<dd><a href="#" class="shop_product_link">进入名师匠作>></a><a href="" class="product_inquiry_btn">点击询价</a></dd>
					</dl>
				</div>
			</div>--%>
			<div class="cont">
				<div  class="title title2"><h2>名师匠作列表</h2>                    
                </div>
				<div>
					<ul class="product_list flex flex-hw flex-sb">
                    <% List<Product> lstPro = ModelProList;
                       foreach (Product model in lstPro)
                       { %>
						<li>
							<dl class="product_list_info">
                                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0)
                                   { %>
								    <dt><a href="m_<%=model.ProductID %>.html" ><img src="<%=model.Images %>"/></a></dt>
                                <%}
                                   else
                                   { %>
                                   <dt class="rel"><a href="m_<%=model.ProductID %>.html" ><img src="<%=model.Images %>"/></a>
                                     <div class="sold"></div>
                                    </dt>
                                   <%} %>
								<dt class="product_list_title"><a href="m_<%=model.ProductID %>.html" >【<%=model.Author %>】<%=model.ProductName %></a></dt>
								<dd>编号：<%=model.ProductID %></dd>
								<dd><a  name="inquiry" href="javascript:ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')" class="product_inquiry_btn">点击询价</a></dd>
							</dl>
						</li>
						<%} %>
					</ul>
				</div>
                <!---PageBar start-->
		        <form id="form2" runat="server">
                    <div class="line20"></div>
                    <div class="pagelist">
                      <div class="l-btns">
                        <span>显示</span>
                        <asp:TextBox ID="txtPageNum" runat="server"  CssClass="pagenum" 
                              onkeydown="return checkNumber(event);"  AutoPostBack="True" 
                              ontextchanged="txtPageNum_TextChanged"></asp:TextBox>
                          <span>条/页</span>
                      </div>  
                      <div id="PageContent" runat="server" class="default"></div>
                    </div>
                </form>
                <!---PageBar end-->
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
	</body>
</html>
