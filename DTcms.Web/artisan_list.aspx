<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artisan_list.aspx.cs" Inherits="DTcms.Web.web.artisan_list" %>
<%@ Register src="UserControl/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/hotProduct_Left.ascx" tagname="hotProduct_Left" tagprefix="uc4" %>
<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc5" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>名家名堂 - 建盏天下网</title>
<meta name="keywords" content="建盏名家,卓立旗,李达,孙建新,黄美金,陈大鹏" />
<meta name="description" content="名家名堂是建盏天下网第一手发布建窑建盏大师名家资讯和个人介绍，业界大师：孙建新、李达、黄美金、陈大鹏、卓立旗、陆金喜；老牌传承人：蔡炳盛、蔡炳昆、叶礼旺、叶礼忠；知名品牌：飞惺、吉玉坊、芦花坪......" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<div class="wrap Pos mt10"><a href="/index.html">首页</a> > 名家名堂</div>
 
<div class="wrap famBanner">
	<img src="images/famous_banner.jpg" width="100%"/>
</div>
 
<!---Site_Content start-->
<section class="wrap clearfix  Site_Content mt10">
	<!---insLeft start-->
    <uc5:Mask ID="Mask1" runat="server" />
    <uc4:hotProduct_Left ID="hotProduct_Left1" runat="server" />
	<!---insLeft end-->
	
	<!---insRight start-->
	<div class="insRight right">
		<ul class="famList clearfix mt30">

            <% List<Artisan> lstArt = ModelArticleList;
            foreach(Artisan model in lstArt)
            { %>
            <li>
				<a href="artisan_detail.aspx?artisanid=<%=model.artisanID %>" class="famPhoto left"  target="_blank"><img src="<%=model.IDHead %>">
                <p style="font-size:16px;color:#701521; font-weight:800; padding:4px 0; text-align:center; border:solid 1px #efeff0;"><%=model.artisanName %></p></a>
                
				<div class="famCont right">
					<dl class="famIntr">
						<dt></dt>
						<dd><b>简介：</b><%= model.introduction.Length>105?model.introduction.Substring(0,104):model.introduction %> ......<a href="artisan_<%=model.artisanID %>.html" target="_blank">【详情】</a></dd>
					</dl>
					<dl class="famPro">
						<dt>代表作品：</dt>
						<dd>
                         <% 
                            List<Product> lstPro = bllPro.GetProductList(" and Author= '" + model.artisanName + "'", 3);
                            foreach (Product modelPro in lstPro)
                            {
                             %>
							    <a href="<%=modelPro.ProductID %>.html"  target="_blank"><img src="<%=modelPro.Images %>"></a>
                            <%} %>
						</dd>
					</dl>
				</div>
			</li>
            <%} %>

             <% if (lstArt.Count == 0)
               { %>
               <li>共搜索到与 "<%=KEYWORD%>" 相关的 0款器具</li>
               <%} %>
		</ul>
 
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
 
	</div><!---insRight end-->
 
</section><!---Site_Content end-->
 
  <uc3:Zhuanti ID="Zhuanti1" runat="server" />
 <uc2:Footer ID="Footer1" runat="server" /> 
 
</body>
</html>
