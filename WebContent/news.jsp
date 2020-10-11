<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${news.type }</title>
    <!-- jsp页面使用include 标签后引入的外部js失效,删除一个文件中引入的重复js文件即可 -->
</head>
<body>
<!-- 导航 -->
<%@ include file="nav.jsp" %>
	<h2 align="center">序号:${news.nid }--${news.title }</h2>
	<p style="color:#EBEBEB;" align="center">
		<fmt:formatDate value="${news.time }" pattern="yyyy-MM-dd" />
	<p>
<div class="row">
 	<!--左侧信息  菜单，显示-->
  	<div class="col-xs-2 col-sm-2 col-md-2" id="left_log">
  		
  	</div>
  	<!--右侧信息 jumbotron巨幕-这是一个轻量、灵活的组件，
  	它能延伸至整个浏览器视口来展示网站上的关键内容。-->
  	<div class="col-xs-9 col-sm-9 col-md-9 jumbotron" id="right_log">
		<div class="media">
		  	<div class="media-body">
		  		<!-- white-space: 如何处理元素中的空白 -->
		  		<p style="width: 600px; white-space: pre-line;margin-left: 100px;font-size:16px;">
					${news.content }
				</p>
		  	</div>
		</div>
	<!--图片二维码信息-->
	<%-- <div class="media">
		<img src="${pageContext.request.contextPath }/img/journalism-codes.jpg" style="width: 100%;height: auto;"/>
	</div> --%>
  		<!--分割线-->
  		<hr color="#5E5E5E"/>
  		<!-- 留言 -->
  		<%@ include file="message.jsp"%>
  	</div>
</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>