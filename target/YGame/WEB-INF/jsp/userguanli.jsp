<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>全部游戏</title>	
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
				<div class="left">
					<div style="width:100%;height:50px;color:#ADB3B3;border-bottom:1px solid #888888;line-height:50px;font-size:18px;margin-bottom:20px;">导航菜单</div>
					<a href="lbtguanli"><div class="nav lbtgl">轮播图管理</div></a>
					<a href="userguanli"><div class="nav yhgl" style="color:#fff">用户管理</div></a>
					<a href="gameguanli"><div class="nav yxflgl" >游戏分类管理</div></a>
					<a href="fuwuqiguanli"><div class="nav yxflgl">游戏服务器管理</div></a>
					<a href="lbtmanage"><div class="nav txdl">退出登录</div></a>
					<a href="lbtmanage"><div class="nav shezhi">设置</div></a>
				</div>
				<div class="right">
					<div class="right-top">
						<div style="width:200px;height:100%;color:#ADB3B3;font-size:15px;line-height:50px;text-align:center" >首页 >> 游戏分类管理</div>
					</div>
					
					<div class="info-display">
						<div class="tishi" style="color:#ff0000;font-size:14px;padding-left:30px;">
							提示: 目前只支持用户状态管理，停用表示用户不能使用。
						</div>
						<table style="width:1200px;background:rgba(255,255,255,0.6);position:absolute;left:30px;top:30px;" class="table table-striped  " >
				            <thead>
				                <tr>
				                    <th>用户ID</th>
				                    <th>用户名</th>
				                    <th>用户头像</th>
				                    <th>用户昵称</th>
				                    <th>用户性别</th>
				                    <th>联系方式</th>
									<th>邮箱</th>
									<th>购买数量</th>
									<th>销售数量</th>
									<th>用户状态</th>
									<th>管理操作</th>
				                </tr>
				   
				            </thead>
				            <tbody id="list">
				            	 <c:forEach items="${userlist}" var="user">
				            	 	<tr style="display:none;height:40px;line-height:40px;">
					            		<td >${user.id}</td>
					            		<td >${user.userName}</td>
					            		<td >${user.image}</td>
					            		<td >${user.nicheng}</td>            		
					            		<td >${user.sex}</td>
					            		<td >${user.iphonenumber}</td>
					            		<td >${user.email}</td>
					            		<td >${user.saleNum}</td>
					            		<td >${user.buyNum}</td>	
					            		<td >${user.usertype}</td>
					            		<td >
											<button class="shanchu">删除</button>
											<c:if test="${user.usertype == '正常'}">
					            				<button class="fenghao">停用</button>
					            			</c:if>
											<c:if test="${user.usertype == '停用'}">
					            				<button class="fenghao">启用</button>
					            			</c:if>
										</td>
					            	</tr>
				            	 </c:forEach>
				            </tbody>
				             
						</table>
					</div>
				</div>
				<!-- 分页 -->
				<div style="display:none" class="store-before-page">1</div>
				 <div class="pages" style="z-index:10000;position:absolute;top:650px;left:70px;">
				    <div id="Pagination"></div>
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
				//分页初始化
				csh2();

				//封号处理
				$(".fenghao").click(function(){
					var tr = $(this)[0].parentNode.parentNode;
					var id = tr.cells[0].innerHTML;				
					var text = $(this)[0].innerHTML;
					
					var formdata = new FormData();
					formdata.append("id",id);
					if( text == "停用" ){
						formdata.append("usertype","停用");
					}else{
						formdata.append("usertype","正常");
					}

					$.ajax({
						type:"post",
						url:"http://localhost:8080/YGame/updateusertype",
						data:formdata,
						processData: false,
						contentType: false,
						success:function (data) {
							if( data == 1 ){
								alert("修改成功");
							}else{
								alert("修改失败");
							}
							window.location.href = "http://localhost:8080/YGame/userguanli";
						}
					});					

				})	
				//删除用户
				$(".shanchu").click(function(){
					var tr = $(this)[0].parentNode.parentNode;
					var id = tr.cells[0].innerHTML;
						
					var formdata = new FormData();
					formdata.append("id",id);
					$.ajax({
						type:"post",
						url:"http://localhost:8080/YGame/deleteuser",
						data:formdata,
						processData: false,
						contentType: false,
						success:function (data) {
							if( data == 1 ){
								alert("删除成功");
							}else{
								alert("删除失败");
							}
							window.location.href = "http://localhost:8080/YGame/userguanli";
						}
					});			

				})						
			})
		</script>
	</body>
</html>