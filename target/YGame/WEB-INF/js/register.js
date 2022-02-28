/**
 * 
 */
$(function(){

	//点击注册时 弹出登录界面 背景变暗
	$(".loginbar1 a").click(function(){
		$(".login-bj-black")[0].style.display = "block";
		$(".zhuce_info")[0].style.display = "block";
	})
	//点击暗色背景时  恢复原样
	$(".login-bj-black").click(function(){
		$(".login-bj-black")[0].style.display = "none";
		$(".zhuce_info")[0].style.display = "none";
	})
	
})
var REGISTER = {
		//消息提示函数
		messapgepop:function(data){
			$(".message-txt")[0].innerHTML = data;
			$(".messagepop")[0].style.display = "block";
			setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
		},
		register:function(){
			console.log($("#registerinfo_form").serialize());
			$.post("http://localhost:8080/YGame/register.do",$("#registerinfo_form").serialize(),function(data){
				if(data[0] =="false"){
					$(".message-txt")[0].innerHTML = "用户名已存在";
					$(".messagepop")[0].style.display = "block";
					setTimeout(function(){$(".messagepop")[0].style.display = "none"},1000);
					setTimeout(function(){window.location.href = "http://localhost:8080/YGame/register"},1000);	
		 		}else if( data[0] =="shibai" ){
		 			$(".message-txt")[0].innerHTML = "注册失败，请重试";
					$(".messagepop")[0].style.display = "block";
					setTimeout(function(){$(".messagepop")[0].style.display = "none"},1000);
					setTimeout(function(){window.location.href = "http://localhost:8080/YGame/register"},1000);	
		 		}else{
		 			$(".message-txt")[0].innerHTML = "注册成功";
					$(".messagepop")[0].style.display = "block";
					setTimeout(function(){$(".messagepop")[0].style.display = "none"},1000);
					setTimeout(function(){window.location.href = "http://localhost:8080/YGame/index"},1000);
					location.reload();
		 			
		 		}	
			})	

		},
		reginputcheck:function(){
				//不能为空检查
				if ($("#regUserID").val() == "") {
					this.messapgepop("用户名不能为空");
					$("#regName").focus();
					return false;
				}
				if ($("#regPassword").val() == "") {
					this.messapgepop("密码不能为空");
					$("#pwd").focus();
					return false;
				}
				//密码检查
				if ($("#regPassword2").val() != $("#regPassword").val()) {
					this.messapgepop("两次密码不一致");
					$("#pwdRepeat").focus();
					return false;
				}
				return true
		},
		
		
		
	};