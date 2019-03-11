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
			this.events.tabStore(this) ;
		},
		events:{
			tabStore:function(_self){
				$('.weui-navbar').children().each(function (index,node){
					$(this).click(function (){
						$('.weui-navbar').children().eq(_self.data.tabindex).removeClass('weui-navbar__item--on') ;
						// $('.weui-navbar').children().eq(_self.data.tabindex).children().eq(0).removeClass('initStyle') ;
						$('.weui-tab__bd').children().eq(_self.data.tabindex).removeClass('weui-tab__bd-item--active') ;
						_self.data.tabindex = index ;
						$('.weui-tab__bd').children().eq(_self.data.tabindex).addClass('weui-tab__bd-item--active') ;
						$(this).addClass('weui-navbar__item--on') ;
					})
				})
			},
		}
	}
	VM.init();
}
