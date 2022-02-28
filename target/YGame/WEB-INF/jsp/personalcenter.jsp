<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>易游商城</title>
		<link rel="stylesheet" type="text/css" href="./css/personalcenter.css">
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/personalcenter.js"></script>
		<script type="text/javascript" src="./js/judgelogin.js"></script>
	</head>
	<body>
		 <!-- 登录界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/login.jsp" />
		<!-- 注册界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/register.jsp" />
		
	    <!-- 页面顶部 -->
		<jsp:include page="/WEB-INF/jsp/commons/header.jsp" />
		
		<!-- 主体部分 -->
		<div class="pc-bj">
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
			<div class="pc-zt">
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
						<li  ><a href="xiugaimima">修改密码</a></li>
					</ul>
				</div>
				<div class="pc-zt-center">
					<div class="center-top">
						<div class="name-wenhou">
							<span>${user.nicheng }</span>
							<span class="wenhou"></span>
						</div>
						<div class="center-time">
							<span class="xingqi"></span>
							<p class="riqi"></p>
						</div>
					</div>
					<div class="imbuyer">
						<div class="buyinfo">
							<span style="width:80px;float:left;color:#333;font-size:16px;">我是买家</span>
							<p>
								<span>成交量:${user.saleNum}</span>
								<span>|</span>
								<span class="cjl"></span>
							</p>
							<p style="float:right;color:#3399ff">
								查看全部订单
							</p>
						</div>
						<div class="buynum">
							<div class="daifukuan marginleft">
								<div style="display:inline-block;height:58px;">
									<img alt="" src="./image/daifukuan.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:80px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										代付款：
									</p>
									<a  style="font-size:10px;" data-value="1" href="mybuyproduct?id=${user.id}">查看商品</a>
								</div>
							</div>
							<div class="wancheng2 marginleft">
								<div style="display:inline-block;height:58px;">
									<img alt="" src="./image/yiwancheng2.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:80px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										已完成：
									</p>
									<a style="font-size:10px;" data-value="2"   href="mybuyproduct?id=${user.id}">查看商品</a>
								</div>
							</div>
						</div>
					</div>
					<div class="imseller">
						<div class="sellerinfo">
							<span style="width:80px;float:left;color:#333;font-size:16px;">我是卖家</span>
							<p>
								<span>成交量:${user.saleNum}</span>
								<span>|</span>
								<span class="cjl"></span>
							</p>
							<p style="float:right;color:#3399ff">
								查看全部订单
							</p>
						</div>
						<div class="buynum">
							<div class="mygoods marginleft">
								<div style="display:inline-block;height:58px;">
									<img alt="" src="./image/shangjiaing.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										上架中商品：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="3" href="myproduct?id=${user.id}">查看商品</a>
								</div>
							</div>
							<div class="wancheng marginleft">
								<div style="display:inline-block;height:58px;">
									<img alt="" src="./image/shouhou.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										售后：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="4"  href="mysaleproduct?id=${user.id}">查看商品</a>
								</div>
							</div>
							<div class="shouhou marginleft">
								<div style="display:inline-block;height:58px;">
									<img alt="" src="./image/yiwancheng.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										已完成：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="5" href="mysaleproduct?id=${user.id}">查看商品</a>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="rementuijian">
						<div class="sellerinfo">
							<span style="width:80px;float:left;color:#333;font-size:16px;">热门推荐</span>
							<p>
								<span>快速直通导航</span>
							</p>
						</div>
						<div class="buynum">
							<div class="remenyouxi marginleft">
								<div style="display:inline-block;height:58px;width:58px;line-height:58px;text-align:center">
									<img  style="width:45px;height:45px;" alt="" src="./image/游戏.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										热门游戏：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="6" href="./wholeproduct">点击查看</a>
								</div>
							</div>
							<div class="woyaobuy marginleft">
								<div style="display:inline-block;height:58px;width:58px;line-height:58px;text-align:center">
									<img  style="width:45px;height:45px;" alt="" src="./image/收付款.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										我要卖：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="7" href="./wholeproduct">点击查看</a>
								</div>
							</div>
							<div class="woyaosale marginleft">
								<div style="display:inline-block;height:58px;width:58px;line-height:58px;text-align:center">
									<img style="width:45px;height:45px;" alt="" src="./image/公告通知.png" >
								</div>
								<div style="display:inline-block;vertical-align:top;width:90px;height:45px;padding-top:7px;color:#333333;">
									<p style="font-size:13px;color:#333333">
										平台公告：
										<span></span>
									</p>
									<a style="font-size:10px;" data-value="8" href="./notice_index">点击查看</a>
								</div>
							</div>
						</div>			
					</div>
					<div class="rementuijian">
						<div style="width:100%;height:25px;line-height:25px;color:#ff6700">
							<span style="width:80px;float:left;color:#ff6700;font-size:16px;">温馨提示</span>
						</div>
						<div style="width:100%;height:75px;background:#fff;font-size:14px;color:#888888">
							线下交易有风险，请严格遵守平台相关规则，在平台监督下完成交易，否则，平台不对任何问题担负责任。
						</div>
					</div>
					<!-- 温馨提示 -->
					<div class="wxts"></div>
				</div>
				<div class="pc-zt-right"></div>
			</div>
			
		</div>
		<script>
			$(function(){
				var a;
				if( ${user.cansleNum} == 0 ){
					a = 0;
				}else{
					a =  ${user.cansleNum} / ( ${user.cansleNum} + ${user.cansleNum} ) * 100 ;
				}
				var cjl = "成交率:" + a +"%";
				$(".cjl")[0].innerHTML = cjl;
				
				//根据时间判断早上晚上
				var myDate = new Date();
				var htime = myDate.getHours();   
				if( htime >= 6 && htime < 11 ){
					$(".name-wenhou .wenhou")[0].innerHTML = ",早上好"
				}
				if( htime >= 11 && htime < 14 ){
					$(".name-wenhou .wenhou")[0].innerHTML = ",中午好"
				}
				if( htime >= 14 && htime < 18 ){
					$(".name-wenhou .wenhou")[0].innerHTML = ",下午好"
				}
				if( htime >= 18 && htime < 24 ){
					$(".name-wenhou .wenhou")[0].innerHTML = ",晚上好"
				}
				if( htime >= 0 && htime < 6 ){
					$(".name-wenhou .wenhou")[0].innerHTML = ",晚上好"
				}
				var xingqi = myDate.getDay(); 
				var xq = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
				$(".xingqi")[0].innerHTML = xq[xingqi];
				
				var riqi = myDate.toLocaleDateString();
				$(".riqi")[0].innerHTML = riqi;
			})
		</script>
	</body>
</html>

		
		
		
		
