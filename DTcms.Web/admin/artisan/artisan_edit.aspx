<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artisan_edit.aspx.cs" Inherits="DTcms.Web.admin.artisan.addArtisan" validateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <dt>工艺师类别</dt>
    <dd>
      <div class="rule-single-select">
        <asp:DropDownList id="ddl_artisanType" runat="server" datatype="*" sucmsg=" ">
            <asp:ListItem Value="业界大师">业界大师</asp:ListItem>
            <asp:ListItem Value="老牌传承人">老牌传承人</asp:ListItem>
            <asp:ListItem Value="名家工艺师">名家工艺师</asp:ListItem>
            <asp:ListItem Value="知名品牌">知名品牌</asp:ListItem>
          </asp:DropDownList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>姓名</dt>
    <dd>
      <div>
      <asp:TextBox ID="txt_artisanName" runat="server" CssClass="input normal" 
              datatype="*2-100" sucmsg=" "  MaxLength="30"/>
    
      </div>
    </dd>
  </dl>
    <dl>
    <dt>用户性别</dt>
    <dd>
      <div class="rule-multi-radio">
        <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="保密" Selected="True">保密</asp:ListItem>
        <asp:ListItem Value="男">男</asp:ListItem>
        <asp:ListItem Value="女">女</asp:ListItem>
        </asp:RadioButtonList>
      </div>
    </dd>
  </dl>
  <dl>
    <dt>身份证号</dt>
    <dd>
      <asp:TextBox ID="txt_IDNumber" runat="server" CssClass="input normal" datatype="*0-100"  MaxLength="30" sucmsg=" " />
    </dd>
  </dl>
 
  <dl >
    <dt>荣誉称号</dt>
    <dd>
      <asp:TextBox ID="txt_artisanTitle" runat="server"  MaxLength="30" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />
    </dd>
  </dl>
  <dl >
    <dt>师从</dt>
    <dd>
      <asp:TextBox ID="txt_masterWorker" runat="server"  MaxLength="30" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />       
    </dd>
  </dl>
  <dl>
    <dt>特点</dt>
    <dd>
      <asp:TextBox ID="txt_artisanSpecial" runat="server"  MaxLength="100" CssClass="input normal" 
            datatype="*0-100" sucmsg=" " />
    </dd>
  </dl>
  <dl>
    <dt>简介</dt>
    <dd>
      <asp:TextBox ID="txt_introduction" runat="server" CssClass="input small" 
            sucmsg=" " Height="124px" TextMode="MultiLine"  MaxLength="200"
            Width="489px"></asp:TextBox>
    </dd>
  </dl>
  <dl>
    <dt>身份证头像</dt>
    <dd>
      <asp:TextBox ID="txt_IDHead" runat="server" CssClass="input normal upload-path" />
      <div class="upload-box upload-img"></div>
    </dd>
  </dl>
  <dl>
    <dt>详细介绍</dt>
    <dd>      
      <textarea id="txt_DetailedIntroduction" class="editor" style="visibility:hidden;" runat="server"></textarea>
    </dd>
  </dl>
  <dl>
    <dt>视频地址</dt>
    <dd>
      <div >
        <asp:TextBox ID="txt_VideoUrl" runat="server" CssClass="input normal"  MaxLength="100" sucmsg=" " />
      </div>
    </dd>
  </dl>
    <dl>
    <dt>是否合作</dt>
    <dd>
      <div  class="rule-multi-radio">
        <asp:RadioButtonList ID="rad_IsCooperation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="1" Selected>是</asp:ListItem>
        <asp:ListItem Value="0">否</asp:ListItem>
        </asp:RadioButtonList>      
      </div>
    </dd>
  </dl>
  <dl>
    <dt>是否推荐到首页</dt>
    <dd>
      <div  class="rule-multi-radio">
        <asp:RadioButtonList ID="rad_IsRecommend" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="1" Selected>是</asp:ListItem>
        <asp:ListItem Value="0">否</asp:ListItem>
        </asp:RadioButtonList>      
      </div>
    </dd>
  </dl>
  <dl>
    <dt>是否推荐到商城</dt>
    <dd>
      <div  class="rule-multi-radio">
        <asp:RadioButtonList ID="rad_IsPushMall" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
        <asp:ListItem Value="1" Selected>是</asp:ListItem>
        <asp:ListItem Value="0">否</asp:ListItem>
        </asp:RadioButtonList>      
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
