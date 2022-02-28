/**
 * 
 */
 //loginsearch.js
$(function(){

	//点击搜索时  搜索相关商品
	$(".sousuo").click(function(){
		if(  $(".shuru")[0].value == "" ){
			messapgepop("请输入关键词");	
			return false;
		}else{
			$.ajax({
				async:false,
				url:"http://localhost:8080/YGame/selectgameinfo",
				type:"post",
				data:{"gamename":$(".shuru")[0].value},
				success:function(data){
					if( data.length == 0){
						messapgepop("未搜索到信息");
					}
					else{
						window.location.href="http://localhost:8080/YGame/productlist?id=" + $(".shuru")[0].value;
					}
				}	
			});
			
		}
		
	})
	//消息提示函数
	function messapgepop(data){
		$(".message-txt")[0].innerHTML = data;
		$(".messagepop")[0].style.display = "block";
		setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
	}
	console.log($(".login-yn")[0].innerHTML == "");
	//点击个人中心时先判断是否登录  未登录先登录
	$(".personal-center").click(function(){
		if( $(".login-yn")[0].innerHTML != "" ){
			window.location.href = "./personalcenter";
		}else{
			$(".login-bj-black")[0].style.display = "block";
			$(".login_dl")[0].style.display = "block";
			$(".reload-url")[0].innerHTML = "./personalcenter";
		}
	})
	
	//点击我要卖时先判断是否登录  未登录先登录
	$(".Iwansale").click(function(){
		//console.log($(".login-yn")[0].innerHTML)
		if( $(".login-yn")[0].innerHTML != "" ){
			window.location.href = "./mysale";
		}else{
			$(".login-bj-black")[0].style.display = "block";
			$(".login_dl")[0].style.display = "block";
			$(".reload-url")[0].innerHTML = "./mysale";
		}
	})
});