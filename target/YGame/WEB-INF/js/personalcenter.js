/**
 * 
 */

$(function(){
	//点击标签传递参数 用来判断左侧导航展开情况
	var nav_index;
	var li_index;
	$(".nav").click(function(){
		nav_index = $(".nav").index(this);
		window.localStorage.setItem("nav_index",nav_index);
	})
	$(".nav_list li").click(function(){
		li_index = $(".nav_list li").index(this);
		window.localStorage.setItem("li_index",li_index);
	})
	//点击修改信息传参数
	$(".pc-zt-name a").click(function(){
		window.localStorage.setItem("nav_index","2");
		window.localStorage.setItem("li_index","5");
	})
	
	//左侧动态菜单栏效果
	$(".nav").click(function(){
		$(this).next().stop().slideToggle().siblings(".nav_list").slideUp();
		$(this).toggleClass("add").siblings(".nav").addClass("add");
	})
	
	$(".buynum a").click(function(){
		//12     345  678
		var d = $(this).attr("data-value");
		window.localStorage.setItem("dh-select",d);
		if( d == 1 || d == 2){
			window.localStorage.setItem("nav_index",0);
			window.localStorage.setItem("li_index",0);
		}
		if( d == 3){
			window.localStorage.setItem("nav_index",1);
			window.localStorage.setItem("li_index",4);
		}
		if( d == 4 || d == 5){
			window.localStorage.setItem("nav_index",1);
			window.localStorage.setItem("li_index",3);
		}
		
	})
	
	
	
	
	
	
	
	
	
})