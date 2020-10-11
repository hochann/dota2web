<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title> 
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<!--validate校验库-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
</head>
<style type="text/css">
	body{
		background-image: url(${pageContext.request.contextPath }/img/bg3.png);
		background-repeat: no-repeat;
		background-size: 100%;
	}
	label{
		color:#AB82FF;
	}
</style>
<body>
	<h3 align="center" style="margin-top: 70px"><font color="#8E8E8E">玩家用户登录</font></h3>
	<br>
	<div style="margin-top: 100px ">
	<form class="form-horizontal" role="form" id="loginForm" method="post"
	action="">
	  	<div class="form-group">
	  		<label for="username" class="col-md-5 control-label">用户名</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="username" id="username" placeholder="用户名">
		  	</div>
	  	</div>
	  	<div class="form-group" style="margin-top:80px;">
	  		<label for="password" class="col-md-5 control-label">密码</label>	
			<div class="col-md-3">    
			    <input type="password" class="form-control" name="password" id="password" placeholder="密码">
		  	</div>
	  	</div>
	  	<br>
	 	<div align="center">
		 	<!-- <button class="btn btn-primary" onclick="login()">登录</button> -->
		 	<input type="button" id="Login" class="btn btn-primary" value="登录">
			<!-- javascript:history.go(-1)返回上一页 -->
			<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
		<div align="center">
			<a href="${pageContext.request.contextPath }/register.jsp" >
			<button type="button" class="btn btn-link" style="margin-top: 50px;color:#48D1CC ">没有账号？请去注册</button>
			</a>
		</div>
	</div>
<script type="text/javascript">
	// 在键盘按下并释放及提交后验证提交表单
	var va = $("#loginForm").validate({
		rules:{
			username:{
				required:true,
				rangelength:[2,8]
			},
			password:{
				required:true,
				digits:true,
				rangelength:[3,9]
			}
		},
		messages:{
			username:{
				required:"用户名不能为空",
				rangelength:"用户名为2到8位"
			},
			password:{
				required:"密码不能为空",
				digits:"密码只能是3-9位数字",
				rangelength:"密码为3到9位"
			}
		}
	});
	$('#Login').click(function () {
		var username = $("#username").val();
	    var password = $("#password").val();
        //va.form()为true时提交
        if(va.form()){
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath }/user/login.action",
                data: {"username":username,"password":password},
                dataType: "json",
                success: function (data) {
                	//alert(data.username);
                	location.href="${pageContext.request.contextPath }/index.jsp";
                },
                error: function (error) {
	               	alert("登录失败，用户名或密码错误！");
	        	    //回写数据
	                $("#username").val(username);
	                $("#password").val(password);
                }
            });
        }
    });
</script>
</body>
</html>