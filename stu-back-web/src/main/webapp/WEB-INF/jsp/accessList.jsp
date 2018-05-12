<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://gxc.cn/common/" prefix="gxc" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>访问列表</title>
<style type="text/css">
#nav-page{ text-align: center;}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<div class="container">
		<div class="panel panel-default">
		  <div class="panel-body">
		   	
		   	<form class="form" action="${pageContext.request.contextPath}/back/accessList.html" method="post">
		   		<div class="form-group col-md-4">
		   			<label for="ip">用户IP</label>
  					<input type="text" class="form-control" id="ip" name="ip" value="${search.ip}" placeholder="用户IP">
		   		</div>
		   		<div class="form-group  col-md-4">
		   			<label for="comedate">访问时间</label>
  					<input type="text" class="form-control" id="comedate" name="comedate" value="${search.comedate}" placeholder="访问时间">
		   		</div>
		   		<div class="form-group  col-md-3">
		   			<label for="resourcepath">资源路径</label>
  					<input type="text" class="form-control" id="resourcepath" name="resourcepath" value="${search.resourcepath}" placeholder="资源路径">
		   		</div>
		   		<div class="form-group  col-md-1 pull-right"  style="margin-bottom: 0px;">
		   			<div class="hidden-xs hidden-sm">
		   				<label for="btnSearch ">搜索</label>
		   			</div>
		   			<button type="submit" id="btnSearch" class="btn btn-primary form-control">搜索</button>
		   		</div>
		   	</form>
		  </div>
		</div>
	</div>
	
	
	<!-- 列表 -->
	<div class="container">
		<div class="panel panel-default table-responsive">
		  <div class="panel-heading">
		    <h5 class="panel-title" style="font-weight: bold;padding: 3px 0;">用户访问信息列表</h5>
		  </div>
		    <table class="table table-bordered table-striped table-hover">
		    	<thead>
		    		<tr>
		    			<th style="text-align: center;">ID</th>
		    			<th style="text-align: center;">用户IP</th>
		    			<th style="text-align: center;">资源路径</th>
		    			<th style="text-align: center;">访问时间</th>
		    			<th style="text-align: center;">操作</th>
		    		</tr>
		    	</thead>
		    	<tbody align="center">
		    		<c:if test="${page.rows.size() == 0}">
		    			<tr>
							<td colspan="7" style="text-align: center;"><span style="display: block;margin: 30px 0;color: red; font-weight: bold;">查询不到该访问信息</span></td>
						</tr>
		    		</c:if>
		    		<c:forEach items="${page.rows}" var="access">
		    			<tr>
			    			<td>${access.id }</td>
			    			<td>${access.ip }</td>
			    			<td>${access.resourcepath }</td>
			    			<td>${access.comedate }</td>
			    			<td>
			    				<button type="button" onclick="deleteAccess(${access.id},this)" class="btn btn-danger btn-xs">删除</button>
			    			</td>
			    		</tr>
		    		</c:forEach>
		    	</tbody>
			</table>
		</div><!-- panel -->
		
		<!-- 分页 -->
		<div style="margin-top: -20px;">
			<gxc:page url="${pageContext.request.contextPath}/back/accessList.html"></gxc:page>
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