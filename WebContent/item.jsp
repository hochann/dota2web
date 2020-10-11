<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品数据ITEM</title>
	<link href="${pageContext.request.contextPath }/css/item.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="nav.jsp" %>
	<div style="margin: 25px;">
		<form action="${pageContext.request.contextPath }/user/searchItem.action" method="post">
			<%-- <input type="text" name="condition" class="col-md-2 col-md-offset-4" value="${condition }" 
			placeholder="请输入.." style="background-color:#C1CDC1"> --%>
			<div class="col-md-1 col-md-offset-4">
				<select class="form-control" name="price" id="price" style="width:115px;">
					<option value="">按价格排序</option>
					<option value="asc">正序</option>
				  	<option value="desc">倒序</option>
				  	<%-- <c:if test="${query.price!=null }">
						<option selected="selected">${query.price }</option>
					</c:if> --%>
				</select>
		  	</div>
			<div class="col-md-1">
				<select class="form-control" name="type" id="type">
					<option value="">请选择</option>
					<option>属性</option>
				  	<option>消耗品</option>
				  	<option>军备</option>
				  	<option>武器</option>
				  	<option>法器</option>
				  	<option>神秘</option>
				  	<option>圣物</option>
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
	<p class="text-center" style="color:#F0FFF0">物品数据：
		<c:if test="${query.price!=null }">
			排序方式 ：${query.price }
		</c:if>
		<c:if test="${query.type!=null }">
			&nbsp;&nbsp;类型 ：${query.type }
		</c:if>
	</p>
	<c:forEach items="${list }" var="list">
		<div class="col" style="margin-left: 60px;">
	  		<div class="col-xs-6 col-md-2" style="margin-bottom: 33px">
		  		<font size="4" color="#E0EEE0" style="margin-left:5px;">${list.item_name }</font>
		  		<br>
		  		<font size="3" color="#FFC125" style="margin-left:5px"><img src="${pageContext.request.contextPath }/img/gold.png"> ${list.item_price }</font>
		  		<font size="3" color="#B4CDCD"><img src="${pageContext.request.contextPath }/img/itemcat_secret.png" width="33px;">${list.item_type }</font>
				<br>
				<a href="${pageContext.request.contextPath }/user/itemDetail.action?id=${list.item_id}">
	     			<img src="/pic/${list.item_img }" alt="暂无图片" id="item_img"
	     			width="170px" class="img-thumbnail itemImg">
     			</a>
	  		</div>
		</div>
	</c:forEach>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>