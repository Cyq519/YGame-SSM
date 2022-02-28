<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>我的商品管理</title>
		<link rel="stylesheet" type="text/css" href="./css/personalcenter.css">
		<!-- 界面大致相同采用相同css样式 -->
		<link rel="stylesheet" type="text/css" href="./css/myproduct.css">
		<link rel="stylesheet" type="text/css" href="./css/mybuyproduct.css">
		<!-- 个别地方修改的 css样式 -->
		<!-- <link rel="stylesheet" type="text/css" href="./css/mycollection.css"> -->
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="./css/pagination.css">
		<!-- js代码在下方  -->
		<style type="text/css">
			.part-03{margin-left:70px;width:100px}
		</style>
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
		<!-- 顶部导航 -->
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
		
		<!-- 主体部分开始 -->
		<div class="myproduct-zt">
			<!-- 导航栏 -->
			<div class="myproduct-zt-dh">
				<ul class="l">
					<li><a href="./index">首页>></a></li>
					<li><a href="./personalcenter">个人中心>></a></li>
					<li>我收藏的商品</li>
				</ul>
			</div>
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
				<ul class="nav_list">
					<li><a href="./personal">个人信息</a></li>
					<!-- 还没 实现 -->
					<li><a>修改密码</a></li>
				</ul>
			</div>
			<!-- 加载自己的商品 -->
			<div class="myproductlist">
				<!-- 详细分类 -->
				<div class="xxfl" style="width:100%;height:50px;line-height:50px;">
					
					<!-- 为你搜索到多少条数据 -->
					<div class="xxfl-r" style="float:right">
						共为你搜索到
						<em style="color:#ff3864;font-size:14px;"></em>
						条数据
					</div>
				</div>
				<div class="goodslist"></div>
				<!-- 分页 -->
				<div style="display:none" class="store-before-page">1</div>
				 <div class="pages" style="z-index:10000">
				    <div id="Pagination"></div>
				</div>
			</div>
			
		</div>
		<!-- 主体部分结束 -->
		
		<!-- js -->
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/mycollection.js"></script>
		<script type="text/javascript" src="./js/judgelogin.js"></script>
		<script type="text/javascript" src="./js/jquery.pagination.js"></script>
		<script type="text/javascript" src="./js/personalcenter.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				//打开页面时左侧导航自动展开定位到对应位置
				var n = window.localStorage.getItem("nav_index");
				$(".nav")[n].click();
				var m = window.localStorage.getItem("li_index");
				$(".nav_list li").eq(m).attr("class","selected");
			})
		</script>
		<script type="text/javascript">
			$(function(){
				//页面显示初始化
				//changepage(1);
				var length ;
				setTimeout(function(){
					length = $(".goodslist .list-item").length;
					console.log(length);
					$("#Pagination").pagination(length, {
						   items_per_page:3,
						   callback:changepage
					});
					var len = 3;
					if( len > length ){
						len = length;
					}
					for( var i = 0 ; i < len; i++ ){
						$(".goodslist .list-item")[i].style.display="block";
					}
				},1000);

				function changepage(page_index){
					var bindex = $(".store-before-page")[0].innerHTML;//获取上一页页码
					console.log(page_index);
					console.log(bindex);
					$(".store-before-page")[0].innerHTML = page_index + 1;
					for( var i = (bindex - 1) * 3 ; i < bindex * 3 && i < $(".goodslist .list-item").length ; i++ ){
						$(".goodslist .list-item")[i].style.display="none";
					}
					for( var i = page_index * 3 ; i < (page_index + 1) * 3  && i < $(".goodslist .list-item").length ; i++ ){
						$(".goodslist .list-item")[i].style.display="block";
					}
				}
			})	 
		</script>
	</body>
</html>