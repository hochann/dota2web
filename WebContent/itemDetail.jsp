<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物品详细数据ITEMDETAIL</title>
</head>
<body>
	<%@ include file="nav.jsp" %>
  	<!--左侧信息  菜单，显示-->
   	<div class="col-xs-2 col-sm-2 col-md-2 col-md-offset-1" id="left_log">
		<div class="list-group" style="margin-top:100px;">
			<a href="${pageContext.request.contextPath }/user/hero.action" class="btn btn-default ana">跳转&nbsp;( 英雄列表 )</a>
			<a href="javascript:history.go(-1)" class="btn btn-default ana">返回&nbsp;( 物品列表 )</a>
		</div>
   	</div>
   	<!-- 右侧数据 -->
   	<div class="col-xs-8 col-sm-8 col-md-8 jumbotron" id="right_log">
   	    <div style="background-color: #1E1E1E;margin-bottom: 10px">
   			<font class="bj">&nbsp;物品背景</font>
   		</div>
   		<hr color="#5E5E5E">
   		<div class="media">
		  	<div class="col-md-4 thumbnail" style="background-color: #5C5C5C">
		  		<font style="color: #C4C4C4" class="bt">物品:</font>
		  		<font class="nr">${list.item_name }</font>
			  	<img src="/pic/${list.item_img }" alt="暂无图片" class="img-rounded" style="width:200px;">
		  	</div>
		  	<div class="col-md-7">
		  	<!-- style="font-size: 19px;color: #737373" -->
		  		<font class="bt">物品描述:</font>
		  		<%-- <font class="nr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.item_details }</font> --%>
		  		<!-- white-space: 如何处理元素中的空白 -->
		  		<p style="width:550px;white-space:pre-line;font-size:16px;" class="nr">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.item_details }
				</p>
		  	</div>
		</div>
   		<div>
    		<font class="bt">物品价格：</font>
    		<img src="${pageContext.request.contextPath }/img/gold.png">
    		<font class="nr">${list.item_price }</font>
    		<br>
   			<font class="bt">物品类型：</font>
   			<img src="${pageContext.request.contextPath }/img/itemcat_secret.png">
   			<font class="nr">${list.item_type }</font>
   		</div>
   		<!--分割线-->
   		<hr color="#5E5E5E"/>
	</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
<!-- 引入外部css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/detail.css">
</html>