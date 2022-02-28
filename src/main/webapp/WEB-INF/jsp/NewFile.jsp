<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>我的商品管理</title>
		<!-- 界面大致相同采用相同css样式 -->
		<link rel="stylesheet" type="text/css" href="./css/myproduct.css">
		<link rel="stylesheet" type="text/css" href="./css/mybuyproduct.css">
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="./css/pagination.css">
		<!-- js代码在下方  -->
	</head>
	<body>
		  <!-- 登录界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/login.jsp" />
		<!-- 注册界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/register.jsp" />
		
	    <!-- 页面顶部 -->
		<jsp:include page="/WEB-INF/jsp/commons/header.jsp" />
		
		<!-- logo-search -->
		<jsp:include page="/WEB-INF/jsp/commons/logosearch.jsp" />	
		
		<!-- 主体部分开始 -->
		<div class="myproduct-zt">
			<!-- 确认购买界面 -->
			<div class="pay-page">
				<div class="dd-info">订单信息</div>
				<div class="dd-productname"></div>
				<div class="dd-productnum"></div>
				<div class="dd-productprice"></div>
				<div class="dd-totalprice"></div>
				<div class="dd-pay">确认支付</div>
				<div class="dd-quxiao">取消支付</div>
			</div>
			<!-- 导航栏 -->
			<div class="myproduct-zt-dh">
				<ul class="l">
					<li><a href="./index">首页>></a></li>
					<li><a href="./personal">个人中心>></a></li>
					<li>我购买的商品</li>
				</ul>
				<ul class="r">
					<li data-value="4">退款申请</li>
					<li data-value="1">待付款</li>
					<li data-value="2">待收货</li>
					<li data-value="3" class="select-dh">已完成</li>
				</ul>
			</div>
			<!-- 加载自己的商品 -->
			<div class="myproductlist">
				<div class="goodslist"></div>
			</div>
			<!-- 分页 -->
			<div style="display:none" class="store-before-page">1</div>
			 <div class="pages" style="z-index:10000">
			    <div id="Pagination"></div>
			</div>
		</div>
		
		<!-- 主体部分结束 -->
		<!-- js -->
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/judgelogin.js"></script>
		<script type="text/javascript" src="./js/jquery.pagination.js"></script>
		<script type="text/javascript" src="./js/mybuyproduct.js"></script>

	</body>
</html>