<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sendSMS258.aspx.cs" Inherits="DTcms.Web.pages.sendSMS258" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" width="600px">
        <tr>
            <td>
                手机号：
            </td>
            <td>
                <asp:TextBox ID="txt_telephones" runat="server" Height="170px" Width="518px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                短信内容：
            </td>
            <td>
                <asp:TextBox ID="txt_message" runat="server" Height="170px" Width="518px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align=center>                
                <asp:Button ID="btn_send" runat="server" Text="短信发送" onclick="btn_send_Click" />                
            </td>
        </tr>

        <tr>
            <td>
                发送结果：
            </td>
            <td>
                <asp:TextBox ID="txt_result" runat="server" Height="170px" Width="518px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
