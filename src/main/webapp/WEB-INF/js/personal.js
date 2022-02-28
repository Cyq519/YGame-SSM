/**
 * 
 */
$(function(){
	
	//修改个人信息
	$("#personal_xiugai").click(function(){
		var formd = new FormData($('#personalinfo_form')[0]);
		var path = $(".personal_name_img img")[0].src;
		formd.append("nowimg",path)
		for (var key of formd.keys()) {
        	console.log("key:" + key + " value:" + formd.get(key));
        }
		//判断是否上传了照片
		/** var temp = $(".changetx")[0].files.length;
		if( temp == 0 ){
			var path = $(".personal_name_img img")[0].src;
			var src = "."+path.substr(27);
			formd.set("tximage",src);
		}*/
        $.ajax({
			url:"http://localhost:8080/YGame/updatauserinfo",
			type:"post",
			data:formd,
			dataType:"JSON",
			cache:false,
			processData:false,
			contentType:false,
			success:function(data){
			 	location.reload();
			}
		
		});
	})
	//更换头像时预览
	$(".changetx").change(function(){
		//获取上传的图片
		var file = $(".changetx").get(0).files[0];
		//创建用来读取此文件的对象
		var reader = new FileReader();
		//使用该对象读取file文件
		reader.readAsDataURL(file);
		//读取文件成功后执行函数
		//读取成功后返回一个参数e
		reader.onload=function(e){
			//console.log(e.target.result);
			//选择要显示的img e中target result里面的base64位编码格式的地址
			$(".puser-img")[0].src=e.target.result;
		}
	})

	
})