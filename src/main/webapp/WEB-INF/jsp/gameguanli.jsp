<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<a href="userguanli"><div class="nav yhgl">用户管理</div></a>
					<a href="gameguanli"><div class="nav yxflgl" style="color:#fff">游戏分类管理</div></a>
					<a href="fuwuqiguanli"><div class="nav yxflgl">游戏服务器管理</div></a>
					<a href="lbtmanage"><div class="nav txdl">退出登录</div></a>
					<a href="lbtmanage"><div class="nav shezhi">设置</div></a>
				</div>
				<div class="right">
					<div class="right-top">
						<div style="width:200px;height:100%;color:#ADB3B3;font-size:15px;line-height:50px;text-align:center" >首页 >> 游戏分类管理</div>
					</div>
					
					<div class="info-display">
						<div class="tishi" style="color:#ff0000;font-size:14px;padding-left:150px;">
							提示: 游戏热度1表示热门;游戏客户端0表示手机端1表示电脑端。
						</div>
						<table style="width:950px;background:rgba(255,255,255,0.6);position:absolute;left:150px;top:30px;" class="table table-striped  " >
				            <thead>
				                <tr>
				                    <th>游戏ID</th>
				                    <th>游戏名称</th>
				                    <th>游戏热度</th>
				                    <th>游戏首字母</th>
				                    <th>游戏图标</th>
				                    <th>游戏客户端</th>
									<th>手机端系统</th>
									<th>管理操作</th>
				                </tr>
				   
				            </thead>
				            <tbody id="list">
				            	 <c:forEach items="${gamelist}" var="game">
				            	 	<tr style="display:none;height:40px;line-height:40px;">
					            		<td contentEditable = "true" style="width:60px;height:40px;line-height:40px;">${game.id}</td>
					            		<td contentEditable = "true" style="width:136px;height:40px;line-height:40px;">${game.gamename}</td>
					            		<td contentEditable = "true" style="width:76px;height:40px;line-height:40px;">${game.hot}</td>
					            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">${game.initials}</td>            		
					            		<td contentEditable = "true" style="width:248px;height:40px;line-height:40px;">${game.gamelogo}</td>
					            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">${game.client}</td>
					            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">${game.iosorandroid}</td>
					            		<td style="width:128px;height:40px;line-height:40px;">
											<button class="shanchu">删除</button>
											<button class="xiugai">修改</button>
										</td>
					            	</tr>
				            	 </c:forEach>
				            </tbody>
				             <tbody class="list">
			            	 	<tr style="height:40px;line-height:40px;">
				            		<td contentEditable = "true" style="width:60px;height:40px;line-height:40px;">n</td>
				            		<td contentEditable = "true" style="width:136px;height:40px;line-height:40px;">请输入</td>
				            		<td contentEditable = "true" style="width:76px;height:40px;line-height:40px;">请输入</td>
				            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">请输入</td>            		
				            		<td contentEditable = "true" style="width:248px;height:40px;line-height:40px;">请输入</td>
				            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">请输入</td>
				            		<td contentEditable = "true" style="width:96px;height:40px;line-height:40px;">请输入</td>
				            		<td style="width:128px;height:40px;line-height:40px;">
										<button class="zengjia">添加</button>
									</td>
				            	</tr>
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
				//增加游戏
				$(".zengjia").click(function(){
					var tr = $(".list tr")[0];
					var id = tr.cells[0].innerHTML;
					var gamename = tr.cells[1].innerHTML;
					var initials = tr.cells[2].innerHTML;
					var hot = tr.cells[3].innerHTML;
					var gamelogo = tr.cells[4].innerHTML;
					var client = tr.cells[5].innerHTML;
					var iosorandroid = tr.cells[6].innerHTML;
				
					var formdata = new FormData();
					formdata.append("id",id);
					formdata.append("gamename",gamename);
					formdata.append("initials",initials);
					formdata.append("hot",hot);
					formdata.append("gamelogo",gamelogo);
					formdata.append("client",client);
					formdata.append("iosorandroid",iosorandroid);

					if( check(formdata) ){
						$.ajax({
							type:"post",
							url:"http://localhost:8080/YGame/addGame",
							data:formdata,
							processData: false,
							contentType: false,
							success:function (data) {
								if( data == 1 ){
									alert("添加成功");
								}
								window.location.href = "http://localhost:8080/YGame/gameguanli";
							}
						});
						
					}			

				})	
				//增加游戏 内容检测
				function check(formdata){
					var temp = {gamename:"游戏名称","hot":"游戏热度","initials":"游戏首字母","client":"游戏客户端",
							"iosorandroid":"手机端系统","gamelogo":"游戏logo"}
				  	for (var key of formdata.keys()) {
                       if( formdata.get(key) == "请输入" ){
							alert( "请输入" + temp[key] );
							return false;
						}
					}
					return true;
				}
				//修改游戏
				$(".xiugai").click(function(){
					var tr = $(this)[0].parentNode.parentNode;
					var id = tr.cells[0].innerHTML;
					var gamename = tr.cells[1].innerHTML;
					var initials = tr.cells[2].innerHTML;
					var hot = tr.cells[3].innerHTML;
					var gamelogo = tr.cells[4].innerHTML;
					var client = tr.cells[5].innerHTML;
					var iosorandroid = tr.cells[6].innerHTML;
				
					var formdata = new FormData();
					formdata.append("id",id);
					formdata.append("gamename",gamename);
					formdata.append("initials",initials);
					formdata.append("hot",hot);
					formdata.append("gamelogo",gamelogo);
					formdata.append("client",client);
					formdata.append("iosorandroid",iosorandroid);

					if( check(formdata) ){
						$.ajax({
							type:"post",
							url:"http://localhost:8080/YGame/updateGame",
							data:formdata,
							processData: false,
							contentType: false,
							success:function (data) {
								if( data == 1 ){
									alert("修改成功");
								}else{
									alert("修改成功");
								}
								window.location.href = "http://localhost:8080/YGame/gameguanli";
							}
						});
						
					}			

				})	
				//删除游戏
				$(".shanchu").click(function(){
					var tr = $(this)[0].parentNode.parentNode;
					var id = tr.cells[0].innerHTML;
						
					var formdata = new FormData();
					formdata.append("id",id);
					$.ajax({
						type:"post",
						url:"http://localhost:8080/YGame/deleteGame",
						data:formdata,
						processData: false,
						contentType: false,
						success:function (data) {
							if( data == 1 ){
								alert("删除成功");
							}else{
								alert("删除失败");
							}
							window.location.href = "http://localhost:8080/YGame/gameguanli";
						}
					});			

				})	
				
				
			})
		</script>
	</body>
</html>