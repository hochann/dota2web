<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加英雄</title>
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
	label{
		color:#EE2C2C;
	}
</style>
<body>
	<h3 align="center"><font color="#8E8E8E">英雄数据添加</font></h3>
	<br>
	<div align="center" style="margin-bottom:50px ">
		<font color="#EE2C2C" size="4px">请输入数据data：</font>
	</div>
	<form class="form-horizontal" role="form" id="Form" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/hero/insert.action" method="post">
	  	<div class="form-group">
	  		<label for="hero_name" class="col-md-5 control-label">名称</label>	
			<div class="col-md-3">    
			    <input type="text" class="form-control" name="hero_name" id="hero_name" placeholder="名称">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="hero_bg" class="col-md-5 control-label">英雄背景</label>	
			<div class="col-md-3">    
				<!--设置textarea光标默认为第一行第一个字符,textarea中不要有空格或是其他的字符 -->
			   	<textarea rows="7" class="form-control" name="hero_bg" id="hero_bg"></textarea>
			    <!-- <input type="text" class="form-control" name="hero_bg" id="hero_bg" placeholder="英雄背景"> -->
		  	</div>
	  	</div>
	  	<!-- <div class="form-group">
	  		<label for="skill" class="col-md-5 control-label">英雄技能</label>	
			<div class="col-md-3">
				<input type="text" class="form-control" name="skill" id="skill" placeholder="技能ID">
		  	</div>
	  	</div> -->
	  	<div class="form-group">
	  		<label for="pic" class="col-md-5 control-label">英雄头像</label>	
			<div class="col-md-3">
				<input type="file" class="form-control" name="pic" id="pic">
			    <!-- <input type="text" class="form-control" name="hero_img" id="hero_img" placeholder="名称"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="attr" class="col-md-5 control-label">属性</label>	
			<div class="col-md-3">
				<select class="form-control" name="attr" id="attr">
					<option>敏捷</option>
				  	<option>力量</option>
					<option>智力</option>
				</select>
				<!-- <input type="radio" class="form-control" name="attr" id="attr"> -->	    
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="type" class="col-md-5 control-label">类型</label>	
			<div class="col-md-3">
				<label>
					<input type="checkbox" name="type" value="近战">近战
				</label>
				<label>
					<input type="checkbox" name="type" value="远程">远程
				</label>
				<label>
					<input type="checkbox" name="type" value="核心">核心
				</label>
				<label>
					<input type="checkbox" name="type" value="辅助">辅助
				</label>
				<label>
					<input type="checkbox" name="type" value="控制">控制
				</label>
				<label>
					<input type="checkbox" name="type" value="爆发">爆发
				</label>
				<label>
					<input type="checkbox" name="type" value="推进">推进
				</label>
		  	</div>
	  	</div>
	 	<div align="center">
<!-- 		 	<button type="submit" class="btn btn-primary" onclick="return confirm('确定提交mie！？')">保存提交</button>  -->
		 	<input type="submit"  class="btn btn-primary" value="保存提交">
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
	
<!-- 	<script type="text/javascript">
	$(function() {
		var jz = $("input[value='近战']");
		var yc = $("input[value='远程']");
		$("input[value='远程']").attr("checked","checked");
		if(jz.prop("checked")){
			yc.attr("checked",false);
		}else if(yz.prop("checked")){
			jz.attr("checked",false);
		}
	})
	</script> -->
</body>
<!-- 检验英雄  -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkHero.js"></script>
</html>