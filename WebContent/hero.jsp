<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>英雄数据HERO</title>
<link href="${pageContext.request.contextPath }/css/item.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="nav.jsp" %>
	<div style="margin: 25px;">
		<form action="${pageContext.request.contextPath }/user/searchHero.action" method="post">
			<%-- <input type="text" name="condition" class="col-md-2 col-md-offset-2" value="${condition }" 
			placeholder="请输入..简单搜索" style="background-color:"> --%>
			<div class="col-md-1 col-md-offset-4">
				<select class="form-control" name="attr" id="attr">
					<option value="">请选择</option>
					<option>敏捷</option>
				  	<option>力量</option>
					<option>智力</option>
					<!--被修改的数据选中-->
					<%-- <c:if test="${query.attr!=null }">
						<option selected="selected">${query.attr }</option>
					</c:if> --%>
				</select>
		  	</div>
			<div class="col-md-1">
				<select class="form-control" name="type" id="type">
					<option value="">请选择</option>
					<option>近战</option>
				  	<option>远程</option>
				  	<option>核心</option>
				  	<option>辅助</option>
				  	<option>控制</option>
				  	<option>爆发</option>
				  	<option>推进</option>
				  	<%-- <c:if test="${query.type!=null }">
						<option selected="selected">${query.type }</option>
					</c:if> --%>
				</select>
		  	</div>
			<button type="submit" class="btn" style="margin-left:30px">
				搜索&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
			</button>
		</form>
		<!-- 提示    消息框 -->
		<p class="bg-info">${msg }</p>
	</div>
	<p class="text-center" style="color:#F0FFF0">英雄数据：
		<c:if test="${query.attr!=null }">
			属性 ：${query.attr }
		</c:if>
		<c:if test="${query.type!=null }">
			&nbsp;&nbsp;类型 ：${query.type }
		</c:if>
	</p>
	<c:forEach items="${list }" var="list">
		<div class="col" style="margin-left: 60px;">
	  		<div class="col-xs-6 col-md-3 " style="margin-bottom: 30px">
		  		<font size="4" color="#E0EEE0" style="margin-left: 10px">${list.hero_name }</font> 
		  		<font size="3" color="#B4CDCD" style="margin-left: 20px">属性:${list.attr }</font>
				<br>
				<a href="${pageContext.request.contextPath }/user/heroDetail.action?id=${list.hid}">
	     			<img src="/pic/${list.hero_img }" alt="暂无图片" onerror="this.src='${pageContext.request.contextPath }/img/logo.jpg'"
	     			width="200px" class="img-thumbnail itemImg">
     			</a>
	  		</div>
		</div>
	</c:forEach>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>