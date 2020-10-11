<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>战队</title>
<!-- 	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script> -->
<style type="text/css">
	.zt{
		color:#EE7621;
		font-size:14px;
	}
	.sp{
		color:#F0FFF0;
	}
	.lmt{
		color:	#DBDBDB;
		font-size:14px;
	}
	.ll{
		color:#EEEE00;
		font-size: 17px;
	}
	.fy{
		position:absolute;
		top:357px;
	}
	p{
		width:300px;
		overflow:hidden;
	}
</style>
</head>
<body>
	<%@ include file="nav.jsp" %>	
	<%-- ${list } --%>
	所有战队
	<div class="row" style="margin:10px;margin-left: 220px;">
	<c:forEach var="list" items="${list }" begin="${start }" end="${end }" varStatus="status">
		<div class="col-md-2" style="margin: 30px;">
			<%-- <span style="color: white;">序号${status.count}.</span> --%>
			<span class="zt">队伍id：<span class="sp">${list.team_id }</span></span>
			<p class='zt'>战队名: <span class="sp">${list.name }</span></p>
			<p class='zt'>简称: <span class="sp">${list.tag }</span></p>
			<!-- onerror图片不存在 使用默认图片代替 -->
			<img src='${list.logo_url }' onerror="this.src='${pageContext.request.contextPath }/img/logo.jpg'" 
			alt='zhanwu' style="width:100px;height:100px;">
			<p class='zt'>
				胜场: <span class="sp">${list.wins }</span>
				&nbsp;&nbsp;负场: <span class="sp">${list.losses }</span>
			</p>
			<br>
			<span class='lmt'>最后游戏时间: ${list.last_match_time }</span>
			<hr>
			<span class='zt'>积分: </span><span class='ll'>${list.rating }</span>
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
		location.href="${pageContext.request.contextPath }/user/teams.action?num="+num;
	}
	function next(num) {//下一页
		num++;
		location.href="${pageContext.request.contextPath }/user/teams.action?num="+num;
	}
</script>
	
<!-- <script type="text/javascript">
	//页面加载，发送请求，调用接口解析并返回数据
    $(function () { 
    	$.ajax({
/*          type:'post',
            dataType: "json", */
            url:"${pageContext.request.contextPath }/user/teams.action",
            success:function(data){
				//alert("加载数据");
                alert(data);
            },
            error:function(){
                alert("连接超时...");
            }
        });
    });
</script> -->
</body>
</html>