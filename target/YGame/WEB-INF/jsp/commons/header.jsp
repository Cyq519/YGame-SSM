<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">			
					<c:if test="${empty user.userName}">
						<span style="color:#444444">欢迎来到易游！</span>
					</c:if>
					<c:if test="${not empty user.userName}">
						<span ><a style="color:#888888">亲爱的,${user.nicheng},欢迎来到易游！</a></span> 
					</c:if>		
				</div>

				<div class="right ">
					<div>
						<ul>
						<!-- href="${pageContext.request.contextPath}/login" -->
						 <c:if test="${empty user.userName}">
							<li id="loginbar" class="loginbar"><a target="_parent">登录</a></li>
							<li >|</li>
							<li id="loginbar1" class="loginbar1"><a  target="_blank" >注册</a></li>				
							<li>|</li>
							<li><a class="personal-center" style= "cursor:pointer" target="_blank">个人中心 </a></li>
						</c:if>
						<c:if test="${not empty user.userName}">
							<li id="loginbar"><a href="./personal" target="_parent">${user.nicheng}</a></li>
							<li >|</li>
							<li id="loginbar1"><a href="./exit" target="_parent" >退出</a></li>
							<li>|</li>
							<li><a href="./personalcenter" target="_blank">个人中心 </a></li>
						</c:if>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->