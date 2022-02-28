/**
 * 
 */
$(function(){


	//打开页面时加载游戏一级分类
	MYSALE.selectDL();
	//选择完游戏一级分类后，自动更新二级分类和平台等信息
	$("#gsType1").change(function(){
		//搜索二级分类
		MYSALE.selectXL();
		//为区分平台的手游 搜索平台
		var datavalue = $('#gsType1 option:selected').attr("data-value");
		if( datavalue == 1){
			$(".mysale-gspt")[0].style.display = "block";
			$("#gsdq").empty();
			$("#gsdq").append('<option data-value="">' + "请先选择游戏平台" + '</option>');
			$("#gsfwq").empty();
			$("#gsfwq").append('<option data-value="">' + "请先选择游戏平台" + '</option>');
			MYSALE.selectPt();
		}else{
			$(".mysale-gspt")[0].style.display = "none";
			$("#gsdq").empty();
			$("#gsfwq").empty();
			if( $('#gsType1 option:selected').text() == "请选择"){
				$("#gsdq").append('<option data-value="">' + "请先选择游戏分类" + '</option>');
				$("#gsfwq").append('<option data-value="">' + "请先选择游戏分类" + '</option>');
			}else{
				$("#gsfwq").append('<option data-value="">' + "请先选择游戏大区" + '</option>');
				MYSALE.selectDQ();
			}
			
		}
		
	});
	//根据选择的游戏平台来添加游戏大区
	$("#gspt").change(function(){
	 	var type = $('#gspt option:selected').text()
		if( type == "请选择" ){
		//如果选择请选择 则清空大区中的信息 然后在添加请选择平台的提示
			$("#gsdq").empty();
			$("#gsdq").append('<option data-value="">' + "请先选择游戏平台" + '</option>');
			$("#gsfwq").empty();
			$("#gsfwq").append('<option data-value="">' + "请先选择游戏平台" + '</option>');
		}else{
			$("#gsfwq").empty();
			$("#gsfwq").append('<option data-value="">' + "请先选择游戏大区" + '</option>');
			MYSALE.selectDQ2();
		}
	});
	//根据选择的游戏平台 和游戏大区 搜索服务器
	$("#gsdq").change(function(){
	 	var type = $('#gsdq option:selected').text()
		if( type == "请选择" ){
			//如果选择请选择 则清空服务器中的信息 然后在添加请选择大区的提示
			$("#gsfwq").empty();
			$("#gsfwq").append('<option data-value="">' + "请先选择游戏大区" + '</option>');
		}else{
			MYSALE.selectfwq();
		}
	});

	
	//发布商品
	$(".btn_sale").click(function(){
		if(checkInput()){
			mysale();
		}
	});
	
	function mysale(){
		var backToPreUrl=window.location.href.split("=")[1];
		var formd = new FormData($('#formmysale')[0]);
		formd.append("id",backToPreUrl);
		formd.append("imgSrc",JSON.stringify(imgSrc));
		formd.append("loginid",$(".login-yn")[0].innerHTML);
		formd.append("deleteImg",JSON.stringify(deleteImg));
		
        $.ajax({
			url:"http://localhost:8080/YGame/updateProduct",
			type:"post",
			data:formd,
			dataType:"JSON",
			cache:false,
			processData:false,
			contentType:false,
			success:function(data){
			 	if(data[0] =="false"){
			 		MYSALE.messapgepop("商品发布失败");
			 		//var preUrl=window.location.href;
			 		//window.open("http://localhost:8080/YGame/login?preUrl=" + preUrl)
			 	}else{
			 		MYSALE.messapgepop("商品发布成功");				
					window.localStorage.setItem("nav_index","1");
					window.localStorage.setItem("li_index","4");
					window.location.href = "http://localhost:8080/YGame/myproduct?id=" + $(".login-yn")[0].innerHTML;
			 	}	
			}
		
		});

                    
        
                    
                    
	};
	//判断填写的商品信息是否符合规范
	function checkInput () {
		if ($("#gsType1").val() == "请选择") {
			alert("请选择游戏分类");
			$("#gsType1").focus();
			return false;
		}
		if( $(".mysale-gspt")[0].style.display == "block"){
			if ($("#gspt").val() == "请选择") {
				alert("请选择游戏平台");
				$("#gspt").focus();
				return false;
			}
		}
		if ($("#gsType2").val() == "请选择") {
			alert("请选择二级分类");
			$("#gsType2").focus();
			return false;
		}
		if ($("#gsdq").val() == "请选择") {
			alert("请选择游戏大区");
			$("#gsdq").focus();
			return false;
		}
		if ($("#gsfwq").val() == "请选择") {
			alert("请选择游戏服务器");
			$("#gsfwq").focus();
			return false;
		}
		
		if ($("#gsName").val() == "") {
			alert("商品标题不能为空");
			$("#gsName").focus();
			return false;
		}
		if ($("#gsPrice").val() == "") {
			alert("商品价格不能为空");
			$("#gsPrice").focus();
			return false;
		}
		if ($("#gsJS").val() == "") {
			alert("商品介绍不能为空");
			$("#gsJS").focus();
			return false;
		}
		if ($("#gsNumber").val() == "") {
			alert("商品数量不能为空");
			$("#gsNumber").focus();
			return false;
		}
		
		if (imgSrc.length == 0) {
			alert("请添加最少一张图片");
			$("#gsImage").focus();
			return false;
		}			
		return true;
	};
	

	
	
	//选择了图片后 预览展示
	var imgName = [];
	var imgSrc = [];
	var imgFile = [];
	$(".gsImage").change(function(){
		var filelist = this.files;
		for( var i = 0; i < filelist.length; i++ ){
			//先判断是否等于4 等于4则终止循环 开始执行后面的代码
			if( imgFile.length == 5 ){
				break;
			}
			//判断格式和大小是否正确 正确则加入对应的数组
			var imgSize = filelist[i].size;
			if(imgSize>2048*2048*1){
				continue;
				//return alert("上传图片不能超过4M");
			}else if(this.files[0].type != 'image/png' && this.files[0].type != 'image/jpeg' && this.files[0].type != 'image/gif'){
				continue;
			}else{
				var imgSrcI = getObjectURL(filelist[i]);
				imgName.push(filelist[i].name);
				imgSrc.push(imgSrcI);
				imgFile.push(filelist[i]);
			}
			console.log(imgName[i]);
			console.log(imgFile[i]);
		}
		addNewContent(".img-yulan");
		
		if(imgSrc.length == 5){
			$(".icon-plus").hide();
			return alert("最多只能上传5张图片");
		}
		
	});
	//获取url地址用于显示图片
	function getObjectURL(file) {
		var url = null ;
		if (window.createObjectURL!=undefined) { // basic
			url = window.createObjectURL(file) ;
		} else if (window.URL!=undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file) ;
		} else if (window.webkitURL!=undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file) ;
		}
		return url ;
	}
	//图片预览
	function addNewContent(obj) {
		$(obj).html("");
		for(var a = 0; a < imgSrc.length; a++) {
			var oldBox = $(obj).html();
			//console.log(imgSrc[a])
			$(obj).html(oldBox + '<li class="content-img-list-item"><img src="'+imgSrc[a]+'" alt=""><a index="'+a+'" class="hide delete-btn"><i class="ico-delete">删除</i></a></li>');
		}
	}
	//鼠标放在图片上显示删除按钮
	$(".img-yulan").on("mouseover","li",function(){
		$(this).children('a').removeClass('hide');
	});
	//鼠标离开图片 隐藏上显示删除按钮
	$(".img-yulan").on("mouseleave","li",function(){
		$(this).children('a').addClass('hide');
	});
	//用来存储删除照片信息 方便后续删除本地和数据库信息
	var deleteImg = [];
	//点击删除图片
	$(".img-yulan").on("click","li a",function(){
	    	var index = $(this).attr("index");
	    	var realPath = "D:/YGame-Image/goodsimage" + imgSrc[index];
	    	deleteImg.push(realPath);
	    	//var xnPath = imgSrc[index];
			imgSrc.splice(index, 1);
			imgFile.splice(index, 1);
			imgName.splice(index, 1);
			var boxId = ".img-yulan";
			addNewContent(boxId);
			if(imgSrc.length < 5 ){//显示上传按钮
				$(".icon-plus").show();
			}
			console.log(deleteImg);
	 });
	 
	$(".delete-btn").click(function(){
		$(this).children('a').addClass('hide');
	});
	
	//搜索产品信息将选项定位到 该产品对应的选项
		
	//MYSALE.selectModifyProduct();
	//搜索要修改的商品的信息 并显示
	selectModifyProduct();
	function selectModifyProduct(){
		var backToPreUrl=window.location.href.split("=")[1];
		$.post("http://localhost:8080/YGame/selectProductXq",{"id":backToPreUrl},function(data){
			console.log(data);
			//游戏分类
			$(".gsType1").val(data.gameType1); 
			
			//二级分类 平台
			//MYSALE.selectXL();
			$("#gsType1").change();
			$(".gspt").val(data.gamept); 
			$(".gsType2").val(data.gameType2); 
			//游戏大区
			//MYSALE.selectDQ();
			$("#gspt").change();
			$(".gsdq").val(data.gamedq); 
			//游戏服务器
			$("#gsdq").change();
			//MYSALE.selectfwq();
			$("#gsfwq").val(data.gamefwq);
			console.log(data.gamefwq)
			//标题
			$(".gsName").attr("value",data.goodsName);
			//价格
			$(".gsPrice").attr("value",data.goodsPrice);
			//介绍
			$(".gsJS")[0].value = data.goodsJieShao;
			//数量
			$(".gsNumber").attr("value",data.goodsNumber);
			//图片显示
			var temp = [data.goodsImage1,data.goodsImage2,data.goodsImage3,data.goodsImage4,data.goodsImage5]
			for( var i = 0 ; i < 5 ; i++ ){
				if( temp[i] != null && temp[i] != ""){
					//imgSrc[i] = temp[i];
					imgSrc.push(temp[i]);
				}
			}
			addNewContent(".img-yulan");
		});
	}
	
})
var MYSALE = {
	//消息提示函数
	messapgepop:function(data){
		$(".message-txt")[0].innerHTML = data;
		$(".messagepop")[0].style.display = "block";
		setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
	},
	//搜索平台
	selectPt:function(){
		$("#gspt").empty();
		$("#gspt").append('<option data-value="1">' + "请选择" + '</option>');
		$("#gspt").append('<option data-value="0">' + "安卓" + '</option>');
		$("#gspt").append('<option data-value="0">' + "苹果" + '</option>');
	},
	//根据平台搜索大区  目前手游只分安卓苹果 QQ微信  所以这里直接添加 节省时间
	selectDQ2:function(){
		$("#gsdq").empty();
		$("#gsdq").append('<option data-value="">' + "请选择" + '</option>');
		$("#gsdq").append('<option data-value="">' + "QQ区" + '</option>');
		$("#gsdq").append('<option data-value="">' + "微信区" + '</option>');
	},
	//根据游戏搜索大区
	selectDQ:function(){
		$("#gsdq").empty();
		$("#gsdq").append('<option data-value="1">' + "请选择" + '</option>');
		var DL = $('#gsType1 option:selected').text();
		
		$.ajax({
			url:"http://localhost:8080/YGame/selectDQ",
			type:"post",
			data:{"DL":DL},
			async:false,
			success:function(data){
				for( var i = 0;i < data.length; i++){
				$("#gsdq").append("<option>"+data[i]+"</option>");
			}		
			}	
		});
	
	},
	//根据游戏大区 搜索服务器
	selectfwq:function(){
		$("#gsfwq").empty();
		$("#gsfwq").append('<option data-value="1">' + "请选择" + '</option>');
		var DQ = $('#gsdq option:selected').text();
		var type1 = $('#gsType1 option:selected').text();
		var temp = $(".mysale-gspt")[0].style.display;
		var pt = "null";
		if( temp =="block"){
			pt = $('#gspt option:selected').text();
		}
		$.ajax({
			url:"http://localhost:8080/YGame/selectFwq",
			type:"post",
			data:{"DQ":DQ,"type1":type1,"pt":pt},
			async:false,
			success:function(data){
				for( var i = 0;i < data.length; i++){
					$("#gsfwq").append("<option>"+data[i]+"</option>");
				}	
			}	
		});

	},
	//搜索游戏种类
	selectDL:function(){

		$("#gsType1").empty();
		$("#gsType1").append('<option data-value="0">' + "请选择" + '</option>');
		
		$.ajax({
			url:"http://localhost:8080/YGame/JZSelect",
			type:"post",
			async:false,
			success:function(data){
				for( var i = 0;i < data.length; i++){
					$("#gsType1").append("<option data-value="+data[i].iosorandroid+">"+data[i].gamename+"</option>");
				}		
			}	
		});
	},
	//根据游戏搜索二级分类
	selectXL:function(){
		$("#gsType2").empty();
		var DL = $('#gsType1 option:selected').text();
		$("#gsType2").append('<option>' + "请选择" + '</option>');
		$.ajax({
			url:"http://localhost:8080/YGame/JZSelect2",
			type:"post",
			async:false,
			data:{SDL:DL},
			success:function(data){
				for( var i = 0;i < data.length; i++){
				$("#gsType2").append("<option>"+data[i]+"</option>");
			}			
			}	
		});
	
	},
	
	
	
	
}