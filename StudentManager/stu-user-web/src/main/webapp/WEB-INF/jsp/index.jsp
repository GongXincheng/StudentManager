<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <script> $(function () {
    new WOW().init();
  })</script>
  <title>个人信息</title>
  <style type="text/css">
    body {
      background-color: rgb(243, 243, 243);
    }

    #user_top_pc_pic {
      width: 100%;
      height: 240px;
      margin-top: -12px;
      display: none;
    }

    #user_top_pc_pic img {
      width: inherit;
      height: inherit;
    }

    #user_top_sj_pic {
      width: 100%;
      height: 150px;
      margin-top: -12px;
      display: none;
    }

    #user_top_sj_pic img {
      width: inherit;
      height: inherit;
    }

    #user_middle_contain_top {
      background: #fff;
    }

    .span_pc_username {
      display: block;
      margin-top: 15px;
      font-size: 25px;
      color: black;
      font-weight: bold;
    }

    .span_sj_username {
      display: block;
      margin-top: 10px;
      font-size: 22px;
      color: black;
      margin-left: -10px;
      font-weight: bold;
    }

    .btn_edit_pc {
      margin-top: 15px;
    }

    .btn_edit_sj {
      margin-top: 14px;
      padding: 3px 5px;
      margin-left: 8px;
    }

    .user_content_row {
      font-size: 15px;
      border-bottom: 1px solid #ddd;
      background: white;
      margin-top: 35px;
      margin-left: -50px;
    }

    .user_content_row div:nth-child(1) {
      text-align: center;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .user_content_row div:nth-child(2) {
      text-align: left;
      margin-bottom: 15px;
    }

    #imgHead:hover {
      cursor: pointer;
    }
  </style>
  <script type="text/javascript">
    $(function () {
      $("#user_top_pc_pic,#user_top_sj_pic").show(550);
    });
  </script>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/checkLogin.js"></script>

<!-- 顶部图片 -->
<!-- pc、pad -->
<div class="container" style="padding: 0px">
  <div id="user_top_pc_pic" class="hidden-xs">
    <img alt="background" src="${pageContext.request.contextPath}/images/banner1.jpg">
  </div>
</div>
<!-- 手机 -->
<div id="user_top_sj_pic" class="hidden-md hidden-sm hidden-lg">
  <img alt="background" src="${pageContext.request.contextPath}/images/banner1.jpg">
</div>
<!-- 顶部图片 -->

<!-- 内容 - top -->
<div class="container" id="user_middle_contain_top">
  <div class="row">
    <!--  -->
    <div class="col-md-1 hidden-xs" style="margin-left: -3%;"></div>

    <!-- 左：头像 -->
    <div class="col-md-2 col-xs-4 user_head  wow fadeInDown" data-wow-delay="0.55s">
      <img alt="head" src="${user.headpic}" style="margin-top: -50%;" class="img-responsive img-thumbnail">
    </div>

    <!-- 右 -->
    <div class="col-md-9 col-xs-8">
      <div class="row">
        <!-- 左 -->
        <div class="col-md-10 col-xs-8">
          <!-- pc -->
          <span class="span_pc_username hidden-xs">${user.username}</span>
          <!-- 手机 -->
          <span class="span_sj_username hidden-md hidden-sm hidden-lg">${user.username}</span>
        </div>
        <!-- 右 pc-->
        <c:if test="${user.id == loginUserId}">
          <div class="col-md-2 col-xs-4 hidden-xs">
            <button type="button" class="btn btn-primary btn_edit_pc" data-toggle="modal" data-target="#userEditDialog">
              编&nbsp;&nbsp;辑
            </button>
          </div>
          <!-- 右sj-->
          <div class="col-md-2 col-xs-4 hidden-md hidden-sm hidden-lg">
            <button type="button" class="btn btn-primary btn-xs btn_edit_sj" data-toggle="modal" data-target="#userEditDialog">
              编&nbsp;&nbsp;辑
            </button>
          </div>
        </c:if>
      </div>
      <div class="row user_content_row" style="margin-top: 45px;">
        <div class="col-md-2 col-xs-4">性别</div>
        <div class="col-md-10 col-xs-8">${user.gender==1 ? '男':'女'}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">电话</div>
        <div class="col-md-10 col-xs-8">${user.telephone}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">邮箱</div>
        <div class="col-md-10 col-xs-8">${user.email}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">个性签名</div>
        <div class="col-md-10 col-xs-8">${user.sign}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">个人简介</div>
        <div class="col-md-10 col-xs-8">${user.description}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">上次登录</div>
        <div class="col-md-10 col-xs-8">
          <fmt:formatDate value="${user.lastlogindate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
        </div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">注册时间</div>
        <div class="col-md-10 col-xs-8">
          <fmt:formatDate value="${user.registdate}" pattern="yyyy-MM-dd HH:mm:ss" type="date"/>
        </div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">登录次数</div>
        <div class="col-md-10 col-xs-8">${user.loginnum}</div>
      </div>
      <div class="row user_content_row">
        <div class="col-md-2 col-xs-4">角色</div>
        <div class="col-md-10 col-xs-8">
          <c:if test="${user.role == 0}">超级管理员</c:if>
          <c:if test="${user.role == 1}">管理员</c:if>
          <c:if test="${user.role == 2}">游客</c:if>
        </div>
      </div>
      <br/><br/>
    </div>
    <!-- 右 -->

  </div>
</div>
<!-- 内容 -->

<jsp:include page="footer.jsp"></jsp:include>


<!-- 学生编辑对话框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel_edit">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="myModalLabel_edit">修改个人信息</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" id="edit_user_form" method="post" enctype="multipart/form-data">
          <!-- 用户Id -->
          <input type="hidden" name="id" id="id" value="${user.id}">
          <input type="hidden" name="username" id="username" value="${user.username}">
          <!-- 头像  左右 -->
          <div class="container">
            <div class="row">
              <!-- 第一列 -->
              <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
                <img src="${user.headpic}" id="imgHead" width="140" height="140" alt="..." class="img-responsive img-thumbnail">
                <input type="file" name="fileInput" class="form-control hidden" id="fileInput">
                <input type="hidden" name="headpic" id="headpic" value="${user.headpic}">
              </div>
              <!-- 第二列 -->
              <div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">
                <label for="telephone" class="control-label">电话</label>
                <input type="text" class="form-control" autocomplete="off"
                       id="telephone" name="telephone" placeholder="电话" value="${user.telephone}" style="margin-bottom: 20px;"/>

                <label for="email" class="control-label">邮箱</label>
                <input type="email" class="form-control" autocomplete="off"
                       id="email" name="email" placeholder="邮箱" value="${user.email}"/>
              </div>
            </div>
          </div>

          <!-- 头像下 -->
          <!-- 性别 -->
          <div class="form-group">
            <label for="gender" style="float: left; padding: 20px 15px 0 27px;">性别</label>
            <div class="col-sm-12">
              <select class="form-control" id="gender" name="gender">
                <option value="1"
                        <c:if test="${user.gender == 1}">selected</c:if> >男
                </option>
                <option value="0" <c:if test="${user.gender != 1}">selected</c:if>>女</option>
              </select>
            </div>
          </div>
          <!-- 签名 -->
          <div class="form-group" style="margin-top: 10px;">
            <label for="sign" style="float: left; padding: 7px 15px 0 27px;">签名</label>
            <div class="col-sm-12">
              <input type="text" class="form-control" id="sign" value="${user.sign}" name="sign" autocomplete="off" placeholder="个性签名"/>
            </div>
          </div>
          <!-- 个人简介 -->
          <div class="form-group" style="margin-top: 0px;">
            <label for="description" style="float: left; padding: 7px 15px 0 27px;">个人简介</label>
            <div class="col-sm-12">
								<textarea class="form-control" rows="3" id="description" name="description"
                          placeholder="个人简介">${user.description}</textarea>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="btnUpdateUser">保存修改</button>
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
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
        <div style="text-align: center;margin: 10px 0;" id="modalShowMsg"></div>
      </div>
      <div class="modal-footer">
        <button type="button" id="btnHideModal" class="btn btn-primary" data-dismiss="modal">确定
        </button>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
  //1、当修改框内头像被点击
  $("#imgHead").click(function () {
    $("#fileInput").click();
  });

  //2、上传选择头像
  $("#fileInput").bind("change", function () {

    //判断文件大小
    var f = document.getElementById("fileInput").files;
    var picSize = f[0].size;
    if (picSize > 2090000) {
      showModal("提示", "图片尺寸应小于2M");
      $("#fileInput").val(null);
      return;
    }

    //显示图片
    if (window.FileReader) {
      var reader = new FileReader();
      reader.readAsDataURL(this.files[0]);
      //监听文件读取结束后事件
      reader.onloadend = function (e) {
        $("#imgHead").attr("src", e.target.result);
      };
    }
  });


  //3、点击修改按钮
  $("#btnUpdateUser").bind("click", function () {
    var telephone = $.trim($("#telephone").val());
    var email = $.trim($("#email").val());
    var sign = $.trim($("#sign").val());
    var description = $.trim($("#description").val());

    //手机号 正则表达式匹配
    var reg_tel = /^[1][3,4,5,7,8][0-9]{9}$/;
    if (telephone.length > 0) {
      if (!reg_tel.test(telephone)) {
        showModal("提示", "请输入正确格式的手机号");
        return;
      }
    }

    //邮箱 正则表达式匹配
    var reg_email = /^((([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})[; ,])*(([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})))$/;
    if (email.length > 0) {
      if (!reg_email.test(email)) {
        showModal("提示", "请输入正确格式的邮箱");
        return;
      }
    }
    if (sign.indexOf("<") >= 0) {
      showModal("提示", "请勿使用非法字符,谢谢");
      return;
    }
    if (description.indexOf("<") >= 0) {
      showModal("提示", "请勿使用非法字符,谢谢");
      return;
    }

    //发送ajax请求
    //提交表单
    var formData = new FormData($("#edit_user_form")[0]);
    $.ajax({
      url: "${pageContext.request.contextPath}/user/updateUser.action",
      type: "POST",
      data: formData,
      async: false,
      cache: false,
      contentType: false,
      processData: false,
      success: function (data) {
        if (data.status == 200) {
          showModal("成功", data.msg);
          setTimeout(function () {
            location.href = "${pageContext.request.contextPath}/";
          }, 1200);
        }
        else if (data.status == 201) {
          showModal("失败", data.msg);
        }
        else {
          showModal("失败", "网络连接失败！请重试...");
        }
      }
    });	//ajax
  });


  //打开Modal
  function showModal(title, message) {
    $('#myModal').modal('show');
    $("#myModalLabel").text(title);
    $("#modalShowMsg").text(message);
  }
</script>
</html>