<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HotArtisan_Left.ascx.cs" Inherits="DTcms.Web.UserControl.HotArtisan_Left" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<div class="insLeft left">
		<h1><img src="images/Rec.jpg" /></h1>
		<ul class="proList4 mt10">
        <% List<Artisan> lstArt = ArtisanList;
           foreach (Artisan model in lstArt)
           { %>
			<li>
				 <a href="artisan_<%=model.artisanID %>.html" target="_blank">
					    <div><img src="<%=model.IDHead %>" /></div>
					    <h2><%=model.artisanName %></h2>
						<div><b><%=model.artisanTitle %></b></div>
					</a>    
				
			</li>
            <%} %>
		</ul>
	</div>

