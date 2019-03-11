<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hotProduct_Left.ascx.cs" Inherits="DTcms.Web.UserControl.hotProduct_Left" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<div class="insLeft left">
		<h1><img src="images/Rec2.jpg" /></h1>
		<ul class="proList4 mt10">
        <% List<ProductListView> lstPro = ModelProList;
           foreach (ProductListView model in lstPro)
           { %>
			<li>
				<a href="<%=model.ProductID %>.html" target="_blank">
				<div><img src="<%=model.Images %>" /></div>
				<h2>【<%=model.Author%>】<%=model.ProductName %></h2></a>
				<div><i   name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点击询价</i>
                <a href="<%=model.ProductID %>.html" target="_blank">　<b>编号.<%=model.ProductID %></b></a></div>
				
			</li>
            <%} %>
		</ul>
	</div>

