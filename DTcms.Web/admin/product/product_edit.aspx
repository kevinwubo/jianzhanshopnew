<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_edit.aspx.cs" Inherits="DTcms.Web.admin.product.product_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>产品录入</title>
<script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=idialog"></script>
<script type="text/javascript" src="../../scripts/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="../../scripts/swfupload/swfupload.js"></script>
<script type="text/javascript" src="../../scripts/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="../../scripts/swfupload/swfupload.handlers.js"></script>
<script type="text/javascript" charset="utf-8" src="../../editor/kindeditor-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
<script type="text/javascript" src="../js/layout.js"></script>
<link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        //初始化表单验证
        $("#form1").initValidform();
        //计算用户组价格
        $("#field_control_sell_price").change(function () {
            var sprice = $(this).val();
            if (sprice > 0) {
                $(".groupprice").each(function () {
                    var num = $(this).attr("discount") * sprice / 100;
                    $(this).val(ForDight(num, 2));
                });
            }
        });
        //初始化编辑器
        var editor = KindEditor.create('.editor', {
            width: '98%',
            height: '350px',
            resizeType: 1,
            uploadJson: '../../tools/upload_ajax.ashx?action=EditorFile&IsWater=1',
            fileManagerJson: '../../tools/upload_ajax.ashx?action=ManagerFile',
            allowFileManager: true
        });
        var editorMini = KindEditor.create('.editor-mini', {
            width: '98%',
            height: '250px',
            resizeType: 1,
            uploadJson: '../../tools/upload_ajax.ashx?action=EditorFile&IsWater=1',
            items: [
				'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
        //初始化上传控件
        $(".upload-img").each(function () {
            $(this).InitSWFUpload({ sendurl: "../../tools/upload_ajax.ashx", flashurl: "../../scripts/swfupload/swfupload.swf" });
        });
        $(".upload-album").each(function () {
            $(this).InitSWFUpload({ btntext: "批量上传", btnwidth: 66, single: false, water: true, thumbnail: true, filesize: "2048", sendurl: "../../tools/upload_ajax.ashx", flashurl: "../../scripts/swfupload/swfupload.swf", filetypes: "*.jpg;*.jpge;*.png;*.gif;" });
        });
        $(".attach-btn").click(function () {
            showAttachDialog();
        });
        //设置封面图片的样式
        $(".photo-list ul li .img-box img").each(function () {
            if ($(this).attr("src") == $("#hidFocusPhoto").val()) {
                $(this).parent().addClass("selected");
            }
        });
    });
    //创建附件窗口
    function showAttachDialog(obj) {
        var objNum = arguments.length;
        var attachDialog = $.dialog({
            id: 'attachDialogId',
            lock: true,
            max: false,
            min: false,
            title: "上传附件",
            content: 'url:dialog/dialog_attach.aspx',
            width: 500,
            height: 180
        });
        //如果是修改状态，将对象传进去
        if (objNum == 1) {
            attachDialog.data = obj;
        }
    }
    //删除附件节点
    function delAttachNode(obj) {
        $(obj).parent().remove();
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
   <div class="tab-content">
     <dl>
    <dt>产品编号</dt>
    <dd>
      <div>      
        <asp:TextBox ID="lbl_ProductNO" runat="server" CssClass="input normal"  sucmsg=" " />
      </div>
    </dd>
  </dl>

  <dl>
    <dt>产品名称</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_ProductName" runat="server" CssClass="input normal"  sucmsg=" " />
    
      </div>
    </dd>
  </dl>
  <dl>
    <dt>副标题</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_SubTitle" runat="server" CssClass="input normal" 
              datatype="*2-100" sucmsg=" " />
      </div>
    </dd>
  </dl>
  <dl>
    <dt>工艺釉色</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type2" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem Value="0">请选择工艺釉色</asp:ListItem>
            <asp:ListItem>兔毫</asp:ListItem>
            <asp:ListItem>油滴/鹧鸪斑</asp:ListItem>            
            <asp:ListItem>曜变</asp:ListItem>
            <asp:ListItem>乌金釉</asp:ListItem>
            <asp:ListItem>杂色釉/异毫</asp:ListItem>            
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>器型</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type3" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem>请选择器型</asp:ListItem>
            <asp:ListItem>束口盏</asp:ListItem>
            <asp:ListItem>灯盏</asp:ListItem>
            <asp:ListItem>敞口盏/斗笠</asp:ListItem>
            <asp:ListItem>撇口盏</asp:ListItem>
            <asp:ListItem>敛口盏</asp:ListItem>
            <asp:ListItem>钵型盏</asp:ListItem>
            <asp:ListItem>创新器型</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>口径</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type4" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem Value="0">请选择口径尺寸</asp:ListItem>
            <asp:ListItem>小（口径9cm以下）</asp:ListItem>            
            <asp:ListItem>中（口径9-12cm）</asp:ListItem>
            <asp:ListItem>大（口径12cm以上）</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>用途功能</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type5" runat="server" datatype="*" sucmsg=" " 
              Height="19px">
            <asp:ListItem Value="0">请选择用途功能</asp:ListItem>
            <asp:ListItem>新手入门</asp:ListItem>
            <asp:ListItem>私享主人杯</asp:ListItem>
            <asp:ListItem>客人杯</asp:ListItem>
            <asp:ListItem>收藏投资</asp:ListItem>
            <asp:ListItem>套装/送礼</asp:ListItem>
            <asp:ListItem>展示/装饰</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>传世老盏</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type6" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem Value="0">请选择传世老盏</asp:ListItem>
            <asp:ListItem>全品整器</asp:ListItem>
            <asp:ListItem>残缺瑕疵</asp:ListItem>
            <asp:ListItem>标本残片</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>价格区间</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_Type7" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem Value="0">请选择价格区间</asp:ListItem>
            <asp:ListItem>1000以下</asp:ListItem>
            <asp:ListItem>1001~3000</asp:ListItem>
            <asp:ListItem>3001~5000</asp:ListItem>
            <asp:ListItem>5001~10000</asp:ListItem>
            <asp:ListItem>10001~50000</asp:ListItem>
            <asp:ListItem>50000以上</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  
  <dl>
    <dt>身份图片</dt>
    <dd>
      <asp:TextBox ID="txt_Images" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
    <dl>
    <dt>摘要</dt>
    <dd>
      <asp:TextBox ID="txt_introduction" runat="server" CssClass="input small" 
            sucmsg=" " Height="124px" TextMode="MultiLine"  MaxLength="200"
            Width="489px"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>产品描述</dt>
    <dd>    
<%--    <asp:TextBox ID="txt_summary" runat="server" CssClass="input normal" 
            datatype="*2-100" sucmsg=" " TextMode="MultiLine" />  --%>
            <textarea id="txt_summary" class="editor" style="visibility:hidden;" runat="server"></textarea>
    </dd>
  </dl>
    <dl>
    <dt>详细介绍</dt>
    <dd>
      <textarea id="txt_ProductDetail" class="editor" style="visibility:hidden;" runat="server"></textarea>
    </dd>
  </dl>
  <dl>
    <dt>产品单张图片</dt>
    <dd>
      <asp:TextBox ID="txt_ProImageDetail" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
    <dl>
    <dt>口径尺寸</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_Volume" runat="server" CssClass="input normal"  sucmsg=" " />
    
      </div>
    </dd>
  </dl>
  <%      //1/2/3  超级管理组/系统管理组/管理组
      if (Manager_Model.role_id == 1 || Manager_Model.role_id == 2 || Manager_Model.role_id == 3)
      { %>
  <dl >
    <dt>成本价</dt>
    <dd>
      <asp:TextBox ID="txt_CostPrice" runat="server" Text="0" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />       
    </dd>
  </dl>
  <dl>
    <dt>市场价</dt>
    <dd>
      <asp:TextBox ID="txt_MarketPrice" runat="server"  Text="0"  CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />
    </dd>
  </dl>
   <dl>
    <dt>最低价</dt>
    <dd>
      <asp:TextBox ID="txt_LowPrice" runat="server"  Text="0"  CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />
    </dd>
  </dl>
  <%} %>
      <dl>
    <dt>作者名</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_Author" runat="server" CssClass="input normal" 
              datatype="*2-100" sucmsg=" " />
      </div>
    </dd>
  </dl>
      <%--<dl>
    <dt>是否推荐到商城</dt>
    <dd>
      <div  class="rule-multi-radio">
        <asp:RadioButtonList ID="rad_IsPushMall" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="1" Selected>是</asp:ListItem>
        <asp:ListItem Value="0">否</asp:ListItem>
        </asp:RadioButtonList>      
      </div>
    </dd>
  </dl>--%>
</div>

<!--工具栏-->
<div class="page-footer">
  <div class="btn-list">
    <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" onclick="btnSubmit_Click" />
    <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
  </div>
  <div class="clear"></div>
</div>
<!--/工具栏-->
</form>
</body>
</html>
