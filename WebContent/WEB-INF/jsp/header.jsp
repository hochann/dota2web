<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" ></script>
<!--validate校验库-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.validate.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/messages_zh.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js" ></script>
</head>
<title>Insert title here</title>
<script type="text/javascript">
//公用
	$(function(){
		//	全选，全不选  	
		$("#selectAll").click(function(){
//			alert($(this));
/* 			prop() 方法设置或返回被选元素的属性和值。
			当该方法用于返回属性值时，则返回第一个匹配元素的值。
			当该方法用于设置属性值时，则为匹配元素集合设置一个或多个属性/值对 */
			$(".itemSelect").prop("checked",$(this).prop("checked"));
		});
		//测试----多选框的值
		$("#test").click(function(){
/*		获取选中的复选框的value值*/
			var ids =[];
			//遍历class为itemSelect复选框，其中选中的执行函数    
          	 	$(".itemSelect:checked").each(function(){
           		ids.push($(this).val());//将选中的值添加到数组ids中          		
           	});
			//测试打印id数组
           	alert(ids);
		});
	});
</script>
</head>
<body>
	<style type="text/css">
		body { padding-top: 50px; }
	</style>
	<!-- 导航 -->
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
	        <li><a href="javascript:void(0);">新手引导</a></li>
	        <!--新闻包括.... 将下拉菜单触发器和下拉菜单都包裹在 .dropdown里，-->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">资讯新闻<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">官方新闻</a></li>
	            <li><a href="#">赛事新闻</a></li>
	            <li><a href="#">更新日志</a></li>
	          </ul>
	        </li>
	        <!--资料包括.... 将下拉菜单触发器和下拉菜单都包裹在 .dropdown里，-->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">数据资料<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">英雄数据</a></li>
	            <li><a href="#">物品数据</a></li>
	          </ul>
	        </li>
	        <li><a href="#">下载中心</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	<div id="main" class="row">
		<!-- 左侧菜单  -->
	<div class="col-xs-2 col-sm-2 col-md-2" id="left" style="background-color:ghostwhite;">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="${pageContext.request.contextPath }/user/admin.action">首页</a></li>
			<li><a href="${pageContext.request.contextPath }/user/list.action?pageNum=1">用户数据</a></li>
			<li><a href="${pageContext.request.contextPath }/skill/list.action?pageNum=1">英雄技能数据</a></li>
			<li><a href="${pageContext.request.contextPath }/hero/list.action?pageNum=1">英雄数据</a></li>
			<li><a href="${pageContext.request.contextPath }/item/list.action?pageNum=1">物品数据</a></li>
			<li><a href="${pageContext.request.contextPath }/mes/list.action?pageNum=1">评论数据</a></li>
		</ul>
	</div>
</body>
</html>