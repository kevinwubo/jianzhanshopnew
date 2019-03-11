;(
	function($){
		$.extend({
				"easypage":function(options){
					options = $.extend({//参数设置
						contentclass:"contentlist",//要显示的内容的class
						navigateid:"navigatediv",//导航按钮所在的dom的id
						everycount:"5",//每页显示多少个
						navigatecount:"5"//导航按钮一次显示多少个
						},
						options);
					var currentpage = 0;//当前页	
					var contents = $("."+options.contentclass);//要显示的内容
					var contentcount = contents.length;//得到内容的个数
					var pagecount = Math.ceil(contentcount/options.everycount);//计算出页数
					//拼接导航按钮
					var navigatehtml = "<div id='pagefirst' class='pagefirst'><a href='javascript:void(0)'>首页</a></div><div id='pagepre' class='pagepre'><a href='javascript:void(0)'>上一页</a></div>";
					for(var i = 1;i <= pagecount;i++){
							navigatehtml+='<div class="pagenavigate"><a href="javascript:void(0)">'+i+'</a></div>';
					}
					navigatehtml+="<div id='pagenext' class='pagenext'><a href='javascript:void(0)'>下一页</a></div><div id='pagelast' class='pagelast'><a href='javascript:void(0)'>尾页</a></div>";
					
					//加载导航按钮
					$("#"+options.navigateid).html(navigatehtml);	
					
					//得到所有按钮
					var navigates = $(".pagenavigate");
					
					//隐藏所有的导航按钮
					$.extend({
						"hidenavigates":function(){
							navigates.each(function(){
								$(this).hide();
							})	
						}	
					});
					
					//显示导航按钮
					$.extend({
						"shownavigate":function(currentnavigate){
							$.hidenavigates();
							var begin = currentnavigate>=options.navigatecount?currentnavigate-parseInt(options.navigatecount):0;
							if(begin>navigates.length-2*options.navigatecount){
								begin = navigates.length-2*options.navigatecount;	
							}
							for(var i = begin;i < currentnavigate+parseInt(options.navigatecount);i++){
								$(navigates[i]).show();
							}
						}	
					});
					
					//高亮显示某个按钮
					$.extend({
						"lightnavigate":function(currentnavigate){
							currentnavigate.addClass("pagenavigateon");	
						}	
					});
					
					//移除所有高亮按钮
					$.extend({
						"removelight":function(){
							$(".pagenavigateon").each(
								function(){
									$(this).removeClass("pagenavigateon");	
								}
							)
						 }	
					});
					
					//显示某页的内容
					$.extend({
						"showPage":function(page){
							contents.each(
								function(contentindex){
									if(contentindex>=page*options.everycount && contentindex < (page+1)*options.everycount){
									$(this).show();	
									}else{
									$(this).hide();	
									}
								}
							);
						}
					});
					
					//隐藏前进后退按钮
					$.extend({
						"hidePreNext":function(page){
								if(page==pagecount-1){
									$("#pagenext").hide();	
									$("#pagelast").hide();
									$("#pagepre").show();
									$("#pagefirst").show();			
								}else if(page==0){
									$("#pagepre").hide();
									$("#pagefirst").hide();	
									$("#pagenext").show();	
									$("#pagelast").show();	
								}else{
									$("#pagenext").show();
									$("#pagepre").show();	
									$("#pagefirst").show();	
									$("#pagelast").show();	
								}
						}	
					});
					//显示指定的导航按钮
					$.shownavigate(0);
					//隐藏所有的内容
					$.showPage(0);
					//开始时隐藏后退按钮
					$.hidePreNext(0);
					//高亮显示第一个按钮
					if(pagecount>0){
							$.lightnavigate($(navigates.get(0)));
					}
					//点击导航按钮
					$(".pagenavigate").each(
						function(myindex){
							$(this).click(
								function(){
									$.showPage(myindex);
									$.removelight();
									$.lightnavigate($(this));
									currentpage = myindex;
									$.hidePreNext(currentpage);
									var na = Math.floor((currentpage+1)/options.navigatecount)*options.navigatecount;
									$.shownavigate(na);	
								}
							);
						}
					);
					//点击后退按钮
					$("#pagepre").click(
						function(){
							--currentpage<=0 && (currentpage=0);
							$.showPage(currentpage);	
							$.removelight();
							$.lightnavigate($(navigates.get(currentpage)));
							$.hidePreNext(currentpage);
							var na = Math.floor(currentpage/options.navigatecount)*options.navigatecount;
							$.shownavigate(na);	
						}
					);
					//点击前进按钮
					$("#pagenext").click(
						function(){
							++currentpage>=pagecount-1 && (currentpage=pagecount-1);
							$.showPage(currentpage);	
							$.removelight();
							$.lightnavigate($(navigates.get(currentpage)));
							$.hidePreNext(currentpage);
							
							var na = Math.floor((currentpage+1)/options.navigatecount)*options.navigatecount;
							$.shownavigate(na);	
						}
					);
					//点击首页按钮
					$("#pagefirst").click(
						function(){
							currentpage=0;
							$.showPage(currentpage);	
							$.removelight();
							$.lightnavigate($(navigates.get(currentpage)));
							$.hidePreNext(currentpage);
							
							var na = Math.floor((currentpage+1)/options.navigatecount)*options.navigatecount;
							$.shownavigate(na);	
						}
					);
				 //点击尾页按钮
				 $("#pagelast").click(
				 		function(){
				 			currentpage=pagecount-1;
				 			$.showPage(currentpage);	
							$.removelight();
							$.lightnavigate($(navigates.get(currentpage)));
							$.hidePreNext(currentpage);
							
							var na = Math.floor((currentpage+1)/options.navigatecount)*options.navigatecount;
							$.shownavigate(na);	
				 		}
				 );
				}
		});
	}
)(jQuery)