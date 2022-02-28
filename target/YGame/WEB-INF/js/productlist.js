/**
 * 
 */
$(function(){

	//打开页面 自动加载游戏的分类、产品列表等信息
	selectgameproduct();	
	function selectgameproduct(num){
		var gamename=decodeURI(window.location.href.split("=")[1]);
		$(".game-logo img").attr("alt",gamename);
		
		$.ajax({
			url:"http://localhost:8080/YGame/selectgameinfo",
			type:"post",
			data:{"gamename":gamename},
			success:function(data){
				//if( data.length == 0){
				//	var s = $(".game-logo img").attr("src","./image/hot-icon.png");
				//}
				var s = $(".game-logo img").attr("src",data[0]);
			}	
		});
		$.ajax({
			async:false,
			url:"http://localhost:8080/YGame/selectgameinfo2",
			type:"post",
			data:{"gamename":gamename},
			success:function(data){
				//循环遍历
				for( var i = 0; i < data.length;i++){
					//动态创建li标签
					var parent = $("#gametype2")[0];
					var li = document.createElement("li");
					var a = document.createElement("a");
					a.innerHTML = data[i];
					li.append(a);
					parent.append(li);
					if( i == 0 ){
						li.setAttribute("class","select");
						$("#gametype2").attr("data-value",data[i]);
					}
				}
			}
		});
		
	};
	
	//获取游戏一级分类
	var type1 = $(".game-logo img").attr("alt");
	//获取游戏二级分类
	var type2 =$(".gametype2 ul").attr("data-value");
	//打开页面时加载产品信息
	P.selectproductinfo(type1,type2,2);

	

})

var P = {
	
	
	//搜索产品信息
	selectproductinfo:function(type1,type2,sort){
		$(".goodslist").empty();
		$.post("http://localhost:8080/YGame/selectproductinfo3",{"type1":type1,"type2":type2,"sort":sort},function(data){
			//循环遍历
			//console.log(data);
			if( data.length == 0 ){
				var parent = $(".goodslist")[0];
				var div = document.createElement("div");
				div.setAttribute("class","NOINFO");
				div.innerHTML = "暂无相关信息";
				parent.appendChild(div);
				return false;
			
			}else{
				for( var i = 0; i<data.length; i++){
					//动态添加商品列表
					//获取父元素
					if( data[i].goodszt == 2 ){
						continue;
					}
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
					
					//点击图片跳转详情页 放在imgbox中
					var a01 = document.createElement("a");
					a01.setAttribute("href","./productxq?id="+data[i].id);
					//放在a01中 点击图片可跳转
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
					//点击标题跳转详情页 txtbox
					var a001 = document.createElement("a");
					a001.setAttribute("href","./productxq?id="+data[i].id);
					a001.appendChild(span01);
					h01.appendChild(a001);
					div001.appendChild(h01);
					//游戏区服
					var h401 = document.createElement("h4");
					var i01 = document.createElement("i");
					i01.innerHTML = "游戏区服:";
					var span02 = document.createElement("span");
					h401.appendChild(i01);
					h401.appendChild(span02);
					if( data[i].gamept != "null" && data[i].gamept != ""){
						span02.innerHTML = data[i].gamept+"/"+ data[i].gamedq+"/"+ data[i].gamefwq;
					}else{
						span02.innerHTML = data[i].gamedq+"/"+ data[i].gamefwq;
					}
					div001.appendChild(h401);
					//游戏类型
					var h02 = document.createElement("h4");
					var i02 = document.createElement("i");
					var span03 = document.createElement("span");
					i02.innerHTML = "游戏类型:";
					span03.innerHTML = data[i].gameType1+"-"+data[i].gameType2;
					h02.appendChild(i02);
					h02.appendChild(span03);
					div001.appendChild(h02);
					//商品数量
					var h04 = document.createElement("h4");
					var i04 = document.createElement("i");
					var span04 = document.createElement("span");
					i04.innerHTML = "商品数量:";
					span04.innerHTML = data[i].goodsNumber;
					h04.appendChild(i04);
					h04.appendChild(span04);
					div001.appendChild(h04);
					//txtbox  end
					
					//设置part2		start					
					var part2 = document.createElement("div");
					part2.setAttribute("class","part-02");
					div2.appendChild(part2);
					//设置价格
					var h5 = document.createElement("h5");
					part2.appendChild(h5);
					h5.innerHTML = "¥"+data[i].goodsPrice;
					//part2 end
					
					
					//设置part3 start
					var part3 = document.createElement("div");
					part3.setAttribute("class","part-03");
					div2.appendChild(part3);
					 
					var h502 = document.createElement("h5");
					var part3a = document.createElement("a");
					part3.appendChild(h502);
					h502.appendChild(part3a);
					part3a.setAttribute("href","./productxq?id="+data[i].id);
					part3a.setAttribute("class","list-btn");
					part3a.setAttribute("target","_blank");
					part3a.innerHTML = "查看账号";

				}
			}
			//页面显示初始化
			csh();
		});
	},
	
}