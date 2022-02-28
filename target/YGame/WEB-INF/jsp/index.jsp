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
		<script type="text/javascript" src="./js/jquery-1.6.4.js"></script>
		<script type="text/javascript" src="./js/index.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>

	</head>

	<body>
		 <!-- 登录界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/login.jsp" />
		<!-- 注册界面 -->
		<jsp:include page="/WEB-INF/jsp/commons/register.jsp" />
		
	    <!-- 页面顶部 -->
		<jsp:include page="/WEB-INF/jsp/commons/header.jsp" />
		
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
						<input type="text" class="shuru"  style="width:500px;height:40px;margin-top:0px;outline:none;" id="key" placeholder="请输入关键字">
					</div>
					<div class="submit fl">
						<input type="button" class="sousuo" style="width:60px;height:44px;outline:none;" value="搜索" />
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
					<li><a href="/manage/index">首页</a></li>
					<li><a class="personal-center" style= "cursor:pointer">个人中心</a></li>
					<li><a href="./wholeproduct">全部游戏</a></li>
					<li><a href="./wholeproduct">我要买</a></li>
					<li><a class= "Iwansale" style="cursor:pointer">我要卖</a></li>
				</ul>
			</div>
		</div>
		<!-- 主体区域 -->
		<div class="ztqy">
			<div class="ztqy_part1">
				<div class="hot_game_list">
					<div class="hgl_top">
						<img src = "./image/gameicon/ico_hot.png" style="width:20px;height:20px">
						<span class="l">热门游戏</span>
					</div>
					<div class="hgl_bottom">
						<div class="hgl_gamelist">
							<ul class="hgll" >
								<li>
			                        <a href="./productlist?id=英雄联盟手游">
			                        	<img src="./image/gameicon/ico03.png">
			                            <span>英雄联盟</span>
			                        </a>
			                        
			                    </li>
								<li>
									<a  href="./productlist?id=王者荣耀">
										<img src="./image/gameicon/320.png">
										<span>王者荣耀</span>
									</a>
								</li>
								<li>
									<a  href="./productlist?id=绝地求生">
										<img src="./image/gameicon/ico01.png">
										<span>绝地求生</span>
									</a>
								</li>
								<li>
									<a  href="./productlist?id=和平精英">
										<img src="./image/gameicon/ico04.png">
										<span>和平精英</span>									
									</a>
								</li>
								<li>
									<a  href="./productlist?id=地下城与勇士">
										<img src="./image/gameicon/ico02.png">
										<span>地下城与勇士</span>
									</a>
								</li>
								<li>
									<a  href="./wholeproduct">
										<span>全部游戏></span>
									</a>
								</li>
							</ul>
						</div>		
					</div>
				</div>
				<div class="pop">
					wohenhao 
				</div>
				
				<div class="slider_img">
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
				<div class="part1_r">
					<div class="index_gonggao" >
						<div style="width:220px;height:30px;border-bottom:1px solid #c0c0c0">
							<span style="font-size:18px;font-family: 微软雅黑;text-align:center;margin-left:10px;">公&nbsp;告</span>
							<a style="margin-left:100px;font-size:14px;color:#5c6573;" href="./notice_index">更多>></a>
						</div>

						<div class="gonggao_list">
							<ul>
								<li>
									<a href="">
										<span>公告</span>
										PUBG全新嬉皮士系列上架啦！
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										史低多款游戏EPIC账号上架啦！！！
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										PUBG四周年皮肤排位号上架啦！！！
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										和平精英阿斯顿马丁全色全渠道上架啦！
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										【4月最新】NBA2KOL2合同费包上架
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										PUBG愚人节新品强势来袭！第十一赛季同时开启！
									</a>
								</li>
								<li>
									<a href="">
										<span>公告</span>
										STEAM新游NO.1《Subverse》上架！
									</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="index_user_gn">
						<div class="index_mybuy">
							<a href="./wholeproduct">
								<img alt="" src="./image/wantbuy.png">	
							</a>					
						</div>
						<div style="position:absolute;top:208px;left:25px;">
							<a href="./wholeproduct"><span >我要买</span></a>
						</div>
						<div class="index_mysale">
							<a class= "Iwansale" style="cursor:pointer">
								<img alt="" src="./image/wangsale.png">	
								<span>我要卖</span>
							</a>
						</div>
						<div class="index_personal">
							<a href="./personal">
								<img alt="" src="./image/personal.png">	
							</a>
						</div>
						<div style="position:absolute;top:208px;left:150px;">
							<a class="personal-center" style= "cursor:pointer"><span >个人中心</span></a>
						</div>
					</div>
					<div class="index_user_gn" style="margin-top:25px;">
						<div class="index_mybuy">
							<a href="./wholeproduct">
								<img  alt="" src="./image/gg_01.png">	
							</a>					
						</div>
						<div style="position:absolute;top:293px;left:25px;">
							<a href="./wholeproduct"><span >商品</span></a>
						</div>
						<div class="index_mysale">
							<a href="http://localhost:8080/YGame/productlist?id=绝地求生"class= "Iwansale" style="cursor:pointer">
								<img alt="" src="./image/gg_04.png">	
								<span>PUBG</span>
							</a>
						</div>

						<div class="index_personal">
							<a >
								<img  alt="" src="./image/gg_06.png">	
							</a>
						</div>
						<div style="position:absolute;top:293px;left:150px;">
							<a href="./wholeproduct" class="personal-center" style= "cursor:pointer"><span >全部游戏</span></a>
						</div>
					</div>
					
				</div>
				</div>
			</div>
			<div class="indexbg"></div>
			<span class="abc">热门游戏</span>
			<div class="hotgame-display">
			
				<!-- 自动搜索 添加热门游戏 -->
			</div>
			<div class="part2">
				<div class="product_display">
					<img style="margin-top:3px;" alt="" src="./image/icon-hot.png">
					<span style="position:absolute;width:130px;">热销产品</span>
				</div>
				<div class="part-top-r">
					<span>网游<em>335</em>款</span>
					<span>手游<em>335</em>款</span>
					<a href="./wholeproduct">全部游戏&gt;</a>
				</div>
				<div class="SYdisplay1">
					<a id="zsImg1" href="./productxq">
						<img alt="" id="displayImg1" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
						
					</a>
				</div>
				<div class="SYdisplay2">
					<a id="zsImg2" href="./productxq">
						<img alt="" id="displayImg2" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay3">
					<a id="zsImg3" href="./productxq">
						<img alt="" id="displayImg3" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay4">
					<a id="zsImg4" href="./productxq">
						<img alt="" id="displayImg4" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay5">
					<a id="zsImg5" href="./productxq">
						<img alt="" id="displayImg5" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay6">
					<a id="zsImg6" href="./productxq">
						<img alt="" id="displayImg6" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay7">
					<a id="zsImg7" href="./productxq">
						<img alt="" id="displayImg7" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>
				<div class="SYdisplay8">
					<a id="zsImg8" href="./productxq">
						<img alt="" id="displayImg8" style="width:290px;height:180px;object-fit:cover" src="./image/loading.png">
						<!-- 标题和价格 -->
						<div class="btandprice">
							<p class="bt">
							
							</p>
							<p class="price">
							
							</p>
						</div>
					</a>
				</div>		
			</div>
		</div>
		<!--  -->
			
		<!-- 页面底部 -->
		<jsp:include page="/WEB-INF/jsp/commons/footer.jsp" />
		
		<script>
			/*
			* 参数说明
			* obj      : 动画的节点，本例中是ul
			* top      : 动画的高度，本例中是-35px;注意向上滚动是负数
			* time     : 动画的速度，即完成动画所用时间，本例中是500毫秒，即marginTop从0到-35px耗时500毫秒
			* function : 回调函数，每次动画完成，marginTop归零，并把此时第一条信息添加到列表最后;
			* 
			*/
			function noticeUp(obj,top,time) {
				$(obj).animate({
					marginTop: top
				}, time, function () {
					$(this).css({marginTop:"0"}).find(":first").appendTo(this);
				})
			};
		 
			$(function () {
				// 调用 公告滚动函数
				setInterval("noticeUp('.gonggao_list ul','-18px',1000)", 3000);
				
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
				
				
				
			});
			
		</script>

		
	</body>
</html>