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
		<div class="managecenter">
			<div class="top">
				<div class="tit">后台管理系统</div>
				<div class="img" ><img style="width:50px;height:50px" alt="" src="${manage.image}"></div>
				<div class="name">${manage.realName}</div>
				<div style="float:right;width:200px;height:100%;">
					<div class="xingqi"></div>
					<div class="riqi"></div>
				</div>
			</div>
			<div class="zhuti">
				<div class="left">
					<div style="width:100%;height:50px;color:#ADB3B3;border-bottom:1px solid #888888;line-height:50px;font-size:18px;margin-bottom:20px;">导航菜单</div>
					<a href="lbtguanli"><div class="nav lbtgl">轮播图管理</div></a>
					<a href="userguanli"><div class="nav yhgl">用户管理</div></a>
					<a href="gameguanli"><div class="nav yxflgl">游戏分类管理</div></a>
					<a href="fuwuqiguanli"><div class="nav yxflgl">游戏服务器管理</div></a>
					<a href="lbtmanage"><div class="nav txdl">退出登录</div></a>
					<a href="lbtmanage"><div class="nav shezhi">设置</div></a>
					
				</div>
				<div class="right">
					<div style="width:400px;height:100px;color:#fff;font-size:35px;position:absolute;left:700px;top:300px;">欢迎使用后台管理系统</div>
				</div>
			</div>	
		</div>
		
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var myDate = new Date();
				var riqi =  myDate.toLocaleDateString(); 
				var xingqi = myDate.getDay();
				var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
				$(".xingqi")[0].innerHTML = weeks[xingqi];
				$(".riqi")[0].innerHTML = riqi;
			})
		</script>
	</body>
</html>