<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>全部游戏</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/wholeproduct.css">

		
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
		<!-- 主体部分 -->
		<div class="wp-ztbf">
			<div class="buyGameList">
				<div class="GameType">
					<ul>
						<li data-value="2" style="width:126px;" class="in">
							全部游戏
							<span></span>
						</li>
						<li data-value="0" style="width:86px;" class="">
							端游
							<span></span>
						</li>
						<li data-value="1" style="width:86px;" class="">
							手游
							<span></span>
						</li>
					</ul>
					
				</div>
				<div class="ptfilter">
		        	<p id="rmyx"><a href="javascript:void(0)"><img src="./image/hot-icon.png"></a></p>
		            <ul>
		        		<li data-value="A">A</li><li data-value="B">B</li><li data-value="C">C</li><li data-value="D">D</li><li data-value="E">E</li>
		                <li data-value="F">F</li><li data-value="G">G</li><li data-value="H">H</li><li data-value="I">I</li><li data-value="J">J</li>
		                <li data-value="K">K</li><li data-value="L">L</li><li data-value="M">M</li><li data-value="N">N</li><li data-value="O">O</li>
		                <li data-value="P">P</li><li data-value="Q">Q</li><li data-value="R">R</li><li data-value="S">S</li><li data-value="T">T</li>
		                <li data-value="U">U</li><li data-value="V">V</li><li data-value="W">W</li><li data-value="X">X</li><li data-value="Y">Y</li>
		                <li data-value="Z">Z</li>
		            </ul>
              	</div>
              	<div class="gamelist">
					
              	</div>
		    </div>
		</div>
		<script type="text/javascript" src="./js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="./js/notice.js"></script>
		<script type="text/javascript" src="./js/wholeproduct.js"></script>
	</body>
</html>