<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>欢迎使用学生管理系统</title>
</head>
<body>
	<jsp:include page="top-index.jsp"></jsp:include>
	
	<div class="container wow fadeInUp" style="margin-top: 65px;">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li style="color: rgg(255,0,0);" data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
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
		    <div class="item">
		      <img class="carousel-inner img-responsive img-rounded" src="../images/banner4.jpg" alt="...">
		      <div class="carousel-caption" style="color:rgb(255,0,0);">
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
	</div>
	<br/>
	
	<!-- 栏目 -->
	<div class="container">
		<div class="row">
		
			<!-- 饼图 -->
			<div class="col-sm-6 col-md-4 col-xs-12 wow fadeIn" style="margin-bottom: 15px;">
		    	<div id="main" style="width: 100%;height: 340%;"></div>
		 	</div>
		
		  	<div id="dept" class="col-sm-6 col-md-4 col-xs-12 wow bounceInLeft" data-wow-delay="0.1s" data-wow-duration="1.7s">
		    	<div class="thumbnail">
			      <img src="../images/banner4.jpg" alt="...">
			      <div class="caption">
			        <h3>院系管理</h3>
			        <p>添加，修改院系信息</p>
			        <p>
				        <a href="/dept/deptList.html" class="btn btn-primary" role="button">Come On</a> 
			        </p>
		    	  </div>
		   		</div>
		 	</div>
		  	<div id="spe" class="col-sm-6 col-md-4 col-xs-12 wow bounceInRight" data-wow-duration="1.7s" data-wow-offset="60">
		    	<div class="thumbnail">
			      <img src="../images/banner3.jpg" alt="...">
			      <div class="caption">
			        <h3>专业管理</h3>
			        <p>查看,添加,修改专业信息</p>
			        <p>
				        <a href="/spe/spetList.html" class="btn btn-primary" role="button">Come On</a> 
			        </p>
		    	  </div>
		   		</div>
		 	</div>
		  	<div id="stuList" class="col-sm-6 col-md-4 col-xs-12 wow fadeInUp" data-wow-offset="60">
		    	<div class="thumbnail">
			      <img src="../images/banner2.jpg" alt="...">
			      <div class="caption">
			        <h3>学生列表</h3>
			        <p>修改头像,条件查询</p>
			        <p>
				        <a href="/stu/stuList.html" class="btn btn-primary" role="button">Come On</a> 
			        </p>
		    	  </div>
		   		</div>
		 	</div>
		  	<div id="addStu" class="col-sm-6 col-md-4 col-xs-12 wow fadeInRight" data-wow-offset="60">
		    	<div class="thumbnail">
			      <img src="../images/banner1.jpg" alt="...">
			      <div class="caption">
			        <h3>录入学生信息</h3>
			        <p>添加学生信息，上传头像</p>
			        <p>
				        <a href="/stu/addStuPage.html" class="btn btn-primary" role="button">Come On</a> 
			        </p>
		    	  </div>
		   		</div>
		 	</div>
		  	<div id="backMg" class="col-sm-6 col-md-4 col-xs-12 wow rotateIn">
		    	<div class="thumbnail">
			      <img src="../images/banner2.jpg" alt="...">
			      <div class="caption">
			        <h3>后台管理</h3>
			        <p>人数统计,用户访问</p>
			        <p>
			        	<a href="${backUrl}" class="btn btn-primary" role="button">Come On</a> 
			        </p>
		    	  </div>
		   		</div>
		 	</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script type="text/javascript">

var myCharts;

	$(function(){
		/* 1、 导航跳转效果插件*/
		$(".nav").singlePageNav({
			offset:60
		});
		 /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
		 
		//2、初始化WOW
		new WOW().init();
		
		//3、饼图
		myCharts = echarts.init(document.getElementById('main'));
		
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
		
	});
</script>
</html>