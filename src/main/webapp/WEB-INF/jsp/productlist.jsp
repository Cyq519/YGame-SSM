<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>商品列表</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/productlist.css">
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="./css/pagination.css">
		
		
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
		
		<!-- 主体部分 开始 -->
		<div class="pl-ztbf">
			<div class="product-null" style="width:1120px;background:rgba(255,255,255,0.7);position:absolute;left:180px;">
				<div class="top-list">
					<h2 class="game-logo">
						<!-- 动态添加图标 -->
						<!-- 加个默认图片 显示失败时显示 -->
						<img alt="显示错误" src="./image/loading.png">
					</h2>
					<div class="gametype2">
						<!-- 动态添加商品二级类型 -->
						<ul id="gametype2" data-value="0">
						</ul>	
						<ul class="product-sort" style="float:right;font-size:16px;color:#a0a0a0">
							<li data-value ="2">全部</li>
							<li data-value ="1">按价格排序</li>
							<li data-value ="2">按时间排序</li>
						</ul>
					</div>
				</div>
				<div class="goodslist">
					<!-- 动态加载商品列表 -->
				</div>
				<!-- 分页 -->
				<div style="display:none" class="store-before-page">1</div>
				 <div class="pages" style="z-index:10000">
				    <div id="Pagination"></div>
				</div>
			</div>
			
		</div>
		<!-- 主体部分 结束 -->
		
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/jquery.pagination.js"></script>
		<script type="text/javascript" src="./js/productlist.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>
		
		<script type="text/javascript">
			$(function(){
				
				
				var type2 = $("#gametype2 li a")[0].innerHTML;
				//点击二级分类切换商品
				$("#gametype2").on("click","li",function(){
					$(this).addClass("select").siblings("li").removeClass("select");
					var type1 = $(".game-logo img").attr("alt");
					type2 = $(this).children()[0].innerHTML;
					P.selectproductinfo(type1,type2,2);
					csh();
				});
				//点击切换排序方式
				$(".product-sort").on("click","li",function(){
					var type1 = $(".game-logo img").attr("alt");
					//var type2 = $(this).children()[0].innerHTML;
					var sort = $(this).attr("data-value");
					P.selectproductinfo(type1,type2,sort);
					csh();
				});
			})
			 
		</script>
	</body>
</html>