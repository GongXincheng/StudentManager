<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://gxc.cn/common/" prefix="gxc" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script> $(function(){ new WOW().init(); })
</script>
<title>访问列表</title>
<style type="text/css">
#nav-page{ text-align: center;}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath}/js/checkLogin.js"></script>
	
	<%-- <div class="container wow fadeInRight" >
		<div class="panel panel-default">
		  <div class="panel-body">
		   	
		   	<form class="form" action="${pageContext.request.contextPath}/back/userList.html" method="post">
		   		<div class="form-group col-md-2">
		   			<label for="ip">用户IP</label>
  					<input type="text" class="form-control" id="ip" name="ip" value="${search.ip}" placeholder="用户IP">
		   		</div>
		   		<div class="form-group col-md-2">
		   			<label for="iplocation">IP所在地</label>
  					<input type="text" class="form-control" id="iplocation" name="iplocation" value="${search.iplocation}" placeholder="IP所在地">
		   		</div>
		   		<div class="form-group  col-md-3">
		   			<label for="resourcepath">资源路径</label>
  					<input type="text" class="form-control" id="resourcepath" name="resourcepath" value="${search.resourcepath}" placeholder="资源路径">
		   		</div>
		   		<div class="form-group  col-md-3">
		   			<label for="comedate">访问时间</label>
  					<input type="text" class="form-control" id="comedate" name="comedate" value="${search.comedate}" placeholder="访问时间">
		   		</div>
		   		<div class="form-group  col-md-2 pull-right"  style="margin-bottom: 0px;">
		   			<div class="hidden-xs hidden-sm">
		   				<label for="btnSearch ">搜索</label>
		   			</div>
		   			<button type="submit" id="btnSearch" class="btn btn-primary form-control">搜索</button>
		   		</div>
		   	</form>
		  </div>
		</div>
	</div> --%>
	
	
	<!-- 列表 -->
	<div class="container wow fadeInLeft">
		<div class="panel panel-default table-responsive">
		  <div class="panel-heading">
		    <h5 class="panel-title" style="font-weight: bold;padding: 3px 0;">用户列表</h5>
		  </div>
		    <table class="table table-bordered table-striped table-hover">
		    	<thead>
		    		<tr>
		    			<th style="text-align: center;">ID</th>
		    			<th style="text-align: center;">用户名</th>
		    			<th style="text-align: center;">性别</th>
		    			<th style="text-align: center;">登录时间</th>
		    			<th style="text-align: center;">登录次数</th>
		    			<th style="text-align: center;">权限</th>
		    		</tr>
		    	</thead>
		    	<tbody align="center">
		    		<c:if test="${page.rows.size() == 0}">
		    			<tr>
							<td colspan="7" style="text-align: center;"><span style="display: block;margin: 30px 0;color: red; font-weight: bold;">查询不到该访问信息</span></td>
						</tr>
		    		</c:if>
		    		<c:forEach items="${page.rows}" var="user">
		    			<tr>
			    			<td>${user.id }</td>
			    			<td>${user.username }</td>
			    			<td>${user.gender==1?'男':'女'}</td>
			    			<td>
			    				<fmt:formatDate value="${user.lastlogindate}" type="date" pattern="yyyy-MM-dd HH:mm-ss"/>
			    			</td>
			    			<td>${user.loginnum}</td>
			    			<td>
			    				<!-- 0：最高权限，1：管理员，2：游客 -->
			    				<c:if test="${user.role == 0}">超级管理员</c:if>
			    				<c:if test="${user.role == 1}">管理员</c:if>
			    				<c:if test="${user.role == 2}">游客</c:if>
			    			</td>
			    			<%-- <td>
			    				<button type="button" onclick="deleteAccess(${access.id},this)" class="btn btn-danger btn-xs">删除</button>
			    			</td> --%>
			    		</tr>
		    		</c:forEach>
		    	</tbody>
			</table>
		</div><!-- panel -->
		
		<!-- 分页 -->
		<div style="margin-top: -20px;">
			<gxc:page url="${pageContext.request.contextPath}/back/userList.html"></gxc:page>
		</div>
		<!-- 分页 -->
	</div><!-- container -->
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
<script type="text/javascript">

	function deleteAccess(id,e){
		$.post("${pageContext.request.contextPath}/back/deleteAccess.action",{id:id},function(data){
			if(data.status!=200){
				alert("网络异常,删除失败...");
				return;
			}
			$(e).parent().parent().remove();
		})
	}

</script>

</html>