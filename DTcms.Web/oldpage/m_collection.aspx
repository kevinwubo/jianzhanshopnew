<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_collection.aspx.cs" Inherits="DTcms.Web.m_collection" %>
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
<title>建盏精品收藏馆 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,老盏,建盏孤品,建盏精品,建盏收藏" />
<meta name="description" content="建盏精品收藏馆汇集了一线大师名家直供的第一手精品建盏：获奖建盏、各大博物馆收藏建盏、拍卖精品、孤品建盏、专利建盏，曜变盏，老盏等价格、收藏、名家押窑和私人定制服务。" />
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
			<div class="swiper-container" id="indexBanner">
		        <div class="swiper-wrapper">
		            <div class="swiper-slide">
		            	<a href="/m_lida.html"><img src="m_images/banner1.jpg" width="100%" /></a></div>
					<div class="swiper-slide">
		            	<a href="/m_lujinxi.html"><img src="m_images/banner.jpg" width="100%" /></a>
		            </div>
		        </div>
		         <div class="swiper-pagination" id="indexPagination"></div>
			</div>
			<div class="cont">
				<div  class="title"><h2>最新匠作</h2></div>
				<div>
					<ul class="product_list flex flex-hw">
                            <% List<Product> lstpro = ModelProList;
                               foreach (Product model in lstpro)
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
								<dt class="product_list_title"><a href="m_<%=model.ProductID %>.html" >【<%=model.Author %>】黑釉银斑束口盏黑釉银斑束口盏</a></dt>
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
