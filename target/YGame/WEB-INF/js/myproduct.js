/**
 * 
 */
$(function(){
	
	var myid = decodeURI(window.location.href.split("=")[1]);
	selectMyProduct(myid,1);
	
	//搜索产品信息
	function selectMyProduct(myid,pxfs){
		$(".goodslist").empty();
		$.post("http://localhost:8080/YGame/selectMyProduct",{"myid":myid,"pxfs":pxfs},function(data){
			chulidata(data);
		});
		
	};
	
	function chulidata(data){
		$(".goodslist").empty();
		console.log(data);

		$(".xxfl-r em")[0].innerHTML = data.length;
		if( data.length == 0 ){
			var parent = $(".goodslist")[0];
			var div = document.createElement("div");
			div.setAttribute("class","NOINFO");
			div.innerHTML = "暂无相关信息";
			parent.appendChild(div);
			return false;	
		}else{
			var parent = $(".goodslist").eq(0);
			for( var i = 0; i<data.length; i++){
				var goodszt;
				if( data[i].goodszt == 1){
					goodszt = "下架";
				}else{
					goodszt = "上架";
				}
	
				parent.append( `
				 <div class="list-item" style="display: none;">
					<div class="list-item-box">
						<div class="part-01">
							<div class="img-box">
								<a href="./productxq?id=${data[i].id}">
									<img src="${data[i].goodsImage1 }">
								</a>
							</div>
							<div class="txt-box">
								<h2>
									<a href="./productxq?id=${data[i].id}">
										<span>
											${data[i].goodsJieShao}
										</span>
									</a>
								</h2>
								<h4>
									<i>
										游戏区服:
									</i>
									<span>
										${data[i].gamept}/${data[i].gamedq}/${data[i].gamefwq}
									</span>
								</h4>
								<h4>
									<i>
										游戏类型:
									</i>
									<span>
										${data[i].gameType1}-${data[i].gameType2}
									</span>
								</h4>
								<h4>
									<i>
										商品数量:
									</i>
									<span>
										${data[i].goodsNumber}
									</span>
								</h4>
							</div>
						</div>
						<div class="part-02">
							<h5>售价：¥ ${data[i].goodsPrice }</h5>
						</div>
						<div class="part-03">
							<h5>
								<a href="./productxq?id=${data[i].id}" class="list-btn" target="_blank">查看商品</a>
							</h5>
							<h5>
								<a href="./productModify?id=${data[i].id}" class="list-btn" target="_blank">修改商品</a>
							</h5>
							<h5>
								<a class="list-btn " target="_blank" data-value="${data[i].id}" onclick="delete_click(this)">删除商品</a>
							</h5>
							<h5>
								<a class="list-btn " target="_blank" data-value="${data[i].id}" onclick="goodsZT(this)">
									${ goodszt }
								</a>
							</h5>
						</div>
					</div>
				</div>
				`
				)
			}
			 
		}
		csh();	
	}
	cshGameType();
	//初始化游戏类型
	function cshGameType(){
	 $.post("http://localhost:8080/YGame/selectMyProductType",{"myid":myid},function(data){
	 	for( var i = 0;i < data.length; i++){
			$(".xxfl-gametype1").append("<option>"+data[i]+"</option>");
		}	
	 })
	}
	
	//点击详细分类 进行分类筛选
	$(".xxfl-gametype1").change(function(){
		var type = $('.xxfl-gametype1 option:selected').text()
		if( type == "全部游戏" ){
			selectMyProduct(myid,1);
			return 0;
		}
		$(".xxfl-gametype2").empty();
		$.post("http://localhost:8080/YGame/JZSelect2",{SDL:type},function(data){
			$(".xxfl-gametype2").append("<option>"+"请选择"+"</option>");
			for( var i = 0;i < data.length; i++){
				$(".xxfl-gametype2").append("<option>"+data[i]+"</option>");
			}		

		});
		$.post("http://localhost:8080/YGame/selectMyByGameType1",{"type":type,"myid":myid},function(data){
			chulidata(data);
		})
	})
	$(".xxfl-gametype2").change(function(){
		var type = $('.xxfl-gametype1 option:selected').text()
		var type2 = $('.xxfl-gametype2 option:selected').text()
		if( type2 == "请选择" ){
			return 0;
		}
		$.post("http://localhost:8080/YGame/selectMyByGameType2",{"type":type,"type2":type2,"myid":myid},function(data){
			//console.log(data);
			chulidata(data);
		})
	})
	
	
	//点击切换排序方式
	$(".myproduct-zt-dh .r").on("click","li",function(){
		$(this).addClass("select-dh").siblings("li").removeClass("select-dh");
		var temp = $(this).attr("data-value");
		if( temp == 1 ){
			$(this).attr("data-value","2");
			$(this)[0].innerHTML = "时间升序";
			temp = 2;
		}
		else if( temp == 2 ){
			$(this).attr("data-value","1");
			$(this)[0].innerHTML = "时间降序";
			temp = 1;
		}
		else if( temp == 3 ){
			$(this).attr("data-value","4");
			$(this)[0].innerHTML = "价格降序";
			temp = 3;
		}
		else if( temp == 4 ){
			$(this).attr("data-value","3");
			$(this)[0].innerHTML = "价格升序";
			temp = 4;
		}
		selectMyProduct(myid,temp);
		csh();
	})
	
	
})

function delete_click(obj){
	var value = $(obj).attr("data-value");
	$.post("http://localhost:8080/YGame/deleteMyProduct",{"id":value},function(data){
		if( data == 1){
			messapgepop("删除成功");
			location.reload();
		}else{
			messapgepop("删除失败");
		}
	})
}
//改变上架下架状态
function goodsZT(obj){
	var state = $(obj)[0].innerHTML;
	var value = $(obj).attr("data-value");
	$.post("http://localhost:8080/YGame/changeProductState",{"state":state,"id":value},function(data){
		if( data == 1){
			if( state == "上架" ){
				$(obj)[0].innerHTML = "下架";
			}else{
				$(obj)[0].innerHTML = "上架";
			}
			//location.reload();
		}else{
			messapgepop("修改失败");
		}
	})
}
//消息提示函数
function messapgepop(data){
	$(".message-txt")[0].innerHTML = data;
	$(".messagepop")[0].style.display = "block";
	setTimeout(function(){$(".messagepop")[0].style.display = "none"},2000);
}









