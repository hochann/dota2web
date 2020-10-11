<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>英雄详细数据HERODETAIL</title>
</head>
<body>
	<%@ include file="nav.jsp" %>
  	<!--左侧信息  菜单，显示-->
   	<div class="col-xs-2 col-sm-2 col-md-2 col-md-offset-1" id="left_log">
		<div class="list-group" style="margin-top:100px;">
			<a href="javascript:history.go(-1)" class="btn btn-default ana">返回&nbsp;( 英雄列表 )</a>
			<a href="${pageContext.request.contextPath }/user/item.action" class="btn btn-default ana">跳转&nbsp;( 物品列表 )</a>
		</div>
   	</div>
   	<!-- 右侧数据 -->
   	<div class="col-xs-8 col-sm-8 col-md-8 jumbotron" id="right_log">
   	    <div style="background-color:#1E1E1E;margin-bottom:10px">
   			<font class="bj">&nbsp;故事背景</font>
   		</div>
   		<hr color="#5E5E5E">
   		<div class="media">
		  	<div class="col-md-4 thumbnail" style="background-color: #5C5C5C">
		  		<font style="color: #C4C4C4" class="bt">英雄:</font>
		  		<font class="nr">${list.hero_name }</font>
			  	<img src="/pic/${list.hero_img }" alt="暂无图片" class="img-rounded">
		  	</div>
		  	<div class="col-md-7">
		  	<!-- style="font-size: 19px;color: #737373" -->
		  		<font class="bt">背景故事:</font>
		  		<br>
		  		<font class="nr">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.hero_bg }</font>
		  	</div>
		</div>
	    
   		<div>
    		<font class="bt">英雄属性：</font><font class="nr">${list.attr }</font>
    		<br>
   			<font class="bt">英雄类型：</font><font class="nr">${list.type }</font>
   		</div>
   		<!--分割线-->
   		<hr color="#5E5E5E"/>
   		<!--标签页 英雄技能-->
   		<div style="background-color: #1E1E1E">
   			<font class="bj">&nbsp;技能介绍</font>
   		</div>
   		<div class="media">
    		<c:forTokens items="${list.skill }" delims="," var="skill" varStatus="status">
				<div class="media-body" align="center">
					<font size="4px" style="color:#121212">${skill }</font>
			  	</div>
			</c:forTokens>
			<br>
			<c:forTokens items="${list.img }" delims="," var="img" varStatus="status">
		    	<div class="media-body" align="center">
			    	<img src="/pic/${img}">    
			  	</div>
			</c:forTokens>	
			<br>
			<c:forTokens items="${list.detail }" delims="," var="detail" varStatus="status">
			  	<div class="media-body nr" align="center">
			    	<p style="white-space:pre-line;font-size:16px;">
						${detail}
					</p>
			  	</div>
			</c:forTokens>
			<br>
		</div>
	</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
<!-- 引入外部css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/detail.css">
</html>