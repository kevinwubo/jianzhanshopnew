/*! 人事无忧B端基础代码 */
(function(window){
	if(!window.HR) window.HR={};
	HR.using = function() {
		var a = arguments, o = this, i = 0, j, d, arg, isExist;
		arg = a[0], isExist = a[1];
		if (arg && arg.indexOf('.')) {
			d = arg.split('.');
			for (j = (d[0] == 'HR') ? 1 : 0; j < d.length; j++) {
				if(!o[d[j]] && isExist) return null;
				o[d[j]] = o[d[j]] || {};
				o = o[d[j]];
			}
		} else {
			o[arg] = o[arg] || {};
		}
		return o;
	};
	/**
 	 *获取或设置cookie与JQ的用法一样 
 	 */
	HR.cookie=function(name, value, options) {
	    if (typeof value != 'undefined') {
	        options = options || {};
	        if (value === null) {
	            value = '';
	            options.expires = -1;
	        }
	        var expires = '';
	        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
	            var date;
	            if (typeof options.expires == 'number') {
	                date = new Date();
	                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
	            } else {
	                date = options.expires;
	            }
	            expires = '; expires=' + date.toUTCString();
	        }
	        var path = options.path ? '; path=' + options.path : '';
	        var domain = options.domain ? '; domain=' + options.domain : '';
	        var secure = options.secure ? '; secure' : '';
	        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
	    } else {
	        var cookieValue = null;
	        if (document.cookie && document.cookie != '') {
	            var cookies = document.cookie.split(';');
	            for (var i = 0; i < cookies.length; i++) {
	                var cookie = $.trim(cookies[i]);
	             	if (cookie.substring(0, name.length + 1) == (name + '=')) {
	                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
	                    break;
	                }
	            }
	        }
	        return cookieValue;
	    }
	};
	HR.showlist =  function (formatL,status){ //是否隐藏，分类列表，新列表
        // if(seeHide==2){
        var temporaryarr = [] ;
		if(status==1){
            for(var i=0; i<formatL.length;i++ ){
                var is_push = 0 ;

                if(formatL[i].sort_list){
                    for(var j=0;j<formatL[i].sort_list.length;j++){
                        if(formatL[i].sort_list[j].value==''||formatL[i].sort_list[j].value=='---'||formatL[i].sort_list[j].status==0){
                            is_push++
                        }
                    }
                    if(is_push!=formatL[i].sort_list.length){
                        temporaryarr.push(formatL[i])
                    }
                }
            }
            return temporaryarr
		}else {
            for(var i=0; i<formatL.length;i++ ){
                var is_push = 0 ;

                if(formatL[i].sort_list){
                    for(var j=0;j<formatL[i].sort_list.length;j++){
                        if(formatL[i].sort_list[j].status==0){
                            is_push++
                        }
                    }
                    if(is_push!=formatL[i].sort_list.length){
                        temporaryarr.push(formatL[i])
                    }
                }
            }
            return temporaryarr
		}

        // }
    }
	HR.selfFlag=false;
})(window);


//HR.Utils命名空间，提供一些常用小函数
(function(NS){
	$.extend(NS,{
    postAjax:function(url,data,succ,flag){
      if(HR.selfFlag&&!flag) return false;
      HR.selfFlag=true;
      $.ajax({
        type: "POST",
        url: url,
        data:data,
        dataType:"json",
        success: function (d) {
          succ(d);
          HR.selfFlag=false;
        },
        error:function(){
          Dialog.error("操作失败，出现网络错误，请刷新重试 :-(");
          HR.selfFlag=false;
        }
      });
    },
		/**
		 * 字符串的真实长度，汉字占2长度
		 * @param {String} text
		 */
		reallength:function(str){
			return str.replace(/[^\x00-\xff]/g, "^^").length;	
		},
		/**
		 * 字符串截取
		 * @param {String} str
		 * @param {Number} len
		 */
		clipstring:function(str,len){
			if(!str || !len) { return ''; }
			var a = 0;
			var i = 0;
			var temp = '';
			for (i=0;i<str.length;i++)
		    {
		        if (str.charCodeAt(i)>255) a+=2;
		    	else a++;
		        
		        if(a > len) { return temp+"..";}
				temp += str.charAt(i);
		    }
		    return str;
		},
		/**
		 * 格式化数字e.g. 1234567 => 1,234,567.00
		 */
		formatNumber:function(numStr){
	        if(!(/^[+-]?[\d\.]+$/.test(numStr))||/^0/.test(numStr)) return numStr;
	        if(numStr.length>15) return numStr;
	        // if(/\./.test(numStr)&&String(numStr).split(".")[1].length>=2) numStr=parseFloat(numStr||0).toFixed(2);
	        // else numStr=parseFloat(numStr||0);
	        var str=String(numStr).split(".");
	        return str[0].replace(/\B(?=(\d{3})+$)/g,',')+(str[1]?('.'+str[1]):"");
	    },
	    /**
	     * 滚动条定位到指定的锚点
	     * arg1[必须] 	标签
	     * arg2[可选]	
	     */
	    gotoAnchor: function(selector,isauto){
            var anchor = $(selector);
            if (anchor.length < 0) {return;}
			var $win=$(window);
			var $body = $(window.document.documentElement);
            var ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf("webkit") > -1) {
                $body = $(window.document.body)
            }
			var pos=anchor.offset();
			if (isauto) {
				var t = pos.top - $win.scrollTop(); //相对于屏幕显示区
				var t2 = $win.height() - t;
				if (t2 < anchor.outerHeight()) {
					$body.animate({"scrollTop": pos.top}, "normal");
				}
				return;
			}
			$body.animate({"scrollTop": pos.top}, "normal");
		},
		 /**
	       * 获取Query值
	       */
	    getQuery:function(name){
	          var paramList = location.search.replace("?","").split("&");
	          for(var i = 0 ; i < paramList.length ; i++)
	          {
	              if(paramList[i].split("=")[0] == name){
	                  return paramList[i].substring(paramList[i].indexOf("=") + 1,paramList[i].length);
	              }
	          }
	          return null;
	    },
		getTelReg:function (){
	    	return '/^[1][3-9]\\d{9}$|^([569])\\d{7}$|^[0][9]\\d{8}$|^[9]\\d{8}$|^[6]([86])\\d{5}$/'
		}
	}); 
})(HR.using("Utils"));
