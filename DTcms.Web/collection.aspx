<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="collection.aspx.cs" Inherits="DTcms.Web.Collection" %>
<%@ Register src="UserControl/FooterCO.ascx" tagname="Footer" tagprefix="uc1" %>
<%@ Register src="UserControl/HeaderCO.ascx" tagname="Header" tagprefix="uc2" %>
<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/LeaveMessage.ascx" tagname="LeaveMessage" tagprefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>建盏精品收藏馆 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,老盏,建盏孤品,建盏精品,建盏收藏" />
<meta name="description" content="建盏精品收藏馆汇集了一线大师名家直供的第一手精品建盏：获奖建盏、各大博物馆收藏建盏、拍卖精品、孤品建盏、专利建盏，曜变盏，老盏等价格、收藏、名家押窑和私人定制服务。" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
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

</style></head>

<body class="collection-bg">
<!---Pos start-->
    <uc2:Header ID="Header1" runat="server" />
    <uc3:Mask ID="Mask1" runat="server" />
<div>
	<img src="images/Collection_Pavilion_banner.jpg" width="100%" />
</div>


<!---proIntr start-->
<section class="wrap">
	<div class="school-title collection-title">
		<h2><img src="images/Collection_Pavilion_title.jpg" /></h2>
	</div>
	<div>
		<ul class="collection_pro_list clearfix">
        <% List<Product> lstpro = ModelProList;
           foreach (Product model in lstpro)
           { %>
			<li>
				<dl>
                <% if (!string.IsNullOrEmpty(model.InventoryCount) && Convert.ToInt32(model.InventoryCount) > 0)
                   { %>
                   <dt class="collection_pro_img"><a href="<%=model.ProductID %>.html" target="_blank"><img src="<%=model.Images %>" width="100%"></a></dt>
                <%}
                   else
                   { %>
					<dt class="collection_pro_img"><a href="<%=model.ProductID %>.html" target="_blank"><div class="rel"><img src="<%=model.Images %>" width="100%"><div class="sold"></div></div></a></dt>
                    <%} %>
					<dt class="collection_pro_title"><a href="<%=model.ProductID %>.html" target="_blank">【<%=model.Author %>】<%=model.ProductName %></a></dt>
					<dd class="collection_pro_number">编号：<%=model.ProductID %></dd>
					<dd class="line20"><%=NoHTML(model.summary)%>......</dd>
					<dd class="collection_pro_tag clearfix">
						<span>作者：<em><%=model.Author %></em></span>
						<span>釉色：<em><%=model.Type2 %></em></span>
						<span>器形：<em><%=model.Type3 %></em></span>
						<span>口径：<em><%=model.Volume %></em></span>
					</dd>
					<dd class="collection_pro_advice"  name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')"> 点此询价 ·</dd>
				</dl>
			</li>
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
        </form><!---PageBar end-->

	</div>

</section><!---proIntr end-->

<!---FeedBack start-->
<section class="wrap mt30">
	<div class="FeedBack  p30">
		<ul class="Form left">
		<uc4:LeaveMessage ID="LeaveMessage1" runat="server" />            
        </ul>
          <% if (QRCodeModel != null)
               { %>
        <div class="proDetail-FeedBack-bg">
			拨打热线，直接沟通<br><b><%=QRCodeModel.HotLine%></b>
			<br/><img src="images/Tel2.jpg" />
			<br/>24小时客服手机号码！<br/><b><%=QRCodeModel.SalesPhone%></b>（<%=QRCodeModel.SalesName%>）
		</div>
		<div class="proDetail-FeedBack-bg"><img src="<%=QRCodeModel.QRImage%>" /></div>	    
        <%} %>
       
	</div>
</section><!---FeedBack end-->
    <uc1:Footer ID="Footer1" runat="server" />
</body>
</html>