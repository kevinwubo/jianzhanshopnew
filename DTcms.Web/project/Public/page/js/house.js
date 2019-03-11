window.onload = function (){
	window.VM = {
		api:{},
		data:{
			bannerMsg:[
				{imgurl:'/project/Public/image/1(1).jpg',href:'javascript:;'},
				{imgurl:'/project/Public/image/1(2).jpg',href:'javascript:;'},
				{imgurl:'/project/Public/image/1(3).jpg',href:'javascript:;'},
				{imgurl:'/project/Public/image/1(4).jpg',href:'javascript:;'},
				{imgurl:'/project/Public/image/1(5).jpg',href:'javascript:;'}
			],
			shoplist:[
				{
					title:'馆藏精品',
					shopDetail:[
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},
						{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						},{
							number:19999,
							imgurl:'',
							name:'[陆金禧]',
							describe:'中束口曜变',
							size:'8.8✖️5.6'
						}
					]
				}
			],
			tabindex:0
		},
		init:function (){
			this.events.htmlView(this) ;
			this.events.tabStore(this) ;
			this.events.bannerInit(this) ;
		},
		events:{
			htmlView:function (_self){
				var h = '';
				$.each(_self.data.shoplist,function (index,item){
					h += '<div class="'+(index%2!=0?'bgc_cc':'bgc_ff')+'">'
					h += '<div class="planbody-shop">'+
			'				<div class="shop-title">'+
			'					<span class="'+(index%2!=0?'bgc_cc':'bgc_ff')+'">'+item.title+'</span>'+
			'				</div>';
					h += 	'<div class="shop-describe flex_around">';
					$.each(item.shopDetail,function (i,v){
						// console.log(v)
						h += '<div class="show-view shop-view-state-a">'+
			'						<p>'+v.number+'</p>'+
			'						<p><img src='+""+v.imgurl+""+'></p>'+
			'						<p>'+v.name+'</p>'+
			'						<p>'+v.describe+'</p>'+
			'						<p>尺寸：'+v.size+'</p>'+
			'						<p>'+
			'							<span></span>'+
			'							<button class="shop-query">立即询价</button>'+
			'						</p>'+
			'					</div>';
					})
					h +='</div>';
					h += '<div class="shop-controll">'+
			'					<button class="load-surplus">再显示3款新品<i class="iconfont icon-xiala1"></i></button>'+
			'				</div>';
					h += '</div>';
					h += '</div>';

				});
				$('#planbody-shop-box').html(h) ;
				$('.load-surplus').click(function (){
					// console.log($(this).parent().parent().children().eq(1))
					$(this).parent().parent().children().eq(1).height('auto') ;
					$(this).html('查看更多产品') ;
				})
			},
			tabStore:function(_self){
        // alert()
				$('.store-title').children().each(function (index,node){
					$(this).click(function (){
						$('.store-title').children().eq(_self.data.tabindex).removeClass('initStyle') ;
						$('.store-title').children().eq(_self.data.tabindex).children().eq(0).removeClass('initStyle') ;
						$('.store-detail').children().eq(_self.data.tabindex).removeClass('initStyle') ;
						_self.data.tabindex = index ;
						$('.store-detail').children().eq(_self.data.tabindex).addClass('initStyle') ;
						$(this).addClass('initStyle') ;
						$(this).children().eq(0).addClass('initStyle') ;

					})
				})
			},
			bannerInit:function (_self){
				var h = '';
				$.each(_self.data.bannerMsg,function (index,value){
					h += '<div class="swiper-slide">'+
						 	'<a href="'+value.href+'"><img src="'+value.imgurl+'"></a>'+
						 '</div>';
				})
				$('#swiper-wrapper-banner').html(h) ;
				var mySwiper = new Swiper ('#swiper-container-banner', {
				    direction: 'horizontal',
				    loop: true,
				    autoplay:{
				    	disableOnInteraction:false,
				    	delay:5000,
				    },
				    // 如果需要分页器
				    pagination: {
				      el: '.swiper-pagination',
				    }
  				})
			}
		}
	}
	VM.init();
}
