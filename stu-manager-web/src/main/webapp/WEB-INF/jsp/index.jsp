<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>欢迎使用学生管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">

<!-- <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.singlePageNav.min.js"></script>


<style type="text/css">
h3{
	font-size:20px;
	font-weight: bold;
}
</style>
</head>
<body>
<jsp:include page="top-index.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/checkLogin.js"></script>

<script type="text/javascript">

/*1、 //导航跳转效果插件
$(".nav").singlePageNav({
	offset:60
});
	 //小屏幕导航点击关闭菜单
$('.navbar-collapse a').click(function(){
    $('.navbar-collapse').collapse('hide');
}); */

//2、初始化WOW
new WOW().init();
</script>
	
<!-- 轮播图 -->
<div class="container wow fadeInUp" style="margin-top: 65px;" data-wow-duration="0.7s">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li style="color: rgg(255,0,0);" data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  </ol>
	
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img class="carousel-inner img-responsive img-rounded" src="../images/banner1.jpg" alt="...">
	      <div class="carousel-caption">
	      </div>
	    </div>
	    <div class="item">
	      <img  class="carousel-inner img-responsive img-rounded" src="../images/banner2.jpg" alt="...">
	      <div class="carousel-caption">
	      </div>
	    </div>
	    <div class="item">
	      <img class="carousel-inner img-responsive img-rounded" src="../images/banner3.jpg" alt="...">
	      <div class="carousel-caption">
	      </div>
	    </div>
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
</div><!-- 轮播图 -->
<br/>

<!-- 栏目 -->
<div class="container">
	<div class="row">
	
		<!-- 饼图 -->
		<div class="col-sm-6 col-md-4 col-xs-12 wow fadeIn" style="margin-bottom: 15px;">
	    	<div id="main" style="width: 100%;height: 300%;"></div>
	 	</div>
	 	<script type="text/javascript">
			//3、饼图
			var myCharts = echarts.init(document.getElementById('main'));
			var option = {
					 backgroundColor: '#dfdfdf',	//背景
					 series : [
					           {
					               name: '访问来源',
					               type: 'pie',
					               radius: '48%',
					               data:[
										{value:235, name:'体育'},
										{value:274, name:'数字媒体'},
										{value:310, name:'物理与光电'},
										{value:335, name:'经济管理'},
										{value:400, name:'计算机工程'}
					               ],
					           		
					               roseType: 'angle',	//1.凹凸
					               
					               itemStyle: {			//2.阴影
					            	    
					            	    emphasis: {	//3.鼠标悬停突出阴影
					            	        shadowBlur: 200,
					            	        shadowColor: 'rgba(0, 0, 0, 0.5)'
					            	    }
					            	}
					           }
					       ]
				};
			//设置Option
			myCharts.setOption(option);
			//饼图响应式
			$(window).resize(function(){
				myCharts.resize();
			});
	 	</script>
	
	  	<div id="dept" class="col-sm-6 col-md-4 col-xs-6 wow fadeInLeft">
	    	<div class="thumbnail">
		      <img src="../images/banner1.jpg" alt="...">
		      <div class="caption">
		        <h3>院系管理</h3>
		        <p>添加,修改院系信息</p>
		        <p align="right">
			        <a href="/dept/deptList.html" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	 	
	  	<div id="spe" class="col-sm-6 col-md-4 col-xs-6 wow fadeInRight">
	    	<div class="thumbnail">
		      <img src="../images/banner3.jpg" alt="...">
		      <div class="caption">
		        <h3>专业管理</h3>
		        <p>查看,修改专业信息</p>
		        <p  align="right">
			        <a href="/spe/spetList.html" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	  	<div id="stuList" class="col-sm-6 col-md-4 col-xs-6 wow fadeInUp">
	    	<div class="thumbnail">
		      <img src="../images/banner2.jpg" alt="...">
		      <div class="caption">
		        <h3>学生列表</h3>
		        <p>修改头像,条件查询</p>
		        <p  align="right">
			        <a href="/stu/stuList.html" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	  	<div id="addStu" class="col-sm-6 col-md-4 col-xs-6 wow fadeInDown">
	    	<div class="thumbnail">
		      <img src="../images/banner1.jpg" alt="...">
		      <div class="caption">
		        <h3>录入学生</h3>
		        <p>添加学生,上传头像</p>
		        <p  align="right">
			        <a href="/stu/addStuPage.html" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	  	<div id="backMg" class="col-sm-6 col-md-4 col-xs-12 wow bounceInLeft">
	    	<div class="thumbnail">
		      <img src="../images/banner2.jpg" alt="...">
		      <div class="caption">
		        <h3>后台管理</h3>
		        <p>人数统计,用户访问</p>
		        <p  align="right">
		        	<a href="${backUrl}" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	 	
	 	
	 	<div id="login" class="col-sm-6 col-md-4 col-xs-6 wow fadeInDown">
	    	<div class="thumbnail">
		      <img src="../images/banner1.jpg" alt="...">
		      <div class="caption">
		        <h3>登录</h3>
		        <p>跳转到登录页面</p>
		        <p  align="right">
			        <a href="${loginUrl}/" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	 	
	 	<div id="regist" class="col-sm-6 col-md-4 col-xs-6 wow fadeInUp">
	    	<div class="thumbnail">
		      <img src="../images/banner3.jpg" alt="...">
		      <div class="caption">
		        <h3>注册</h3>
		        <p>跳转到登录页面注册</p>
		        <p  align="right">
			        <a href="${loginUrl}/page/regist.html" class="btn btn-primary" role="button">Come On</a> 
		        </p>
	    	  </div>
	   		</div>
	 	</div>
	 	
	</div>
</div>
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

</script>
</html>