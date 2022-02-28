<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/mysale.css">
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		
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
		
		<div class="mysale-zt">
			<div class="mysale_tishi">
				<div class="line-left"></div>
				<span>填写商品信息</span>
				<div class="line-right"></div>
			</div>
			<div class="mysale_center">
				<form id="formmysale"  method="post"  enctype="multipart/form-data">
					<div class="mysale_info">
						
						<div class="mysale_li">
							<span>游戏分类:</span>
							<select  name="goodsType1" class="gsType1" id="gsType1" >
							
							</select>
							<label style="font-size:14px;color:#AAAAAA">请选择要出售的游戏</label>
						</div>		
						<div class="mysale_li mysale-gspt" style="display:none">
							<span>游戏平台:</span>
							<select  name="goodspt" class="gspt" id="gspt">
								
							</select>
							<label style="font-size:14px;color:#AAAAAA">请选择游戏平台</label>
						</div>		
						<div class="mysale_li">
							<span>二级分类:</span>		
							<select name="goodsType2" class="gsType2" id="gsType2">
								<option data-value="">请先选择游戏分类</option>
							</select>
							<label style="font-size:14px;color:#AAAAAA">请选择游戏分类</label>
						</div>
						<div class="mysale_li mysale-gsdq" >
							<span>游戏大区:</span>		
							<select name="goodsdq" class="gsdq" id="gsdq">
								<option data-value="">请先选择游戏分类</option>
							</select>
							<label style="font-size:14px;color:#AAAAAA">请选择游戏大区</label>
						</div>
						<div class="mysale_li" style="margin-left:210px">
							<span>服务器:</span>		
							<select name="goodsfwq" class="gsfwq" id="gsfwq">
								<option data-value="">请先选择游戏分类</option>
							</select>
							<label style="font-size:14px;color:#AAAAAA">请选择游戏服务器</label>
						</div>
						<div class="mysale_li">
							<span>商品标题:</span>
							<input type="text" name="goodsName" class="gsName" id="gsName" value="" placeholder="请输入商品标题"/>
							<label style="font-size:14px;color:#AAAAAA">请输入商品标题</label>
						</div>
						<div class="mysale_li">
							<span>商品价格:</span>
							<input type="text" name="goodsPrice" class="gsPrice" id="gsPrice" placeholder="请输入商品价格"/>
							<label style="font-size:14px;color:#AAAAAA">请输入商品价格</label>
						</div>
						<div class="mysale_li">
							<span>商品介绍:</span>
							<input type="text" name="goodsJieShao" class="gsJS" id="gsJS" placeholder="请输入商品介绍"/>
							<label style="font-size:14px;color:#AAAAAA">请输入商品介绍</label>
						</div>
						<div class="mysale_li">
							<span>商品数量:</span>
							<input type="text" name="goodsNumber" class="gsNumber" id="gsNumber" placeholder="请输入商品数量"/>
							<label style="font-size:14px;color:#AAAAAA">请输入商品数量</label>
						</div>
						
						<!-- 上传图片 -->
						<div class="mysale_li mysale-product-img">
							<!-- 图片预览 -->
							<ul  class="img-yulan">
								
							</ul>
							<div class="icon-plus">
								<span>上传图片，支持jpg/png</span>
								<input class="gsImage" id="gsImage" type="file" accept="image/*" name="prodFile" multiple="multiple">
							</div>						
						</div>
					
						<div class="mysale_li">
							<input type="button" class="btn_sale" value="发布商品">
						</div>
					</div>
				</form>	
			</div>
		</div>
		<!-- 在前面报错  需要等页面加载完再执行js -->
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/mysale.js"></script>
		<script type="text/javascript" src="./js/judgelogin.js"></script>
	</body>
</html>