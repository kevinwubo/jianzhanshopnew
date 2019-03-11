<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auction_List.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.Auction_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import namespace="DTcms.Common" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>频道分类列表</title>
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<link  href="../../css/pagination.css" rel="stylesheet" type="text/css" />
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
      <li><asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除该分类将删除对应的目录及文件；<br />如果该分类下还存在频道则无法删除，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
        <%--<li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>--%>
<%     //1/2/3  超级管理组/系统管理组/管理组
                  if (Manager_Model!=null&&(Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3))
                  { %>
        <li><asp:LinkButton ID="LinkButton1" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除该分类将删除对应的目录及文件；<br />如果该分类下还存在频道则无法删除，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
        <%} %>
        <li><asp:LinkButton ID="lb_exprot" runat="server" CssClass="btn-search" 
                onclick="lb_exprot_Click">数据导出</asp:LinkButton></li>
      </ul>
    </div>
     <div class="rule-single-select">
      <asp:DropDownList ID="ddl_AuctionDetail" runat="server">
        <asp:ListItem Value="全部">全部</asp:ListItem>
        <asp:ListItem Value="拍卖提醒">拍卖提醒</asp:ListItem>
        <asp:ListItem Value="拍卖出价">拍卖出价</asp:ListItem>
      </asp:DropDownList>
      </div>
      <div class="rule-single-select">
      <asp:DropDownList ID="ddl_AuctionType" runat="server">
        <asp:ListItem Value="全部">全部</asp:ListItem>
        <asp:ListItem Value="小匠">小匠</asp:ListItem>
        <asp:ListItem Value="名家">名家</asp:ListItem>
        <asp:ListItem Value="大师">大师</asp:ListItem>
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
<asp:Repeater ID="rptList" runat="server" >
<HeaderTemplate>
<table style="width: 100%;border-collapse: collapse;table-layout: fixed;" border="0" cellspacing="0" cellpadding="0" class="ltable">
  <tr>
    <th>选择</th>
    <th align="left">序号</th>
    <th align="left">作品ID</th>
    <th align="left">作品名称</th>
    <th align="left">作者</th>
    <th align="left">底价</th>
    <th align="left">保留价</th>
    <th align="left">客户手机号</th>
    <th align="left">客户出价</th>
    <th align="left">行为</th>
    <th align="left">关注时间</th>
    <th align="left">归属销售</th>
    <th align="left">专场</th>
    <th align="left">来源</th>
    <th align="left">操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>

  <tr>
    <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" style="vertical-align:middle;" /><asp:HiddenField ID="hidId" Value='<%#Eval("ID")%>' runat="server" /></td>
    <td><%#Eval("ID")%></td>
    <td><a href="/product_detail.aspx?productid=<%#Eval("ProductID") %>" target="_blank"><%#Eval("ProductID")%></a></td>
    <td><%#Eval("ProductName") %></td>
    <td><%#Eval("Author") %> </td>
    <td><%#Eval("LowPrice")%></td>
    <td><%#Eval("ReservePrice")%></td>
    <td><%#DESEncrypt.ConvertByABC(Eval("Telephone").ToString())%></td>
    <td><%#Eval("CustomerOffer")%></td>
    <td><%#Eval("AuctionDetail")%></td>
    <td><%#Eval("AddDate")%></td>
    <td><%#Eval("SalesName")%></td>
    <td><%#Eval("AuctionType")%></td>
    <td><%#Eval("Source")%></td>
    <td align="center"></td>
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
    <span><b>【有效数据：<%=DistinctCount %>】</b>—显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
  </div>
  
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->
</form>
</body>
</html>
