<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
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
	<div style="margin-top: 100px" align="center">
		<font color="#8E8E8E" size="5px">添加玩家用户</font>
	</div>
	<div style="margin-top: 100px ">
    <form class="form-horizontal" role="form" id="Form" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/user/insert.action" method="post">
	  	<div class="form-group">
	  		<label for="username" class="col-md-5 control-label">用户名</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="username" id="username" placeholder="用户名">
			    <span id="msg" style="color:#AB82FF;font-weight: bold; "></span>
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
	  		<label for="birthday" class="col-md-5 control-label">出生日期</label>	
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
		 	<input type="submit" id="reg" class="btn btn-primary" value="确定">
			<!-- javascript:history.go(-1)返回上一页 -->
			<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 50px">返回</a>
	    </div>
	</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkUser.js"></script>
</body>
</html>