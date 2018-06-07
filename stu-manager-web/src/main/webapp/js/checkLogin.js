var StuManager = {
	checkLogin : function(){
		var token = $.cookie("token");
		if(!token){
			$("#div_login").show(500);
			return ;
		}
		$.ajax({
			url : "http://localhost:8085/user/token/" + token + ".action",
			dataType : "jsonp",
			type : "GET",
			success : function(data){
				if(data.status == 200){
					var username = data.data.username;
					var headPic = data.data.headpic;
					//alert("欢迎您：" + username);
					
					$("#img_headPic").attr("src",headPic);
					$("#span_username").text(username);
					$("#div_user").show();
				}
				else{
					$("#div_login").show(500);
				}
			}
		});
	}
}

//登录，传递当前页面的url
$("#toLoginPage").click(function(){
	//获取当前的url
	var redirect = window.location.href;
	//获取登录页的url
	var loginUrl = $("#loginPageUrl").val();
	location.href = loginUrl + "?redirectUrl=" + redirect;
});

//退出
$("#loginOut").click(function(){
	//清空cookie
	//$.cookie('token', '', { expires: -1 }); // 删除 cookie
	//获取当前的url
	var redirect = window.location.href;
	//获取退出登录的url
	var loginOutUrl = $("#loginOutUrl").val();
	//跳转
	location.href = loginOutUrl + "?redirectUrl=" + redirect;
});


$(function(){
	// 查看是否已经登录，如果已经登录查询登录信息
	StuManager.checkLogin();
});