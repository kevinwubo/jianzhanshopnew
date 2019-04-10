<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proInquiry_edit.aspx.cs" Inherits="DTcms.Web.admin.Inquiry.proInquiry_edit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>编辑信息</title>
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
    <dt>产品名称/编号</dt>
    <dd>
      <div >
          <asp:Label ID="txt_ProductName" runat="server" ></asp:Label>
<%--      <asp:Label ID="txt_ProductName" runat="server" CssClass="input normal" 
              datatype="*0-100" sucmsg=" "  MaxLength="30"/>--%>
    
      </div>
    </dd>
  </dl>
  <dl>
    <dt>询价销售转移</dt>
    <dd>
     <div class="rule-single-select" style="z-index: 100">
        <asp:DropDownList id="ddl_SaleUsers" runat="server" datatype="*" sucmsg=" ">            
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>客户姓名</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_CustomerName" runat="server" CssClass="input normal" 
              datatype="*0-100" sucmsg=" "  MaxLength="30"/>
    
      </div>
    </dd>
  </dl>
  <dl>
    <dt>电话号码</dt>
    <dd>
      <asp:TextBox ID="txt_telphone" runat="server" CssClass="input normal" datatype="*0-100"  MaxLength="30" sucmsg=" " />
    </dd>
  </dl>
 
  <dl >
    <dt>QQ/微信号码</dt>
    <dd>
      <asp:TextBox ID="txt_WebChartID" runat="server"  MaxLength="30" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />
    </dd>
  </dl>
  <dl >
    <dt>留言内容</dt>
    <dd>
      <asp:TextBox ID="txt_InquiryContent" runat="server"  MaxLength="30" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />       
    </dd>
  </dl>
  <dl>
    <dt>评论内容</dt>
    <dd>
      <asp:TextBox ID="txt_CommentContent" runat="server"  MaxLength="100" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " TextMode="MultiLine" />
    </dd>
  </dl>
  <dl>
    <dt>处理状态</dt>
    <dd>
    <div  class="rule-multi-radio">
      <asp:RadioButtonList ID="rad_ProcessingState" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="0" Selected>未处理</asp:ListItem>
        <asp:ListItem Value="1">已处理</asp:ListItem>
      </asp:RadioButtonList>  
      </div>
    </dd>
  </dl>
  <dl>
    <dt>省份</dt>
    <dd>
      <asp:TextBox ID="txt_Provence" runat="server"  MaxLength="20"  CssClass="input normal " />
    </dd>
  </dl>
  <dl>
    <dt>城市</dt>
    <dd>
      <asp:TextBox ID="txt_City" runat="server"  MaxLength="20"  CssClass="input normal " />
    </dd>
  </dl>
  <dl>
    <dt>跟踪内容</dt>
    <dd>
      <div >
        <asp:TextBox ID="txt_TraceContent" runat="server" CssClass="input normal"  
              MaxLength="100" sucmsg=" " TextMode="MultiLine" />
      </div>
    </dd>
  </dl>
    <dl>
    <dt>跟踪状态</dt>
    <dd>
      <div  class="rule-multi-radio">
        <asp:RadioButtonList ID="rad_TraceState" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="有意向">有意向</asp:ListItem>
        <asp:ListItem Value="已成交">已成交</asp:ListItem>
        <asp:ListItem Value="无意向">无意向</asp:ListItem>
        <asp:ListItem Value="无意向">假号</asp:ListItem>
        </asp:RadioButtonList>      
      </div>
    </dd>
  </dl>


  <dl>
    <dt>下次回访时间</dt>
    <dd>
      <div class="input-date">
        <asp:TextBox ID="txt_NextVisitTime" runat="server" CssClass="input date" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd '})" datatype="/^\s*$|^\d{4}\-\d{1,2}\-\d{1,2}$/" errormsg="请选择正确的日期" sucmsg=" " />
        <i>日期</i>
      </div>
    </dd>
  </dl>
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
