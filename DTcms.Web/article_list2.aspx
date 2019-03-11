<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_list2.aspx.cs" Inherits="DTcms.Web.article_list2" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc1" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc2" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>建盏学院 - 建盏天下网</title>
<meta name="keywords" content="建盏知识,选盏技巧,建盏新闻,建盏百科,建盏文化" />
<meta name="description" content="建盏学院是建盏天下网传播千年的建盏文化和历史，共六大板块：建盏工艺，选盏技巧，百科知识，建盏新闻，拍卖行情，建盏历史，一站式指导盏友们如何鉴赏和入门的频道。" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<link href="css/idangerous.swiper.css" rel="stylesheet" type="text/css" />
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<script src="js/public.js" type="text/javascript"></script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<script src="js/layer/layer.js" type="text/javascript"></script>

<script src="js/idangerous.swiper.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
    <form id="form1" runat="server">

<uc3:Header ID="Header1" runat="server" />

<!---swiper1-->
<section class="school-cont1-bg">
	
	<div class="wrap">
		 <div class="device">
		    <a class="arrow-left" href="#"></a> 
		    <a class="arrow-right" href="#"></a>
		    <div class="swiper-container">
		    	<div class="swiper-wrapper">
		        	<div class="swiper-slide">
		        		<ul class="content-slide">
                        <% List<Artisan> lstArt = ArtisanHotList1;
                           foreach (Artisan model in lstArt)
                           { %>
		        			<li>
		        				<a href="artisan_<%=model.artisanID %>.html" target="_blank"><img src="<%=model.IDHead %>" width="240px" height="215px" /></a>
		        				<dl class="des-slide">
		        					<dt><a href="artisan_<%=model.artisanID %>.html" target="_blank"><%=model.artisanName%></a></dt>
		        					<dd><%= model.introduction.Length>45?model.introduction.Substring(0,44):model.introduction %>......<a href="artisan_<%=model.artisanID %>.html" target="_blank" class="red">【详情】</a></dd>
		        				</dl>
		        			</li>
		        			<%} %>
		        		</ul>
		        	</div>
		        	
		        	<div class="swiper-slide">
		        		<ul class="content-slide">
		        			<% List<Artisan> lstArtHot = ArtisanHotList2;
                            foreach (Artisan model in lstArtHot)
                           { %>
		        			<li>
		        				<a href="artisan_<%=model.artisanID %>.html" target="_blank"><img src="<%=model.IDHead %>" width="240px" height="215px" /></a>
		        				<dl class="des-slide">
		        					<dt><a href="artisan_<%=model.artisanID %>.html" target="_blank"><%=model.artisanName %></a></dt>
		        					<dd><%= model.introduction.Length>45?model.introduction.Substring(0,44):model.introduction %>......<a href="artisan_<%=model.artisanID %>.html" target="_blank" class="red">【详情】</a></dd>
		        				</dl>
		        			</li>
		        			<%} %>
		        		</ul>
		        	</div>
		        </div>
		    </div>
			<div class="pagination"></div>
		 </div>
		
		
  </div>
</section>
<!---content start-->
<section class="wrap mt20">
	<!--innernav start-->
	<div>
		<ul class="school-nav clearfix">
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("新闻资讯")) %>">新闻资讯</a></li>
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("拍卖行情")) %>">拍卖行情</a></li>
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("建盏工艺")) %>">建盏工艺</a></li>
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("百科知识")) %>">百科知识</a></li>
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("选盏技巧")) %>">选盏技巧</a></li>
			<li><a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("文化历史")) %>">文化历史</a></li>
		</ul>
	</div>
	<!--innernav end-->
	<!---swiper2 start-->
	
	<!---swiper2 end-->
	<div class="clearfix">
		<!--Purchasing skills start-->
		<div class="school-left">
			<div class="school-title">
				<h2><img src="images/school_title2.jpg" /></h2>
				
			</div>
            <% List<articleView> lstArtJQ = ModelArticleJQList;//选盏技巧 三条数据
               foreach (articleView model in lstArtJQ)
               { %>
			<div class=" school-artistry">
				<div class="school-artistry-left"><a href="artisan_<%=model.id %>.html" target="_blank"><img src="<%=model.img_url %>" /></a></div>
				<a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" class="school-artistry-right">
					<div class="line20">
						<h3><%=model.articleTitle %></h3>
						<p><%=model.zhaiyao.Length > 98 ? model.zhaiyao.Substring(0, 97) : model.zhaiyao%>......</p>
					</div>
				</a>
			</div>
            <%} %>
		</div>
		<!--Maintenance use start-->
		<div class="school-right">
			<div class="school-title">
				<h2><img src="images/school_title3.jpg" /></h2>				
			</div>
			<div>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("选盏技巧")) %>" target="_blank"><img src="images/school_img1.jpg" width="100%" height="195"/></a>
				<ul class="school-maintain mt20">
                <% List<articleView> lstArtBJ = ModelArticleBYList;//保养使用 三条数据
                   foreach (articleView model in lstArtBJ)
                   { %>
					<li>
						<a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" class="school-maintain-link">
							<dl class="school-maintain-cont">
								<dt><%=model.articleTitle %></dt>
								<dd class="line20"><%=model.zhaiyao.Length > 55 ? model.zhaiyao.Substring(0, 54) : model.zhaiyao%>......</dd>
							</dl>
						</a>
					</li>
					<%} %>
				</ul>
			</div>
		</div>
	</div>
	<div class="clearfix mt60">
		<div class="school-knowledge">
			<h1 class="TitleH1 mb30"></h1>
            <% List<articleView> lstArtBKHot = ModelArticleNEWSList1;//新闻资讯  两条数据
               foreach (articleView model in lstArtBKHot)
               { %>
			<div class="school-knowledge-cont">
				<dl>
					<dt class="school-knowledge-title"><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" ><%=model.articleTitle %></a></dt>
					<dd class="line20"><%=model.zhaiyao.Length > 70 ? model.zhaiyao.Substring(0, 69) : model.zhaiyao%>......</dd>
				</dl>
			</div>
            <%} %>
			<div class="mt20">
				<ul class="school-knowledge-list clearfix">
                <% List<articleView> lstArtBK = ModelArticleNEWSList2;//新闻资讯   六条数据
                   foreach (articleView model in lstArtBK)
                   { %>
					<li><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" ><%=model.articleTitle %></a></li>
                    <%} %>
				</ul>
			</div>
		</div>
		<div class="school-history-cultural">
			<h1 class="TitleH1 mb30"></h1>
			<div class="school-history-cont">
				<ul class="school-history-list">
					<li><a href="" target="_blank">晚唐五代建盏</a></li>
					<li><a href="" target="_blank">北宋建盏</a></li>
					<li><a href="" target="_blank">两宋建盏</a></li>
					<li><a href="" target="_blank">南宋建盏</a></li>
					<li><a href="" target="_blank">明代建盏</a></li>
					<li><a href="" target="_blank">清朝建盏</a></li>
					<li><a href="" target="_blank">近代建盏</a></li>
				</ul>
				<div class="school-history-img">
					<img src="UpFile/Ad/Ad_R_2.jpg" />
				</div>
			</div>
			<div class="mt30">
				<div class="school-history-summary">
					建盏于晚唐五代创烧，以烧制青釉瓷为主，同时也烧酱釉，器型特征与同时期的浙江越窑黑釉瓷相似，尚未形成自己的特征。
				</div>
			</div>
		</div>
		<div class="school-tea-cultural">
			<h1 class="TitleH1 mb30"></h1>
			<div>
				<ul class="school-tea-list clearfix">
                 <% List<articleView> lstArtPMHot = ModelArticlePMList;//拍卖行情  四条数据
                    foreach (articleView model in lstArtPMHot)
                    { %>
					<li>
						<a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank">
							<dl>
								<dt><img src="<%=model.img_url %>" width="100%" /></dt>
								<dd class="mt10"><%=model.articleTitle.Length > 11 ? model.articleTitle.Substring(0, 11) : model.articleTitle%></dd>
							</dl>
						</a>
					</li>
					<%} %>
				</ul>
				<ul class="school-tea-list2">
                <% List<articleView> lstArtPM = ModelArticlePMList2;//拍卖行情  三条数据
                   foreach (articleView model in lstArtPM)
                   { %>
					<li><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" ><%=model.articleTitle %></a></li>
                    <%} %>
				</ul>
			</div>
		</div>
	</div>
</section><!---content end-->


<!---ZhuangTi start-->
<uc2:Zhuanti  ID="Zhuanti1" runat="server" />
<!---ZhuangTi end-->
 <uc1:Footer ID="Footer1" runat="server" />
<script type="text/javascript">
 var mySwiper = new Swiper('.swiper-container',{
    pagination: '.pagination',
    loop:true,
    grabCursor: true,
    paginationClickable: true
  })
  $('.arrow-left').on('click', function(e){
    e.preventDefault()
    mySwiper.swipePrev()
  })
  $('.arrow-right').on('click', function(e){
    e.preventDefault()
    mySwiper.swipeNext()
  })
  
  var technology = new Swiper('.technology-swiper-container',{
    loop:true,
    grabCursor: true,
  })
  $('.technology-left').on('click', function(e){
    e.preventDefault()
    technology.swipePrev()
  })
  $('.technology-right').on('click', function(e){
    e.preventDefault()
    technology.swipeNext()
  })

</script>

   
    </form>

</body>
</html>