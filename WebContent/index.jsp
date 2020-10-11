<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
<title>欢迎进入DOTA2！！</title>
	<!--	导入js文件是要有解析顺序的，比如你的html文件的js代码是在外部写的。
	而且js代码要用jquery的语法。那么你要先导入jquery的js文件。这种关
	系类似于jquery是你写的外部js的子类。所以要先导入jquery插件。否则
	浏览器无法进行解析你的jquery语法。-->
	<!-- <link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script> -->
	<!-- 背景图片的样式-->
<style type="text/css">
	body{
		background-image: url(img/bg2.jpg);
		background-repeat: no-repeat;
		background-size: 100%;
	}
	.list-group-item{
		background: #2B2B2B;
	}
</style>
<!--设置全局的a标签属性，新窗口打开 -->
<!-- <base target="_blank" /> -->

</head>
<body>
   	<%@ include file="nav.jsp" %>
		<!--广告-->
		<div id="ad" style="width:100%;display: none;" align="center">
		<img src="img/deadgame.jpg" width="1600px">
	</div>
	<!--<p class="text-center">图片轮播：</p>-->
	<div class="container" style="width: 100%;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2200">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
				<!-- https://www.dota2.com.cn/article/details/20190116/201911.html -->
					<a href="#" target="_blank">
						<img src="img/01.jpg">
					</a>
				</div>
				<div class="item">
				<!-- https://www.dota2.com.cn/article/details/20181222/201811.html -->
					<a href="${pageContext.request.contextPath }/user/news.action?type=赛事新闻" target="_blank">
						<img src="img/06.jpg">
					</a>
				</div>
				<div class="item">
					<!-- <a href="rubick_zb.html" target="_blank"> -->
					<a href="#" target="_blank">
						<img src="img/03.jpg">
					</a>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>
		</div> 
	</div>
	<!--<p class="text-center">杂项内容：</p>-->
	<!--内容面板-->
	<div id="main" class="row">
	<!--列偏移,使用 .col-md-offset-* 类可以将列向右侧偏移。
		例如，.col-md-offset-4 类将 .col-md-4 元素向右侧偏移了4个列（column）的宽度。-->
			<!--新闻中心 面版 -情境效果 -->
			<div class="col-xs-5 col-sm-5 col-md-3 col-md-offset-1" >
				<!--面版-->
				<div class="panel panel-info" style="margin-top: 30px; background-color: #080808">
					<!--面版标题-->
					<div class="panel-heading" style="background-color:#121212">
						<h2 class="panel-title" style="color: ghostwhite;">
							<span class="glyphicon glyphicon-eye-open"></span>&nbsp;&nbsp;&nbsp;新闻中心
						</h2>
					</div>		
				  	<!--徽章给链接、导航等元素嵌套 <span class="badge"> 元素，
				  	可以很醒目的展示新的或未读的信息条目。
				  	给列表组加入徽章组件，它会自动被放在右边。-->
				  	<ul class="list-group">
						<li class="list-group-item">
							<span class="badge" >2019-04-15</span>
							<a href="${pageContext.request.contextPath }/user/news.action?type=官方新闻">英雄修炼渐近尾声 冲击排名争TI9门票</a>
						</li>
						<li class="list-group-item">
							<span class="badge">2019-04-19</span>
							<a href="${pageContext.request.contextPath }/user/news.action?type=赛事新闻">吹响城市集结号 2019完美世界城市挑战赛（春季赛）报名今日开启</a>
						</li>
						<li class="list-group-item">
							<span class="badge">2018-12-28</span>
							<a href="rubick_zb.html" target="_blank">1个至宝=115个英雄特效 最“绿”至宝拉比克“魔导师密钥”登场</a>
						</li>
						<!-- <li class="list-group-item">
							<span class="badge">2018-12-20</span>
							<a>凌霜圣地：迎霜节奇谈</a>
						</li> -->
					</ul>
				</div>
			</div>
			<!--版本更新 -->
			<div class="col-xs-5 col-sm-5 col-md-3">
				<!--面版-->
				<div class="panel panel-info" style="margin-top: 30px; background-color: #080808">
					<!--面版标题 -->
					<div class="panel-heading" style=" background-color:#121212">
						<h2 class="panel-title" style="color: ghostwhite;"><span class="glyphicon glyphicon-retweet"></span>&nbsp;&nbsp;&nbsp;版本更新</h2>
					</div>
				  	<!--为列表中的条目添加情境类，默认样式或
				  	链接列表都可以。还可以为列表中的条目设置 .active 状态。-->
				  	<div class="list-group">
					  <a href="${pageContext.request.contextPath }/user/news.action?type=更新日志" class="list-group-item list-group-item-success">游戏性更新 7.21c平衡性改动</a>
					  <a href="${pageContext.request.contextPath }/updateLog.jsp" class="list-group-item list-group-item-info">游戏性更新 7.20平衡性改动</a>
					  <a href="${pageContext.request.contextPath }/updateLog.jsp" class="list-group-item list-group-item-warning">游戏性更新 7.07c平衡性改动</a>
					  <a href="${pageContext.request.contextPath }/updateLog.jsp" class="list-group-item list-group-item-danger">游戏性更新 7.02平衡性改动</a>
					</div>
				</div>	
			</div>
			<!--游戏公告 -->
			<div class="col-xs-5 col-sm-5 col-md-4">
				<!--面版-->
				<div class="panel panel-info" style="margin-top: 30px; background-color: #080808">
					<!--面版标题 -->
					<div class="panel-heading" style=" background-color:#121212">
						<h2 class="panel-title" style="color: ghostwhite;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;&nbsp;游戏公告</h2>
					</div>
				  	<div class="list-group">
						<a href="javascript:void(0)" class="list-group-item list-group-item-success">
							<h3>DOTA2真视界——TI8总决赛纪录片</h3>
						 	两支队伍，十人追梦。冠军神盾终究只有一面，胜利者喜悦的同时，
						 	也注定会有失意者的落寞。2019再战上海，风霜后的果实才分外甜美。
						 	<br />
						 	<br />
						 	<p align="right">----2019-01-16</p>
						</a>
					</div>
				</div>	
			</div>
	</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
<!--广告-->
<script>
	$(function(){
		//开启一个定时器 2秒之后展示div
		setTimeout(showAd,2000);
	});	
	//编写展示的方法
	function showAd(){
		//获取div,调用效果
		//$("#ad").show(1000);
		//$("#ad").slideDown(1000);
		$("#ad").fadeIn(1000);
		//开启另一个隐藏的定时器
		setTimeout("hideAd()",3000);
	}	
	//编写隐藏方法
	function hideAd(){
		//$("#ad").hide(1000);
		//$("#ad").slideUp(1000);
		$("#ad").fadeOut(1000);
	}			
	//设置轮播图切换3s
	$(function(){
		$('.carousel').carousel({
		  interval: 3000
		})
	})
</script>
</html>