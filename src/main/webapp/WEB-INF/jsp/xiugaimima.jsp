<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>易游商城</title>
		<link rel="stylesheet" type="text/css" href="./css/personalcenter.css">
		<link rel="stylesheet" type="text/css" href="./css/personal.css">
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/personalcenter.js"></script>
		<script type="text/javascript" src="./js/personal.js"></script>
		<script type="text/javascript" src="./js/judgelogin.js"></script>
	</head>
	<body>
		<!-- 登录界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/login.jsp" />
		<!-- 注册界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/register.jsp" />
		
	    <!-- 页面顶部 -->
		<jsp:include page="/WEB-INF/jsp/commons/header.jsp" />
		
		<!-- 隐藏   用来判断哪一个导航被选中展开 -->
		<div class="nav-this" style="display:none">0</div>
		<div class="nav-list-this" style="display:none">0</div>
		
		<!-- 主体部分 -->
		<div class="pc-bj">
			<div class="pc-top">
				<div style="width:1030px;margin:0 auto">
					<div class="pc-top-logo" style="margin-left:-50px;">
						<a><img alt="" src="./image/personal-logo.png" style="width:180px;height:50px;"></a>
					</div>
				</div>
				<div class="top-gndh">
					<div class="co">
						<div class="co-tit"><a href="./index">首页</a></div>
					</div>
					
					<div class="co">
						<div class="co-tit"><a href="./personal">个人信息</a></div>
					</div>
					<div class="co">
						<div class="co-tit"><a href="./wholeproduct">全部游戏</a></div>
					</div>
					<div class="co">
						<div class="co-tit"><a href="./wholeproduct">我要买</a></div>
					</div>
					<div class="co">
						<div class="co-tit"><a href="./mysale">我要卖</a></div>
					</div>
				</div>
			</div>
			<div class="pc-zt">
				<div class="pc-zt-left">
					<!-- 头像+名字 -->
					<div class="personal_name_img">
						<img alt="头像显示错误" src="${user.image}" style="width:100px;height:100px;">
					</div>
					<div class="pc-zt-name">
						<span>${user.nicheng}</span>
						<a href="./personal">
							<img alt="" src="./image/xiugai.png" style="width:16px;height:16px">
						</a>
					</div>
					<!-- 功能区 -->
					<div style="text-align:center;width:170px;height:40px;line-height:40px;color:#333333;font-size:18px;cursor:pointer;vertical-align:middle">
						<div class="tit"><a href="./personalcenter">个人首页</a></div>
					</div>
					<div class="nav add">
						<div class="tit">我是买家</div>
						<div class="icon"></div>
					</div>
					<ul class="nav_list">
						<li><a href="./mybuyproduct?id=${user.id }">我购买的商品</a></li>
						<li><a href="./mycollection?id=${user.id }">我收藏的商品</a></li>
					</ul>
					
					<div class="nav add" >
						<div class="tit">我是卖家</div>
						<div class="icon"></div>
					</div>
					<ul class="nav_list">
						<li><a href="./mysale">我要卖</a></li>
						<li><a href="./mysaleproduct?id=${user.id }">我卖出的商品</a></li>
						<li><a href="./myproduct?id=${user.id }">我的商品管理</a></li>
					</ul>
					
					<div class="nav add" >
						<div class="tit">账户设置</div>
						<div class="icon"></div>
					</div>
					<ul class="nav_list" >
						<li><a href="./personal">个人信息</a></li>
						<!-- 还没 实现 -->
						<li  ><a>修改密码</a></li>
					</ul>
				</div>
				<div class="pc-zt-center">
					<div class="info_title">修改登录密码</div>
					<div class="personalinfo">
						<form id="personalinfo_form">		
							<div class="xiugaimima" style="position:absolute;left:700px;top:300px;">
								<label style="margin-left:-10px;font-size:16px">请输入新密码:</label>
								<input class="npas" type="password" name="password" style="outline:none;margin-left:30px;height:25px;" >
							</div>			
							<input style = "position:absolute;left:770px;top:380px;width:150px;height:30px;" id="personal_xiugaimima"type="button" value="确认修改">
						</form>
					</div>				
				</div>
			</div>		
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				//修改密码
				$("#personal_xiugaimima").click(function(){
					var newpassword = $(".npas")[0].value;
					var id = ${user.id };
					$.post("http://localhost:8080/YGame/xiugaimima",{"newpassword":newpassword,"id":id},function(data){
						if( data == 1 ){
							alert("修改成功");
						}else{
							alert("修改失败");
							
						}
						window.location.href = "http://localhost:8080/YGame/exit";
					})
				})
			})
		</script>
	</body>
</html>

		
		
		
		
