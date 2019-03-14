<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<style>
/* Logo颜色,字体大小 */
.navbar-default .navbar-brand{
	font-weight:bold;
	color:#14b4b4;
}
/* 导航字体 */
.navbar-default .navbar-nav>li>a {
    font-weight: bold;
}
.dropdown-menu>li>a {
    font-weight: bold;
    line-height: 28px;
}
.dropdown-menu>li:hover{
	background-color: #82cbff;
}
</style>
	<input type="hidden" id="loginUrl" value="${loginUrl}">
	
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
          <a class="navbar-brand" href="/">学生信息管理</a>
        </div>
    
    	<!-- Nav Bar -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a href="/dept/deptList.html">院系管理</a></li>
            <li><a href="/spe/spetList.html">专业管理</a></li>
            
            <li class="dropdown">
			  <a id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    学生信息管理 <span class="caret"></span>
			  </a>
			  <ul class="dropdown-menu" aria-labelledby="dLabel">
			    <li><a href="/stu/stuList.html">学生列表</a></li>
            	<li><a href="/stu/addStuPage.html">学生信息录入</a></li>
			  </ul>
			</li>
			
			<li><a href="${backUrl}">后台管理</a></li>
          </ul>
          
          <!-- 登录注册，个人信息 -->
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
	            <li><a href="javascript:void(0);" id="loginOut">退出</a></li>
	          </ul>
	        </li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
