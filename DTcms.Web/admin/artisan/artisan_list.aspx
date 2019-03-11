<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artisan_list.aspx.cs" Inherits="DTcms.Web.admin.artisan.artisan_list" %>
<%@ Import namespace="DTcms.Common" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>频道分类列表</title>
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<link  href="../../css/pagination.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    //更新库存数量
    function Update_Sort(artisanID) {
        var sort = $("#txt_IC_" + artisanID).val();
        var type = "USORT";
        $.post("../Ajax/Ajax.aspx", { Type: type, Sort: sort, ArtisanID: artisanID }, function (result) {
            alert("艺人编号：" + artisanID + "—更新库存成功！");
        });
    }
</script>
</head>

<body class="mainbody">
<form id="form1" runat="server">
<!--导航栏-->
<div class="location">
  <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a>
  <a href="../center.aspx" class="home"><i></i><span>首页</span></a>
  <i class="arrow"></i>
  <span>频道分类列表</span>
</div>
<!--/导航栏-->

<!--工具栏-->
<div class="toolbar-wrap">
  <div id="floatHead" class="toolbar">
    <div class="l-list">
      <ul class="icon-list">
        <li><a class="add" href="artisan_edit.aspx?action=<%=DTEnums.ActionEnum.Add %>"><i></i><span>新增</span></a></li>
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
        <li><asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除该分类将删除对应的目录及文件；<br />如果该分类下还存在频道则无法删除，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
      </ul>
    </div>
    <div class="rule-single-select">
          <asp:DropDownList ID="ddl_IsCooperation" runat="server">
            <asp:ListItem Value="" Selected="True">是否合作</asp:ListItem>
            <asp:ListItem Value="">所有</asp:ListItem>
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
          </asp:DropDownList>
        </div>
    <div class="r-list">
      <asp:TextBox ID="txtKeywords" runat="server" CssClass="keyword" />
      <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn-search" onclick="btnSearch_Click">查询</asp:LinkButton>
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->
<asp:Repeater ID="rptList" runat="server">
<HeaderTemplate>
<table  style="width: 100%;border-collapse: collapse;table-layout: fixed;"  border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tr>
    <th width="6%">选择</th>
    <th align="left">艺人姓名</th>
    <th align="left">艺人类型</th>
    <th align="left">是否合作</th>
    <th align="left">艺人头衔</th>
    <th align="left">显示顺序</th>
<%--    <th align="left" width="110">是否默认</th>--%>
    <th width="10%">操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" style="vertical-align:middle;" /><asp:HiddenField ID="hidId" Value='<%#Eval("artisanID")%>' runat="server" /></td>
    <td><a href="/artisan_detail.aspx?artisanid=<%#Eval("artisanID")%>" target="_blank"><%#Eval("artisanName")%></a></td>
    <td><%#Eval("artisanType")%></td>
    <td><%#Convert.ToInt32(Eval("IsCooperation")) == 1 ? "是" : "否"%></td>
    <td><%#Eval("artisanTitle")%></td>
    <td><input type="text" style="width:40px" maxlength=5  value="<%#Eval("Sort")%>" onchange="javascript:Update_Sort(<%#Eval("artisanID")%>)" id="txt_IC_<%#Eval("artisanID")%>"/></td>
    <td align="center"><a href="artisan_edit.aspx?action=<%#DTEnums.ActionEnum.Edit %>&channel_id=<%#Eval("artisanID")%>&page=<%=page %>&keywords=<%=keywords %>">修改</a></td>
  </tr>
</ItemTemplate>
<FooterTemplate>
  <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"7\">暂无记录</td></tr>" : ""%>
</table>
</FooterTemplate>
</asp:Repeater>
<!--/列表-->

<!--内容底部-->
<div class="line20"></div>
<div class="pagelist">
  <div class="l-btns">
    <span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
  </div>
  
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->
</form>
</body>
</html>
