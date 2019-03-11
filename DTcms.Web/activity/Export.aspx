<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Export.aspx.cs" Inherits="DTcms.Web.activity.Export" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:DropDownList ID="ddl_type" runat="server">
            <asp:ListItem Value="小匠">小匠</asp:ListItem>
        <asp:ListItem Value="大师">大师</asp:ListItem>
        <asp:ListItem Value="名家">名家</asp:ListItem>
    </asp:DropDownList>
        <asp:DropDownList ID="ddl_select" runat="server">
            <asp:ListItem Value="建盏君">建盏君</asp:ListItem>
        <asp:ListItem Value="盏天下">盏天下</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="导出" onclick="Button1_Click" />
    <br />
    <br />
    <div>
    
    <asp:Button ID="Button2" runat="server" Text="建盏君数据更新" onclick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="盏天下数据更新" onclick="Button3_Click"  />   
    
    </div>
    </form>
</body>
</html>
