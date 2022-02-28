<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/register.css">
		<script type="text/javascript" src="./js/gVerify.js"></script>
		<script type="text/javascript" src="./js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="./js/register.js"></script>
		
	</head>
	<body>
		<!-- 弹窗提示信息 -->
		<div class="messagepop" style="z-index:11;width:160px;height:50px;background:rgba(0,0,0,0.6);position:absolute;top:210px;left:680px;color:#fff;display:none">
			<div class="message-txt" style="margin-top:15px;height:auto;text-align:center">验证码错误</div>
		</div>
		<!-- 注册时暗色背景 -->
		<div class="login-bj-black"></div>
		<div class="zhuce_info">	
			<!-- 注册 -->
			<div class="zhuce_title">
				<h3>快速注册</h3>
				<P>QUICK REGISTRATION</P>
			</div>
			<form id="registerinfo_form">
				<div class="register_form">
					<ul class="form-box">
						<li class="reg_username">
							<label class="label_01">
								<img src="./image/dlzc_01.png">
							</label>
							<input onkeyup="this.value=this.value.replace(/[^\w_]/g,'');" maxlength="10" id="regUserID" name="UserName" type="text" class="input_01" placeholder="请输入用户名/手机号">
						</li>		
						<li class="reg_password">
							<label class="label_02">
								<img src="./image/dlzc_02.png">
							</label>
							<input onkeyup="this.value=this.value.replace(/[^\w_]/g,'');" maxlength="10" id="regPassword" name="PassWord" type="password" class="input_02" placeholder="请输入密码">
						</li>
						<li class="rereg_password">
							<label class="label_03">
								<img src="./image/dlzc_02.png">
							</label>
							<input onkeyup="this.value=this.value.replace(/[^\w_]/g,'');" maxlength="10" id="regPassword2" name="PassWord2" type="password" class="input_03" placeholder="请输入密码">
						</li>
						<li class="reg_input_yzm">
							<!-- 存放验证码 -->
							<div id="v_container"></div>
							<input maxlength="5" type="text" id="regCheckCode" name="CheckCode" maxlength="4" class="input_05" placeholder="验证码">
							<input type="button" class="button_03" id="btn_register" value="立即注册">
						</li>
						
					</ul>											
				</div>
				<div style="clear:both"></div>	
			</form>
		</div>
		<script type="text/javascript">
			var verifyCode = new GVerify("v_container");
			$(".button_03")[0].onclick = function(){
				if( REGISTER.reginputcheck() ){
					var res = verifyCode.validate($(".input_05")[0].value);
					if(res){
						REGISTER.register();
					}else{
						REGISTER.messapgepop("验证码错误");
					}
				}		
			}
		</script>
	</body>
</html>