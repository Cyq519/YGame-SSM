/**
 * 
 */

$(function(){
	//鼠标指向显示浮窗
	/*
		$(".hgll")[0].onmouseover= function(){
			$(".pop").show();
		}
		$(".hgll")[0].onmouseout= function(){
			$(".pop").hide();
		}
	*/
	//打开界面加载热门游戏列表
	INDEX.ptChange(2,1,"null");
	//主界面商品展示8个
	INDEX.selectimage6();
	
	//点击我要卖时先判断是否登录  未登录先登录
	$("#Iwansale").click(function(){
		//console.log($(".login-yn")[0].innerHTML)
		if( $(".login-yn")[0].innerHTML != "" ){
			window.location.href = "./mysale";
		}else{
			$(".login-bj-black")[0].style.display = "block";
			$(".login_dl")[0].style.display = "block";
		}
	})

	
});
var INDEX = {
	//消息提示函数
	messapgepop:function(data){
		$(".message-txt")[0].innerHTML = data;
		$(".messagepop")[0].style.display = "block";
		setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
	},
	ptChange:function(gamekhd,rmyx,datavalue){
		$.post("http://localhost:8080/YGame/selectgamelist",{"datavalue":datavalue,"rmyx":rmyx,"gamekhd":gamekhd},function(data){
			$(".gamelist").empty();
			for( var i = 0; i < data.length; i++){				
				//动态添加游戏列表
				var parent = $(".hotgame-display")[0];
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
	},
	
	
	selectimage6:function(){
		$.post("http://localhost:8080/YGame/indexselectimage",function(data){
			for( var i = 0; i<data.length; i++){
				if( i == 0){
					$("#displayImg1").attr("src",data[i].goodsImage1);
					$("#displayImg1").attr("alt",data[i].id);
					$("#zsImg1").attr("href","./productxq?id="+data[i].id);
					$("#zsImg1 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg1 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 1){
					$("#displayImg2").attr("src",data[i].goodsImage1);
					$("#displayImg2").attr("alt",data[i].id);
					$("#zsImg2").attr("href","./productxq?id="+data[i].id);
					$("#zsImg2 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg2 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 2){
					$("#displayImg3").attr("src",data[i].goodsImage1);
					$("#displayImg3").attr("alt",data[i].id);
					$("#zsImg3").attr("href","./productxq?id="+data[i].id);
					$("#zsImg3 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg3 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 3){
					$("#displayImg4").attr("src",data[i].goodsImage1);
					$("#displayImg4").attr("alt",data[i].id);
					$("#zsImg4").attr("href","./productxq?id="+data[i].id);
					$("#zsImg4 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg4 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 4){
					$("#displayImg5").attr("src",data[i].goodsImage1);
					$("#displayImg5").attr("alt",data[i].id);
					$("#zsImg5").attr("href","./productxq?id="+data[i].id);
					$("#zsImg5 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg5 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 5){
					$("#displayImg6").attr("src",data[i].goodsImage1);
					$("#displayImg6").attr("alt",data[i].id);
					$("#zsImg6").attr("href","./productxq?id="+data[i].id);
					$("#zsImg6 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg6 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 6){
					$("#displayImg7").attr("src",data[i].goodsImage1);
					$("#displayImg7").attr("alt",data[i].id);
					$("#zsImg7").attr("href","./productxq?id="+data[i].id);
					$("#zsImg7 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg7 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
				if( i == 7){
					$("#displayImg8").attr("src",data[i].goodsImage1);
					$("#displayImg8").attr("alt",data[i].id);
					$("#zsImg8").attr("href","./productxq?id="+data[i].id);
					$("#zsImg8 .btandprice .bt")[0].innerHTML = data[i].goodsName;
					$("#zsImg8 .btandprice .price")[0].innerHTML = "<em>￥"+data[i].goodsPrice+"</em>";
				}
			}

		});
	},

}

