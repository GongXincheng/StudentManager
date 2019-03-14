<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<style>
/* Logo颜色,字体大小 */
.navbar-default .navbar-brand{
	font-weight:bold;
	color: rgb(255,255,255);
}
/* 导航字体 */
.navbar-default .navbar-nav>li>a {
    font-weight: bold;
    color: #ddd;
}
.navbar-default .navbar-nav>li>a:hover {
    color:#999;  
}

.dropdown-menu>li>a {
    line-height: 28px;
}
nav.navbar.navbar-default {
    background-color: rgba(36, 41, 46,0.9);
    border-color: rgb(36, 41, 46);
    border-radius: 0px;
}
button.navbar-toggle.collapsed {
    border: 1px solid #111;
}

</style>
	<input type="hidden" id="loginUrl" value="${loginUrl}" />
	<input type="hidden" id="indexUrl" value="${indexUrl}" />

	<nav class="navbar navbar-default">
      <div class="container">
      	<!-- 小屏幕导航按钮 和 logo -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- logo -->
          <a class="navbar-brand" href="/">后台管理</a>
        </div>
    
    	<!-- Nav Bar -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         	<ul class="nav navbar-nav">
                <li><a href="${indexUrl}"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;前台首页</a></li>
                <li><a href="${pageContext.request.contextPath}/back/userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/back/accessList.html"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;访问列表</a></li>
                <li><a href="${pageContext.request.contextPath}/back/chartList.html"><span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;统计图表</a></li>
            </ul>
          	
          <ul class="nav navbar-nav navbar-right">
            <li id="div_login" style="display: none;">
            	
            	<a style="display: inline-block" id="toLoginPage" href="javascript:void(0);">登录</a>|
            	<a style="display: inline-block" href="${loginUrl}/page/regist.html">注册</a>
            </li>
            
            <li class="dropdown" style="display: none;" id="div_user">
	          <a style="display: inline-block" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
	         	 <img id="img_headPic" style="margin-top: -2px;" alt="" src="${pageContext.request.contextPath}/images/defaultHead.jpg" width="25px" class="img-circle">
	         	 <span style="margin-left: 5px;" id="span_username">杨昆</span><span class="caret"></span>
	          </a>
	          
	          <ul class="dropdown-menu">
	            <li><a href="${userUrl}">个人信息</a></li>
	            <li>
	            	<a href="javascript:void(0);" id="loginOut">退出</a>
	            </li>
	          </ul>
	        </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
