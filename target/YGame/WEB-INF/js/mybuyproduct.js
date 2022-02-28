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
	
	var cstemp = $(".select-dh").attr("data-value");
	//点击导航栏 通过添加class改变选中标签样式 并更新数据
	$(".myproduct-zt-dh .r").on("click","li",function(){
		$(this).addClass("select-dh").siblings("li").removeClass("select-dh");
		cstemp = $(this).attr("data-value");
		var pxfs = $(".pxfs-select").attr("data-value");
		selectMyProduct(myid,cstemp,pxfs);
	})
	
	var myid = decodeURI(window.location.href.split("=")[1]);
	var dh_select = window.localStorage.getItem("dh-select");
	// console.log(dh_select);
	if( dh_select == 1 ){
		$("asd").trigger("click");
		$(".myproduct-zt-dh .r li")[1].click();
	}else{
		selectMyProduct(myid,cstemp,1);
	}
	
	cshtypeList();
	//点击切换分类时 更新产品列表
	$(".xxfl-gametype1").change(function(){
		var type = $(".xxfl-gametype1 option:selected").text();
		var pxfs = $(".pxfs-select").attr("data-value");
		if ( type == "全部分类" ){
			selectMyProduct(myid,cstemp,pxfs);
		}else{
			$(".goodslist").empty();
			$.post("http://localhost:8080/YGame/mybuyByGoodsType",{"myid":myid,"type":type,"pxfs":pxfs},function(data){
				CLdata(data,cstemp);
			})
		}
	})
	//点击排序方式 切换样式并更新产品列表
	$(".mybuy-pxfs").click(function(){
		$(this).addClass("pxfs-select").siblings(".mybuy-pxfs").removeClass("pxfs-select");
		var pxfs = $(this).attr("data-value");
		var type = $('.xxfl-gametype1 option:selected').text();
		if ( type == "全部分类" ){	
			selectMyProduct(myid,cstemp,pxfs);
		}else{
			$(".goodslist").empty();
			$.post("http://localhost:8080/YGame/mybuyByGoodsType",{"myid":myid,"type":type,"pxfs":pxfs},function(data){
				CLdata(data,cstemp);
			})
		}
	
	})
	
	//搜索产品信息 默认页显示已完成订单
	function selectMyProduct(myid,temp,pxfs){
		$(".goodslist").empty();
		$.post("http://localhost:8080/YGame/myBuyProductInfo",{"myid":myid,"pxfs":pxfs},function(data){
			CLdata(data,temp);
		});
	};
	
	function CLdata(data,temp){
		$(".xxfl-r em")[0].innerHTML = data.length;
		//循环遍历
		console.log(data);
		if( data.length == 0 ){
			var parent = $(".goodslist")[0];
			var div = document.createElement("div");
			div.setAttribute("class","NOINFO");
			div.innerHTML = "暂无相关信息";
			parent.appendChild(div);
			return false;	
		}else{
			for( var i = 0; i<data.length; i++){
				if( temp != 4 ){
					if( data[i].state != temp ){
						continue;
					}
				}else{
					if( data[i].state != 3 || data[i].refund != 2 ){
						continue;
					}
				}	
				
				//动态添加商品列表
				//获取父元素
				var parent = $(".goodslist")[0];
				//创建div 并设置class
				var div1 = document.createElement("div");
				div1.setAttribute("class","list-item");
				div1.style.display = "none";
				//创建div 并设置class
				var div2 = document.createElement("div");
				div2.setAttribute("class","list-item-box");
				//添加到父元素中
				parent.appendChild(div1);
				div1.appendChild(div2);

				//设置part1
				//创建part1的div
				var part1 = document.createElement("div");
				part1.setAttribute("class","part-01");
				//添加到父元素中
				div2.appendChild(part1);
				//part1中 图片盒子
				var div01 = document.createElement("div");
				div01.setAttribute("class","img-box");
				//part1中 文字盒子
				var div001 = document.createElement("div");
				div001.setAttribute("class","txt-box");
				//添加到父元素中
				part1.appendChild(div01);
				part1.appendChild(div001);

				var a01 = document.createElement("a");
				var img01= document.createElement("img");
				img01.setAttribute("src",data[i].goodsImage1);
				a01.appendChild(img01);
				div01.appendChild(a01);
				//结束imgbox
				
				//设置txtbox中内容 start
				//设置标题
				var h01= document.createElement("h2");
				var span01 = document.createElement("span");
				span01.innerHTML = data[i].goodsJieShao;
				var a001 = document.createElement("a");
				a001.appendChild(span01);
				h01.appendChild(a001);
				div001.appendChild(h01);
				//游戏区服
				var h401 = document.createElement("h4");
				var i01 = document.createElement("i");
				i01.innerHTML = "游戏区服:" + data[i].gameServer;
				h401.appendChild(i01);
				div001.appendChild(h401);
				//游戏类型
				var h02 = document.createElement("h4");
				var i02 = document.createElement("i");
				var span03 = document.createElement("span");
				i02.innerHTML = "游戏类型:"+ data[i].goodsType;
				h02.appendChild(i02);
				div001.appendChild(h02);
				//卖家名称
				var h04 = document.createElement("h4");
				var i04 = document.createElement("i");
				i04.innerHTML = "卖家昵称:" + data[i].sellerName;
				h04.appendChild(i04);
				div001.appendChild(h04);
				//txtbox  end	
				
				//设置part2		start						
				var part2 = document.createElement("div");
				part2.setAttribute("class","part-02");
				div2.appendChild(part2);
				//商品数量
				var h21 = document.createElement("h4");
				h21.innerHTML = "购买数量:" 
				span21 = document.createElement("span");
				span21.innerHTML = data[i].buynumber;
				span21.setAttribute("class","part-02-buynum");
				h21.appendChild(span21);
				part2.appendChild(h21);
				//设置价格
				var h5 = document.createElement("h5");
				part2.appendChild(h5);
				h5.innerHTML = "总价：¥"+data[i].goodsPrice;
				//设置价格
				//购买时间
				var h31 = document.createElement("h4");
				h31.innerHTML = data[i].buyTime.split(".")[0];
				part2.appendChild(h31);
				//part2 end
				
				
				//设置part3 start
				var part3 = document.createElement("div");
				part3.setAttribute("class","part-03");
				div2.appendChild(part3);
				if( temp == 1 ){
					var h504 = document.createElement("h5");
					var part3a3 = document.createElement("a");
					part3.appendChild(h504);
					h504.appendChild(part3a3);
					part3a3.setAttribute("class","list-btn ");
					part3a3.setAttribute("target","_blank");
					part3a3.setAttribute("data-value",data[i].goodsId);
					part3a3.setAttribute("onclick","qxdd_click(this)");
					part3a3.setAttribute("data-values",data[i].ddId);
					part3a3.innerHTML = "取消订单";
					
					var h51 = document.createElement("h5");
					var a31 = document.createElement("a");
					part3.appendChild(h51);
					h51.appendChild(a31);
					a31.setAttribute("class","list-btn ");
					a31.setAttribute("target","_blank");
					a31.setAttribute("data-value",data[i].ddId);
					a31.setAttribute("onclick","lkfk_click(this)");
					a31.innerHTML = "立刻付款";
				}
				if( temp == 2 ){
					var h504 = document.createElement("h5");
					var part3a3 = document.createElement("a");
					part3.appendChild(h504);
					h504.appendChild(part3a3);
					part3a3.setAttribute("class","list-btn ");
					part3a3.setAttribute("target","_blank");
					part3a3.setAttribute("data-value",data[i].id);
					part3a3.setAttribute("id-value",data[i].customerId);
					part3a3.setAttribute("user-value",data[i].sellerId);
					part3a3.setAttribute("data-values",data[i].ddId);
					part3a3.setAttribute("onclick","qrsh_click(this)");
					part3a3.innerHTML = "确认收货";
				} 
				if( temp == 3 ){					
					var h504 = document.createElement("h5");
					var part3a3 = document.createElement("a");
					part3.appendChild(h504);
					h504.appendChild(part3a3);
					part3a3.setAttribute("class","list-btn ");
					part3a3.setAttribute("target","_blank");
					part3a3.setAttribute("data-value",data[i].id);
					part3a3.setAttribute("onclick","delete_click(this)");
					part3a3.innerHTML = "删除订单";
					
					if( data[i].refund == 1 ){
						var h51 = document.createElement("h5");
						var a31 = document.createElement("a");
						part3.appendChild(h51);
						h51.appendChild(a31);
						a31.setAttribute("class","list-btn ");
						a31.setAttribute("target","_blank");
						a31.setAttribute("data-value",data[i].id);
						a31.setAttribute("data-values",data[i].ddId);
						a31.setAttribute("onclick","sqtk_click(this)");
						a31.innerHTML = "申请退款";
					}
					if( data[i].refund == 2 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "申请退款中";
					}
					if( data[i].refund == 3 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "退款成功";
					}
					if( data[i].refund == 4 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "商家拒绝退款";
					}
				}
				if( temp == 4 ){				
					
					if( data[i].refund == 2 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "申请退款中";
					}
					if( data[i].refund == 3 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "已退款";
					}
					if( data[i].refund == 4 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);					
						h51.innerHTML = "决绝退款";
					}
				}
			}
		}
		csh();
	}
	
	
	
	
})
//初始化 加载分类列表
function cshtypeList(){
	var myid = decodeURI(window.location.href.split("=")[1]);
	//$(".xxfl-gametype1").append("<option>"+"全部分类"+"</option>");
	$.post("http://localhost:8080/YGame/selectTypeByJY",{"myid":myid},function(data){
		for( var i = 0;i < data.length; i++){
			$(".xxfl-gametype1").append("<option>"+data[i]+"</option>");
		}	
	});
}

var ddid;
//申请退款
function sqtk_click(obj){
	ddid = $(obj).attr("data-values");
	$(".tuikuan-resaon")[0].style.display = "block";
}
//取消退款
$(".quxiaotuikuan").click(function(){
	$(".tuikuan-resaon")[0].style.display = "none";
})
//确认退款
$(".querentuikuan").click(function(){
	var type = $(".reasonbq").val();
	var reason = $(".reason")[0].value;
	
	$.post("http://localhost:8080/YGame/applyRrefund",{"ddid":ddid,"type":type,"reason":reason},function(data){
		messapgepop("申请成功");
		$(".myproduct-zt-dh .r li")[0].click();
	});
	$(".tuikuan-resaon")[0].style.display = "none";
})




//确认收货
function qrsh_click(obj){
	var ddid = $(obj).attr("data-values");
	var userid = $(obj).attr("user-value");
	var myid = $(obj).attr("id-value");
	$.post("http://localhost:8080/YGame/confirmReceipt",{"ddid":ddid,"userid":userid,"myid":myid},function(data){
		messapgepop("收货成功");
		$(".myproduct-zt-dh .r li")[3].click();
	});
}
//点击付款
var ddid;
function lkfk_click(obj){
	//判断是否登录不登录不能购买 
	var loginid = $(".login-yn")[0].innerHTML;
	if( loginid == null || loginid == "" ){
		$(".loginbar a")[0].click();
	}else{
		//获取对应订单的编号id
		ddid = $(obj).attr("data-value");
		var myid = decodeURI(window.location.href.split("=")[1]);
		$.post("http://localhost:8080/YGame/myBuyProductInfo",{"myid":myid,"pxfs":"1"},function(data){
			for( var i = 0 ; i < data.length ;i++ ){
				if( data[i].ddId == ddid ){
					
					$(".dd-productname")[0].innerHTML = "商品："+data[i].goodsName;
					$(".dd-productnum")[0].innerHTML = "购买数量："+data[i].buynumber;
					$(".dd-productprice")[0].innerHTML = "单价：￥"+data[i].goodsPrice;
					$(".dd-totalprice")[0].innerHTML = "总价：￥"+data[i].totalPrice;
					$(".dd-imgdisplay img")[0].src = data[i].goodsImage1;
				}
			}
			$(".pay-page")[0].style.display = "block";
		});	
	}
}
//取消支付
$(".dd-quxiao").click(function(){
	$(".pay-page")[0].style.display = "none";
});
//确定支付
$(".dd-pay").click(function(){
	$.post("http://localhost:8080/YGame/updateMyBuyProductInfo",{"ddid":ddid},function(data){
		if( data == 1 ){
			messapgepop("支付成功");
		}
		else{
			messapgepop("支付失败");
		}
		$(".myproduct-zt-dh .r li")[2].click();
		$(".pay-page")[0].style.display = "none";
	});
});
//删除订单
function delete_click(obj){
	var value = $(obj).attr("data-value");
	$.post("http://localhost:8080/YGame/deleteMyBuyProductInfo",{"id":value},function(data){
		if( data == 1){
			messapgepop("删除成功");
		}else{
			messapgepop("删除失败");
		}
		$(".myproduct-zt-dh .r li")[3].click();
	})
}

//取消订单  先把交易表中信息删掉 然后根据goodsid 货物数量+1
function qxdd_click(obj){
	var buynum = $(".part-02-buynum")[0].innerHTML;
	var goodsid = $(obj).attr("data-value");
	var	ddid =  $(obj).attr("data-values");
	$.post("http://localhost:8080/YGame/cancelOrder",{"ddid":ddid,"goodsid":goodsid,"buynum":buynum},function(data){
		if( data == 1){
			messapgepop("取消订单成功");
		}else{
			messapgepop("取消订单失败");
		}
		$(".myproduct-zt-dh .r li")[1].click();
	})
}
//消息提示函数
function messapgepop(data){
	$(".message-txt")[0].innerHTML = data;
	$(".messagepop")[0].style.display = "block";
	setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
}









