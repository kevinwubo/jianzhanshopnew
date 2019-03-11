<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proInquiry_Adver.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.proInquiry_Adver" %>

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
        
        <%--<li><a href="proInquiry_list.aspx">查看总库</a></li>--%>
      </ul>
    </div>
    <div class="r-list">
    <asp:LinkButton ID="lbtnSearch" runat="server" CssClass="btn-search" onclick="btnSearch_Click">查询</asp:LinkButton>
    <asp:TextBox ID="txtAddTime" runat="server" CssClass="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM'})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}\s{1}(\d{1,2}:){2}\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
    </div>
  </div>
</div>
<!--/工具栏-->

<!--列表-->
<asp:Repeater ID="rptList" runat="server" >
<HeaderTemplate>
<table style="width: 100%;border-collapse: collapse;table-layout: fixed;" border="1" cellspacing="0" cellpadding="0" class="ltable">
  <tr>
    <th style="width:5px"></th>
    <th align="center" style="width:10%">日期</th>
    <th align="left" style="width:40%">汇总</th>
    <th style="width:45px"></th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr style=''>
    <td></td>
    <td style="text-align:center"><b><%#Eval("datetime")%></b></td>
    <td style="text-align:left"><%#Eval("info")%></td>
    <td></td>
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
    <%--<span>显示</span><asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>--%>
  </div>
  
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->
</form>
</body>
</html>
