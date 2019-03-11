<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="guzhe.aspx.cs" Inherits="DTcms.Web.guzhe" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 

<%@ Register src="UserControl/mn_footer_HD.ascx" tagname="mn_footer_HD" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>骨折一价双盏专场</title>
	<link rel="stylesheet" href="css/wrapstyle.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
    	<script type="text/javascript" src="project/Public/base/js/swiper-4.3.3.min.js"></script>
	<!-- <script src="js/ZRrem.js"></script> -->
</head>

<body style="height: 100%;">
	<form id="form1" runat="server">
	<div class="index-page wrap">
		<div class="banner">			
			<img src="images/011_01.jpg" alt="">
		</div>
		<div class="con">
			<div class="con-fl1">
				<img src="images/011_02.jpg" alt="">
				<img src="images/011_03.jpg" alt="">
			</div>
			<div class="con-fl2">
				<div class="tit">
					<img src="images/011_022.jpg" alt="">
				</div>
				<div class="shop-lt">
					<ul class="">
                    	<% 
                            List<Product> lstPro = ModelList1111;
                            if (lstPro != null && lstPro.Count > 0)
                            {
                                foreach (Product model in lstPro)
                                {
                             %>
						<li>
							<div class="goods">
								<p class="gid">ID.<%=model.ProductID %></p>
								<a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20">原价:<%=model.MarketPrice %>元</span>
								</p>
								<div class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">1111元 抢购</div>
							</div>
						</li>
						<%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl2 con-fl3">
				<div class="tit">
					<img src="images/011_04.jpg" alt="">
				</div>
				<div class="shop-lt">
					<ul class="">
						<% 
                            List<Product> lstPro2 = ModelList2222;
                            if (lstPro2 != null && lstPro2.Count > 0)
                            {
                                foreach (Product model in lstPro2)
                                {
                             %>
						<li>
							<div class="goods">
								<p class="gid">ID.<%=model.ProductID %></p>
								<a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20">原价:<%=model.MarketPrice %>元</span>
								</p>
								<div class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">2222元 抢购</div>
							</div>
						</li>
						<%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl2">
				<div class="tit">
					<img src="images/011_06.jpg" alt="">
				</div>
				<div class="shop-lt">
					<ul class="">
						<% 
                            List<Product> lstPro5 = ModelList5555;
                            if (lstPro5 != null && lstPro5.Count > 0)
                            {
                                foreach (Product model in lstPro5)
                                {
                             %>
						<li>
							<div class="goods">
								<p class="gid">ID.<%=model.ProductID %></p>
								<a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20">原价:<%=model.MarketPrice %>元</span>
								</p>
								<div class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">3999元 抢购</div>
							</div>
						</li>
						<%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="act-priz">
				<img src="images/011_05.jpg" alt="">
				<img src="images/011_08.jpg" alt="">
			</div>
		</div>
		<div class="footer">
			<p class="info_txt">11月1日开启，作品及赠品限量，售完即止</p>
		</div>
		<div style="height:4rem"></div>
		<div class="footerlink">
		<a href="1111.html" class="mr-1">双11主会场</a>
		<a href="dashi.html" class="mr-1">大师展</a>
		<a href="miaosha.html" class="mr-1">0利润秒杀</a>
		<a href="zhibo.html" class="mr-1">大师直播</a>
			</div>
	</div>
	<div class="footer" style="height: 18rem;
    bottom: 0;
    position: fixed;z-index: 999">
		<!-- 快速查询 -->
		<uc1:mn_footer_HD ID="mn_footer_HD1" runat="server" />
	</div>
	<div id='menumark' style="display: none"></div>
	<script>
	    // 点击快速查询
//	    $('.ipt').click(function () {

//	        $("#menumark").css("display", "block");
//	        $("#ksplane").css("display", "block");
//	        // $(".footer").animate({ bottom: '6.5rem' }, "slow", function () {
//	        // 	// $(this).css("display", "none");
//	        // });
//	    })
	    $('#menumark').click(function () {
	        // $(".footer").animate({ bottom: '0rem' }, "slow", function () {
	        $("#menumark").css("display", "none");
	        $("#ksplane").css("display", "none");
	        // });

	    })

	</script>
    </form>
</body>

</html>