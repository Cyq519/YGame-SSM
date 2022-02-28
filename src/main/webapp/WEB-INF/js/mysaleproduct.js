/**
 * 
 */
$(function(){
	selectMyProducts(myid,cstemp);

})
var myid = decodeURI(window.location.href.split("=")[1]);
var cstemp = $(".select-dh").attr("data-value");
//点击导航栏 通过添加class改变选中标签样式 并更新数据
$(".myproduct-zt-dh .r").on("click","li",function(){
	$(this).addClass("select-dh").siblings("li").removeClass("select-dh");
	var temp = $(this).attr("data-value");
	selectMyProducts(myid,temp);
})
//搜索产品信息
	function selectMyProducts(myid,temp){
	
		$(".goodslist").empty();
		$.post("http://localhost:8080/YGame/mySaleProductInfo",{"myid":myid},function(data){
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
					i04.innerHTML = "买家昵称:" + data[i].customerName;
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
					//part2 end
					
					
					//设置part3 start
					var part3 = document.createElement("div");
					part3.setAttribute("class","part-03");
					div2.appendChild(part3);
					if( temp == 1 ){
						var h51 = document.createElement("h5");
						part3.appendChild(h51);
						h51.innerHTML = "等待买家付款";
					
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
					}
					if( temp == 2 ){
						var h504 = document.createElement("h5");
						part3.appendChild(h504);
						h504.innerHTML = "等待确认收货";
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
						
						if( data[i].refund == 2 ){
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.appendChild(a31);
							a31.setAttribute("class","list-btn ");
							a31.setAttribute("target","_blank");
							a31.setAttribute("data-value",data[i].id);
							a31.setAttribute("data-values",data[i].ddId);
							a31.innerHTML = "买家请求退款";
							a31.setAttribute("onclick","qqtk_click(this)");
						}
						if( data[i].refund == 3 ){
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.innerHTML = "已同意退款";
						}
						if( data[i].refund == 4 ){
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.innerHTML = "已拒绝退款";
						}
		
					}
					//
					if( temp == 4 ){				
						
						if( data[i].refund == 2 ){
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.appendChild(a31);
							a31.setAttribute("class","list-btn ");
							a31.setAttribute("target","_blank");
							a31.setAttribute("data-value",data[i].id);
							a31.setAttribute("data-values",data[i].ddId);
							a31.innerHTML = "买家请求退款";
							a31.setAttribute("onclick","qqtk_click(this)");
						}
						if( data[i].refund == 3 ){
							
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.innerHTML = "已同意退款";
							
						}
						if( data[i].refund == 4 ){
							var h51 = document.createElement("h5");
							var a31 = document.createElement("a");
							part3.appendChild(h51);
							h51.innerHTML = "已拒绝退款";
						}
					}
				}
			}
			csh();
		});
	};
//删除订单
function delete_click(obj){
	var value = $(obj).attr("data-value");
	$.post("http://localhost:8080/YGame/deleteMySaleProductInfo",{"id":value},function(data){
		if( data == 1){
			messapgepop("删除订单成功");
		}else{
			messapgepop("删除订单失败");
		}
		$(".myproduct-zt-dh .r li")[3].click();
	})
}
//消息提示函数
function messapgepop(data){
	$(".message-txt")[0].innerHTML = data;
	$(".messagepop")[0].style.display = "block";
	setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
}

//请求退款
var ddid;
function qqtk_click(obj){
	var ddid = $(obj).attr("data-values");
	$.post("http://localhost:8080/YGame/selectDDById",{"ddid":ddid},function(data){
		console.log(data)
		$("#refund-tips")[0].innerHTML = "退款原因："+data.reasonbq;
		$("#refund-reason")[0].innerHTML = "详细说明："+data.reasontip;
		$(".handleRefund")[0].style.display = "block";
		//关闭处理窗口
		$(".close").click(function(){
			$(".handleRefund")[0].style.display = "none";
		});
		//同意退款
		$(".agreeRefund").click(function(){
			$.post("http://localhost:8080/YGame/agreeRefund",{"ddId":data.ddId,"myid":myid},function(){
				$(".myproduct-zt-dh .r li")[3].click();
				$(".handleRefund")[0].style.display = "none";
			})
		});
		//拒绝退款
		$(".refuseRefund").click(function(){
			$.post("http://localhost:8080/YGame/refuseRefund",{"ddId":data.ddId},function(){
				$(".myproduct-zt-dh .r li")[3].click();
				$(".handleRefund")[0].style.display = "none";
			})
		});
	});
}
//取消订单  先把交易表中信息删掉 然后根据goodsid 货物数量+对应购买的数量
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







