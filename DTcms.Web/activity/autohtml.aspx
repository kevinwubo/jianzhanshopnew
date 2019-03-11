<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autohtml.aspx.cs" Inherits="DTcms.Web.activity.autohtml" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <asp:Button ID="Button1" runat="server" Text="首页" onclick="Button1_Click" />

    <asp:Button ID="Button2" runat="server" Text="小匠图录" onclick="Button2_Click" />
    <asp:Button ID="Button9" runat="server" Text="小匠专场" onclick="Button9_Click" />

    <asp:Button ID="Button8" runat="server" Text="名家图录" onclick="Button8_Click" />
    <asp:Button ID="Button7" runat="server" Text="名家专场" onclick="Button7_Click" />

    <asp:Button ID="Button6" runat="server" Text="大师图录" onclick="Button6_Click" 
        style="height: 21px" />
    <asp:Button ID="Button5" runat="server" Text="大师专场" onclick="Button5_Click" />
   
    </form>
</body>
</html>
