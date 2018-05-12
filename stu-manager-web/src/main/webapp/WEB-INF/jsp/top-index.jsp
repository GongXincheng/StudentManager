<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.singlePageNav.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<style>
.navbar-nav>li:hover{
	background-color: #82cbff;
}
.navbar-default{
	background: #fff;
	border: none;
	box-shadow:0px 2px 4px 0px rgba(50,50,50,0.25);
}
/* Logo颜色,字体大小 */
.navbar-default .navbar-brand{
	font-size:20px;
	font-weight:bold;
	color:#14b4b4;
	line-height:30px;
}
/* 导航字体 */
.navbar-default .navbar-nav>li>a {
    color: #777;
    font-weight: bold;
    font-size: 15px;
    line-height: 30px;
}
.navbar-default .navbar-toggle {
    border-color: #ddd;
    margin-top: 13px;
    margin-bottom: 12px;
}

</style>
	<div id="top"></div>
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
      	<!-- 小屏幕导航按钮 和 logo -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- logo -->
          <a class="navbar-brand" href="/">学生信息管理</a>
        </div>
    
    	<!-- Nav Bar -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#top">首页</a></li>
            <li><a href="#dept">院系管理</a></li>
            <li><a href="#spe">专业管理</a></li>
            <li><a href="#stuList">学生列表</a></li>
            <li><a href="#addStu">学生信息录入</a></li>
            <li><a href="#backMg">后台管理</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
