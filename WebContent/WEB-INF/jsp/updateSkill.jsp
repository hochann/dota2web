<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>技能修改页面</title>
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
	.wj{
		color:	#EE5C42;
		margin-left: 10px;
	}
</style>
<body>
	<h3 align="center"><font color="#8E8E8E">英雄技能数据修改</font></h3>
	<br>
	<div align="center" style="margin-bottom: 50px;">
		<font color="" size="4px">技能 :<span class="wj">${list.skill }</span></font>
	</div>
	<!-- 修改界面form表单 -->
    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/skill/update.action" 
    method="post" id="Form" enctype="multipart/form-data">
	  	<!-- id隐藏  -->
	  	<input type="hidden" id="sid" name="sid" value="${list.sid }"/>
	  	<div class="form-group">
	  		<label for="skill_id" class="col-md-5 control-label">英雄ID</label>	
			<div class="col-md-3">
				<select class="form-control" name="skill_id" id="skill_id" style="">
				<c:forEach var="hero" items="${hero }">
				<!--实际传递英雄ID，显示英雄名称-->
					<option value="${hero.hid }">
						英雄：${hero.hero_name }
					</option>
					<!--被修改的数据选中-->
					<c:if test="${hero.hid==list.skill_id }">
						<option value="${hero.hid }" selected="selected">
						英雄：${hero.hero_name }
						</option>
					</c:if>
				</c:forEach>
				</select>
			    <%-- <input type="text" value="${list.skill_id }" class="form-control" name="skill_id" id="skill_id"> --%>
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="skill" class="col-md-5 control-label">技能名称</label>	
			<div class="col-md-3">    
			    <input type="text" value="${list.skill }" class="form-control" name="skill" id="skill">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="detail" class="col-md-5 control-label">技能描述</label>	
			<div class="col-md-3">
				<textarea rows="7" class="form-control" name="detail" id="detail" >${list.detail }</textarea>
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="hero_img" class="col-md-5 control-label">技能图片</label>
			<div class="col-md-3"> 
				<c:if test="${list.img !=null}">
					<img id="img" src="/pic/${list.img }" width="80" height="70"/>
				</c:if>
				<!--图片文件上传 -->
				<input type="file" class="form-control" name="pic" id="pic">
		  	</div>
	  	</div>
	  	
	 	<div align="center">
		 	<input type="submit" class="btn btn-primary" value="保存修改" onclick="return confirm('确定修改吗！？')">
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkHeroSkill.js"></script>
</html>