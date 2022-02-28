<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>我的商品管理</title>
		<link rel="stylesheet" type="text/css" href="./css/productxq.css">
		
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
		
		<!-- 数量为0时 正在交易提示   -->
		<div class="inTrade">
			正在交易
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
			<div class="zf-fangshi" style="padding-left:200px;">
				<input checked ="true" type="radio" id="zfb" style="margin-top: 20px;position: absolute;">
				<img  alt="" src="./image/02.jpg" style="width:70px;height:70px;margin-left:20px;">
				<input type="radio" id="vx" style="margin-top: 20px;position: absolute;margin-left:60px;">
				<img alt="" src="./image/03.jpg"" style="width:70px;height:70px;margin-left:80px;">
			</div>
			<div class="dd-pay">确认支付</div>
			<div class="dd-quxiao">取消支付</div>
		</div>
		<div class="web-dh">
			
		</div>
		<div class="product_zt">
			<!-- 改为大图下面四个小图 点哪个哪个放大 把小的缩小放下去 -->
			<div class="zt-productinfo">
				<div class="product-img">
					<div class="display-big">
						<img id="product-disimg" alt="产品图" src="./image/zwpt.jpg" >
					</div>
				</div>
				<!-- 预览图 小 -->
				<div class="samll-yl-img">
					<ul>
					
					</ul>
				</div>
	
				<div class="productxq_info">
					<!-- 商品名 -->
					<div class="productxq_name">
					
					</div>
					
					<div class="productxq_type">
						<span style="float:left">商品类型:</span>

					</div>
					
					<div class="pt-dq-fwq" style="height:40px;margin-top:10px;">
						<!-- 平台大区服务器 -->
					</div>
					<!-- 价格和数量 -->
					<div style="height:40px;background:#f5f6f7;">
						<div class="productxq_price"> 

						</div>
						<div class="productxq_number">
							库存：
							<span></span>
						</div>
					</div>
					<div class="productxq_JS">
					<!-- 介绍商品 -->
					</div>
					<!-- 购买数量 -->
					<div class="buy-number">
						<div class="reduce">-</div>
						<input class="buynum" type="text" value="1">
						<div class="add">+</div>
					</div>
					<!-- 立即购买 -->
					<div class="buy_now">
						<input type="button" class="btn_buy" id="btn_buy" value="立即购买">
						<input type="button" class="btn_collection" id="btn_collection" value="加入收藏">
					</div>
				</div>
			</div>
			<div class="zt-sallerinfo">
				<div class="userinfo-img">
					<img alt="" src="./image/loading.png">
				</div>
				<div class="userinfo-name"></div>
				<div style="width:100px;height:1px;border-bottom:1px solid #c0c0c0;margin-left:25px;margin-top:5px"></div>
				<div class="userinfo-xinyu">
					<p style="font-size:14px;color:#999999;text-align:center;">卖家信誉</p>
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>
				<div style="width:100px;height:1px;border-bottom:1px solid #c0c0c0;margin-left:25px;margin-top:15px"></div>
				<!-- 交易情况 -->
				<div class="userinfo-jyqk">
					<div class="jy-success" style="margin-left:20px;"></div>	
					<div class="jy-cansel"  style="margin-left:20px;"></div>	
					<div class="jy-gailu"  style="margin-left:20px;"></div>
				</div>
				<div class="reminder">
					<p style="width:100%;height:30px;font-size:16px;color:#ff9999;text-align:center">温馨提示</p>
					<h3>私下交易有风险，请于平台内交易，谨防诈骗。</h3>
				</div>
			</div>
		</div>
		
		
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/productxq.js"></script>
	</body>
</html>