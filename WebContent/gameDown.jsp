<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>游戏下载</title>
    <!-- jsp页面使用include 标签后引入的外部js失效,删除一个文件中引入的重复js文件即可 -->
</head>
<body>
<!-- 导航 -->
<%@ include file="nav.jsp" %>
<h2 align="center">DOTA2 最新客户端下载</h2>
<div class="row">
 		<!--左侧信息  菜单，显示-->
  	<div class="col-xs-2 col-sm-2 col-md-2" id="left_log">
  		
  	</div>
  	<!--右侧信息 jumbotron巨幕-这是一个轻量、灵活的组件，
  	它能延伸至整个浏览器视口来展示网站上的关键内容。-->
  	<div class="col-xs-9 col-sm-9 col-md-9 jumbotron" id="right_log">
  		<p style="font-size: 20px;">DOTA2 最新客户端下载</p>
  		<p style="font-size: 15px;">更新日期：2018-12-24|文件大小：****;</p>
   	<!--第一行-->
   	<div class="media">
	  	<div class="media-left">
		    <a href="${pageContext.request.contextPath }/res/dota2.zip" download="DOTA2.zip">
			    <div style="width:180px;height:35px;background-color:#6495ED;display:inline-block;text-align: center;">
			      	<span style="color:white;font-size:26px;">游戏下载</span>
			    </div>
		    </a>
	  	</div>
	  	<div class="media-body">
			<img src="img/liuc.png" style="width:700px;margin-left:120px;">
	  	</div>
	</div>
	<!--第二行  右侧-->
	<div class="media">
	  	<div class="media-body">
		    <h2 class="media-heading">官方PC最低配置要求:</h2>
		   	<p style="width: 600px; white-space: pre-line;margin-left: 100px;">
			CPU：	Intel 或 AMD双核(Dual core) 2.8 GHz
			内存：	4 GB
			显卡：	nVidia GeForce 8600/9600GT 或 ATI/AMD Radeon HD2600/3600
			DirectX：	Version 9.0c
			网络：	支持宽带互联网链接
			硬盘空间：	8 GB 可用空间以上
			声卡：	兼容DirectX
			操作系统：	Windows 7
			</p>
	  	</div>
	</div>
<%-- 	<!--图片信息-->
	<div class="media">
		<img src="${pageContext.request.contextPath }/img/journalism-codes.jpg" style="width: 100%;height: auto;"/>
	</div> --%>
  		<!--分割线-->
  		<hr color="#5E5E5E" style="margin-top: 10px;"/>
  	</div>
</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>