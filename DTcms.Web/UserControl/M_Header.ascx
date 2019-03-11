<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="M_Header.ascx.cs" Inherits="DTcms.Web.UserControl.M_Header" %>
<script src="js/m_o_code.js" type="text/javascript" charset="utf-8"></script>
<%--<div class="header">
			<div class="top flex flex-sb flex align">
				<a href="/m_index.html" class="logo"><img src="m_images/logo.png" width="110px" height="37x" /></a>
				<div class="soso_box flex1">
					<input type="text" id="keyword" placeholder="大师精品 名家建盏"/>
				</div>                
				<a href="javascript:void()" class="soso_icon"  id="btnSearch">搜索</a>
			</div>
			<div class="nav">
				<ul class="nav_list flex flex-sb">
					<li class="index"><a href="m_index.html">首页</a></li>
					<li><a href="m_product_list.html">建盏商城</a></li>
					<li><a href="m_artisan_list.html">名家名堂</a></li>
					<li><a href="m_collection.html">收藏馆</a></li>
					<li><a href="xiamen.html">厦门店</a></li>
				</ul>
			</div>
		</div>--%>


<img src="m_images/school-banner.jpg" width="100%">
		<div class="header">
			<div class="top flex flex-sb class="index"">
				<a href="m_index.html" class="logo"><img src="m_images/logo-school.png" width="110px" height="34x" /></a>
				<div class="soso_box flex1">
					<input type="text" id="keyword" placeholder="大师精品 名家建盏"/>
				</div>
				<a href="javascript:;" id="btnSearch" class="soso_icon">搜索</a>
			</div>
			<div class="nav">
				<ul class="nav_list flex flex-sb">
					<li class="index"><a href="m_product_list.html"><img src="m_images/school-nav1.png"/>建盏商城</a></li>
					<li><a href="m_artisan_list.html"><img src="m_images/school-nav2.png"/>名家名堂</a></li>
					<li><a href="m_school.html"><img src="m_images/school-nav3.png"/>学院频道</a></li>
					<li><a href="m_collection.html"><img src="m_images/school-nav4.png"/>收藏馆</a></li>
					<li><a href="xiamen.html"><img src="m_images/school-nav5.png"/>厦门店</a></li>
				</ul>
			</div>
		</div>

<script type="text/javascript">
    $(function () {
        $("#btnSearch").bind("click", function (e) {
            var keyword = encodeURIComponent($("#keyword").val());
            window.location.href = "m_product_list.aspx?keyword=" + keyword;
        });
        var arrplaceholder = "大师精品 名家建盏";
        $("keyword").focus(function () {
            if (!!!$(this).prop("readonly")) {
                $(this).prop("placeholder", "")
            }
        });
        $("keyword").blur(function () {
            $(this).prop("placeholder", arrplaceholder)
        });

    });
</script>
