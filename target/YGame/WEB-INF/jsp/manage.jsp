<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>全部游戏</title>	
		<link rel="stylesheet" type="text/css" href="./css/manage.css">
	</head>
	<body>
		<div class="manage-bg">
			
			<div class="manage-dl">
				<div class="title">后台管理系统</div>
				<div class="manage-info">
					<div class="manage-dl-tit">管理员登录</div>
					<div style="visibility:hidden;font-size:14px;color:#ff0000;text-align:center;margin-top:20px;">用户名或密码错误</div>
					<form id="formmanage"  method="post">
						<div class="yhm">
						<label class="label_01">
							<img src="./image/dlzc_01.png">
						</label>
						<input id="LoginUserID" name="manageName" placeholder="请输入用户名">
						</div>
						
						<div class="mm">
							<label class="label_01">
								<img src="./image/dlzc_02.png">
							</label>
							<input id="LoginPassword" type="password" name="managePassword" placeholder="请输入密码">
						</div>
					</form>
					<div class="button">
						<div class="chongzhi">重置</div>
						<div class="denglu">登录</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			$(function(){
				//点击重置
				$(".chongzhi").click(function(){
					$(".yhm input").val("");
					$(".mm input").val("");
					$(".yhm input").focus();
				})
				//点击登录
				$(".denglu").click(function(){
					if ( check() ){
						console.log( $("#formmanage").serialize());
						$.post("http://localhost:8080/YGame/manageLogin", $("#formmanage").serialize(),function(data){
							if ( data == 1 ) {
								window.location.href = "http://localhost:8080/YGame/managecenter";
							} else {
								alter("账号或密码错误");
							}
						});
					}
				})
				function check(){
					if ($("#LoginUserID").val() == "") {
						alert("用户名不能为空")
						$("#LoginUserID").focus();
						return false;
					}
					if ($("#LoginPassword").val() == "") {
						alert("密码不能为空")
						$("#LoginPassword").focus();
						return false;
					}
					return true;
				}

			})
		
		</script>
	</body>
</html>