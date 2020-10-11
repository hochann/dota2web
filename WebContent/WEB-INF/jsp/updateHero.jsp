<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>英雄修改页面</title>
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
	.wj{
		color:#B4CDCD;
		margin-left: 10px;
	}
</style>
<body>
	<h3 align="center"><font color="#8E8E8E">英雄数据修改</font></h3>
	<br>
	<div align="center" style="margin-bottom:50px ">
		<font color="#EE2C2C" size="4px">英雄 :<span class="wj">${list.hero_name }</span></font>
	</div>
	<!-- 修改界面form表单 -->
    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/hero/update.action" 
    method="post" id="Form" enctype="multipart/form-data">
	  	<!-- id隐藏  -->
	  	<input type="hidden" id="hid" name="hid" value="${list.hid }"/>
	  	<div class="form-group">
	  		<label for="hero_name" class="col-md-5 control-label">名称</label>	
			<div class="col-md-3">    
			    <input type="text" value="${list.hero_name }" class="form-control" name="hero_name" id="hero_name" placeholder="名称">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="hero_bg" class="col-md-5 control-label">英雄背景</label>	
			<div class="col-md-3">
				<textarea rows="7" class="form-control" name="hero_bg" id="hero_bg" >${list.hero_bg }</textarea>
			    <%-- <input type="text" value="${list.hero_bg }" class="form-control" name="hero_bg" id="hero_bg" placeholder="英雄背景"> --%>
		  	</div>
	  	</div>
	  	<!-- <div class="form-group">
	  		<label for="skill" class="col-md-5 control-label">英雄技能</label>	
			<div class="col-md-3">
				<input type="text" class="form-control" name="skill" id="skill" placeholder="技能ID">
		  	</div>
	  	</div> -->
	  	<div class="form-group">
	  		<label for="hero_img" class="col-md-5 control-label">英雄头像</label>
			<div class="col-md-3"> 
				<c:if test="${list.hero_img !=null}">
					<img id="hero_img" src="/pic/${list.hero_img }" width=80 height=50/>
				</c:if>
				<!--图片文件上传 -->
				<input type="file" class="form-control" name="pic" id="pic">
			    <!-- <input type="text" class="form-control" name="hero_img" id="hero_img"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="attr" class="col-md-5 control-label">属性</label>	
			<div class="col-md-3">
				<input id="sx" value="${list.attr }" type="hidden"/>
				<select class="form-control" name="attr" id="attr" >
					<option id="op1">敏捷</option>
				  	<option id="op2">力量</option>
					<option id="op3">智力</option>
				</select>
				<script type="text/javascript">
					//获取英雄属性
					var sx=document.getElementById('sx');
					var v=sx.value;
					//设置下拉框选中
					if(v=="敏捷"){
						document.getElementById('op1').selected="selected"
					}else if(v=="力量"){
						document.getElementById('op2').selected="selected"
					}else if(v=="智力"){
						document.getElementById('op3').selected="selected"
					}				
				</script>
			    <%-- <input type="text" value="${list.attr }" class="form-control" name="attr" id="attr" placeholder="属性"> --%>
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="type" class="col-md-5 control-label">类型</label>	
			<div class="col-md-3">
				<input id="type" value="${list.type }" type="hidden"/>
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
		  	<script type="text/javascript">
				//获取英雄类型
				var type=document.getElementById('type');
				var v=type.value;
				//alert(v);
			</script>
	  	</div>
	 	<div align="center">
		 	<input type="submit" class="btn btn-primary" value="保存修改" onclick="return confirm('确定修改么？')">
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkHero.js"></script>
</html>