<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<!--validate校验库-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
	<!--国际化库，中文提示-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js" ></script>
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
	<h3 align="center" style="margin-top: 70px"><font color="#8E8E8E">玩家用户注册</font></h3>
	<br>
	<div style="margin-top: 100px ">
    <form class="form-horizontal" role="form" id="Form" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/user/register.action" method="post">
	  	<div class="form-group">
	  		<label for="username" class="col-md-5 control-label">用户名</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="username" id="username" placeholder="用户名">
			    <span id="msg" style="color:#AB82FF;font-weight: bold;"></span>
		  	</div>
	  	</div>
	  	<br>
	  	<div class="form-group">
	  		<label for="password" class="col-md-5 control-label">密码</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="password" id="password" placeholder="密码">
		  	</div>
	  	</div>
	  	<br>
	  	<div class="form-group">
	  		<label for="repassword" class="col-md-5 control-label">确认密码</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="repassword" id="repassword" placeholder="密码">
		  	</div>
	  	</div>
	  	<br>
	  	<div class="form-group">
	  		<label for="password" class="col-md-5 control-label">出生日期</label>	
			<div class="col-md-3">    
			    <input type="date" name="birthday" >
		  	</div>
	  	</div>
	  	<br>
	  	<div class="form-group">
	  		<label for="pic" class="col-md-5 control-label">头像（可选）</label>
			<div class="col-md-3">
				<input type="file" class="form-control" name="pic" id="pic">
		  	</div>
	  	</div>
	  	<br>
	 	<div align="center">
		 	<input type="submit" id="reg" class="btn btn-primary" value="注册">
			<!-- javascript:history.go(-1)返回上一页 -->
			<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 50px">返回</a>	
	    </div>
	</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkUser.js"></script>
	<script type="text/javascript">
	$(function(){
		//名称框失去焦点事件,验证用户名是否存在
		$("#username").blur(function(){
			var username = $(this).val();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/user/findByName.action",
				//定义回调响应的数据格式
				dataType:"json",
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringify({"username":username}),
				success:function(data){
					//alert(data);返回boolean
					//如果用户存在,false
					if(!data){
						//alert("用户名已经存在");
						$("#msg").html("用户名已经存在!!!");
						//设置注册按钮不可点击
						$("#reg").attr("disabled",true);
					}else{
						//删除提示
						$("#msg").html("");
						$("#reg").attr("disabled",false);
					}
				},
			});
		});
	});
	</script>
</body>
</html>