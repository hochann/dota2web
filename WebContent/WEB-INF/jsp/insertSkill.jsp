<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加英雄技能</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
</head>
<style type="text/css">
	body{
		background-image: url(${pageContext.request.contextPath }/img/bg2.jpg);
		background-repeat: no-repeat;
		background-size: 100%;
	}
</style>
<body>
	<h3 align="center"><font color="#8E8E8E">英雄技能数据添加</font></h3>
	<br>
	<div align="center" style="margin-bottom: 50px">
		<font color="#00CD66" size="4px">请输入数据data：</font>
	</div>
	<form class="form-horizontal" role="form" id="Form" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/skill/insert.action" method="post">
	  	<div class="form-group">
	  		<label for="skill_id" class="col-md-5 control-label">英雄ID</label>
			<div class="col-md-3">
				<select class="form-control" name="skill_id" id="skill_id" style="">
				<c:forEach var="list" items="${list }">
				<!--实际传递英雄ID，显示英雄名称-->
					<option value="${list.hid }">
						英雄：${list.hero_name }
					</option>
				</c:forEach>
				</select>
			    <!-- <input type="text" class="form-control" name="skill_id" id="skill_id" placeholder="英雄ID"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="skill" class="col-md-5 control-label">技能名称</label>	
			<div class="col-md-3">
			    <input type="text" class="form-control" name="skill" id="skill" placeholder="技能名称">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="pic" class="col-md-5 control-label">技能图片</label>	
			<div class="col-md-3">    
				<input type="file" class="form-control" name="pic" id="pic">
			    <!-- <input type="text" class="form-control" name="hero_img" id="hero_img" placeholder="名称"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="detail" class="col-md-5 control-label">技能描述</label>	
			<div class="col-md-3">    
			    <textarea rows="6" cols="" class="form-control" name="detail" id="detail"></textarea>
			    <!-- <input type="text" class="form-control" name="item_price" id="item_price" placeholder="物品价格"> -->
		  	</div>
	  	</div>
	 	<div align="center">
		 	<button type="submit" class="btn btn-primary" onclick="return confirm('确定提交mie！？')">保存提交</button> 
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkHeroSkill.js"></script>
</html>