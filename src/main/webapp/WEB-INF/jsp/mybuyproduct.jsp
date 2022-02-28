<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>我的商品管理</title>
		<!-- 界面大致相同采用相同css样式 -->
		<link rel="stylesheet" type="text/css" href="./css/personalcenter.css">
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
		
		<!-- 隐藏   用来判断哪一个导航被选中展开 -->
		<div class="nav-this" style="display:none">0</div>
		<div class="nav-list-this" style="display:none">0</div>
		
		<div class="tuikuan-resaon" style="display:none;position:fixed;left:550px;top:150px;width:400px;height:300px;background:rgba(255,255,255);z-index:999">
			<div style="width:100%;height:40px;line-height:40px;text-align:center;font-size:20px;border-bottom:#f98d59 1px solid;color:#f98d59">退款申请</div>
			<div style="margin-left:60px;">原因类型：</div>
			<select class="reasonbq" style="border:none;background:#f5f6f7;outline:none;width:275px;height:30px;margin-left:60px;">
				<option>质量问题</option>
				<option>价格问题</option>
				<option>其他问题</option>
			</select>
			<div style="margin-left:60px;">详细原因：</div>
			<textarea style="margin-left:60px;resize: none;outline:none;width:275px;height:150px;border:none;background:#f5f6f7" maxlength="50" name="reason" class="reason" id="reason" placeholder="请输入详细原因"></textarea>
			<div style="margin-left:85px;">
				<div class = "querentuikuan" style="display:inline-block;width:100px;height:30px;background-color:#f98d59;line-height:30px;text-align:center;">确定退款</div>
				<div class = "quxiaotuikuan" style="display:inline-block;width:100px;height:30px;background-color:#f98d59;line-height:30px;text-align:center;margin-left:20px;">取消退款</div>
			</div>
		</div>
			
		<!-- 主体部分开始 -->
		<div class="pc-bj">
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
			<!-- 确认购买界面 -->
			<div class="pay-page">
				<div class="dd-info">订单信息</div>
				<div class="dd-imgdisplay" style="width:330px;height:230px;display:inline-block;vertical-align:top">
					<img alt="" src="" style="width:330px;height:230px;">
				</div>
				<div class="dd-textbox" style="width:343px;height:230px;display:inline-block;vertical-align:top">
					<div class="dd-productname"></div>
					<div class="dd-productnum"></div>
					<div class="dd-productprice"></div>
					<div class="dd-totalprice"></div>
				</div>
				<div class="zf-fangshi" style="padding-left:220px;">
					<input checked ="true" type="radio" id="zfb" style="margin-top: 20px;position: absolute;">
					<img  alt="" src="./image/02.jpg" style="width:70px;height:70px;margin-left:10px;">
					<input type="radio" id="vx" style="margin-top: 20px;position: absolute;margin-left:60px;">
					<img alt="" src="./image/03.jpg"" style="width:70px;height:70px;margin-left:70px;">
				</div>
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
					<li id="asd" data-value="2">待收货</li>
					<li data-value="3" class="select-dh">已完成</li>
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
					<div class="tit">个人首页</div>
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
					<div class="xxfl-l">
						<div  class="xxfl-select">
							<select class="xxfl-gametype1" style="width:150px;">
								<option>全部分类</option>
							</select>
						</div>
						<div  data-value="1" class="mybuy-pxfs pxfs-select" style="padding-left:60px;">
							价格升序
						</div>
						<div  data-value="2" class="mybuy-pxfs">
							价格降序
						</div>
						<div  data-value="3" class="mybuy-pxfs">
							时间升序
						</div>
						<div  data-value="4" class="mybuy-pxfs">
							时间降序
						</div>	
					</div>
					<!-- 为你搜索到多少条数据 -->
					<div class="xxfl-r">
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
		<script type="text/javascript" src="./js/judgelogin.js"></script>
		<script type="text/javascript" src="./js/jquery.pagination.js"></script>
		<script type="text/javascript" src="./js/mybuyproduct.js"></script>
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
	</body>
</html>