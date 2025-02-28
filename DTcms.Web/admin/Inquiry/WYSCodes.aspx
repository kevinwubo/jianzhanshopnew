﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WYSCodes.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.WYSCodes" %>
<%@ Import namespace="DTcms.Common" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
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

<div class="tab-content">
  <dl>
    <dt>位置</dt>
    <dd>
     <div class="rule-single-select" style="z-index: 100">
          <asp:DropDownList id="ddl_Codes" runat="server" datatype="*" sucmsg=" ">          
            <asp:ListItem Value="0">请选择分类</asp:ListItem>            
            <asp:ListItem  Value="WuYiShanSales">武夷山销售排出队列</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>对应值</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_CodeValues" runat="server" CssClass="input normal"  sucmsg=" "  MaxLength="50" TextMode="MultiLine"/>
      格式：AA,BB,CC,DD ......
      </div>
    </dd>
  </dl>
  <dl>
    <dt></dt>
    <dd>
      <div>
      <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" /> 
      </div>
    </dd>
  </dl>
</div>
<!--工具栏-->
<div class="toolbar-wrap">
  <div id="floatHead" class="toolbar">
    <div class="l-list">
      <ul class="icon-list">        
        <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
        <li style="display:none"><asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','删除该分类将删除对应的目录及文件；<br />如果该分类下还存在频道则无法删除，是否继续？');" onclick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
        <li><a href="proInquiry_list.aspx">返回咨询列表</a></li>
      </ul>
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
    <th align="left">Code</th>
    <th align="left">位置属性</th>
    <th align="left" style="width:40%">存储值</th>
    <th align="left">修改时间</th>
    <th>操作</th>
  </tr>
</HeaderTemplate>
<ItemTemplate>
  <tr>
    <td align="center"><asp:CheckBox ID="chkId" CssClass="checkall" runat="server" style="vertical-align:middle;" /><asp:HiddenField ID="hidId" Value='<%#Eval("ID")%>' runat="server" /></td>
    <td><%#Eval("Code")%></td>
    <td><%#Eval("CodeName")%></td>
    <td><%#Eval("CodeValues")%></td>
    <td><%#Eval("change_Date")%></td>
    <td align="center"><a href="WYSCodes.aspx?action=<%#DTEnums.ActionEnum.Edit %>&channel_id=<%#Eval("ID")%>">修改</a></td>
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
    <asp:TextBox ID="txtPageNum" runat="server" CssClass="pagenum" onkeydown="return checkNumber(event);" ontextchanged="txtPageNum_TextChanged" AutoPostBack="True"></asp:TextBox><span>条/页</span>
  </div>
  
  <div id="PageContent" runat="server" class="default"></div>
</div>
<!--/内容底部-->
</form>
</body>
</html>