/**
 * 
 */

$(function(){
	//选择付款方式
	$("#zfb").click(function(){
		$("#vx").prop("checked",false);
	})
	$("#vx").click(function(){
		$("#zfb").prop("checked",false);
	})

	//执行函数，查询产品的详细信息
	functionJH.productinfo();
	
	function userinfo(){
		var userid = $(".display-big").attr("data-value");
		
	}
	//点击图片时切换
	$(".samll-yl-img ul").on("click","li img",function(){
		var bigimg = $("#product-disimg")[0].src;
		var smallimg = $(this)[0].src;
		
		$("#product-disimg")[0].src = smallimg;
		$(this)[0].src = bigimg;
	});
	//判断输入数量是否合法
	$(".buynum").change(function(){
		var num = $(".buynum")[0].value;
		var goodsnum = $(".productxq_number span")[0].innerHTML;
		if( num > goodsnum){
			$(".buynum")[0].value = goodsnum;
		}
		
	});
	//数量+1
	$(".add").click(function(){
	
		var goodsnum = $(".productxq_number span")[0].innerHTML;
		var num = $(".buynum")[0].value;
		if( parseInt(num) + 1 <= parseInt(goodsnum) ){
			$(".buynum")[0].value = parseInt(num)+1;
		}
	});
	//数量-1
	$(".reduce").click(function(){
		var num = $(".buynum")[0].value;
		if( parseInt(num) - 1 > 0 ){
			$(".buynum")[0].value = parseInt(num) - 1;
		}
	});
	//点击购买
	$(".btn_buy").click(function(){
		//判断是否登录不登录不能购买 
		var loginid = $(".login-yn")[0].innerHTML;
		if( loginid == null || loginid == "" ){
			$(".loginbar a")[0].click();
		}else{
			var name = $(".productxq_name")[0].innerHTML;
			$(".dd-productname")[0].innerHTML = "商品："+name;
			var buynum = $(".buynum")[0].value;
			$(".dd-productnum")[0].innerHTML = "购买数量："+buynum;
			var price = $(".productxq_price").attr("data-value");
			$(".dd-productprice")[0].innerHTML = "单价：￥"+price;
			var totalprice = price * buynum;
			$(".dd-totalprice")[0].innerHTML = "总价：￥"+totalprice;

			$(".dd-imgdisplay img")[0].src = $("#product-disimg").attr("src");
			$(".pay-page")[0].style.display = "block";
		}
	});
	//取消支付
	$(".dd-quxiao").click(function(){
		//获取产品id
		var id = window.location.href.split("=")[1];
		//获取买家id
		var loginid = $(".login-yn")[0].innerHTML;
		//获取买家昵称
		var usernc = $(".login-yn-name")[0].innerHTML;
		//获取要购买的数量
		var num = $(".buynum")[0].value;
		//在我的购买  和卖家的我的卖出的商品中分别添加相应信息
		$.post("http://localhost:8080/YGame/addTransAction",{"id":id,"loginid":loginid,"num":num,"usernc":usernc,"state":"1"},function(data){
			if( data == 1){
				//获取库存
				var goodsnum = $(".productxq_number span")[0].innerHTML;
				//获取要购买的数量
				var buynum = $(".buynum")[0].value;
				//减少相应数量 并在未支付数据中加上对应数量
				$.post("http://localhost:8080/YGame/addUnPaid",{"id":id,"buynum":buynum},function(data){
					if( data == 1){
						functionJH.messapgepop("未支付，请尽快支付");
						setTimeout(function(){
							location.reload();
						},2000)
					}else{
						functionJH.messapgepop("购买失败");
						setTimeout(function(){
							location.reload();
						},1000)
					}
				})
				
			}
			
		});
		$(".pay-page")[0].style.display = "none";
	});
	
	//确定支付
	$(".dd-pay").click(function(){
			//查询产品详情
			var id = window.location.href.split("=")[1];
			//获取买家id
			var loginid = $(".login-yn")[0].innerHTML;
			//获取买家昵称
			var usernc = $(".login-yn-name")[0].innerHTML;
			//获取要购买的数量
			var num = $(".buynum")[0].value;
			//在我的购买  和卖家的我的卖出的商品中分别添加相应信息
			$.post("http://localhost:8080/YGame/addTransAction",{"id":id,"loginid":loginid,"num":num,"usernc":usernc,"state":"2"},function(data){
				if( data == 1){
					//获取库存
					var goodsnum = $(".productxq_number span")[0].innerHTML;
					//获取要购买的数量
					var num = $(".buynum")[0].value;
					//购买商品减去相应数量  若数量和未支付都为0则删掉商品                      剩下的数量
					$.post("http://localhost:8080/YGame/reduceMyProductNum",{"id":id,"num":goodsnum-num},function(data){
						if( data == 1){
							functionJH.messapgepop("购买成功");
							setTimeout(function(){
								location.reload();
							},1000)
						}else{
							functionJH.messapgepop("购买失败");
							setTimeout(function(){
								location.reload();
							},1000)
						}
					})		
				}			
			});			
	});
	
	//点击收藏
	$(".btn_collection").click(function(){
		//判断是否登录不登录不能收藏 
		var loginid = $(".login-yn")[0].innerHTML;
		if( loginid == null || loginid == "" ){
			$(".loginbar a")[0].click();
		}else{
			// 获取产品id
			var id = window.location.href.split("=")[1];
			//获取买家id  也就是我的id
			var loginid = $(".login-yn")[0].innerHTML;
			$.post("http://localhost:8080/YGame/addCollection",{"id":id,"loginid":loginid},function(data){
				if( data == 1 ){
					functionJH.messapgepop("收藏成功");
				}else{
					functionJH.messapgepop("已经收藏过了");
				}
			})	
		}	
	});
})


var functionJH = {
	//消息提示函数
	messapgepop:function(data){
		$(".message-txt")[0].innerHTML = data;
		$(".messagepop")[0].style.display = "block";
		setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
	},
	productinfo:function(){
		//查询产品详情
		var backToPreUrl=window.location.href.split("=")[1];
		$.post("http://localhost:8080/YGame/selectProductXq",{"id":backToPreUrl},function(data){
			$.post("http://localhost:8080/YGame/selectUserInfo",{"userid":data.userID},function(data2){
				$(".userinfo-img img")[0].src = data2.image;
				$(".userinfo-name")[0].innerHTML = data2.nicheng;
				$(".jy-success")[0].innerHTML = "成交订单：" + data2.saleNum;
				$(".jy-cansel")[0].innerHTML = "取消订单：" + data2.cansleNum;
				var temp = (data2.saleNum / (data2.saleNum +data2.cansleNum));
				$(".jy-gailu")[0].innerHTML = "成交概率：" + ( temp.toFixed(2) * 100) + "%";
				var n = (data2.saleNum / (data2.saleNum +data2.cansleNum)) * 5
				$(".userinfo-xinyu ul").each(function(){
				     $(this).find("li").each(function(i){
				       if(i < n-1)
				         $(this).addClass("starlight");
				    });
				  });	
			})
			//console.log(data);
			//判断是不是自己的产品 自己的产品不能操作
			if( $(".login-yn")[0].innerHTML == data.userID ){
				$("#btn_buy").attr("disabled","ture");
				$("#btn_collection").attr("disabled","ture");	
			}
			////若数量为0也不能买 并提示正在交易中 请稍后购买
			if( data.goodsNumber == 0 ){
				$(".inTrade")[0].style.display = "block";
				$("#btn_buy").attr("disabled","ture");
				$("#btn_collection").attr("disabled","ture");	
			}
			if( data.length == 0 ){ 
				$(".zt-productinfo").empty();
				var parent = $(".zt-productinfo")[0];
				var div = document.createElement("div");
				div.setAttribute("class","NOINFO");
				div.innerHTML = "商品已售空";
				parent.appendChild(div);
				return false;
			}
			$("#product-disimg").attr("src",data.goodsImage1);
			$(".display-big")[0].setAttribute("data-value",data.userID);
			$(".productxq_name")[0].innerHTML=data.goodsName;
			$(".productxq_JS")[0].innerHTML=data.goodsJieShao;
			$(".productxq_price")[0].innerHTML= "现价：￥"+data.goodsPrice;
			$(".productxq_price").attr("data-value",data.goodsPrice);
			$(".productxq_number span")[0].innerHTML=data.goodsNumber;
			$(".productxq_type")[0].innerHTML=data.gameType1+"-"+data.gameType2;
			if( data.gamept == "" || data.gamept == null){
				$(".pt-dq-fwq")[0].innerHTML=data.gamedq+"/"+data.gamefwq;
			}else{
				$(".pt-dq-fwq")[0].innerHTML=data.gamept+"/"+data.gamedq+"/"+data.gamefwq;
			}
			
			
			//导航栏
			$(".web-dh").append(
			`
				<a style="padding-left:0 8px;" href="./index">首页</a>
				>>
	            <a style="padding-left:0 8px;" href="productlist?id=${data.goodsName}">${data.gameType1}</a>
				>>
				<a style="padding-left:0 8px;">${data.gameType2}</a>
			`
			)
			//其他图片添加小的预览图  
			if( data.goodsImage2 != null && data.goodsImage2 != ""){
				$(".samll-yl-img ul").append(`<li class="content-img-list-item"><img src="${data.goodsImage2}" alt=""></li>`);
			}
			if( data.goodsImage3 != null && data.goodsImage2 != ""){
				$(".samll-yl-img ul").append(`<li class="content-img-list-item"><img src="${data.goodsImage3}" alt=""></li>`);
			}
			if( data.goodsImage4 != null && data.goodsImage4 != ""){
				$(".samll-yl-img ul").append(`<li class="content-img-list-item"><img src="${data.goodsImage4}" alt=""></li>`);
			}
			if( data.goodsImage5 != null && data.goodsImage2 != ""){
				$(".samll-yl-img ul").append(`<li class="content-img-list-item"><img src="${data.goodsImage5}" alt=""></li>`);
			}
		});
		
	},
	
	
	
}













































