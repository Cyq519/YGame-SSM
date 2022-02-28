/**
 * 
 */
$(function(){

	$("#btn_login").click(function(){	
		LOGIN.login();
	});
	
	//点击登录时 弹出登录界面 背景变暗
	$(".loginbar a").click(function(){
		$(".login-bj-black")[0].style.display = "block";
		$(".login_dl")[0].style.display = "block";
	})
	//点击暗色背景时  恢复原样
	$(".login-bj-black").click(function(){
		$(".login-bj-black")[0].style.display = "none";
		$(".login_dl")[0].style.display = "none";
	})
	
})
var redirectUrl = window.location.href

var LOGIN = {
	login:function() {
		if (this.checkInput()) {
			this.doLogin();
		}
	},
	checkInput:function() {
		if ($("#LoginUserID").val() == "") {
			this.messapgepop("用户名不能为空")
			$("#LoginUserID").focus();
			return false;
		}
		if ($("#LoginPassword").val() == "") {
			this.messapgepop("密码不能为空")
			$("#LoginPassword").focus();
			return false;
		}
		return true;
	},
	doLogin:function() {
		$.post("http://localhost:8080/YGame/inlogin.action", $("#formlogin").serialize(),function(data){
		console.log(data);
			if(data == 9 ){
				$(".message-txt")[0].innerHTML = "账号已停用";
				$(".messagepop")[0].style.display = "block";
				setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
				return ;
			}
			if ( data == 1 ) {
				$(".message-txt")[0].innerHTML = "登录成功";
				$(".messagepop")[0].style.display = "block";
				setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
				
				if( $(".reload-url")[0].innerHTML != "url" ){
					window.location.href = $(".reload-url")[0].innerHTML;
				}else{
					location.reload();
				}
			} else {
				$(".message-txt")[0].innerHTML = "账号或密码错误";
				$(".messagepop")[0].style.display = "block";
				setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
			}
		});
	},
	//消息提示函数
	messapgepop:function(data){
		$(".message-txt")[0].innerHTML = data;
		$(".messagepop")[0].style.display = "block";
		setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
	},
	
	
}