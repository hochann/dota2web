<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>dota2管理登录</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
	<style type="text/css">
		body { 
			padding-top: 50px;
			background-image: url("img/bgg.jpg");
			background-size: 100%;
		}
		label{
			color:#DDA0DD;
			font-size: 17px;
		}
	</style>
</head>
<body>
<h3 align="center" style="margin-top: 100px"><font color="#B0B0B0">管理用户登录</font></h3>
<br>
<%-- 	<!-- 提示消息框 -->
 	<c:if test="${msg!=null }">
		<p class="bg-success col-md-2 col-md-offset-5 text-center" style="background-color: #555555">
			<font color="#BA55D3">${msg }</font>
		</p>
	</c:if> --%>
<div style="margin-top: 100px ">
	<form class="form-horizontal" role="form" id="loginForm" method="post"
	action="">
	  	<div class="form-group">
	  		<label for="name" class="col-md-5 control-label">用户名</label>	
			<div class="col-md-2">    
			    <input type="text" class="form-control" name="name" id="name" placeholder="用户名">
		  	</div>
	  	</div>
	  	<br>
	  	<div class="form-group">
	  		<label for="password" class="col-md-5 control-label">密码</label>	
			<div class="col-md-2">    
			    <input type="text" class="form-control" name="password" id="password" placeholder="密码">
		  	</div>
	  	</div>
	 	<div align="center" style="margin-top: 66px">
		 	<input type="button" id="Login" class="btn btn-primary" value="登录">
			<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
</div>
<script type="text/javascript">
	//在键盘按下并释放及提交后验证提交表单
	var va = $("#loginForm").validate({
		rules:{
			name:{
				required:true,
				rangelength:[2,6]
			},
			password:{
				required:true,
				digits:true,
				rangelength:[3,6]
			}
		},
		messages:{
			name:{
				required:"账号不能为空",
				rangelength:"账号为2到6位"
			},
			password:{
				required:"密码不能为空",
				digits:"密码只能是3-6位数字",
				rangelength:"密码为3到6位"
			}
		}
	});
	$('#Login').click(function () {
		var name = $("#name").val();
	    var password = $("#password").val();
	    //va.form()为true时提交
	    if(va.form()){
	        $.ajax({
	            type: "POST",
	            url: "${pageContext.request.contextPath }/user/main.action",
	            data: {"name":name,"password":password},
	            dataType: "json",
	            success: function (data) {
	            	//alert(data.name+data.id);
	            	location.href="${pageContext.request.contextPath }/user/admin.action";
	            },
	            error: function (error) {
	               	alert("登录失败，用户名或密码错误！");
	        	    //回写数据
	                $("#name").val(name);
	                $("#password").val(password);
	            }
	        });
	    }
	});
</script>
</body>
</html>
