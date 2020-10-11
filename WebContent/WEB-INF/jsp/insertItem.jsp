<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加物品</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
</head>
<style type="text/css">
	body{
		background-image: url(${pageContext.request.contextPath }/img/bg3.jpg);
		background-repeat: no-repeat;
		background-size: 100%;
	}
	label{
		color:#EEC900;
	}
</style>
<body>
	<h3 align="center" style="margin-top: 80px;"><font color="#141414">物品数据添加</font></h3>
	<div align="center" style="margin-top: 120px;">
	<form class="form-horizontal" role="form" id="Form" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/item/insert.action" method="post">
	  	<div class="form-group">
	  		<label for="item_name" class="col-md-5 control-label">名称</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="item_name" id="item_name" placeholder="名称">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_details" class="col-md-5 control-label">物品描述</label>	
			<div class="col-md-3">
				<textarea rows="7" class="form-control" name="item_details" id="item_details"></textarea>
			    <!-- <input type="text" class="form-control" name="item_details" id="item_details" placeholder="物品描述"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="pic" class="col-md-5 control-label">物品图片</label>	
			<div class="col-md-3">    
				<input type="file" class="form-control" name="pic" id="pic">
			    <!-- <input type="text" class="form-control" name="hero_img" id="hero_img" placeholder="名称"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_price" class="col-md-5 control-label">物品价格</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="item_price" id="item_price" placeholder="物品价格">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_type" class="col-md-5 control-label">类型</label>	
			<div class="col-md-3">    
				<select class="form-control" name="item_type" id="item_type">
					<option>消耗品</option>
				  	<option>属性</option>
				  	<option>军备</option>
				  	<option>武器</option>
				  	<option>法器</option>
					<option>圣物</option>
					<option>神秘</option>
				</select>
			    <!-- <input type="text" class="form-control" name="item_type" id="item_type" placeholder="属性"> -->
		  	</div>
	  	</div>
	 	<div align="center">
		 	<button type="submit" class="btn btn-primary" onclick="return confirm('确定提交吗！？')">保存提交</button> 
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>	
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkItem.js"></script>
</html>