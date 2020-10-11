<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<title>proPlayers</title>
<style type="text/css">
	body {
		background: url("${pageContext.request.contextPath }/img/bg.jpg");
		background-repeat: no-repeat;
	}
	.zt{
		color:#4D4D4D;
		font-size:14px;
	}
	.sp{
		color:#F0FFF0;
	}
	.lmt{
		color:#A8A8A8;
		font-size: 14px;
	}
	.ll{
		color:#5B5B5B;
		font-size: 18px;
	}
	.fy{
		position:absolute;
		top:357px;
	}
</style>
</head>
<body>
	<!-- 导航 -->
	<%@ include file="nav.jsp" %>
	<!-- 列表 -->
	<div class="row" style="margin: 30px;margin-left: 270px;">
	<c:forEach var="list" items="${list }" begin="${start }" end="${end }" varStatus="status">
		<div class="col-md-2" style="margin: 30px;">
			<%-- <div id="div${status.count}">
				<span style="color: white;">
				${status.count}
				游戏名：${list.personaname }
				用户id：${list.account_id }
				</span>
			</div> --%>
			<%-- <a href="${list.avatarfull }" class="">
		  		<img src="${list.avatarmedium }" alt="zhanwu">
			</a> --%>
			<p style="font-size: 17px">
			<%-- <span style="color:gray;">用户id:${list.account_id }</span> --%>
				<span style="color: white;">序号${status.count}.</span>
				<span class="sp">${list.personaname }</span>
			</p>
			
			<a data-toggle="popover" role="button" tabindex="0" data-trigger="focus"
			title="<font class='zt'>游戏名:${list.personaname }</font>"
			data-content="<font class='zt'>玩家: ${list.name }&nbsp;&nbsp;id:${list.account_id }</font>
			<div>
				<span class='lmt'>最近一场比赛时间:${list.last_match_time }</span>
				<img src='${list.avatarfull }' alt='zhanwu'>
				<br>
				<hr>
				<span class='ll'>
					所属战队:${list.team_name }<c:if test="${list.team_name==null }">无</c:if>
				</span>
			</div>">
				<!--显示小图 -->
				<img src="${list.avatarmedium }" alt="zhanwu">
			</a>
		</div>
	</c:forEach>
	</div>
	<c:if test="${num!=0 }"><!-- 第0页时隐藏上一页 -->
	<button style="left:120px;" class="btn btn-info fy" onclick="last(${num })">
		<font style="color:white;font-size:20px;">
		上一页
		</font>
	</button>
	</c:if>
	<c:if test="${stop!=0 }">
	<button style="left:1300px;" class="btn btn-info fy" onclick="next(${num })">
		<font style="color:white;font-size:20px;">
		下一页<!-- <span class="glyphicon glyphicon-menu-right" ></span> -->
		</font>
	</button>
	</c:if>
<script type="text/javascript">
	function last(num) {//上一页
		num--;
		location.href="${pageContext.request.contextPath }/user/player.action?num="+num;
	}
	function next(num) {//下一页
		num++;
		location.href="${pageContext.request.contextPath }/user/player.action?num="+num;
	}
	/* 初始化
	由于性能的原因，工具提示和弹出框的 data 编程接口（data api）是必须要手动初始化的。
	在一个页面上一次性初始化所有弹出框的方式是通过 data-toggle 属性选中他们： 
	实现“点击并让弹出框消失”的效果需要一些额外的代码
	为了更好的跨浏览器和跨平台效果，你必须使用 <a> 标签，不能使用 <button> 标签，并且，
	还必须包含 role="button" 和 tabindex 属性。*/
	$(function () {
		$('[data-toggle="popover"]').popover({html : true });
	});
  	//span实现前台文字显示字数，当多于一定数量时，用...代替
  	$('.sp').each(function() {
        var words = $(this).text().length;
        if(words > 5){
            $(this).text($(this).text().slice(0,5)+"...");
        }
  	});
</script>
</body>
</html>