<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>轮播图管理</title>	
		<link rel="stylesheet" type="text/css" href="./css/manage.css">
		
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="./css/pagination.css">
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
				<div class="left" style="height:750px;">
					<div style="width:100%;height:50px;color:#ADB3B3;border-bottom:1px solid #888888;line-height:50px;font-size:18px;margin-bottom:20px;">导航菜单</div>
					<a href="lbtguanli"><div class="nav lbtgl" style="color:#fff">轮播图管理</div></a>
					<a href="userguanli"><div class="nav yhgl" >用户管理</div></a>
					<a href="gameguanli"><div class="nav yxflgl" >游戏分类管理</div></a>
					<a href="fuwuqiguanli"><div class="nav yxflgl">游戏服务器管理</div></a>
					<a href="lbtmanage"><div class="nav txdl">退出登录</div></a>
					<a href="lbtmanage"><div class="nav shezhi">设置</div></a>
				</div>
				<div class="right" style="height:750px;">
					<div class="right-top">
						<div style="width:200px;height:100%;color:#ADB3B3;font-size:15px;line-height:50px;text-align:center" >首页 >> 轮播图管理</div>
					</div>	
					<div class="info-display">
						<div style="width:1200px;height:230px;">
							<ul class="slider_lb" style="width:1200px;height:230px;">
								 <c:forEach items="${lbtlist}" var="lbt">
								 	<c:if test="${lbt.selectz != '4'}">
								 		<a href="${lbt.href}" target="_blank"><li class="slider_panel" style="display:none;background-image:url('${lbt.image}')"></li></a>  		
								 	</c:if>	            	 	
				            	 </c:forEach>	
							</ul>
							<ul class="slider_bq">
								<c:forEach items="${lbtlist}" var="lbt">
								 	<c:if test="${lbt.selectz != '4'}">
								 		<a href="${lbt.href}"><li title="${lbt.gamename}" id="wzry" style="opacity:1"><p>${lbt.gamename}</p></li></a>
								 	</c:if>	            	 	
				            	 </c:forEach>										
							</ul>	
						</div>
						<div>
							<ul>
								<li></li>
							</ul>
						</div>
						<div class="display" style="position:absolute;top:320px;color:#fff;width:1331px;height:270px;">
							<c:forEach items="${lbtlist}" var="lbt">
					 			<div class="dis-img"   style="display:none;width:565px;margin-left:50px;">
					 				<img alt="" src="${lbt.image}"  style="width:465px;height:130px;">
					 				<div value="${lbt.id}" style="position:absolute;margin-left:360px;margin-top:-130px;">
					 					<select class="sleectimg" onchange="change(this)">
					 						<c:if test="${lbt.selectz == '0'}">
					 							<option value="0" selected="true">图1</option>
						 						<option value="1">图2</option>
						 						<option value="2">图3</option>
						 						<option value="3">图4</option>
						 						<option value="4">未选择</option>
					 						</c:if>
					 						<c:if test="${lbt.selectz == '1'}">
					 							<option value="0">图1</option>
						 						<option value="1"selected="true">图2</option>
						 						<option value="2">图3</option>
						 						<option value="3">图4</option>
						 						<option value="4">未选择</option>
					 						</c:if>
					 						<c:if test="${lbt.selectz == '2'}">
					 							<option value="0">图1</option>
						 						<option value="1">图2</option>
						 						<option value="2"selected="true">图3</option>
						 						<option value="3">图4</option>
						 						<option value="4">未选择</option>
					 						</c:if>
					 						<c:if test="${lbt.selectz == '3'}">
					 							<option value="0">图1</option>
						 						<option value="1">图2</option>
						 						<option value="2">图3</option>
						 						<option value="3"selected="true">图4</option>
						 						<option value="4">未选择</option>
					 						</c:if>
					 						<c:if test="${lbt.selectz == '4'}">
					 							<option value="0">图1</option>
						 						<option value="1">图2</option>
						 						<option value="2">图3</option>
						 						<option value="3">图4</option>
						 						<option value="4"selected="true">未选择</option>
					 						</c:if>
					 					</select>
					 				</div>
								</div>						 	        	 	
				           	</c:forEach>
						</div>
				    
					</div>
					<!-- 分页 -->
					<div style="display:none" class="store-before-page">1</div>
					 <div class="pages" style="z-index:10000;position:absolute;top:720px;left:70px;">
					    <div id="Pagination"></div>
					</div>
				</div>
			</div>	
		</div>
		
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/jquery.pagination.js"></script>
		<script type="text/javascript">
			$(function(){
				var myDate = new Date();
				var riqi =  myDate.toLocaleDateString(); 
				var xingqi = myDate.getDay();
				var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
				$(".xingqi")[0].innerHTML = weeks[xingqi];
				$(".riqi")[0].innerHTML = riqi;
				
				//轮播图设置
				$(".slider_lb li")[0].style.display = "block";
				console.log(	$(".slider_bq li")[0])
				$(".slider_bq li").eq(0).attr('class','current');
				var speed = 3000;
				var m = 1;
				var playTimer = setInterval(runPlay,speed);
				function runPlay(){
					if(m>3){
						m=0;
					}
					controPlay(m);
					m++;
				};
				function controPlay(n){
					if( n == 0 ){
						$(".slider_lb li")[3].style.display = "none";
					}else{
						$(".slider_lb li")[n-1].style.display = "none";
					}
					$(".slider_lb li")[n].style.display = "block";
					if( (n-1)==-1 ){
						$(".slider_bq li").eq(0).attr('class','current');
						$(".slider_bq li").eq(3).attr('class','');
					}
					if( (n-1)==0 ){
						$(".slider_bq li").eq(1).attr('class','current');
						$(".slider_bq li").eq(0).attr('class','');
					}
					if( (n-1)==1 ){
						$(".slider_bq li").eq(2).attr('class','current');
						$(".slider_bq li").eq(1).attr('class','');
					}
					if( (n-1)==2 ){
						$(".slider_bq li").eq(3).attr('class','current');
						$(".slider_bq li").eq(2).attr('class','');
					}
					
				};
				
				csh3();
			
				
			})
			//切换图片
			function change(obj){
				var id = $(obj)[0].parentNode.getAttribute("value");
				var value = $(obj)[0].value;
				var formdata = new FormData();
				formdata.append("id",id);
				formdata.append("value",value);
				$.ajax({
					type:"post",
					url:"http://localhost:8080/YGame/updatelbt",
					data:formdata,
					processData: false,
					contentType: false,
					success:function (data) {
						if( data == 1 ){
							alert("修改成功");
						}else{
							alert("修改失败");
						}
						window.location.href = "http://localhost:8080/YGame/lbtguanli";
					}
				});		
			}
		</script>
	</body>
</html>