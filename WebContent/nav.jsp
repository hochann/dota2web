<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>导航</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    </head>
    <!-- 背景图片的样式-->
	<style type="text/css">
		body{
			background-image: url(${pageContext.request.contextPath }/img/bg2.jpg);
			background-repeat: no-repeat;
			background-size: 100%;
		}
	</style>
	<script type="text/javascript">
		var log = '更新日志';
	</script>
    <body>
    	<!--navbar-fixed-top固定的导航条,需要为 body元素设置内补（padding）
    	这个固定的导航条会遮住页面上的其它内容，除非你给 <body>元素底部设置了 padding。
		导航条的默认高度是 50px。-->
		<style type="text/css">
			body { padding-top: 50px; }
		</style>
		<!--反色的导航条,通过添加 .navbar-inverse 类可以改变导航条的外观。-->
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  <div class="container-fluid">
		    <div class="navbar-header" style="margin-left: 40px;">
		      <!--移动端显示，菜单---切换导航-->
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <!--logo 图片-->
		      <img src="${pageContext.request.contextPath }/img/logo.jpg" alt="DOTA2" height="50px" width="100px"/>
		      <a class="navbar-brand" href="#">欢迎来到DOTA2！</a>
		    </div>
		
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
		        <li><a href="${pageContext.request.contextPath }/guide.jsp">新手引导</a></li>
		        <!--新闻包括.... 将下拉菜单触发器和下拉菜单都包裹在 .dropdown里，-->
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资讯新闻<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${pageContext.request.contextPath }/user/news.action?type=官方新闻">官方新闻</a></li>
		            <li><a href="${pageContext.request.contextPath }/user/news.action?type=赛事新闻">赛事新闻</a></li>
		            <li><a href="${pageContext.request.contextPath }/user/news.action?type=更新日志">更新日志</a></li>
		          </ul>
		        </li>
		        <!--资料包括.... 将下拉菜单触发器和下拉菜单都包裹在 .dropdown里，-->
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">数据资料<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${pageContext.request.contextPath }/user/hero.action">英雄数据</a></li>
		            <li><a href="${pageContext.request.contextPath }/user/item.action">物品数据</a></li>
		          </ul>
		        </li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">官方数据<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${pageContext.request.contextPath }/user/teams.action?num=0" target="_blank">战队TEAMS</a></li>
		            <li><a href="${pageContext.request.contextPath }/user/player.action?num=0" target="_blank">玩家player</a></li>
		          </ul>
		        </li>
		        <li><a href="${pageContext.request.contextPath }/gameDown.jsp">下载中心</a></li>
		      </ul>
		      <!--navbar-right 右侧登录，显示用户信息，头像等-->
		      <ul class="nav navbar-nav navbar-right" style="margin-right: 30px;">
		      	<!--<li><button type="button" class="btn btn-link" style="margin-top: 7;">登录</button></li>-->
		      	<c:if test="${user.username==null }">
			      	<li style="margin-right: 10px;"><a href="${pageContext.request.contextPath }/user/toLogin.action">登录</a></li>
			      	<li style="margin-right: 10px;"><a href="${pageContext.request.contextPath }/user/toRegister.action">注册</a></li>
			   	</c:if>
			   	<c:if test="${user.username!=null }">
			   		<li style="margin-right: 10px;"><a href="${pageContext.request.contextPath }/user/exit.action" onclick="return confirm('确定退出？')">退出</a></li>
			   		<li style="margin-right: 10px;"><a href="${pageContext.request.contextPath }/user/select.action?uid=${user.uid}">${user.username}</a></li>
			   	</c:if>
		        <!--头像-->
		        <c:if test="${user.img!=null }">
		        	<a href="${pageContext.request.contextPath }/user/select.action?uid=${user.uid}">
		        	<img src="/pic/${user.img }" alt="头像" class="img-circle" height="40px" width="40px" style="margin-top: 6px;">
		        	</a>
		        </c:if>
		      </ul>
		    </div>
		  </div>
		</nav>
 	</body>
</html>