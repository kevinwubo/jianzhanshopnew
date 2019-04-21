<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mn_schooldetail.aspx.cs" Inherits="DTcms.Web.mn_schooldetail" %>
<%@ Import Namespace="System.Data" %> 
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="DTcms.Model" %> 
<%@ Register src="UserControl/mn_footer.ascx" tagname="mn_footer" tagprefix="uc1" %>
<%@ Register src="UserControl/mn_planbody_foot.ascx" tagname="mn_planbody_foot" tagprefix="uc2" %>
<%@ Register src="UserControl/menuplane.ascx" tagname="mn_menuplane" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
        <% article model = Model;
       if (model != null)
       {%>
<title><%=model.title%>—建盏学院<%=acate.GetTitle(model.category_id) %></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="Keywords" content="<%=model.title%>,建盏天下" />
<meta name="Description" content="<%=model.zhaiyao.Length > 150 ? model.zhaiyao.Substring(0, 149) : model.zhaiyao %>" />
<%} %>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=750, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
        <link rel="stylesheet" href="../static/css/base_1_30.css" type="text/css">
    <link rel="stylesheet" href="../static/css/style.css">
    <style>
        body {
            background: #fff;
            max-width: 750px;
            margin: auto;
            /*-webkit-overflow-scrolling: touch;*/
        }
    </style>
</head>
<body>
    <header>
        <div class="flex-row college-hd">
            <div class="back" href="javascript:window.history.back()">
                <!-- <img src="../static/images/college/fanhui.png" alt=""> -->
                返回
            </div>
            <div class="txt px36">建盏学院</div>
            <div class="menu">
                <img src="../static/images/college/menu.png" alt="">
            </div>
        </div>
    </header>
    <section class="college-wrap">
            <% article modelShow = Model;
               if (modelShow != null)
               { %>

        <div class="wrap-title">
            <h1 class="px36"><%=modelShow.title%></h1>
            <span class="px16">日期：<%=modelShow.add_time.ToShortDateString() %> 版块：<em><%=acate.GetTitle(model.category_id) %></em></span>
        </div>
        <div class="wrap-con">
            <%=model.content %>
        </div>
        <%} %>
    </section>
    <footer style="border-top: 2px solid #F0F0F0;">
        <div class="flex-row pad-l-30 pad-r-30 pad-t-20 pad-b-40" style="text-align: center;align-items: center;">
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_home.png" alt="">
                <div style="margin-top: .1rem;">首页</div>
            </div>
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic_fl.png" alt="" />
                <div style="margin-top: .1rem;">分类</div>
            </div>
            <div class="flex-col">
                <img style="height: .5rem;width:.5rem" src="../static/images/jianzhan/ic-zx.png" alt="" />
                <div style="margin-top: .1rem;">咨询</div>
            </div>
            <div style="width:2rem" class="mar-l-20">
                <div class="flex-row">
                    <img style="height: .5rem;width:.55rem" src="../static/images/jianzhan/ic_wx.png" alt="" />
                    <div class="flex-col px16">(长按复制添加微信)</div>
                </div>
                <div style="margin-top: .1rem;">1231723876</div>
            </div>
        </div>
    </footer>



    <script src="../static/js/jquery-2.1.4.js"></script>
    <script src="../static/js/jquery-weui.js"></script>
    <script src="../static/js/jquery.pagination.js"></script>
    <script src="../static/js/utils.js"></script>
    <script src="../static/js/showdiv.js"></script>
    <script>


    </script>
</body>

</html>