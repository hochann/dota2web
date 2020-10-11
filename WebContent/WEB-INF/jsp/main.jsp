<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>dota2管理界面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
		body { padding-top: 50px; }
	</style>
</head>
<body>
	<!-- 导入导航，和左侧菜单 -->
	<%@ include file="header.jsp" %>
	<div class="alert alert-info col-md-3 col-md-offset-3" align="center" role="alert" style="margin-top: 66px">
		欢迎 '${admin.name }' 来到
		<span>
			<img src="${pageContext.request.contextPath }/img/u=1373107861,723230692&fm=27&gp=0.jpg" width="44px">
		</span>
		数据管理后台！
		<div class="col-md-3">
			<p style="color: #EE2C2C">请选择功能模块</p>
			<div id="jt">
			<span class="glyphicon glyphicon-arrow-left" style="font-size: 30px"></span>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		setInterval(function(){
			//淡入淡出
			$("#jt").fadeToggle("slow");
		}, 300);
	</script>
</body>
</html>
