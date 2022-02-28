/**
 * 
 */

$(function(){
	//打开界面加载热门游戏列表
	ptChange(2,1,"null");
	//点击游戏类型切换  端游or手游
	$(".GameType li").click(function(){
		$(".GameType li").removeClass("in");
		$(this).addClass("in");
		//获取是选择的手游还是端游
		var gamekhd = $(this).attr("data-value");
		var datavalue = $(".on").attr("data-value");
		
		if( datavalue == null){
			ptChange(gamekhd,1,"null");
		}else{
			ptChange(gamekhd,3,datavalue);
		}
	
	});
	//点击热门游戏时 去掉字母的class属性
	console.log($(".ptfilter ul"))
	$("#rmyx").on("click",function(){
		$(".ptfilter ul li").removeClass("on");
	});
	//字母点击切换
	$(".ptfilter ul").on("click","li",function(){
		var datavalue = $(this).attr("data-value");
		$(this).addClass("on").siblings("li").removeClass("on");
		//获取是选择的手游还是端游
		var gamekhd = $(".in").attr("data-value");
		ptChange(gamekhd,3,datavalue);
	});
	//点击热门游戏切换
	$(".ptfilter a").on("click",function(){
		//1表示是热门游戏
		//获取是选择的手游还是端游
		var gamekhd = $(".in").attr("data-value");
		//根据条件查询
		ptChange(gamekhd,1,"null");
	});
	
	function ptChange(gamekhd,rmyx,datavalue){
		
		$.post("http://localhost:8080/YGame/selectgamelist",{"datavalue":datavalue,"rmyx":rmyx,"gamekhd":gamekhd},function(data){
			console.log(data);
			$(".gamelist").empty();
			if( data.length == 0 ){
				var parent = $(".gamelist")[0];
				var div = document.createElement("div");
				div.setAttribute("class","NOINFO");
				div.innerHTML = "暂无相关信息";
				parent.appendChild(div);
			} 
			for( var i = 0; i < data.length; i++){				
				//动态添加游戏列表
				var parent = $(".gamelist")[0];
				var dl = document.createElement("dl");
				var dt = document.createElement("dt");
				var dd = document.createElement("dd");
				var a = document.createElement("a");
				var img = document.createElement("img");
				
				a.setAttribute("href","./productlist?id="+data[i].gamename);
				img.setAttribute("src",data[i].gamelogo);
				dl.appendChild(dt);
				dl.appendChild(dd);
				dt.appendChild(a);
				a.appendChild(img);
				parent.appendChild(dl);
				
				var aa = document.createElement("a");
				aa.setAttribute("href","./index");
				aa.setAttribute("href","./index");
				aa.innerHTML = data[i].gamename;
				
				var p = document.createElement("p");
				dd.appendChild(p);
				p.appendChild(aa);

			}
		});
	};
	
	
	
})
