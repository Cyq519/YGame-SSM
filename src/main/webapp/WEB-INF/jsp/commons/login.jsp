<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="./js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="./js/login.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>
		<!-- css 都写在主页的文件里 -->
	</head>
<body>
		<!-- 用来判断是否登录了 -->
		<div style="display:none" class="login-yn">${user.id}</div>
		<!-- 用来判断是否登录了 -->
		<div style="display:none" class="login-yn-name">${user.nicheng}</div>
		<!-- 用来存储跳转url -->
		<div style="display:none" class="reload-url">url</div>
		<!-- 弹窗提示心思 -->
		<div class="messagepop" style="z-index:1111;width:160px;height:50px;background:rgba(0,0,0,0.6);position:absolute;top:280px;left:680px;color:#fff;display:none">
			<div class="message-txt" style="margin-top:15px;height:auto;text-align:center">验证码错误</div>
		</div>
		<!-- 登录时暗色背景 -->
		<div class="login-bj-black"></div>
		<!-- 登录页面 -->
		<div class="login_dl">
			<div style="clear:both"></div>
			<span class="dl_tit">用户登录</span>
			<div style="clear:both"></div>
			<form id="formlogin"  method="post">
				<div class="dl_info">
					<p class="zc_title">
						还没有易游账号？
						<span class="dl_zc"><a  href="">快速注册</a></span>
					</p>
					<ul class="dl_list">
						<li class="dl_username">
							<label class="label_01">
								<img src="./image/dlzc_01.png">
							</label>
							<input   onkeyup="this.value=this.value.replace(/[^\w_]/g,'');" maxlength="10" id="LoginUserID" name="UserName" value="" type="text" class="input_01 iptFlat" placeholder="用户名/手机/邮箱">
						</li>		
					</ul>
					<div style="clear:both"></div>
					<ul class="dl_list">
						<li class="dl_password">
							<label class="label_02">
								<img src="./image/dlzc_02.png">
							</label>
							<input  onkeyup="this.value=this.value.replace(/[^\w_]/g,'');" maxlength="10" id="LoginPassword" name="PassWord" value="" type="password" class="input_02 iptFlat" placeholder="请输入密码">
						</li>
					</ul>
					<div style="clear:both"></div>
					
					<ul class="login_lj">
						<li>
					       <p style="float:right;margin-right:50px;margin-top:-20px;"><a href="/login/RefindPwd/">忘记密码？</a></p>
	                    </li>
						<li>
							<input type="button" class="button_01" id="btn_login" value="立即登录">
						</li>
						
					</ul>
				</div>
			</form>				
		</div>
</body>
</html>