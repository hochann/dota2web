<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新手引导</title>
	<script type="text/javascript">
		//设置点击播放、暂停
		$(function(){
			$("#video_dota").click(function(){
				if(this.paused){
					this.play();
			    }else{
			    	this.pause();
			    }
			})
		})
	</script>
</head>
<body>
<!-- 导航 -->
<%@ include file="nav.jsp" %>	
<h2 align="center">DOTA2 新手引导</h2>
<div class="row">
 	<!--左侧信息-->
  	<div class="col-xs-1 col-sm-1 col-md-1" id="left_log">
  	</div>
  	<!--右侧信息 jumbotron巨幕-这是一个轻量、灵活的组件，
  	它能延伸至整个浏览器视口来展示网站上的关键内容。-->
  	<div class="col-xs-10 col-sm-10 col-md-10 jumbotron" id="right_log" 
  	style="background-image: url(${pageContext.request.contextPath }/img/timg2.jpg);background-repeat:no-repeat">
   	<div class="media">
   		<div class="media-left">
		    <img class="media-object" src="img/LGD.jpg">
		    <p><span style="color:#030303;">《刀塔2》也被称作《DOTA2》，由《DOTA》的地图核心制作者IceFrog（冰蛙）联手美国
		    Valve公司研发的一款游戏，于2013年4月28日开始测试，发布中文名为“刀塔”，是该系列的第二部作品。</span></p>
	  	</div>
	  	<div class="media-body">
		    <h4 class="media-heading">This Is DOTA</h4>
		    <!-- poster在没有播放状态下显示指定图像  -->
			<video id="video_dota" src="${pageContext.request.contextPath }/video/This_Is_DOTA_chn.mp4"
			controls="controls" height="566px" poster="${pageContext.request.contextPath }/img/timg.jpg">
			</video>
	  	</div>
	</div>
	<span id='s' style="color:#FF69B4;">《刀塔2》也被称作《DOTA2》，由《DOTA》的地图核心制作者IceFrog（冰蛙）联手美国
		    Valve公司研发的一款游戏，于2013年4月28日开始测试，发布中文名为“刀塔”，是该系列的第二部作品。</span>
  	</div>
  	<!-- 网页底部 -->
	<%@ include file="bottom.jsp" %>
<script type="text/javascript">
  	//span实现前台文字显示字数，当多于一定数量时，用...代替
  	$('#s').each(function() {
        var words = $(this).text().length;
        if(words > 5){
            $(this).text($(this).text().slice(0,5)+"...");
        }
  	});
</script>
</div>
</body>
</html>