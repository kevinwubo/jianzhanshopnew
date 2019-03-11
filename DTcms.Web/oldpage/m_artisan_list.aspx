<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="m_artisan_list.aspx.cs" Inherits="DTcms.Web.m_artisan_list" %>
<%@ Register src="UserControl/M_Header.ascx" tagname="M_Header" tagprefix="uc1" %>
<%@ Register src="UserControl/M_Footer.ascx" tagname="M_Footer" tagprefix="uc2" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>名家名堂 - 建盏天下网</title>
<meta name="keywords" content="建盏名家,卓立旗,李达,孙建新,黄美金,陈大鹏" />
<meta name="description" content="名家名堂是建盏天下网第一手发布建窑建盏大师名家资讯和个人介绍，业界大师：孙建新、李达、黄美金、陈大鹏、卓立旗、陆金喜；老牌传承人：蔡炳盛、蔡炳昆、叶礼旺、叶礼忠；知名品牌：飞惺、吉玉坊、芦花坪......" />
<meta name="author" content="jianzhan team" />  
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">  
<meta name="format-detection" content="telephone=no"> 
<meta http-equiv="x-rim-auto-match" content="none">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="css/m_base.css"/>
<link rel="stylesheet" type="text/css" href="css/m_main.css"/>
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
	</head>
	<body>
		<uc1:M_Header ID="M_Header2" runat="server" />
		<div class="main">
			<div class="swiper-container" id="indexBanner">
		        <div class="swiper-wrapper">
		            <div class="swiper-slide">
		            	<a href="/m_lujinxi.html"><img src="m_images/banner.jpg" width="100%" /></a></div>
					<div class="swiper-slide">
		            	<a href="/m_huangmeijin.html"><img src="m_images/banner2.jpg" width="100%" /></a>
		            </div>
		        </div>
		         <div class="swiper-pagination" id="indexPagination"></div>
			</div>
			<div class="cont">
				<div  class="title"><h2>名家推荐</h2></div>
				<div>
					<ul class="famous_list clearfix">
                        <% List<Artisan> lstArt = ModelArticleList;
                            foreach (Artisan model in lstArt)
                            { %>
						<li>
							<a href="m_art<%=model.artisanID %>.html" class="famPhoto"><img src="<%=model.IDHead %>"/></a>
							
								<dl class="famIntr">
									<dt><a href="m_art<%=model.artisanID %>.html">【<%=model.artisanName %>】</a></dt>
									<dd><%= model.introduction.Length>86?model.introduction.Substring(0,85):model.introduction %> ......<a href="m_art<%=model.artisanID %>.html">详情</a></dd>
								</dl>
								<dl class="famPro">
									<dt>代表作品：</dt>
									<dd class="flex flex-sb">
                                    <% 
                                        List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 3);
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
                		<!---PageBar start-->
		<form id="form1" runat="server">
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
