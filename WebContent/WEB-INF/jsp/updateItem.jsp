<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改页面</title>
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
	.wj{
		color:#CFCFCF;
		margin-left: 10px;
	}
</style>
<body>
	<h3 align="center" style="margin-top: 40px;"><font color="#141414">物品数据修改</font></h3>
	<div align="center" style="margin-top: 60px;">
		<font color="#EEC900" size="4px">物品 :<span class="wj">${list.item_name }</span></font>
	</div>
	<br>
	<!-- 修改界面form表单 -->
    <form class="form-horizontal" role="form" action="${pageContext.request.contextPath }/item/update.action" 
    method="post" id="Form" enctype="multipart/form-data">
	  	<!-- id隐藏  -->
	  	<input type="hidden" id="item_id" name="item_id" value="${list.item_id }"/>
	  	<div class="form-group">
	  		<label for="item_name" class="col-md-5 control-label">名称</label>
			<div class="col-md-3">    
			    <input type="text" value="${list.item_name }" class="form-control" name="item_name" id="item_name" placeholder="名称">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_details" class="col-md-5 control-label">物品描述</label>	
			<div class="col-md-3">
				<textarea rows="7" class="form-control" name="item_details" id="item_details" >${list.item_details }</textarea>
			    <%-- <input type="text" value="${list.item_details }" class="form-control" name="item_details" id="item_details" placeholder="物品描述"> --%>
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_img" class="col-md-5 control-label">物品图片</label>
			<div class="col-md-3"> 
				<c:if test="${list.item_img !=null}">
					<img id="item_img" src="/pic/${list.item_img }" width=60 height=50/>
				</c:if>
				<!--图片文件上传 -->
				<input type="file" class="form-control" name="pic" id="pic">
			    <!-- <input type="text" class="form-control" name="hero_img" id="hero_img"> -->
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_price" class="col-md-5 control-label">物品价格</label>	
			<div class="col-md-3">    
			    <input type="text" value="${list.item_price }" class="form-control" name="item_price" id="item_price" placeholder="物品价格">
		  	</div>
	  	</div>
	  	<div class="form-group">
	  		<label for="item_type" class="col-md-5 control-label">属性</label>	
			<div class="col-md-3">
				<input id="sx" value="${list.item_type }" type="hidden"/>
			    <select class="form-control" name="item_type" id="item_type">
					<option id="op1">消耗品</option>
				  	<option id="op2">属性</option>
				  	<option id="op3">军备</option>
				  	<option id="op4">武器</option>
				  	<option id="op5">法器</option>
					<option id="op6">圣物</option>
					<option id="op7">神秘</option>
				</select>
			    <script type="text/javascript">
					//获取属性
					var sx=document.getElementById('sx');
					var v=sx.value;
					//设置下拉框选中
					if(v=="消耗品"){
						document.getElementById('op1').selected="selected"
					}else if(v=="属性"){
						document.getElementById('op2').selected="selected"
					}else if(v=="军备"){
						document.getElementById('op3').selected="selected"
					}else if(v=="武器"){
						document.getElementById('op4').selected="selected"
					}else if(v=="法器"){
						document.getElementById('op5').selected="selected"
					}else if(v=="圣物"){
						document.getElementById('op6').selected="selected"
					}else if(v=="神秘"){
						document.getElementById('op7').selected="selected"
					}			
				</script> 
		  	</div>
	  	</div>
	 	<div align="center">
		 	<input type="submit" class="btn btn-primary" value="保存修改" onclick="return confirm('确定修改mie！？')">
		 	<a href="javascript:history.go(-1)" type="button" class="btn btn-default" 
			style="margin-left: 70px">返回</a>
	    </div>
	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/checkItem.js"></script>
</html>