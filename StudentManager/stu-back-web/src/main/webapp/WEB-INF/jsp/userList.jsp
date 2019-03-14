<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://gxc.cn/common/" prefix="gxc"%>
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
#nav-page {
	text-align: center;
}
</style>
</head>
<body>

	<input type="hidden" id="userUrl" value="${userUrl}" />

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
	<div class="container wow fadeInUp">
		<div class="panel panel-default table-responsive">
			<div class="panel-heading">
				<h5 class="panel-title" style="font-weight: bold; padding: 3px 0;">用户列表</h5>
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
						<th style="text-align: center;">权限修改</th>
						<th style="text-align: center;">查看&nbsp;|&nbsp;删除</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:if test="${page.rows.size() == 0}">
						<tr>
							<td colspan="7" style="text-align: center;"><span
								style="display: block; margin: 30px 0; color: red; font-weight: bold;">查询不到该访问信息</span>
							</td>
						</tr>
					</c:if>
					<c:forEach items="${page.rows}" var="user">
						<tr>
							<td>${user.id }</td>
							<td>${user.username }</td>
							<td>${user.gender==1?'男':'女'}</td>
							<td><fmt:formatDate value="${user.lastlogindate}"
									type="date" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${user.loginnum}</td>
							<td class="td_role">
								<!-- 0：最高权限，1：管理员，2：游客 --> 
								<c:if test="${user.role == 0}">超级管理员</c:if>
								<c:if test="${user.role == 1}">管理员</c:if> 
								<c:if test="${user.role == 2}">游客</c:if>
							</td>
							<td>
								<select class="form-control" onchange="editUserRole(${user.id},${user.role},this)" style="width: 100px; padding: 0px 0px 0px 5px;">
									<option value="0" <c:if test="${user.role == 0}">selected</c:if>>超级管理员</option>
									<option value="1" <c:if test="${user.role == 1}">selected</c:if>>管理员</option>
									<option value="2" <c:if test="${user.role == 2}">selected</c:if>>游客</option>
								</select>
							</td>
							<td>
								<button type="button" onclick="showUser(${user.id})" class="btn btn-primary btn-xs">查看</button> |
								<button type="button" onclick="deleteUserModal(${user.id},'${user.username}',this)" class="btn btn-danger btn-xs">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- panel -->

		<!-- 分页 -->
		<div style="margin-top: -20px;">
			<gxc:page url="${pageContext.request.contextPath}/back/userList.html"></gxc:page>
		</div>
		<!-- 分页 -->

	</div>
	<!-- container -->

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 提示模态框 -->
	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog  modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center; margin: 10px 0;" id="modalShowMsg"></div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnHideModal" class="btn btn-primary"
						data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 删除模态框 -->
	<!-- Modal -->
	<div class="modal fade bs-example-modal-sm" id="myDeleteModal"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel_delete">
		<div class="modal-dialog  modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel_delete">提示</h4>
				</div>
				<div class="modal-body">
					<div style="text-align: center; margin: 10px 0;"
						id="modalShowMsg_del"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
					<button type="button" id="btn_deleteStu" class="btn btn-danger"
						data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
	//1、根据用户id查看用户信息
	function showUser(userId){
		var userUrl = $("#userUrl").val();
		window.location.href = userUrl + "/user/" + userId + ".html";
	}
	
	var userId = null;
	var username = null;
	var btn = null;
	
	//2、删除用户提示Modal
	function deleteUserModal(userId1,username1,btn1){
		userId = userId1;
		username = username1;
		btn = btn1;
		//打开删除modal框
		$("#myDeleteModal").modal("show");
		$("#modalShowMsg_del").text("是否确认删除用户：" + username);
	}//删除用户提示Modal
	
	
	//4、修改用户权限
	function editUserRole(userId, oldRoleId, element){
		var roleId = $(element).val();
		var userUrl = $("#userUrl").val();
		$.ajax({
			url : userUrl + "/user/editRole.action",
			data : {
				userId : userId,
				roleId : roleId
			},
			type : "GET",
			dataType : "jsonp",
			success : function(data){
				if(data.status == 200){
					showModal("提示", data.msg);
					if(roleId == 0){
						$(element).parent().siblings(".td_role").text("超级管理员");
					}
					else if(roleId == 1){
						$(element).parent().siblings(".td_role").text("管理员");
					}
					else{
						$(element).parent().siblings(".td_role").text("游客");
					}
				}else{
					showModal("提示", data.msg);
					$(element).val(oldRoleId);
				}
			}
		});
	}
	
	
	$(function(){
		//3、Ajax跨域删除用户
		$("#btn_deleteStu").click(function(){
			if(userId==null){
				return;
			}
			var userUrl = $("#userUrl").val();
			var deleteUrl = userUrl + "/user/deleteUser.action"; 
			$.ajax({
				url : deleteUrl,
				data : {id:userId},
				dataType : "jsonp",
				type : "GET",
				success : function(data){
					if(data.status == 200){
						showModal("提示", data.msg);
						$(btn).parent().parent().remove();
						userId = null;
						username = null;
						btn = null;
					}else{
						showModal("提示", data.msg);
						userId = null;
						username = null;
						btn = null;
					}
				} 
			});
		});//Ajax跨域删除用户
		
	});
	
	
	//打开Modal
	function showModal(title,message){
		$('#myModal').modal('show');
		$("#myModalLabel").text(title);
		$("#modalShowMsg").text(message);
	}
	
</script>
</html>