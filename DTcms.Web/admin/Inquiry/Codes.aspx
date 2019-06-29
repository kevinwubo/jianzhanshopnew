<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Codes.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.Codes" %>
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
            <asp:ListItem Value="0">--------手机首页-------</asp:ListItem> 
            <asp:ListItem Value="MSY_ZXJZ">手机首页-最新匠作</asp:ListItem>
            <asp:ListItem Value="MSY_MSJZ">手机首页-匠心</asp:ListItem>      
            <asp:ListItem Value="MSY_DSSJ">手机首页-大师</asp:ListItem>           
            <asp:ListItem Value="0">---------PC首页----------</asp:ListItem>
            <asp:ListItem Value="SY_DSJP">PC首页大师精品</asp:ListItem>            
            <asp:ListItem Value="SY_YD">首页工艺精品-油滴</asp:ListItem>
            <asp:ListItem Value="SY_TH">首页工艺精品-兔毫</asp:ListItem>
            <asp:ListItem Value="SY_ZB">首页工艺精品-曜变</asp:ListItem>              
            <asp:ListItem Value="SY_ZSY">首页工艺精品-杂色釉</asp:ListItem> 
            <asp:ListItem Value="SY_SK">首页器型-束口</asp:ListItem>
            <asp:ListItem Value="SY_JK">首页器型-敛口</asp:ListItem>
            <asp:ListItem Value="SY_PK">首页器型-撇口</asp:ListItem>       
            <asp:ListItem Value="SY_QPZQ">首页老盏-整器</asp:ListItem>
            <asp:ListItem Value="SY_CQXC">首页老盏-瑕疵 </asp:ListItem>
            <asp:ListItem  Value="ASalesQueue">凌晨2点到12点分分配队列</asp:ListItem>
            <asp:ListItem  Value="BSalesQueue">12点~14点00分分配队列</asp:ListItem>
            <asp:ListItem  Value="CSalesQueue">14点01分~18点30分分配队列</asp:ListItem>
            <asp:ListItem  Value="DSalesQueue">18点30分~21点30分分配队列</asp:ListItem>
            <asp:ListItem  Value="ESalesQueue">21点30分~凌晨2点分配队列</asp:ListItem>
            <asp:ListItem  Value="SmsTemplate">短信模版</asp:ListItem>
            <asp:ListItem  Value="BlackMobile">资讯黑名单</asp:ListItem>
            <asp:ListItem  Value="WXChartID">微信号</asp:ListItem>
            <asp:ListItem  Value="XiaMenSales">厦门销售排出队列</asp:ListItem>
            <asp:ListItem  Value="WuYiShanSales">武夷山销售排出队列</asp:ListItem>
            <asp:ListItem Value="WXChartList">微信号队列</asp:ListItem>
            <asp:ListItem Value="BeiJingSalesQueue">北京天津销售队列</asp:ListItem>
            <asp:ListItem Value="ADSalesQueue">广告销售队列</asp:ListItem>
   <%--         <asp:ListItem Value="315XIAOJIANG">小匠专场</asp:ListItem>
            <asp:ListItem Value="315MINGJIA">名家专场</asp:ListItem>
            <asp:ListItem Value="315DASHI">大师专场</asp:ListItem>
            <asp:ListItem Value="315ZHIZUN">至尊专场</asp:ListItem>
            <asp:ListItem Value="XJStartTime">小匠开始时间</asp:ListItem>
            <asp:ListItem Value="XJEndTime">小匠结束时间</asp:ListItem>
            <asp:ListItem Value="MJStartTime">名家开始时间</asp:ListItem>
            <asp:ListItem Value="MJEndTime">名家结束时间</asp:ListItem>
            <asp:ListItem Value="DSStartTime">大师开始时间</asp:ListItem>
            <asp:ListItem Value="DSEndTime">大师结束时间</asp:ListItem>--%>
            
<%--            <asp:ListItem Value="1111Product">1111档</asp:ListItem>
            <asp:ListItem Value="2222Product">2222档</asp:ListItem>
            <asp:ListItem Value="5555Product">5555档</asp:ListItem>
            <asp:ListItem Value="Artisan1">镇店艺人1</asp:ListItem>
            <asp:ListItem Value="Artisan2">镇店艺人2</asp:ListItem>
            <asp:ListItem Value="Artisan3">镇店艺人3</asp:ListItem>
            <asp:ListItem Value="Artisan4">镇店艺人4</asp:ListItem>
            <asp:ListItem Value="Artisan5">镇店艺人5</asp:ListItem>
            <asp:ListItem Value="Artisan6">镇店艺人6</asp:ListItem>
            <asp:ListItem Value="Artisan7">镇店艺人7</asp:ListItem>
            <asp:ListItem Value="Artisan8">镇店艺人8</asp:ListItem>
            <asp:ListItem Value="Artisan9">镇店艺人9</asp:ListItem>
            <asp:ListItem Value="ProductIDS">秒杀产品队列ID</asp:ListItem>--%>
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
<%--  <dl>
    <dt>状态</dt>
    <dd>
        <div>
        
      <asp:RadioButtonList ID="radStatus" runat="server">
          <asp:ListItem Selected="True" Value="0">运营中</asp:ListItem>
          <asp:ListItem Value="1">隐藏中</asp:ListItem>
      </asp:RadioButtonList>
        </div>
    </dd>
  </dl>--%>
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
    <div class="rule-single-select">
         <asp:DropDownList ID="ddlStatus" runat="server">
            <asp:ListItem Value="0" Selected="True">运营中</asp:ListItem>
            <asp:ListItem Value="1">隐藏中</asp:ListItem>
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
    <td><%#Eval("change_date")%></td>
    <td align="center"><a href="Codes.aspx?action=<%#DTEnums.ActionEnum.Edit %>&channel_id=<%#Eval("ID")%>">修改</a></td>
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