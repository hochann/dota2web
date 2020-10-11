<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>更新日志</title>
    <!-- jsp页面使用include 标签后引入的外部js失效,删除一个文件中引入的重复js文件即可 -->
</head>
<body>
<!-- 导航 -->
<%@ include file="nav.jsp" %>
<h2 align="center">DOTA2 12月10日更新日志：7.20e平衡性更新</h2>
<div class="row">
 		<!--左侧信息  菜单，显示-->
  	<div class="col-xs-2 col-sm-2 col-md-2" id="left_log">
  		
  	</div>
  	<!--右侧信息 jumbotron巨幕-这是一个轻量、灵活的组件，
  	它能延伸至整个浏览器视口来展示网站上的关键内容。-->
  	<div class="col-xs-9 col-sm-9 col-md-9 jumbotron" id="right_log">
  		<p style="font-size: 20px;">英雄:</p>
   	<!--第一行-->
   	<div class="media">
	  	<div class="media-left">
		    <a href="">
		      <img id="img1" class="media-object" src="${pageContext.request.contextPath }/img/meepo_full.png">
		    </a>
	  	</div>
	  	<div class="media-body">
		    <h4 class="media-heading">米波：</h4>
			敏捷成长从2.2降低至1.4<br />
			忽悠伤害从80/100/120/140降低至70/90/110/130<br />
			洗劫敌方英雄生命值窃取从8/12/16/20降低至6/10/14/18<br />
			10级天赋从+15攻击力减少至+10<br />
			15级天赋从+10%吸血替换为+15%闪避<br />
			20级天赋从+15%闪避替换为+10%吸血<br />
			25级天赋从+600生命降低至+400
	  	</div>
	</div>
	<!--第二行  右侧-->
	<div class="media">
	  	<div class="media-body">
		    <h4 class="media-heading">kaer:</h4>
		         敏捷成长从2.2降低至1.4<br />
			忽悠伤害从80/100/120/140降低至70/90/110/130<br />
			洗劫敌方英雄生命值窃取从8/12/16/20降低至6/10/14/18<br />
			10级天赋从+15攻击力减少至+10<br />
			15级天赋从+10%吸血替换为+15%闪避<br />
			20级天赋从+15%闪避替换为+10%吸血<br />
			25级天赋从+600生命降低至+400
	  	</div>
	  	<div class="media-right">
		    <img class="media-object" src="${pageContext.request.contextPath }/img/invoker_full.png">
	  	</div>
	</div>
	<!--第三行-->
	<div class="media">
	  	<div class="media-left">
		    <img class="media-object" src="${pageContext.request.contextPath }/img/slark_full.png">
	  	</div>
	  	<div class="media-body">
		    <h4 class="media-heading">斯拉克：</h4>
			现在只有亲手杀死敌人才能窃取敏捷<br />
			突袭束缚时间从3.5调整为2.75/3/3.25/3.5<br />
			突袭束缚范围从325提高至350<br />
			暗影之舞冷却时间从60秒提高至80/70/60秒<br />
			20级天赋从+3秒突袭束缚时间更改为+2秒
	  	</div>
	</div>
	<br>
	<p style="font-size: 20px;">物品:</p>
	<div class="media">
	  	<div class="media-left">
		    <img class="media-object" src="${pageContext.request.contextPath }/img/wraith_band_lg.png" width="140" height="110">
	  	</div>
	  	<div class="media-body">
		    <h4 class="media-heading">怨灵系带：</h4>
			攻击速度加成从+8降低至+7
	  	</div>
	</div>
	<!--图片信息-->
	<div class="media">
		<img src="${pageContext.request.contextPath }/img/journalism-codes.jpg" style="width: 100%;height: auto;"/>
	</div>
  		<!--分割线-->
  		<hr color="#5E5E5E"/>
  		<!-- 留言 -->
  		<%-- <%@ include file="message.jsp"%> --%>
  	</div>
</div>
	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
</body>
</html>