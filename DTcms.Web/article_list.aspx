<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article_list.aspx.cs" Inherits="DTcms.Web.web.article_list" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>

<%@ Register src="UserControl/HotProduct_Right.ascx" tagname="HotProduct_Right" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=Keyword%>- 建盏学院</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="建盏知识,选盏技巧,建盏新闻,建盏百科,建盏文化" />
<meta name="Description" content="<%=Keyword%>字段是建盏学院六大板块之一，我们立志传播千年的建盏文化和历史，建盏工艺，选盏技巧，百科知识，建盏新闻，拍卖行情，建盏历史，一站式指导盏友们如何鉴赏和入门的频道。" />
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<script>    !window.jQuery && document.write(unescape('%3Cscript src="js/jquery-1.9.1.min.js"%3E%3C/script%3E'))</script>
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
<style type="text/css">
    /*分页样式*/
.pagelist{ clear:both; display:block; margin:0 0 20px 0; }
	.pagelist:after{ clear:both; content:"."; display:block; height:0; visibility:hidden; }
	.pagelist .l-btns{ display:block; float:left; margin:0 5px 0 0; padding:0 10px; border:1px solid #dbdbdb; height:28px; overflow:hidden; }
	.pagelist .l-btns span{ font-size:12px; color:#333; line-height:28px; }
	.pagelist .l-btns .pagenum{ display:inline-block; margin:0 5px; padding:0 5px; border:1px solid #dbdbdb; border-top:0; border-bottom:0; width:30px; height:28px; line-height:28px; font-size:12px; color:#333; text-align:center; vertical-align:top; overflow:hidden; }
	
	/*css default style pagination*/
div.default{ margin:0; padding:0; font-family:"Microsoft YaHei",Verdana; font-size:12px; }
	div.default a,div.default span{ display:inline-block; margin:0 0 0 -1px; padding:4px 12px; line-height:20px; height:20px; border:1px solid #e1e1e1; background:#fff; color:#333; text-decoration:none; }
	div.default span:first-child{ border-left:1px solid #e1e1e1; }
	div.default a:hover{ color:#666; background:#eee; }
	div.default span.current{ color:#fff; background:#488FCD; border-color:#488FCD; }
	div.default span.disabled{ color:#999; background:#fff; }

</style>
</head>

<body style="background:#F8F8F8;">

<uc1:Header ID="Header1" runat="server" />
<!---Pos start-->
<div class="wrap Pos mt10"><a href="/index.html">首页</a> > 建盏学院</div>

<ul class="wrap mt10 lineH0">
	<li><img src="UpFile/Ad/Ad_M_0.jpg" /></li>
</ul>


<!---Site_Content start-->
<section class="wrap clearfix Flex mt10">
	<!---insLeft start-->
	<div class="w200 left top-border">
		<h1><img src="images/article-title.jpg" /></h1>
		<ul class="artList-sideList mt10">
			<li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("新闻资讯")) %>" target="_blank">新闻资讯</a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='新闻资讯'")%>)</span>
			</li>
			<li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("拍卖行情")) %>" target="_blank">拍卖行情</a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='拍卖行情'")%>)</span>
			</li>
			<li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("建盏工艺")) %>" target="_blank">建盏工艺 </a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='建盏工艺'")%>)</span>
			</li>
			<li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("百科知识")) %>" target="_blank">百科知识</a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='百科知识'")%>)</span>
			</li>
            <li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("选盏技巧")) %>" target="_blank">选盏技巧</a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='选盏技巧'")%>)</span>
			</li>
            <li>
				<a href="article_list.aspx?keyword=<%=Server.UrlEncode(Server.UrlPathEncode("文化历史")) %>" target="_blank">文化历史</a>
				<span>(<%= bllArt.GetTotalCount(" and b.title='文化历史'")%>)</span>
			</li>
		</ul>
		<div>
			<a href="/product_list.aspx?keyword=陆金喜" target="_blank"><img src="UpFile/Ad/Ad_L_1.jpg" width="100%" /></a>
		</div>
	</div><!---insLeft end-->
	
	<!---insRight start-->
	<div class="w970 right top-border">
		<div class="w670 left">
			<ul class="artList clearfix mt30">
            <% List<articleView> lstArticel = ModelArticleList;
               foreach (articleView model in lstArticel)
               { %>
				<li>
					<dl class="artList-content">
						<dt class="artList-img"><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank"><img src="<%=model.img_url %>" width="100%" /></a></dt>
						<dt class="artList-title"><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank" ><%=model.articleTitle %></a></dt>
						<dd class="artList-source"><span><%=model.AddDate.ToShortDateString() %></span><span>版块：<%=model.articleType %></span></dd>
						<dd class="artList-summary"><%= model.zhaiyao.Length > 101 ? model.zhaiyao.Substring(0, 100) : model.zhaiyao%> ......<a href="article_detail.aspx?articleid=<%=model.id %>" class="red" target="_blank">【详情】</a></dd>
						<dd class="artList-tag"><span><%=model.Call_Index%></span></dd>
					</dl>
				</li>
                <%} %>
                 <% if (lstArticel.Count == 0)
               { %>
               <li>共搜索到与 "<%=Keyword%>" 相关的 0条新闻</li>
               <%} %>
			</ul>
	
			<!---PageBar start-->
			<!--内容底部-->
        <form id="form1" runat="server">
            <div class="line20"></div>
            <div class="pagelist">
              <div class="l-btns">
                <span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
              </div>
  
              <div id="PageContent" runat="server" class="default"></div>
            </div>
        </form>
            <!--/内容底部-->            
            <!---PageBar end-->
		</div>
		<div class="w250  right">
			<h1 class="TitleH1 mt30">
				<img src="images/top-icon.jpg" />
				<span>热文排行榜</span>
				
			</h1>
			<div>
				<img src="../UpFile/Ad/Ad_R_0.jpg"  width="250px" height="140px" />
			</div>
			<div class="mt20">
				<ul class="artList-rightList">
                <% List<articleView> lstArthot = ModelArticleHotList;
                   foreach (articleView model in lstArthot)
                   { %>
					<li><a href="article_detail.aspx?articleid=<%=model.id %>" target="_blank"><%=model.articleTitle %></a></li>
                    <%} %>
				</ul>
			</div>
			<div class="mt20">
			    <uc4:HotProduct_Right ID="HotProduct_Right1" runat="server" />
			</div>
		</div>

	</div>
	

</section><!---Site_Content end-->

<uc3:Zhuanti ID="Zhuanti1" runat="server" />
<uc2:Footer ID="Footer1" runat="server" />

</body>
</html>