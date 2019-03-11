
//拍卖提醒
function TiXing(productid, telephone, type, source) {
    if (telephone == "") {
        alert('请输入您的手机号码');
        return false;
    }
    if (telephone.length != 11) {
        alert('请输入正确的手机号码');
        return false;
    }

    $.post("ajax/addajax.aspx", { ProductID: productid, Telephone: telephone, AuctionType: type, Action: "拍卖提醒", CustomerOffer: 0, Source: source }, function (result) {
        alert(result);
        window.location.reload()
        $("#txt_TXtelephone").val("");
    });
}



//拍卖提醒
function ChuJia(productid, telephone, type, price, unit,source) {
    if (price == "") {
        alert('请输入您想出的价格');
        return false;
    }
    if (telephone == "") {
        alert('请输入您的手机号码');
        return false;
    }
    if (telephone.length != 11) {
        alert('请输入正确的手机号码');
        return false;
    }

    if (type == "小匠") {
        var i = price % unit;
        if (i > 0) {
            alert("小匠专场：出价必须是10元的整数倍");
            return false;
        }
    } else if (type == "名家") {
        var i = price % unit;
        if (i > 0) {
            alert("名家专场：出价必须是100元的整数倍");
            return false;
        }
    }
    else if (type == "大师") {
        var i = price % unit;
        if (i > 0) {
            alert("大师专场：出价必须是100元的整数倍");
            return false;
        }
    }


    $.post("ajax/addajax.aspx", { ProductID: productid, Telephone: telephone, AuctionType: type, Action: "拍卖出价", CustomerOffer: price, Source: source }, function (result) {
        alert(result);
        window.location.reload()
        $("#txt_JJtelephone").val("");
    });
}