$(document).ready(function () {

    $(".select-result").hide()
    //作者
    $("#select1 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectA").remove();
        } else {
            var copyThisA = $(this).clone();
            if ($("#selectA").length > 0) {
                $("#selectA a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisA.attr("id", "selectA"));
            }
        }
        $("#btn_search").click();
    });
    //釉色
    $("#select2 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectB").remove();
        } else {
            var copyThisB = $(this).clone();
            if ($("#selectB").length > 0) {
                $("#selectB a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisB.attr("id", "selectB"));
            }
        }
        $("#btn_search").click();
    });
    //器型
    $("#select3 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectC").remove();
        } else {
            var copyThisC = $(this).clone();
            if ($("#selectC").length > 0) {
                $("#selectC a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisC.attr("id", "selectC"));
            }
        }
        $("#btn_search").click();
    });
    //口径
    $("#select4 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectD").remove();
        } else {
            var copyThisD = $(this).clone();
            if ($("#selectD").length > 0) {
                $("#selectD a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisD.attr("id", "selectD"));
            }
        }
        $("#btn_search").click();
    });
    //价格
    $("#select5 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectE").remove();
        } else {
            var copyThisE = $(this).clone();
            if ($("#selectE").length > 0) {
                $("#selectE a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisE.attr("id", "selectE"));
            }
        }
        $("#btn_search").click();
    });

    //功能
    $("#select6 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectF").remove();
        } else {
            var copyThisF = $(this).clone();
            if ($("#selectF").length > 0) {
                $("#selectF a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisF.attr("id", "selectF"));
            }
        }
        $("#btn_search").click();
    });
    //老盏
    $("#select7 dd").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectG").remove();
        } else {
            var copyThisG = $(this).clone();
            if ($("#selectG").length > 0) {
                $("#selectG a").html($(this).text());
            } else {
                $(".select-result").show();
                $(".select-result dl").append(copyThisG.attr("id", "selectG"));
            }
        }
        $("#btn_search").click();
    });
    window.onload = function () {

        var type1 = decodeURIComponent(getUrlParam("type1")); //作者
        if (type1 != null && type1 != "") {
            $("#select1 dd").each(function () {
                if ($(this).last().text() == type1) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisA = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisA.attr("id", "selectB"));
                }

            });
        }
        var type2 = decodeURIComponent(getUrlParam("type2")); //釉色分类
        if (type2 != null && type2 != "") {
            $("#select2 dd").each(function () {
                if ($(this).last().text() == type2) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisB = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisB.attr("id", "selectB"));
                }

            });
        }
        var type3 = decodeURIComponent(getUrlParam("type3")); //经典器型
        if (type3 != null && type3 != "") {
            $("#select3 dd").each(function () {
                if ($(this).last().text() == type3) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisC = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisC.attr("id", "selectC"));
                }

            });
        }
        var type4 = decodeURIComponent(getUrlParam("type4")); //口径分类
        if (type4 != null && type4 != "") {
            $("#select4 dd").each(function () {
                if ($(this).last().text() == type4) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisD = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisD.attr("id", "selectD"));
                }

            });
        }
        var type5 = decodeURIComponent(getUrlParam("type5")); //功能分类
        if (type5 != null && type5 != "") {
            $("#select6 dd").each(function () {
                if ($(this).last().text() == type5) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisE = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisE.attr("id", "selectF"));
                }

            });
        }
        var type6 = decodeURIComponent(getUrlParam("type6")); //传世老盏
        if (type6 != null && type6 != "") {
            $("#select7 dd").each(function () {
                if ($(this).last().text() == type6) {
                    $(this).last().addClass("selected").siblings().removeClass("selected");
                    var copyThisF = $(this).last().clone();
                    $(".select-result").show();
                    $(".select-result dl").append(copyThisF.attr("id", "selectG"));
                }

            });
        }
        //        var type7 = decodeURIComponent(getUrlParam("type7"));
        //        if (type7 != null && type7 != "") {
        //            $("#select7 dd").each(function () {
        //                if ($(this).last().text() == type7) {
        //                    $(this).last().addClass("selected").siblings().removeClass("selected");
        //                    var copyThisG = $(this).last().clone();
        //                    $(".select-result dl").append(copyThisG.attr("id", "selectG"));
        //                }

        //            });
        //        }
        if (type1 == "null" && type2 == "null" && type3 == "null" && type4 == "null" && type5 == "null" && type6 == "null") {
            var keyword = $("#hid_Keyword").val(); //decodeURI(getUrlParam("keyword"));
        }
        $("#progressBar").show();
        $("#navigatediv").hide();
        $("#contents").html("");
        $.post("ajax/prolistAjax.aspx", { Type1: type1, Type2: type2, Type3: type3, Type4: type4, Type5: type5, Type6: type6, Keyword: keyword }, function (data) {
            var parsedJson = jQuery.parseJSON(data);
            $('#contents li').each(function () {
                $(this).remove();
            });
            $("#ALLCOUNT").text(" ");
            $("#ALLCOUNT").append("");
            $("#ALLCOUNT").append("<b>为您选出" + parsedJson.length + "款</b>");
            $.each(parsedJson, function (i, item) {

                if (item.InventoryCount > 0) {
                    $("#contents").append(
                    "<li class='contentlist'><a href='" + item.ProductID + ".html'>" +
                    "<div><img src='" + item.Images + "' /></div>" +
                    "<h2>【" + item.ShowTitle + "】" + item.ProductName + "</h2>" +
                    "<b>编号：" + item.ProductID + "</b></a>" +
                    "<i name='inquiry' onclick=javascript:$.windowbox.ShowPrice('" + item.ProductID + "','" + item.Author + "','" + item.ProductName + "')>点此询价</i></li>");
                }
                else {
                    $("#contents").append(
                    "<li class='contentlist'><a href='" + item.ProductID + ".html'>" +
                    "<div class='rel'><img src='" + item.Images + "' /><div class='sold'></div></div>" +
                    "<h2>【" + item.ShowTitle + "】" + item.ProductName + "</h2>" +
                    "<b>编号：" + item.ProductID + "</b></a>" +
                    "<i  name='inquiry'  onclick=javascript:$.windowbox.ShowPrice('" + item.ProductID + "','" + item.Author + "','" + item.ProductName + "')>点此询价</i></li>");
                }
            });
            $(
				function () {
				    $.easypage({ 'contentclass': 'contentlist', 'navigateid': 'navigatediv', 'everycount': 9, 'navigatecount': 10 });
				}
			)
            $("#progressBar").hide();
            $("#navigatediv").show();
            if (parsedJson.length == 0) {
                $("#contents").append(" <li>共搜索到相关的0款器具</li>");
            }
        });

    }

    //获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }

    $("#A_default").click(function () {
        $("#hid_Order").val('default');
        $("#btn_search").click();
    });
    $("#A_new").click(function () {
        $("#hid_Order").val('new');
        $("#btn_search").click();
    });
    $("#A_sales").click(function () {
        $("#hid_Order").val('sales');
        $("#btn_search").click();
    });
    $("#A_hot").click(function () {
        $("#hid_Order").val('hot');
        $("#btn_search").click();
    });
    $("#dt_ClearAll").click(function () {
        $(".select-result dd").remove();
    });
    $("#btn_search").click(function (type) {

        var type1 = $("#selectA a").last().text(); //作者
        var type2 = $("#selectB a").last().text(); //釉色分类
        var type3 = $("#selectC a").last().text(); //经典器型
        var type4 = $("#selectD a").last().text(); //口径分类
        var type5 = $("#selectF a").last().text(); //功能分类
        var type6 = $("#selectG a").last().text(); //传世老盏
        var type7 = $("#selectE a").last().text(); //价格分类

        var orderType = $("#hid_Order").val();

        if (type1 == "null" && type2 == "null" && type3 == "null" && type4 == "null" && type5 == "null" && type6 == "null" && type7 == "null") {
            var keyword = $("#hid_Keyword").val(); //decodeURI(getUrlParam("keyword"));
        }
        $("#progressBar").show();
        $("#navigatediv").hide();
        $("#contents").html("");
        $.post("ajax/prolistAjax.aspx", { Type1: type1, Type2: type2, Type3: type3, Type4: type4, Type5: type5, Type6: type6, Type7: type7, OrderType: orderType, Keyword: keyword }, function (data) {
            var parsedJson = jQuery.parseJSON(data);
            $('#contents li').each(function () {
                $(this).remove();
            });
            $("#ALLCOUNT").text(" ");
            $("#ALLCOUNT").append("");
            $("#ALLCOUNT").append("<b>为您选出" + parsedJson.length + "款</b>");
            $.each(parsedJson, function (i, item) {
                if (item.InventoryCount > 0) {
                    $("#contents").append(
                    "<li class='contentlist'><a href='" + item.ProductID + ".html'>" +
                    "<div><img src='" + item.Images + "' /></div>" +
                    "<h2>【" + item.ShowTitle + "】" + item.ProductName + "</h2>" +
                    "<b>编号：" + item.ProductID + "</b></a>" +
                    "<i  name='inquiry'  onclick=javascript:$.windowbox.ShowPrice('" + item.ProductID + "','" + item.Author + "','" + item.ProductName + "')>点此询价</i></li>");
                }
                else {
                    $("#contents").append(
                    "<li class='contentlist'><a href='" + item.ProductID + ".html'>" +
                    "<div class='rel'><img src='" + item.Images + "' /><div class='sold'></div></div>" +
                    "<h2>【" + item.ShowTitle + "】" + item.ProductName + "</h2>" +
                    "<b>编号：" + item.ProductID + "</b></a>" +
                    "<i  name='inquiry'  onclick=javascript:$.windowbox.ShowPrice('" + item.ProductID + "','" + item.Author + "','" + item.ProductName + "')>点此询价</i></li>");
                }
            });
            $("#progressBar").hide();
            $("#navigatediv").show();
            if (parsedJson.length == 0) {
                $("#contents").append(" <li>共搜索到相关的0款器具</li>");
            }
            //contentclass   要分页内容的class名称 默认的为contentlist
            //navigateid		 放置导航按钮的位置id 默认为mynavigate
            //everycount 		 每页显示多少个
            //navigatecount	 导航按钮开始显示多少个，从第二个开始显示为双倍	
            $(
				function () {
				    $.easypage({ 'contentclass': 'contentlist', 'navigateid': 'navigatediv', 'everycount': 9, 'navigatecount': 10 });
				}
			)
        });

    });

});