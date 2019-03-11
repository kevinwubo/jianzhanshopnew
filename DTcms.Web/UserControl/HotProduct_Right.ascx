<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HotProduct_Right.ascx.cs" Inherits="DTcms.Web.UserControl.HotProduct_Right" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<ul class="proList4 mt20">
<% List<Product> lstPro = ModelProList;
           foreach (Product model in lstPro)
           { %>
			<li>
				<a href="<%=model.ProductID %>.html" target="_blank">
				<div><img src="<%=model.Images %>" /></div>
				<h2>【<%=model.Author %>】<%=model.ProductName %></h2></a>
				<div><i   name="inquiry" onclick="javascript:$.windowbox.ShowPrice(<%=model.ProductID %>,'<%=model.Author %>','<%=model.ProductName %>')">点击询价</i>
                <a href="<%=model.ProductID %>.html" target="_blank">　<b>编号：<%=model.ProductID %></b></a></div>
				
			</li>
            <%} %>
			</ul>


