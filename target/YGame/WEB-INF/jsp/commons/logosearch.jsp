<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script type="text/javascript" src="./js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>
	</head>
<body>
		<!-- logo+搜索框 -->
		<div class="logo-search">
			<a href="./index.html" target="_blank">
			<div class="logo fl">
				<img style="width:230px;height:75px" src="./image/logo.png">
			</div>
			</a>
			<div class="search fr">	
				<form  class="ss-search" method="get">
					<span style="margin-bottom:0px;margin-right:650px;background:#ff3864"><font color="white">精确搜索</font></span>
					<div class="text fl">
						<input type="text" class="shuru"  style="outline:none;width:500px;height:40px;margin-top:0px" id="key" placeholder="请输入关键字">
					</div>
					<div class="submit fl">
						<input type="button" class="sousuo" style="width:60px;height:44px;" value="搜索" "/>
					</div>
					<div class=search_rmss>
						<ul>
							<li><a>热门搜索:</a></li>
							<li><a href="./productlist?id=王者荣耀" target="_blank">王者荣耀</a></li>
							<li>|</li>
							<li><a href="./productlist?id=绝地求生" target="_blank">绝地求生</a></li>
							<li>|</li>
							<li><a href="./productlist?id=和平精英" target="_blank">和平精英</a></li>
							<li>|</li>
							<li><a href="./productlist?id=地下城与勇士" target="_blank">地下城与勇士</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
		
		<!-- 导航栏 -->
		<div class="dhl">
			<div class="dhl_right">
				<ul>
					<li><a href="./index">首页</a></li>
					<li><a class="personal-center" style="cursor:pointer">个人中心</a></li>
					<li><a href="./wholeproduct">全部游戏</a></li>
					<li><a href="./wholeproduct">我要买</a></li>
					<li><a class= "Iwansale" style="cursor:pointer">我要卖</a></li>
				</ul>
			</div>
		</div>
		<!-- 主体区域 -->
		<div class="ztqy" style = "height:0px;">
			<div class="ztqy_part1" style = "height:0px;">
				<div class="hgl_top" style = "position:absolute;left:180px;top:-40px;">
					<img src = "./image/gameicon/ico_hot.png" style="width:20px;height:20px">
					<a href="./wholeproduct"><span class="l">热门游戏</span></a>
				</div>
			</div>
		</div>
</body>
</html>