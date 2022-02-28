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
						<li  ><a href="./xiugaimima">修改密码</a></li>
					</ul>
				</div>
				<div class="pc-zt-center">
					<div class="info_title">设置个人信息</div>
					<div class="personalinfo">
						<form id="personalinfo_form">
							<div class="personal_tx">
								<div style="margin-left:50px;font-size:20px;display:inline-block;vertical-align:top;">头像:</div>
								<div style="cursor:pointer;width:80px;height:80px;border-radius:50px;overflow:hidden;display:inline-block;vertical-align:top;margin-left:30px;">
									<img class="puser-img"src="${user.image}" style="width:80px;height:80px;float:left">
									<input type="file" class="changetx" name="tximage" class="user-img" style="opacity:0;z-index:55;width:80px;height:80px;float:left;margin-top:-50px;">
									<p>编辑</p>
								</div>											
								<label style="font-size:14px;color:#AAAAAA;padding-left:75px;">仅支持小于4M的文件</label>
							</div>
							<div class="personal_yhm">
								<label style="margin-left:10px;font-size:20px;margin-top:2px;">用户名:</label>
								<input type="text" name="useryhm" style="outline:none;margin-left:30px; border:none" value="${user.userName}" readonly ="readonly";>
								<label style="font-size:14px;color:#AAAAAA">用户名不支持修改</label>
								
							</div>
							<div class="personal_nc" >
								<label style="margin-left:30px;font-size:20px;">昵称:</label>
								<input onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\@\.]/g,'')" maxlength="8" type="text" name="usernc" style="outline:none;margin-left:30px;height:25px;" value="${user.nicheng}">
								<label style="font-size:14px;color:#AAAAAA">请输入想要修改的昵称</label>
							</div>
							<%/**
								<div class="personal_brith">
								<label style="margin-left:-10px;font-size:20px">个人签名:</label>
								<input type="text" style="margin-left:30px;height:25px;" value="${user.gexingqianming}">
								<label style="font-size:14px;color:#AAAAAA">请输入您的个性签名</label>
								</div>
							*/%>
							
								<div class="personal_sex">
									<label style="margin-left:30px;font-size:20px">性别:</label>
									<input onkeyup="this.value=this.value.replace(男,女)" maxlength="1" type="text" name="usersex" style="outline:none;margin-left:30px;height:25px;" value="${user.sex}">
									<label style="font-size:14px;color:#AAAAAA">请选择你的性别</label>
								</div>
							

							<div class="personal_iphone">
								<label style="margin-left:-10px;font-size:20px">联系方式:</label>
								<input onkeyup="this.value=this.value.replace(/\D/g,'')"  maxlength="11" type="text" name="userphone" style="outline:none;margin-left:30px;height:25px;" value="${user.iphonenumber}">
								<label style="font-size:14px;color:#AAAAAA">请输入您的联系方式，方便与您联系</label>
							</div>
							<div class="personal_mail">
								<label style="margin-left:30px;font-size:20px">邮箱:</label>
								<input required pattern="^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"  maxlength="20" type="text" name="usermail" style="outline:none;margin-left:30px;height:25px;" value="${user.email}">
								<label style="font-size:14px;color:#AAAAAA">请输入您的联系方式，方便与您联系</label>
							</div>
							<input id="personal_xiugai"type="button" value="确认修改">
						</form>
					</div>				
				</div>
			</div>		
		</div>
		<script type="text/javascript">
			$(document).ready(function(){
				//打开页面时左侧导航自动展开定位到对应位置
				var n = window.localStorage.getItem("nav_index");
				$(".nav")[n].click();
				var m = window.localStorage.getItem("li_index");
				$(".nav_list li").eq(m).attr("class","selected");
			})
		</script>
	</body>
</html>

		
		
		
		
