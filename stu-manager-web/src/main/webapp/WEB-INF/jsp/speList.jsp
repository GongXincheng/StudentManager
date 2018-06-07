<%@ page import="java.util.List"%>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/checkLogin.js"></script>
<script>
	$(function(){
		new WOW().init();
	})
</script>
<title>专业管理</title>
<style type="text/css">
#nav-page{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
	<script src="${pageContext.request.contextPath}/js/checkLogin.js"></script>
	
	<!-- 路径条 -->
	<div class="container wow fadeInRight" data-wow-duration="0.5s">
		<ol class="breadcrumb">
		  <li><a href="/">首页</a></li>
		  <li class="active">专业信息</li>
		</ol>
	</div>
	
	<div class="container">
		<div class="row wow fadeInLeft" data-wow-delay="0.2s">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-horizontal" action="/spe/spetList.html" method="post">
						<div class="form-group"> <!--  style="border: 1px solid #999;  -->
							<label for="deptIdSelect" class="col-md-1" style="line-height: 35px;">院系</label>
							<div class="col-md-3" >
								<select class="form-control" id="deptIdSelect" name="deptId">
									<option value="0">--请选择--</option>
									<c:forEach items="${deptList}" var="dept">
										<option  value="${dept.deptId}" <c:if test="${slctDeptId == dept.deptId}">selected</c:if>>
											 ${dept.deptName}
										 </option>
									</c:forEach>
								</select>
							</div>
						</div>	
						<div class="col-md-3 col-xs-8">
							<button type="button" class="btn btn-info pull-left" data-toggle="modal" data-target="#speAddDialog">添加专业</button>
						</div>
						<div class="col-md-2 col-xs-3">
							<button type="submit" class="btn btn-primary pull-left">查&nbsp;&nbsp;&nbsp;询</button>
						</div>
					</form>
				</div>
				</div>
			</div>
		</div>
		
		<div class="row  wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
			<div class="col-lg-12">
				<div class="panel panel-default  table-responsive">
					<div class="panel-heading" style="font-size: 17px;font-weight: bold;">专业列表</div>
					<table class="table table-bordered table-striped table-hover" style="text-align: center;">
						<thead>
							<tr>
								<th style="text-align: center;">专业ID</th>
								<th style="text-align: center;">专业名称</th>
								<th style="text-align: center;">添加时间</th>
								<th style="text-align: center;">专业简介</th>
								<th style="text-align: center;">院系名称</th>
								<th style="text-align: center;">修改信息</th>
							</tr>
						</thead>
						<tbody>
			<c:if test="${page.rows.size() == 0}">
				<tr>
					<td colspan="7" style="text-align: center;"><span style="display: block;margin: 30px 0;color: red; font-weight: bold;">该院系暂无专业</span></td>
				</tr>
			</c:if>
			<c:forEach items="${page.rows}" var="spe">
				<tr>
					<td>${spe.speId }</td>
					<td>${spe.speName }</td>
					<td> <fmt:formatDate value="${spe.createDate }" type="date" pattern="yyyy-MM-dd HH:mm"/> </td>
					<td>${spe.description }</td>
					<td>${spe.deptName }</td>
					<td>
						<a href="javascript:void(0);" class="btn btn-primary btn-xs" onclick="editSpe(${spe.speId })" data-toggle="modal" data-target="#speEditDialog">修改</a> 
					</td>
				</tr>
			</c:forEach>
						</tbody>
					</table>
				</div><!-- /.panel -->
				
				<!-- 分页 -->
				<div style="margin-top: -20px;">
					<gxc:page url="${pageContext.request.contextPath}/spe/spetList.html"></gxc:page>
				</div><!-- 分页 -->
				
			</div><!-- /.col-lg-12 -->
		</div><!-- row -->
	</div>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 专业添加对话框 -->
	<div class="modal fade" id="speAddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_add">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_add">添加专业</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form class="form-horizontal" method="post" action="/spe/addSpe.html" id="add_spe_form">
						<div class="form-group">
							<label for="add_DeptId" class="col-sm-2 control-label">选择院系</label>
							<div class="col-sm-10">
								<!-- deptId -->
								<select class="form-control col-sm-10" id="add_DeptId" name="deptId">
									<option value="0">--请选择--</option>
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptId}">
											 ${dept.deptName}
										 </option>
									</c:forEach>
								</select>
								<!-- deptName -->
								<input type="hidden" id="deptNameHidden" name="deptName">
							</div>
						</div>
					
						<div class="form-group">
							<label for="add_speName" class="col-sm-2 control-label">专业名称</label>
							<div class="col-sm-10">
								<!-- speName -->
								<input type="text" class="form-control" id="add_speName" name="speName" placeholder="专业名称"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="add_desc" class="col-sm-2 control-label">专业简介</label>
							<div class="col-sm-10">
								<!-- description -->
								<textarea class="form-control" rows="4" name="description" placeholder="专业简介" id="add_desc"></textarea>
							</div>
						</div>
					</form>
				</div>
				<!-- footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn_addSpe">添加专业</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
	
	<!-- 专业修改对话框专业修改对话框专业修改对话框专业修改对话框 -->
	<div class="modal fade" id="speEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_edit">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_edit">修改专业</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form class="form-horizontal" method="post" id="edit_spe_form">
						<input type="hidden" name="speId" id="edit_speId">
						<div class="form-group">
							<label for="edit_deptId" class="col-sm-2 control-label">选择院系</label>
							<div class="col-sm-10">
								<select class="form-control col-sm-10" name="deptId" id="edit_deptId">
									<option value="0">--请选择--</option>
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptId}">
											 ${dept.deptName}
										 </option>
									</c:forEach>
								</select>
								<!-- deptName -->
								<input type="hidden" id="edit_deptName" name="deptName">
							</div>
						</div>
					
						<div class="form-group">
							<label for="edit_speName" class="col-sm-2 control-label">专业名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_speName" name="speName" placeholder="专业名称"/>
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit_desc" class="col-sm-2 control-label">专业简介</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="4" name="description" placeholder="专业简介" id="edit_desc"></textarea>
							</div>
						</div>
					</form>
				</div>
				<!-- footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="editSpe" class="btn btn-primary" data-loading-text="Loading..." >修改专业</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
	<!-- 模态框 -->
	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog  modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      </div>
	      <div class="modal-body">
	        <div style="text-align: center;margin: 10px 0;" id="modalShowMsg"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="btnHideModal" class="btn btn-primary" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
<script type="text/javascript">
	$(function(){
		//1、添加专业选择院系时保存院系名称
		$("#add_DeptId").change(function(){
			var deptName= $("#add_DeptId option:selected").text();
			var deName = $.trim(deptName)
			$("#deptNameHidden").val(deName);
		});
		
		//4、修改前更改了院系
		$("#edit_deptId").change(function(){
			var deptName = $("#edit_deptId option:selected").text();
			var deName = $.trim(deptName)
			$("#edit_deptName").val(deName);
		});
		
		//2、添加专业
		$("#btn_addSpe").click(function(){
			var deptId = $("#add_DeptId").val();
			var add_speName = $.trim($("#add_speName").val());
			var add_desc = $.trim($("#add_desc").val());
			
			if(deptId == 0 || add_speName.length == 0){
				showModal("提示","请正确填写！");
				return ;
			}
			
			if(add_speName.indexOf("<") >= 0 || add_desc.indexOf("<") >= 0){
				showModal("提示","请勿使用非法字符");
				return ;
			}
			
			$("#add_spe_form")[0].submit();
		});
		
		//5、确定修改
		$("#editSpe").click(function(){
			//验证
			var deptId = $("#edit_deptId").val();
			var speName = $("#edit_speName").val();
			if(deptId==0 || speName==""){
				showModal("提示","请正确填写!");
				return;
			}
			
			$.post("/spe/updateSpe.action",$("#edit_spe_form").serialize(),function(data){
				if(data.status == 200){
					showModal("成功",data.msg);
					setTimeout(function(){
						location.href = "/spe/spetList.html";
					}, 1200);
				}
			});
		});
	});
	
	//3、点击修改，Ajax后台查询专业
	function editSpe(speId){
		$.ajax({
			url : "/spe/findSpeBySpeId.action",
			data : {speId:speId},
			type : "POST",
			dataType : "json",
			success : function(data){
				if(data.status == 200){
					$("#edit_speId").val(data.data.speId);
					$("#edit_speName").val(data.data.speName);
					$("#edit_desc").val(data.data.description);
					$("#edit_deptName").val(data.data.deptName);
					$("#edit_deptId").val(data.data.deptId);
				}
				else{
					showModal("错误","网络异常!请检查网络..." + data.msg);
				}
			}
		});
	}
	
	//关闭模态框
	$("#btnHideModal").click(function(){
		$("#myModal").modal("hide");
	});
	
	//打开Modal
	function showModal(title,message){
		$('#myModal').modal('show');
		$("#myModalLabel").text(title);
		$("#modalShowMsg").text(message);
	}

</script>
</html>