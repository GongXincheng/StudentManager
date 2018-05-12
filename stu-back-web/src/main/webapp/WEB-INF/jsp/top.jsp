<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
.navbar-nav>li:hover{
	background-color: #82cbff;
}
</style>
</head>
<!--导航-->
<nav class="navbar navbar-default">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/" class="navbar-brand" style="font-weight: bold;">后台管理系统</a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${indexUrl}"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;前台首页</a></li>
                <li><a href="javascript:void(0);"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/back/accessList.html"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;访问列表</a></li>
                <li><a href="${pageContext.request.contextPath}/chartList.html"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;统计图表</a></li>
            </ul>
        </div>
        <!--导航-->
    </div>
</nav>
<!--导航-->