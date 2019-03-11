<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productOper.aspx.cs" Inherits="DTcms.Web.admin.product.productOper" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import namespace="DTcms.Common" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
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
  <span>产品上架/下架</span>
</div>
<!--/导航栏-->

<div class="tab-content">
  <dl>
    <dt>产品ID</dt>
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
      <asp:Button ID="btnSubmit" runat="server" Text="产品下架" CssClass="btn" 
              onclick="btnSubmit_Click" /> 
<%--      <asp:Button ID="btnSubmit0" runat="server" Text="产品下架" CssClass="btn" 
              onclick="btnSubmit0_Click" /> --%>
      </div>
    </dd>
  </dl>
</div>
</form>
</body>
</html>