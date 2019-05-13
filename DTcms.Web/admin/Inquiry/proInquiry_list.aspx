<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proInquiry_list.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.proInquiry_list" %>

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
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
              <%     //1/2/3  超级管理组/系统管理组/管理组
                  if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
                  { %>
        <li><asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除该分类将删除对应的目录及文件；<br />如果该分类下还存在频道则无法删除，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
        <li><a href="proInquiry_info.aspx">咨询量统计</a></li>
        <li><a href="proInquiry_history_list.aspx">查看释放库</a></li>
        <%--<li><a href="Codes.aspx">产品队列维护</a></li>--%>
        <%} %>
        <li><asp:LinkButton ID="btn_Into_History" runat="server" CssClass="del" 
                OnClientClick="return ExePostBack('btn_Into_History','移动该分类将移动对应的目录及文件；<br />确定将该数据移动到释放库吗，是否继续？');" 
                onclick="btn_Into_History_Click" ><i></i><span>移动释放库</span></asp:LinkButton></li>
      </ul>
      <div class="menu-list">
    <div class="rule-single-select">
         <asp:DropDownList ID="ddl_TraceState" runat="server" AutoPostBack="True" 
             onselectedindexchanged="ddl_TraceState_SelectedIndexChanged">
            <asp:ListItem Value="">全部</asp:ListItem>
             <asp:ListItem Value="有意向">有意向</asp:ListItem>
            <asp:ListItem Value="已成交">已成交</asp:ListItem>
            <asp:ListItem Value="无意向">无意向</asp:ListItem>
            <asp:ListItem Value="假号">假号</asp:ListItem>
        </asp:DropDownList>
        </div>
        </div>
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
    <th align="left">产品编号</th>
    <th align="left">产品名称</th>
    <th align="left">作者</th>
    <th align="left">联系方式</th>
    <th align="left">关联销售</th>
    <th align="left">跟踪状态</th>
    <th align="left">处理状态</th>    
    <th align="left">留言时间</th>
    <th align="left">所属城市</th>
    <th>操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr style='<%#Eval("ProcessingState").ToString()=="0"? "background-color:#ff5a00":"background-color:write" %>'>
    <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" style="vertical-align:middle;" /><asp:HiddenField ID="hidId" Value='<%#Eval("PPID")%>' runat="server" /></td>
    <td <%#Eval("fontColor")%>><a href="/product_detail.aspx?productid=<%#Eval("ProductID") %>" target="_blank"><%#Eval("ProductID")%></a></td>
    <td <%#Eval("fontColor")%>><%#Eval("ProductName") %></td>
    <td <%#Eval("fontColor")%>><%#Eval("Author") %>  &nbsp;&nbsp;<%#Eval("status")%></td>
    <td <%#Eval("fontColor")%>><%#Eval("telphone")%>  电话：<%#DESEncrypt.ConvertByABC( Eval("telphone").ToString())%>QQ：<%#Eval("WebChartID")%></td>
    <td <%#Eval("fontColor")%>><%#Eval("real_name")%></td>
    <td <%#Eval("fontColor")%>><%#Eval("TraceState")%></td>
    <td <%#Eval("fontColor")%>><%#Eval("ProcessingStateDesc")%></td>
    <td <%#Eval("fontColor")%>><%#Eval("AddDate")%></td>
        <td <%#Eval("fontColor")%>><%#Eval("Provence")%><%#Eval("City")%></td>
    <td <%#Eval("fontColor")%> align="center"><a href="proInquiry_edit.aspx?action=<%#DTEnums.ActionEnum.Edit %>&channel_id=<%#Eval("PPID")%>&page=<%=page %>&keywords=<%=keywords %>">客户跟踪</a></td>
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
    <span><b>【咨询量总数（去重）：<%=DistinctCount %>】</b>—显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
  </div>
  
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->
</form>
</body>
</html>
