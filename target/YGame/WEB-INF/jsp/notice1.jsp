<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>易游商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/notice.css">
		<script type="text/javascript" src="./js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>
		
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
		
		<!-- 主体区域 -->
		<div class="ztqy">
			<div class="ztqy_part1">
				<div class="hgl_top">
					<img src = "./image/gameicon/ico_hot.png" style="width:20px;height:20px">
					<a href="./wholeproduct"><span class="l">热门游戏</span></a>
				</div>
			</div>
				<!-- 公告区域 -->
			<div class="notice-part">
				<div class="notice-tit">
					<a href="./index">首页&nbsp>>&nbsp</a>公告
				</div>
				<div class="noticeinfo">
					<div class="notice-title">
                        <p class="title">2021新春快乐，9891春节不打烊！</p>
                        <p class="cont_fbz">发布者：123游戏服务网 &nbsp;&nbsp;&nbsp;&nbsp;
                            发布时间：<span class="pubTime">2021-02-05 13:40</span></p>
                    </div>
                    <div class="notice-zt">
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">尊敬的9891用户：</span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="white-space: pre; font-size: 20px; color: rgb(255, 0, 0);"></span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);"><span class="Apple-tab-span" style="font-size: 20px; color: rgb(89, 89, 89); white-space: pre;"></span>&nbsp; &nbsp; 鼠报平安归玉宇，牛随吉瑞下天庭！</span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">&nbsp; &nbsp; 9891游戏服务网全体员工给大家拜年啦！</span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">&nbsp; &nbsp; 春节期间，为了使广大玩家朋友能够继续畅快游戏、安心交易，9891游戏服务网春节不打烊！</span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">&nbsp; &nbsp; 客服<strong>7*24</strong>小时坚守岗位为您提供优质的贴心服务！</span></p>
                    	<p style="white-space: normal; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;感谢您对9891的支持与厚爱，祝新年大吉大利，天天吃鸡！</span></p>
                    	<p style="white-space: normal; text-align: right; line-height: 3em;"><span style="font-size: 20px; color: rgb(255, 0, 0);">9891游戏服务网</span></p>
                    </div>
				</div>
			</div>
		</div>
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		