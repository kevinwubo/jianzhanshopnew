<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product_list.aspx.cs" Inherits="DTcms.Web.web.product_list" %>
<%@ Register src="UserControl/HeaderSH.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="UserControl/Footer.ascx" tagname="Footer" tagprefix="uc2" %>
<%@ Register src="UserControl/Zhuanti.ascx" tagname="Zhuanti" tagprefix="uc3" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/Mask.ascx" tagname="Mask" tagprefix="uc4" %>
<%@ Register src="UserControl/HotArtisan_Left.ascx" tagname="HotArtisan_Left" tagprefix="uc6" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>建盏商城 - 建盏天下网</title>
<meta name="keywords" content="曜变盏,天目盏,兔毫盏,油滴盏,束口盏" />
<meta name="description" content="建盏商城是福建省建窑建盏首席品牌商城，提供产地大师名家直供的一手精品货源：兔毫盏、油滴盏、曜变盏、鹧鸪斑、金油滴、敛口盏、束口盏，提供建盏价格、收藏、名家押窑和私人定制服务。" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/style-new.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/public.js" type="text/javascript"></script>
<script src="js/Js_product.js" type="text/javascript"></script>
<script src="js/jquery.easypage.js" type="text/javascript"></script>
<base target="_blank" />
<script type="text/javascript">

// JavaScript Document
function urlredirect() {
    var sUserAgent = navigator.userAgent.toLowerCase(); 
    if ((sUserAgent.match(/(ipod|iphone os|midp|ucweb|android|windows ce|windows mobile)/i))) {
        // PC跳转移动端
        var thisUrl = window.location.href;
        window.location.href = "/m_product_list.html";; //跳转为网址后面加mobile的路径
    }
}
urlredirect();

</script>
				
<style type="text/css">
 /*分页样式*/
.pagelist{ clear:both; display:block; margin:0 0 20px 0; }
.pagelist:after{ clear:both; content:"."; display:block; height:0; visibility:hidden; }
.pagelist .l-btns{ display:block; float:left; margin:0 5px 0 0; padding:10px 10px 0px 10px; height:35px; overflow:hidden; font-size:1.1em;  }
.pagelist .l-btns span{ font-size:1.1em; color:#333; line-height:35px; }
.pagelist .l-btns .pagenum{ display:inline-block; margin:0 5px; padding:0 5px; border:1px solid #dbdbdb; border-top:0; border-bottom:0; width:30px; height:35px; line-height:35px; color:#333; text-align:center; vertical-align:top; overflow:hidden; }
/*css default style pagination*/
div.default{ margin:0; padding:0; font-family:"Microsoft YaHei",Verdana; font-size:12px; }
div.default a,div.default span{ display:inline-block; margin:0 0 0 -1px; padding:4px 12px; line-height:20px; height:20px; border:1px solid #e1e1e1; background:#fff; color:#333; text-decoration:none; }
div.default span:first-child{ border-left:1px solid #e1e1e1; }
div.default a:hover{ color:#666; background:#eee; }
div.default span.current{ color:#fff; background:#488FCD; border-color:#488FCD; }
div.default span.disabled{ color:#999; background:#fff; }

.progressBar { 
border: solid 2px #86A5AD; 
background: white url(progressBar_m.gif) no-repeat 10px 10px; 
} 
.progressBar { 
display: block; 
width: 148px; 
height: 28px; 
position: fixed; 
top: 22%; 
left: 50%; 
margin-left: -14px; 
margin-top: 60px; 
padding: 10px 10px 10px 50px; 
text-align: left; 
line-height: 27px; 
font-weight: bold; 
position: absolute; 
z-index: 2001; 
} 

</style>
</head>
 
<body style="background:#F8F8F8;">
<uc1:Header ID="Header1" runat="server" />
<uc4:Mask ID="Mask1" runat="server" />  
<!---Pos start-->
<div class="wrap Pos mt10"><a href="/index.html" target="_self">首页</a> > <a href="/product_list.html" target="_self">建盏商城</a> > 大师精品</div>
 
<ul class="wrap mt10">
	<li><img src="UpFile/Ad/Ad_M_0.jpg" /></li>
</ul>
 
<!---Site_Content start-->    
<section class="wrap Site_Content mt10 clearfix">
	<!---insLeft start-->
    <uc6:HotArtisan_Left ID="HotArtisan_Left1" runat="server" />
	<!---insLeft end-->
	
	<!---insRight start-->
	<div class="insRight w910 right"><input id="hid_Keyword" value="<%=KEYWORD %>" type="hidden" />
    
    <ul class="select">
		<li class="select-list">
			<dl id="select1">
				<dt><b>作者：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>		
<dd><a href="javascript:void(0);"><b>业界大师</b></a></dd>
                <% List<Artisan> lstArtC = bllArtisan.GetArtisanList(" and artisanType='业界大师' and IsCooperation=1", " Sort,artisanName desc ");        
                   foreach (Artisan model in lstArtC)
                   { %>
				    <dd><a href="javascript:void(0);"><%=model.artisanName %></a></dd>
                <%} %>				
                <dd><a href="javascript:void(0);"><b>老牌传承人</b></a></dd>
                <% List<Artisan> lstArtA = bllArtisan.GetArtisanList(" and artisanType='老牌传承人' and IsCooperation=1", " Sort");
                   foreach (Artisan model in lstArtA)
                   { %>
				    <dd><a href="javascript:void(0);"><%=model.artisanName %></a></dd>
                <%} %>
				
				<dd><a href="javascript:void(0);"><b>名家工艺师</b></a></dd>
                <% List<Artisan> lstArtB = bllArtisan.GetArtisanList(" and artisanType='名家工艺师' and IsCooperation=1", " Sort");
                   foreach (Artisan model in lstArtB)
                   { %>
				    <dd><a href="javascript:void(0);"><%=model.artisanName %></a></dd>
                <%} %>
               
                <dd><a href="javascript:void(0);"><b>知名品牌</b></a></dd>
                <% List<Artisan> lstArtD = bllArtisan.GetArtisanList(" and artisanType='知名品牌' and IsCooperation=1", " Sort");        
                   foreach (Artisan model in lstArtD)
                   { %>
				    <dd><a href="javascript:void(0);"><%=model.artisanName %></a></dd>
                <%} %>
			</dl>
		</li>

		<li class="select-list">
			<dl id="select2">
				<dt><b>釉色：</b></dt><input id="hid_Type2" type="hidden" />
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">兔毫</a></dd>
                <dd><a href="javascript:void(0);">油滴/鹧鸪斑</a></dd>
                <%--<dd><a href="javascript:void(0);">金缕鹧鸪斑</a></dd>--%>
                <dd><a href="javascript:void(0);">曜变</a></dd>
                <dd><a href="javascript:void(0);">乌金釉</a></dd>
                <dd><a href="javascript:void(0);">杂色釉/异毫</a></dd>
                <%--<dd><a href="javascript:void(0);">龙鳞纹/苍蝇翅</a></dd>--%>

			</dl>
		</li>
		<li class="select-list">
			<dl id="select3">
				<dt><b>器形：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">束口盏</a></dd>
                <dd><a href="javascript:void(0);">灯盏</a></dd>
                <dd><a href="javascript:void(0);">敞口盏/斗笠</a></dd>
                <dd><a href="javascript:void(0);">撇口盏</a></dd>
                <dd><a href="javascript:void(0);">敛口盏</a></dd>
                <dd><a href="javascript:void(0);">钵型盏</a></dd>
                <dd><a href="javascript:void(0);">创新器型</a></dd>
			</dl>
		</li>
		<li class="select-list">
			<dl id="select7">				
                <dt><b>老盏：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">全品整器</a></dd>
                <dd><a href="javascript:void(0);">残缺瑕疵</a></dd>
                <dd><a href="javascript:void(0);">标本残片</a></dd>
			</dl>
		</li>
		<div class="filterSlider" id="filterSlider">
        <li class="select-list">
			<dl id="select4">
				<dt><b>口径：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">小（口径9cm以下）</a></dd>
                <dd><a href="javascript:void(0);">中（口径9-12cm）</a></dd>
                <dd><a href="javascript:void(0);">大（口径12cm以上）</a></dd>
			</dl>
		</li>
        
       <li class="select-list">
			<dl id="select5">
				<dt><b>价格：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">1000以下</a></dd>
                <dd><a href="javascript:void(0);">1001~3000</a></dd>
                <dd><a href="javascript:void(0);">3001~5000</a></dd>
                <dd><a href="javascript:void(0);">5001~10000</a></dd>
                <dd><a href="javascript:void(0);">10001~50000</a></dd>
                <dd><a href="javascript:void(0);">50000以上</a></dd>
			</dl>
		</li>
        <li class="select-list">
			<dl id="select6">
				<dt><b>功能：</b></dt>
				<dd class="select-all selected"><a href="javascript:void(0);">全部</a></dd>
				<dd><a href="javascript:void(0);">新手入门</a></dd>
                <dd><a href="javascript:void(0);">私享主人杯</a></dd>
                <dd><a href="javascript:void(0);">客人杯</a></dd>
                <dd><a href="javascript:void(0);">收藏投资</a></dd>
                <dd><a href="javascript:void(0);">套装/送礼</a></dd>
                <dd><a href="javascript:void(0);">展示/装饰</a></dd>
			</dl>
		</li>

        </div>
         <div class="filterSliControl" id="filterSliControl">更多选项</div>
        <li class="select-result">
			<dl>
				<dt>已选条件：</dt>
				<%--<dd class="select-no">暂时没有选择过滤条件</dd>--%>
                <input id="btn_search" type="button" value="查询" style="display:none" />
                <a style="padding-top:10px" href="product_list.aspx" target="_self"><b>清空全部</b></a>
			</dl>
            
		</li>        
	</ul>

		<div class="mt40 clearfix">
			<div class="Order left"><input id="hid_Order" type="hidden" />
				<a href="javascript:void(0);" id="A_default" class="Cur">默认</a>
				<a href="javascript:void(0);" id="A_new">新品</a>
				<a href="javascript:void(0);" id="A_sales">销量</a>
				<a href="javascript:void(0);" id="A_hot">人气</a>
				<a href="javascript:void(0);" id="ALLCOUNT">&nbsp;&nbsp;</a>
			</div>
		</div>
        
        <!--Ajax分页-->
                    <div id="progressBar" class="progressBar" style="display: none; ">数据加载中，请稍等...</div>
        <ul id="contents" class="list-proList5 clearfix mt20">

        </ul>        
        
        <div class="line20"></div>
            <div class="pagelist">
              <div class="l-btns">
                <div id="navigatediv"></div>
              </div> 
            </div>
        <!--Ajax分页-->		
	</div>
    <!---insRight end--> 
</section><!---Site_Content end-->    
<uc3:Zhuanti ID="Zhuanti1" runat="server" />
<uc2:Footer ID="Footer1" runat="server" />  
<script type="text/javascript">
    $(function () {
        $('.Cate').mouseover(function () {
            //	$(this).addClass('cateHover');
            $(this).find('.CateList').show();
        });
        $('.Cate').mouseleave(function () {
            //	$(this).removeClass('cateHover');
            $(this).find('.CateList').hide();
        });

        $(".TypeList li").find("a").bind("click", function () {
            $(this).css("color", "red");
        })
        $(".Order").find("a").bind("click", function () {
            $(this).addClass("Cur").siblings("a").removeClass("Cur");
        })
    });
    var filterControl = document.getElementById("filterSliControl");
    var filterSlider = document.getElementById("filterSlider");
    var filterSliders = document.getElementsByClassName("filterSliders");
    filterControl.onclick = function () {
        if (filterSlider.style.display == "block") {
            filterSlider.style.display = "none";
            this.innerHTML = "更多选项";
        } else {
            filterSlider.style.display = "block";
            this.innerHTML = "收起";
        }
    };
</script>
 
</body>
</html>
