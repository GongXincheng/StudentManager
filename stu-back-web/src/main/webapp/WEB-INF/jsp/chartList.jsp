<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>图表统计</title>
</head>

<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<div class="container">
		<div class="col-md-2 col-sm-3">
			<div class="list-group">
			  <a href="/" id="accessChart" class="list-group-item active">用户访问统计</a>
			  <a href="javascript:void(0);" id="deptChart" class="list-group-item">院系人数统计</a>
			  <a href="javascript:void(0);" id="speChart" class="list-group-item">专业人数统计</a>
			 <!--  <a href="javascript:void(0);" id="serverChart" class="list-group-item">服务器资源</a> -->
			</div>
		</div>
		
		<!-- 统计图 -->
		<div class="col-md-10 col-sm-9">
			<div id="main" style="width: 100%;height: 480%;" ></div>
		</div>
		
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/myChart.js"></script>
<script type="text/javascript">
$(function(){
	//初始化
	var myChart = echarts.init(document.getElementById('main'));
	myChart.showLoading();
	
	//菜单点击事件
	$(".list-group a").bind("click",function(){
		$(this).parent().find('a.active').removeClass("active");
		$(this).addClass("active");
		myChart.showLoading();
	});
	
	//假数据
	//var xData = ['Monss', 'Tuess', 'Wessd', 'Thuss', 'Frssi', 'Sasst', 'Susssn'];
	//var yData = [10, 52, 200, 334, 390, 330, 500];
	//var data1 = ['西凉', '益州','兖州','荆州','幽州'];
	//var data2 = [{value:681,name: '幽州'},{value:535, name: '荆州'},{value:510, name: '兖州'},{value:634, name: '益州'},{value:735, name: '西凉'}];
	          
	//页面加载后
	$.ajax({
			url: "${pageContext.request.contextPath}/back/chart/getAccessChart.action",
			data: {},
			type: "POST",
			dataType: "json",
			success : function(data){
				myChart.setOption(MyBar(data.xData,data.yData));
				setTimeout(function(){
					myChart.hideLoading();
				},300);
			}
		});
	
	//1、点击访问统计
	$("#accessChart").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/back/chart/getAccessChart.action",
			data: {},
			type: "POST",
			dataType: "json",
			success : function(data){
				myChart.setOption(MyBar(data.xData,data.yData));
				setTimeout(function(){
					myChart.hideLoading();
				},300);
			}
		})
	});
	
	
	//2、点击院系人数统计
	$("#deptChart").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/back/chart/getDeptChart.action",
			data: {},
			type: "POST",
			dataType: "json",
			success : function(data){
				myChart.setOption(MyPie(data.data1,data.data2));
				setTimeout(function(){
					myChart.hideLoading();
				},300);
			}
		});
	});
	
	//3、点击专业人数统计
	$("#speChart").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/back/chart/getSpeChart.action",
			data: {},
			type: "POST",
			dataType: "json",
			success : function(data){
				myChart.setOption(MyPie(data.data1,data.data2));
				setTimeout(function(){
					myChart.hideLoading();
				},300);
			}
		});
	});
	
	
	//4、点击服务器资源
	$("#serverChart").click(function(){
				
	});
	
	
	//饼图响应式
	$(window).resize(function(){
		myChart.resize();
	});
	
});
	
</script>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>

</html>