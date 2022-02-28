/**
 * 
 */
$(function(){
	
	var loginid = $(".login-yn")[0].innerHTML;
	if( loginid == null || loginid == "" ){
		window.location.href = "http://localhost:8080/YGame/";
	}
})