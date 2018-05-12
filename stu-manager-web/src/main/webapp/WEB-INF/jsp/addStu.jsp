<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<title>学生信息</title>
<style type="text/css">
	#imgHead:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 路径条 -->
	<div class="container">
		<ol class="breadcrumb">
		  <li><a href="/">首页</a></li>
		  <li class="active">添加学生</li>
		</ol>
	</div>
	
	<div class="container">
		<form action="/stu/addStudent.html" enctype="multipart/form-data" method="POST" class="form-horizontal center-block" id="add_stu_form" style="margin-bottom: 20px">
			<!-- 头像  左右 -->
			<div class="container">
				<div class="row">
					<!-- 第一列 -->
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
						<img src="${pageContext.request.contextPath}/images/defaultHead.jpg" id="imgHead" width="140" height="140" alt="..." class="img-responsive img-thumbnail">	
						<input type="file" name="picFile" class="form-control hidden" id="fileInput">
					</div>
					<!-- 第二列 -->
					<div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
						<label for="stuId" class="control-label">学号</label>
						<input type="text" class="form-control" id="stuId" placeholder="学号" name="stuId" style="margin-bottom: 20px;"/>
						
						<label for="stuName" class="control-label">姓名</label>
						<input type="text" class="form-control" id="stuName" name="stuName" placeholder="姓名"/>
					</div>
				</div>
			</div>
			
			<!-- 头像下 -->
			<!-- 专业 -->
			<div class="form-group">
				<label for="gender" style="float: left; padding: 20px 15px 0 27px;">性别</label>
				<div class="col-sm-12">
					<select class="form-control" id="gender" name="gender">
						<option value="1" selected="selected">男</option>
						<option value="0">女</option>
					</select>
				</div>
			</div>
			<!-- 院系 -->
			<div class="form-group" style="margin-top: 10px;">
				<label for="deptId" style="float: left; padding: 7px 15px 0 27px;">所在院系</label>
				<div class="col-sm-12">
					<select class="form-control" id="deptId" name="deptId">
						<option value="0">--请选择--</option>
						<c:forEach items="${deptList}" var="dept">
							<option value="${dept.deptId}">${dept.deptName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<!-- 专业 -->
			<div class="form-group">
				<label for="speId" style="float: left; padding: 4px 15px 0 27px;">专业</label>
				<div class="col-sm-12">
					<select class="form-control" id="speId" name="specialty.speId">
						<option value="0">--请选择--</option>
					</select>
				</div>
			</div>
			<!-- 生日 -->
			<div class="form-group">
				<label for="birthday" style="float: left; padding: 4px 15px 0 27px;">生日</label>
				<div class="col-sm-12">
					<input type="date" name="birthday" id="birthday" class="form-control" style="padding: -5px 0;">	
				</div>
			</div>
			<!-- 入校时间 -->
			<div class="form-group">
				<label for="comeDate" style="float: left; padding: 4px 15px 0 27px;">入校时间</label>
				<div class="col-sm-12">
					<input type="date" name="comeDate" id="comeDate" class="form-control" style="padding: -5px 0;">	
				</div>
			</div>			
			<!-- 添加按钮 -->
			<button class="center-block btn btn-info" type="button" id="btnAddStu" style="width: 200px;">添加</button>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<!-- 模态框 -->
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
	
	
</body>
<script type="text/javascript">
	$(function(){
		//1、点击图片时，选择本地文件
		$("#imgHead").click(function(){
			$("#fileInput").click();
		});
		
		//2、显示本地上传的图片
		$("#fileInput").bind("change", function() {
			//判断文件大小
			var f = document.getElementById("fileInput").files;  
			var picSize = f[0].size;
			if(picSize>2090000){
				showModal("提示","图片尺寸应小于2M");
				$("#fileInput").val(null);
				return ;
			}
			
			//显示
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
						/* alert(data.msg); */
						//将select置为空
						$("#speId").html("");
						//遍历数据并添加option
						$.each(data.data,function(index,spe){
							//alert(index + "::" + spe.speId + "::" + spe.speName);
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
		});
		
		//4、添加学生按钮
		$("#btnAddStu").bind("click",function(){
			var stuId = $.trim($("#stuId").val());
			var stuName = $.trim($("#stuName").val());
			var birthday = $.trim($("#birthday").val());
			var comeDate = $.trim($("#comeDate").val());
			var speId = $("#speId").val();
			
			//学号正则表达式匹配
			var reg = /^[0-9]{1,11}$/;
			if (!reg.test(stuId)) { 
				//alert("学号格式不正确(1~11位数字)"); 
				showModal("提示","学号格式不正确(1~11位数字)");
				return;
			}
			if (stuName == '') { 
				//alert("姓名不能为空"); 
				showModal("提示","姓名不能为空");
				return; 
			}
			if (speId == 0) { 
				//alert("请填写所在专业"); 
				showModal("提示","请填写所在专业");
				return;
			}
			if (birthday == '') {
				//alert("请填写出生日期");
				showModal("提示","请填写出生日期");
				return; 
			}
			if (comeDate == '') {
				//alert("请填写入学时间");
				showModal("提示","请填写入学时间");
				return; 
			}

			//发送ajax，判断学号是否已经存在
			$.post("/stu/findStuById.action",{"stuId":stuId},function(data){
				//如果改学号已经存在
				if(data.status==200){
					//提交表单
					var formData = new FormData($("#add_stu_form")[0]);  
					$.ajax({
						url : "${pageContext.request.contextPath}/stu/addStudent.action",
						type : "POST",
						data : formData,
						async: false,  
			            cache: false,  
			            contentType: false,  
			            processData: false,
						success : function(data2){
							if(data2.status == 200){
								showModal("成功",data2.msg);
								setTimeout(function(){
									location.href = "${pageContext.request.contextPath}/stu/stuList.html";
								}, 1200);
							}
							else if(data2.status = 201){
								showModal("失败",data2.msg);
							}
							else{
								showModal("失败","网络异常，请重试");
							}
						}
					});	
				}
				else if(data.status==201){
					showModal("失败",data.msg);
					return;
				}
				else{
					showModal("失败","网络异常，请重试");
				}
			});
		});

		
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
	});
</script>
</html>