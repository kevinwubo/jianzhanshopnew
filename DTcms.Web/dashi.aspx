<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashi.aspx.cs" Inherits="DTcms.Web.dashi" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer_HD.ascx" tagname="mn_footer_HD" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<title>大师镇店展专场</title>
	<link rel="stylesheet" href="css/wrapstyle.css" />
    <script type="text/javascript" src="project/Public/base/js/jquery-1.11.3.min.js"></script>
</head>

<body style="height: 100%;">
	<div class="index-page wrap">
		<div class="banner">
			<img src="images/dc1.jpg" alt="顶部">
		</div>
		<div class="con">
			<div class="con-fl1">
				<img src="images/dc2.jpg" alt="镇店">
			</div>
			<div class="con-fl4">
				<div class="tit">
					<img src="images/dc3.jpg" alt="孙建兴">
				</div>
				<div class="shop-lt-dc">
					<ul class="">
                    <% 
                            List<Product> listPro1 = ModelListArtisan1;
                            if (listPro1 != null && listPro1.Count > 0)
                            {
                                foreach (Product model in listPro1)
                                {
                             %>
						<li class="color-b">
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
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4 background-w">
				<div class="tit">
					<img src="images/dc4.jpg" alt="李达">
				</div>
				<div class="shop-lt-dc background-w">
					<ul class="">
						<% 
                            List<Product> listPro2 = ModelListArtisan2;
                            if (listPro2 != null && listPro2.Count > 0)
                            {
                                foreach (Product model in listPro2)
                                {
                             %>
						<li class="color-b background-w">
							<div class="goods f9">
								<p class="gid">ID.<%=model.ProductID %></p>								
                                <a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4">
				<div class="tit">
					<img src="images/dc5.jpg" alt="陈大鹏">
				</div>
				<div class="shop-lt-dc">
					<ul class="">
						<% 
                            List<Product> listPro3 = ModelListArtisan3;
                            if (listPro3 != null && listPro3.Count > 0)
                            {
                                foreach (Product model in listPro3)
                                {
                             %>
						<li class="color-b">
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
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4 background-w">
				<div class="tit">
					<img src="images/dc6.jpg" alt="黄美金">
				</div>
				<div class="shop-lt-dc background-w">
					<ul class="">
						<% 
                            List<Product> listPro4 = ModelListArtisan4;
                            if (listPro4 != null && listPro4.Count > 0)
                            {
                                foreach (Product model in listPro4)
                                {
                             %>
						<li class="color-b  background-w">
							<div class="goods f9">
								<p class="gid">ID.<%=model.ProductID %></p>								
                                <a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4">
				<div class="tit">
					<img src="images/dc7.jpg" alt="陆金喜">
				</div>
				<div class="shop-lt-dc">
					<ul class="">
						<% 
                            List<Product> listPro5 = ModelListArtisan5;
                            if (listPro5 != null && listPro5.Count > 0)
                            {
                                foreach (Product model in listPro5)
                                {
                             %>
						<li class="color-b">
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
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4 background-w">
				<div class="tit">
					<img src="images/dc8.jpg" alt="卓立旗">
				</div>
				<div class="shop-lt-dc background-w">
					<ul class="">
						<% 
                            List<Product> listPro6 = ModelListArtisan6;
                            if (listPro6 != null && listPro6.Count > 0)
                            {
                                foreach (Product model in listPro6)
                                {
                             %>
						<li class="color-b  background-w">
							<div class="goods f9">
								<p class="gid">ID.<%=model.ProductID %></p>								
                                <a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4">
				<div class="tit">
					<img src="images/dc9.jpg" alt="蔡炳盛">
				</div>
				<div class="shop-lt-dc">
					<ul class="">
						<% 
                            List<Product> listPro7 = ModelListArtisan7;
                            if (listPro7 != null && listPro7.Count > 0)
                            {
                                foreach (Product model in listPro7)
                                {
                             %>
						<li class="color-b">
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
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4 background-w">
				<div class="tit">
					<img src="images/dc10.jpg" alt="裴春元">
				</div>
				<div class="shop-lt-dc background-w">
					<ul class="">
						<% 
                            List<Product> listPro8 = ModelListArtisan8;
                            if (listPro8 != null && listPro8.Count > 0)
                            {
                                foreach (Product model in listPro8)
                                {
                             %>
						<li class="color-b  background-w">
							<div class="goods f9">
								<p class="gid">ID.<%=model.ProductID %></p>								
                                <a href="m_<%=model.ProductID %>.html"><img src="<%=model.Images %>" alt=""></a>
								<p class="tit1"><%=model.Author %> <%=model.ProductName %></p>
								<p class="tit2">
									<span class="tit2_1">釉色:<%=model.Type2 %></span>
									<span class="tit2_2">器形:<%=model.Type3 %></span>
								</p>
								<p class="tit2">
									<span class="tit2_1">口径:<%=model.Volume %></span>
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
			<div class="con-fl4">
				<div class="tit">
					<img src="images/dc11.jpg" alt="孙莉">
				</div>
				<div class="shop-lt-dc">
					<ul class="">
						<% 
                            List<Product> listPro9 = ModelListArtisan9;
                            if (listPro9 != null && listPro9.Count > 0)
                            {
                                foreach (Product model in listPro9)
                                {
                             %>
						<li class="color-b">
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
									<span class="tit2_2 cl_c20"></span>
								</p>
								<p class="ipt" onclick="javascript:xunjia('<%=model.ProductName %>','<%=model.ProductID %>')">点击询价</p>
							</div>
						</li>
                        <%}
                        } %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="height:4rem"></div>
		<div class="footerlink">
		<a href="1111.html" class="mr-1">双11主会场</a>
		<a href="dashi.html" class="mr-1">大师展</a>
		<a href="miaosha.html" class="mr-1">0利润秒杀</a>
		<a href="zhibo.html" class="mr-1">大师直播</a>
			</div>
     <div class="footer" style="height: 18rem;
    bottom: 0;
    position: fixed;z-index: 999">
		<!-- 快速查询 -->
		<uc1:mn_footer_HD ID="mn_footer_HD1" runat="server" />
	</div>
    <div id='menumark' style="display: none"></div>
	<%--<script src="js/jquery-2.1.4.js"></script>--%>
	<script>
	    $(function () {
	        $('#btnShowAccountSetting').click(function () {
	            $('.account-setting-wrap').fadeIn();
	        });
	        $('#btnClose').click(function () {
	            $('.account-setting-wrap').fadeOut();
	        });
	    })
	</script>
    <script>
        $('#menumark').click(function () {
            // $(".footer").animate({ bottom: '0rem' }, "slow", function () {
            $("#menumark").css("display", "none");
            $("#ksplane").css("display", "none");
            // });

        })
	</script>
</body>

</html>