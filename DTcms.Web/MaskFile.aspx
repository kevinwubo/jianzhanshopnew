<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaskFile.aspx.cs" Inherits="DTcms.Web.MaskFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>静态页面生成</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btn_Ad" runat="server" Text="广告页面" onclick="btn_Ad_Click"/><a href="default.aspx" target="_blank">广告页面</a>
        <br />
        <br />
        <asp:Button ID="btn_Default" runat="server" Text="首页静态页面" 
            onclick="btn_Default_Click" /><a href="default.aspx" target="_blank">首页</a>
        <br />
        <br />
        <asp:Button ID="btn_product_list" runat="server" Text="商城静态页面" 
            onclick="btn_product_list_Click" /><a href="product_list.aspx" target="_blank">商城页面</a>
        <br />
        <br />
        <asp:Button ID="btn_artisan_list" runat="server" Text="名家名堂静态页面" 
            onclick="btn_artisan_list_Click" /><a href="artisan_list.aspx" target="_blank">名家名堂</a>
        <br />
        <br />
        <asp:Button ID="btn_article_list" runat="server" Text="建盏学院静态页面" 
            onclick="btn_article_list_Click" /><a href="article_list2.aspx" target="_blank">建盏学院</a>
            <br />
            <br />
            <asp:Button ID="btn_collection" runat="server" Text="收藏阁静态页面" onclick="btn_collection_Click" 
            /><a href="collection.aspx" target="_blank">收藏阁</a>
        <br />
        <br />
        <asp:Button ID="btn_AllProduct" runat="server" Text="所有产品详情页面" onclick="btn_AllProduct_Click" 
             />        
        <br />
        <br />
                     生成最新前<asp:TextBox ID="txt_Count" runat="server" 
            Width="45px">10</asp:TextBox>
        <asp:Button ID="btn_OnlyOne" runat="server" Text="个详情页面" 
            onclick="btn_OnlyOne_Click" />

        <br />
        <br />
        <asp:Button ID="btn_AllArtisan" runat="server" Text="所有艺人详情页面" 
            onclick="btn_AllArtisan_Click" />
        <br />

        <asp:Button ID="btn_AllArticle" runat="server" Text="所有新闻详情页面" 
            onclick="btn_AllArticle_Click" />
        <br />
        <br />
        <asp:Button ID="btn_ClearCache" runat="server" Text="清空所有缓存" 
            onclick="btn_ClearCache_Click" />
        <br />
        <br />
        <br />
        <br />
    
        新手机站点页面生成
        <br />
        <asp:Button ID="btn_mn_index" runat="server" Text="手机站：首页" 
            onclick="btn_mn_index_Click" /><a href="m_index.html" target="_blank">首页</a>
        <br />
        <br />
                <br />
        <asp:Button ID="Button1" runat="server" Text="手机站：头条落地首页" onclick="Button1_Click" 
             /><a href="/M0/Tt01/01A1.html" target="_blank">头条落地首页</a>
        <br />
    
        <asp:Button ID="btn_mn_shop" runat="server" Text="手机站：商城" 
            onclick="btn_mn_shop_Click" /><a href="mn_shop.aspx" target="_blank">商城</a>
        <br />
        <br />
    
        <asp:Button ID="btn_mn_famous" runat="server" Text="手机站：名家名堂" 
            onclick="btn_mn_famous_Click"  /><a href="mn_famous.aspx" target="_blank">名家名堂</a>
        <br />
        <br />
    
        <asp:Button ID="btn_mn_house" runat="server" Text="手机站：收藏馆" 
            onclick="btn_mn_house_Click"  /><a href="mn_house.aspx" target="_blank">收藏馆</a>
        <br />
        <br />
    
        <asp:Button ID="btn_mn_school" runat="server" Text="手机站：建盏学院" 
            onclick="btn_mn_school_Click" /><a href="mn_school.aspx" target="_blank">建盏学院</a>
        <br />
        <br />
        <asp:Button ID="btn_allproductdetail" runat="server" Text="手机站：所有产品详情页面" 
            onclick="btn_allproductdetail_Click" />
        <br />
                生成最新前<asp:TextBox ID="txt_MCount" 
            runat="server" Width="50px">10</asp:TextBox>
        <asp:Button ID="btn_M_onlyProductID" runat="server" Text="手机站：详情页面" 
            onclick="btn_M_onlyProductID_Click" />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" Text="手机站：艺人列表页面" 
            onclick="Button8_Click" />
        <br />
        <br />
        <asp:Button ID="btn_mn_about" runat="server" Text="手机站：关于我们" 
            onclick="btn_mn_about_Click" />
        <br />
        <br />      
                <asp:Button ID="btn_HD" runat="server" Text="活动页面" onclick="btn_HD_Click" 
             />
    </div>
    </form>
</body>
</html>
