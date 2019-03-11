window.onload = function () {
	window.VM = {
		api: {},
		data: {
			shoplist: [
				{
					title: '馆藏精品',
					shopDetail: [
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						}, {
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						},
						{
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						}, {
							number: 19999,
							imgurl: '',
							name: '[陆金禧]',
							describe: '中束口曜变',
							size: '8.8✖️5.6'
						}
					]
				}
			],
			tabindex: 0,
			isshow:false,
			lastindex:0,
		},
		init: function () {
			this.events.htmlView(this) ;
			this.events.tabStore(this) ;
		},
		events: {
			htmlView: function (_self) {
				var h = '';
				$.each(_self.data.shoplist, function (index, item) {
					h += '<div class="' + (index % 2 != 0 ? 'bgc_cc' : 'bgc_ff') + '">'
					h += '<div class="planbody-shop">' +
						'				<div class="shop-title">' +
						'					<span class="' + (index % 2 != 0 ? 'bgc_cc' : 'bgc_ff') + '">' + item.title + '</span>' +
						'				</div>';
					h += '<div class="shop-describe flex_around">';
					$.each(item.shopDetail, function (i, v) {
						// console.log(v)
						h += '<a href="m_index.html" class="show-view shop-view-state-a">'+
			'						<p>'+v.number+'</p>'+
			'						<p><img  class="list-item-img" src='+""+v.imgurl+""+'></p>'+
			'						<p>'+v.name+'</p>'+
			'						<p>'+v.describe+'</p>'+
			'						<p>尺寸：'+v.size+'</p>'+
			'						<p>'+
			'							<span></span>'+
			'							<button class="shop-query">立即询价</button>'+
			'						</p>'+
			'					</a>';
					})
					h += '</div>';
					h += '<div class="shop-controll">' +
						'					<button class="load-surplus">再显示3款新品<i class="iconfont icon-xiala1"></i></button>' +
						'				</div>';
					h += '</div>';
					h += '</div>';

				});
				$('#planbody-shop-box').html(h);
				$('.load-surplus').click(function () {
					// console.log($(this).parent().parent().children().eq(1))
					$(this).parent().parent().children().eq(1).height('auto');
					$(this).html('查看更多产品');
				})
			},
			tabStore:function(_self){
				$('.weui-navbar').children().each(function (index,node){
					$(this).click(function (){
						$('.item-plane').css('display','block');
						
						$('.weui-navbar').children().eq(_self.data.tabindex).children('div').removeClass('div-on') ;
						$('.item-plane').children().css('display','none');
						_self.data.lastindex=_self.data.tabindex;
						_self.data.tabindex = index ;						

						$('.item-plane').children().eq(_self.data.tabindex).css('display','block');
						$(this).children('div').addClass('div-on');

						if(_self.data.tabindex==_self.data.lastindex){
							_self.data.isshow=!_self.data.isshow;
							_self.data.isshow?$('.item-plane').css('display','block'):$('.item-plane').css('display','none')
						}else{
							$('.item-plane').css('display','block');
						}
					})
				})
			},
		}
	}
	VM.init();
}

