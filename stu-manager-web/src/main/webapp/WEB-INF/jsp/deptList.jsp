<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://gxc.cn/common/" prefix="gxc" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>院系管理</title>
<style type="text/css">
#nav-page{
text-align: center;}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	
	<!-- 路径条 -->
	<div class="container wow fadeInRight" data-wow-duration="0.5s">
		<ol class="breadcrumb">
		  <li><a href="/">首页</a></li>
		  <li class="active">院系管理</li>
		</ol>
	</div>
	<div class="container">
		<div class="row wow fadeInLeft">
			<div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
				<button class="btn btn-primary pull-left" data-toggle="modal" data-target="#deptAddDialog">添加院系</button>
			</div>
		</div>
		
		<div class="row wow fadeInUp"  data-wow-delay="0.7s">
			<div class="col-lg-12">
				<div class="panel panel-default table-responsive">
					<div class="panel-heading" style="font-size: 17px;font-weight: bold;">院系列表</div>
					<table class="table table-bordered table-striped table-hover" style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">院系ID</th>
								<th style="text-align: center;">院系名称</th>
								<th style="text-align: center;">添加时间</th>
								<th style="text-align: center;">修改时间</th>
								<th style="text-align: center;">院系简介</th>
								<th style="text-align: center;">修改信息</th>
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${page.rows}" var="dept">
				<tr>
					<td>${dept.deptId}</td>
					<td>${dept.deptName}</td>
					<td><fmt:formatDate value="${dept.createDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${dept.updateDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>${dept.discription}</td>
					<td>
						<a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" onclick="editDept(${dept.deptId})" data-target="#deptEditDialog">修改</a> 
					</td>
				</tr>
			</c:forEach>
						</tbody>
					</table>
				</div><!-- /.panel -->
				
				<!-- 分页 -->
				<div style="margin-top: -20px;">
					<gxc:page url="${pageContext.request.contextPath}/dept/deptList.html"></gxc:page>
				</div><!-- 分页 -->
				
			</div><!-- /.col-lg-12 -->
		</div><!-- row -->
	</div><!-- container -->
		
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<!-- 院系编辑对话框 -->
	<div class="modal fade" id="deptEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_edit">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_edit">修改院系信息</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form class="form-horizontal" id="edit_dept_form" action="/dept/updateDept.html" method="post">
						<input type="hidden" id="edit_deptId" name="deptId">
						<!-- <input type="hidden" id="edit_updateDate" name="updateDate"> -->
						<div class="form-group">
							<label for="edit_deptName" class="col-sm-2 control-label">院系名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="deptName" id="edit_deptName" placeholder="院系名称"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit_desc" class="col-sm-2 control-label">院系简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="4" name="discription" placeholder="院系简介" id="edit_desc"></textarea>
							</div>
						</div>
					</form>
				</div>
				<!-- footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnUpdateDept">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
	
	
	<!-- 院系添加对话框 -->
	<div class="modal fade" id="deptAddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_add">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_add">添加院系</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form class="form-horizontal" action="/dept/addDept.html" id="add_dept_form" method="post">
						<div class="form-group">
							<label for="add_deptName" class="col-sm-2 control-label">院系名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" required="required" id="add_deptName" name="deptName" placeholder="院系名称"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="add_desc" class="col-sm-2 control-label">院系简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="4" required="required" name="discription" placeholder="院系简介" id="add_desc"></textarea>
							</div>
						</div>
					</form>
				</div>
				<!-- footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnAddDept">添加院系</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
	
</body>
<script type="text/javascript">
	
	$(function(){
		//点击添加提交表单
		$("#btnAddDept").click(function(){
			$("#add_dept_form")[0].submit();
		});
		
		//点击更新按钮
		$("#btnUpdateDept").click(function(){
			$("#edit_dept_form")[0].submit();
		});
	});
	
	function editDept(id){
		$.post("/dept/editById.action",{deptId:id},function(data){
			$("#edit_deptId").val(data.deptId);
			$("#edit_deptName").val(data.deptName);
			$("#edit_desc").val(data.discription);
			//$("#edit_updateDate").val(data.updateDate);
		});
	}

</script>
</html>

