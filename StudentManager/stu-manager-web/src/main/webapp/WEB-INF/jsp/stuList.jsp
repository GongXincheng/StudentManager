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
<script>
	$(function(){
		new WOW().init();
	})
</script>
<title>学生信息</title>
<style type="text/css">
	#imgHead:hover{
		cursor: pointer;
	}
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
	<div class="container wow fadeInRight" data-wow-duration="0.8s">
		<ol class="breadcrumb">
		  <li><a href="/">首页</a></li>
		  <li class="active">学生信息</li>
		</ol>
	</div>
	
	<!-- 查询条件 -->
	<div class="container wow fadeInLeft" data-wow-delay="0.5s" data-wow-duration="0.8s">
		<div class="panel panel-default">
		<div class="panel-body">
		<form class="form-inline" action="${pageContext.request.contextPath}/stu/stuList.html" method="post">
			<div class="row">
				<div class="form-group col-xs-12 col-md-3 col-sm-6 col-lg-3"  style="margin-top: 10px;">
					<label for="stuId" style="font-size: 16px;">学号</label>&nbsp; 
					<input type="text" class="form-control" id="stuId" name="stuId" value="${searchCdt.stuId}" placeholder="学号"/>
				</div>
				<div class="form-group col-xs-12  col-md-3 col-sm-6 col-lg-3"  style="margin-top: 10px;" >
					<label for="stuName" style="font-size: 16px;">姓名</label> &nbsp;
					<input type="text" class="form-control" name="stuName" id="stuName" value="${searchCdt.stuName}" placeholder="学生姓名"/>
				</div>
				<div class="form-group col-xs-12  col-md-3 col-sm-6 col-lg-3" style="margin-top: 10px;">
					<label for="deptId">院系</label> &nbsp;
					<select class="form-control" id="deptId" name="deptId">
						<option value="0">--请选择--</option>
						<c:forEach items="${deptList}" var="dept">
							<option value="${dept.deptId}" <c:if test="${dept.deptId==searchCdt.deptId}">selected</c:if>>${dept.deptName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-xs-12  col-md-2 col-sm-6 col-lg-3" style="margin-top: 10px;">
					<label for="speId">专业</label> &nbsp;
					<select class="form-control" id="speId" name="speId">
						<option value="0">--请选择--</option>
						<c:if test="${searchSpeList != null}">
							<c:forEach items="${searchSpeList}" var="spe">
								<option value="${spe.speId}" <c:if test="${spe.speId==searchCdt.speId}">selected</c:if>>${spe.speName}</option>
							</c:forEach>
						</c:if>
					</select>
					<%-- <input id="search_speId" type="hidden" value="${searchCdt.speId}"> --%>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-xs-6"  style="margin-top: 10px;">
					<a href="${pageContext.request.contextPath}/stu/addStuPage.html" class="btn btn-primary">录入信息</a>
				</div>
				<div class="col-md-3 col-xs-6"  style="margin-top: 10px;">
					<a href="${pageContext.request.contextPath}/stu/stuList.html" class="btn btn-primary">全部学生</a>
				</div>
				<div class="col-md-3 col-xs-6 " style="margin-top: 10px;" >
					<button type="submit" class="btn btn-primary" formmethod="post" formaction="${pageContext.request.contextPath}/stu/exportData.html">导出数据</button>
				</div>
				<div class="col-md-3 col-xs-6 " style="margin-top: 10px;">
					<button class="btn btn-primary" type="submit">搜&nbsp;&nbsp;&nbsp;&nbsp;索</button>
				</div>
			</div>
		</form>
		</div>
		</div>
	</div>
	
	<!-- 学生信息列表 -->
	<div class="container" style="margin-top: 5px;" >
		<div class="row  wow fadeInUp" data-wow-duration="1.2s" data-wow-delay="0.7s">
			<div class="col-lg-12">
				<div class="panel panel-default table-responsive">
					<div class="panel-heading" style="font-size: 17px;font-weight: bold;">院系列表</div>
						<table class="table table-bordered table-striped table-hover" style="text-align: center;">
							<thead>
								<tr>
									<th style="text-align: center;">学号</th>
									<th style="text-align: center;">姓名</th>
									<th style="text-align: center;">性别</th>
									<th style="text-align: center;">入学时间</th>
									<th style="text-align: center;">专业名称</th>
									<th style="text-align: center;">修改</th>
									<th style="text-align: center;">删除</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${page.rows.size() == 0}">
								<tr>
									<td colspan="7" style="text-align: center;"><span style="display: block;margin: 30px 0;color: red; font-weight: bold;">查询不到该学生信息</span></td>
								</tr>
								
							</c:if>
							<c:forEach items="${page.rows}" var="stu">
								<tr>
									<td>${stu.stuId}</td>	
									<td>${stu.stuName}</td>
									<td>${stu.gender==1 ? '男' : '女' }</td>
									<td> <fmt:formatDate value="${stu.comeDate}" type="date" pattern="yyyy-MM-dd"/></td>
									<td>${stu.specialty.speName}</td>
									<td> <button type="button" class="btn btn-primary btn-xs" onclick="clickEditStu(${stu.stuId})" data-toggle="modal" data-target="#stuEditDialog">修改</button></td>
									<td> <button type="button" class="btn btn-danger btn-xs" onclick="clickDelStu(${stu.id},'${stu.stuName}',this)">删除</button></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div><!-- panel panel-default -->
				</div><!-- col-lg-12 -->

				<!-- 分页 -->
				<div style="margin-top: -20px;">
					<gxc:page url="${pageContext.request.contextPath}/stu/stuList.html"></gxc:page>
				</div><!-- 分页 -->
				
			</div><!-- row -->
		</div><!-- container -->
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<!-- 学生编辑对话框 -->
	<div class="modal fade" id="stuEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_edit">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_edit">修改学生信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_stu_form" method="post" enctype="multipart/form-data">
						<!-- 学生Id -->
						<input type="hidden" name="id" id="edit_id">
						<!-- 头像  左右 -->
						<div class="container">
							<div class="row">
								<!-- 第一列 -->
								<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
									<img src="${pageContext.request.contextPath}/images/defaultHead.jpg" id="imgHead" width="140" height="140" alt="..." class="img-responsive img-thumbnail">	
									<input type="file" name="fileInput" class="form-control hidden" id="fileInput">
									<input type="hidden" name="headPic" id="headPic">
								</div>
								<!-- 第二列 -->
								<div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
									<label for="edit_stuId" class="control-label">学号</label>
									<input type="text" class="form-control" id="edit_stuId" name="stuId" placeholder="学号" style="margin-bottom: 20px;"/>
									
									<label for="edit_stuName" class="control-label">姓名</label>
									<input type="text" class="form-control" id="edit_stuName" name="stuName" placeholder="姓名"/>
								</div>
							</div>
						</div>
						
						<!-- 头像下 -->
						<!-- 专业 -->
						<div class="form-group" style="">
							<label for="edit_gender" style="float: left; padding: 20px 15px 0 27px;">性别</label>
							<div class="col-sm-12">
								<select class="form-control" id="edit_gender" name="gender">
									<option value="1">男</option>
									<option value="0">女</option>
								</select>
							</div>
						</div>
						<!-- 院系 -->
						<div class="form-group" style="margin-top: 10px;">
							<label for="edit_deptId" style="float: left; padding: 7px 15px 0 27px;">所在院系</label>
							<div class="col-sm-12">
								<select class="form-control" id="edit_deptId" name="deptId">
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.deptId}">${dept.deptName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 专业 -->
						<div class="form-group" style="">
							<label for="edit_speId" style="float: left; padding: 4px 15px 0 27px;">专业</label>
							<div class="col-sm-12">
								<select class="form-control" id="edit_speId" name="specialty.speId">
								</select>
							</div>
						</div>
						<!-- 生日 -->
						<div class="form-group">
							<label for="edit_birthday"  style="float: left; padding: 4px 15px 0 27px;">生日</label>
							<div class="col-sm-12">
<!-- 								<input type="date" name="birthday" id="edit_birthday" class="form-control" style="padding: -5px 0;">	-->		
							<input type="text" name="birthday" id="edit_birthday" class="form-control" style="padding: -5px 0;">	
							</div>
						</div>
						<!-- 入校时间 -->
						<div class="form-group">
							<label for="edit_comeDate"  style="float: left; padding: 4px 15px 0 27px;">入校时间</label>
							<div class="col-sm-12">
								<!-- <input type="date" name="comeDate" id="edit_comeDate" class="form-control" style="padding: -5px 0;">	 -->
								<input type="text" name="comeDate" id="edit_comeDate" class="form-control" style="padding: -5px 0;">	
							</div>
						</div>			
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btnUpdateStu">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->
	
	
	<!-- 提示模态框 -->
	<!-- Modal -->
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
	
	<!-- 删除模态框 -->
	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" id="myDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_delete">
	  <div class="modal-dialog  modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel_delete">提示</h4>
	      </div>
	      <div class="modal-body">
	        <div style="text-align: center;margin: 10px 0;" id="modalShowMsg_del"></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button"  class="btn btn-primary" data-dismiss="modal">取消</button>
	        <button type="button" id="btn_deleteStu" class="btn btn-primary" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
<script type="text/javascript">
	$(function(){
		
		//1、头像被点击
		$("#imgHead").click(function(){
			$("#fileInput").click();
		});
		
		//2、上传选择头像
		$("#fileInput").bind("change", function() {
			
			//判断文件大小
			var f = document.getElementById("fileInput").files;  
			var picSize = f[0].size;
			if(picSize>2090000){
				showModal("提示","图片尺寸应小于2M");
				$("#fileInput").val(null);
				return ;
			}
			
			//显示图片
			if (window.FileReader) {
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				//监听文件读取结束后事件    
				reader.onloadend = function(e) {
					$("#imgHead").attr("src",e.target.result);
				};
			}
		});
		
		
		//3.二级联动
		$("#deptId").bind("change",function(){
			var deptId = $(this).val();
			//发送ajax请求
			$.ajax({
				url : "/stu/findSpeByDeptId.action",
				data : {deptId:deptId},
				type : "POST",
				dataType :"json",
				success : function(data){
					//如果所选的部门有专业
					if(data.status == 200){
						//将select置为空
						$("#speId").html("<option value='0'>--请选择--</option>");
						//遍历数据并添加option
						$.each(data.data,function(index,spe){
							$("#speId").append("<option value="+spe.speId+">" + spe.speName + "</option>");
						});
					}
					//如果所选部门为空
					else if(data.status == 201){
						$("#speId").html("");
						$("#speId").append("<option value='0'>--请选择--</option>");
					}else{
						alert("网络异常，请检查网络...");
					}
				}
			});
		});//二级联动
		
		//5、编辑时的二级联动
		$("#edit_deptId").bind("change",function(){
			var deptId = $("#edit_deptId").val();
			//发送Ajax
			$.post("/stu/findSpeByDeptId.action",{"deptId":deptId},function(data){
				if(data.status == 200){
					$("#edit_speId").html("");
					$.each(data.data,function(index,spe){
						$("#edit_speId").append("<option value="+spe.speId+">" + spe.speName + "</option>");
					});
				}
				else{
					$("#edit_speId").html("");
					$("#edit_speId").append("<option value='0'>--请选择--</option>");
				}
			})
		});
		
		
		//6、修改学生信息
		$("#btnUpdateStu").bind("click",function(){
			var stuId = $.trim($("#edit_stuId").val());
			var stuName = $.trim($("#edit_stuName").val());
			var birthday = $.trim($("#edit_birthday").val());
			var comeDate = $.trim($("#edit_comeDate").val());
			var speId = $("#edit_speId").val();
			
			//学号正则表达式匹配
			var reg_stuId = /^[0-9]{1,11}$/;
			//日期正则表达式匹配
			var reg_date = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
			
			if (!reg_stuId.test(stuId)) { 
				//alert("学号格式不正确(1~11位数字)"); 
				showModal("提示","学号格式不正确(1~11位数字)");
				return;
			}
			if (stuName == '') { 
				//alert("姓名不能为空"); 
				showModal("提示","姓名不能为空");
				return; 
			}
			if(stuName.indexOf("<") >= 0){
				showModal("提示","请勿使用非法字符,谢谢");
				return; 
			}
			if (speId == 0) { 
				//alert("请填写所在专业"); 
				showModal("提示","请填写所在专业");
				return;
			}
			if (!reg_date.test(birthday)) {
				//alert("请填写出生日期");
				showModal("提示","请正确填写出生日期(xxxx-xx-xx)");
				return; 
			}
			if (!reg_date.test(comeDate)) {
				//alert("请填写入学时间");
				showModal("提示","请正确填写入学时间(xxxx-xx-xx)");
				return; 
			}

			//提交表单
			var formData = new FormData($("#edit_stu_form")[0]);  
			$.ajax({
				url : "${pageContext.request.contextPath}/stu/updateStudent.action",
				type : "POST",
				data : formData,
				async: false,  
	            cache: false,  
	            contentType: false,  
	            processData: false,
				success : function(data){
					if(data.status == 200){
						showModal("成功",data.msg);
						setTimeout(function(){
							location.href = "${pageContext.request.contextPath}/stu/stuList.html";
						}, 1200);
					}
					else if(data.status == 201){
						showModal("失败",data.msg);
					}
					else{
						showModal("失败","网络连接失败！请重试...");
					}
				}
			});	//ajax
		});//修改按钮
		
		//删除学生
		$("#btn_deleteStu").click(function(){
			//alert(deleteId); alert(deletePoint); alert(deleteStuName);
			$.post("${pageContext.request.contextPath}/stu/deleteStu.action",{"id":deleteId},function(data){
				if(data.status == 200){
					//删除当前行
					$(deletePoint).parent().parent().remove();
					showModal("提示",data.msg);
					//初始化数据
					deleteId = null;
					deletePoint = null;
					deleteStuName = null;
				}
				else{
					//显示错误提示，并初始化数据
					showModal("提示",data.msg);
					deleteId = null;
					deletePoint = null;
					deleteStuName = null;
				}
			});
		});
		
		
	});//##### $(function())
	
	//4、点击修改按钮
	function clickEditStu(stuId){
		//发送ajax请求,获取该学生信息
		$.post("${pageContext.request.contextPath}/stu/findStuByStuId.action",{"stuId":stuId},function(data){
			//将数据填充
			$("#edit_id").val(data.data.student.id);
			$("#imgHead").attr("src",data.data.student.headPic);
			$("#headPic").val(data.data.student.headPic);
			$("#edit_stuId").val(data.data.student.stuId);
			$("#edit_gender").val(data.data.student.gender);
			$("#edit_stuName").val(data.data.student.stuName);
			$("#edit_birthday").val(data.data.birthday);
			$("#edit_comeDate").val(data.data.comeDate);
			$("#edit_deptId").val(data.data.student.specialty.deptId);
			//填充专业选项
			$("#edit_speId").html("");
			$.each(data.data.speList,function(index,spe){
				$("#edit_speId").append("<option value="+spe.speId+">"+spe.speName+"</option>");
			});
			//设置本来的专业选项
			$("#edit_speId").val(data.data.student.specialty.speId);
		});
	};

	
	//7、删除前获取数据，并显示对话框
	var deleteId = null;
	var deletePoint = null;
	var deleteStuName = null;
	function clickDelStu(id,deleteName,point){
		//赋值
		deleteId = id;
		deletePoint = point;
		deleteStuName = deleteName;
		//打开删除modal框
		$("#myDeleteModal").modal("show");
		$("#modalShowMsg_del").text("是否确认删除：" + deleteStuName);
	}
	
	//打开Modal
	function showModal(title,message){
		$('#myModal').modal('show');
		$("#myModalLabel").text(title);
		$("#modalShowMsg").text(message);
	}
</script>
</html>