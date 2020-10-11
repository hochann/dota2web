<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言评论页</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
	.xm{
		color:#4B0082;
	}
</style>		
<body>
<!--留言区-->
	<div id="mesBox">
<div>
	<p style="font-size: 24px;">评论</p>
	<form action="${pageContext.request.contextPath }/user/comment.action?type=${news.type }" method="post">
		<textarea class="form-control" rows="4" placeholder="请输入你的评论.." name="comment" required="required"></textarea>
		<div style="margin-top: 10px">
            <span><font color="#949494">最多输入200字 ----</font></span>
            <!-- 用户为空显示登录  -->
            <c:if test="${sessionScope.user==null }">
            	评论请先
	            <a href="${pageContext.request.contextPath }/user/toLogin.action">
	            	<button type="button" class="btn btn-default">登录</button>
	            </a>
            </c:if>
            <!-- 用户为不为空显示发布评论  -->
            <!-- <button type="submit" class="btn btn-default">发布评论</button> -->
            <c:if test="${sessionScope.user!=null }">
            	<input type="submit" class="btn btn-default" value="发布评论">
            </c:if>
	        <button type="button" class="btn btn-default" onclick="px('${news.type}')">根据赞数排序</button>
	        <button type="button" class="btn btn-default" onclick="pxt('${news.type}')">根据时间排序</button>
        </div>
	</form>	
	<br>

	<!--列表组-->
	<c:forEach var="comments" items="${news.comments }" varStatus="status">
	<li class="list-group-item">
		<div class="row">
			<div class="col-md-9">
				<span class="xm">评论ID :</span> ${comments.id } 
				<!-- ${status.index } 标记 -->
				<c:forEach var="user" items="${news.users }" begin="${status.index }" end="${status.index }">
				<!--用户头像-->
				<!-- <a href="#"> -->
				&nbsp; <img src="/pic/${user.img }" alt="头像" class="img-circle" height="40px" width="40px">
				&nbsp; <span class="xm">玩家 :</span> ${user.username }
				<!-- </a> -->
				</c:forEach>
				<c:if test="${comments.rname!=null }">
				&nbsp; <span class="xm">回复 :</span> ${comments.rname }
				</c:if>
			</div>
			<div class="col-md-3" style="margin-top: 10px;">
				支持
				<!--点赞按钮-->
				<a class="btn btn-default" onclick="dz('${news.type}','${comments.id }')"><span class="glyphicon glyphicon-thumbs-up"></span></a>
				<span id="${comments.id }" >${comments.zan_count }</span>
				<span id="f${comments.id }" hidden="ture">true</span>
				<%-- <c:if test="${sessionScope.user!=null}"> --%>
				留言
				<!--用户不为空时显示 回复按钮-->
				<a class="btn btn-default" onclick="ms(${status.index },${sessionScope.user.uid})"><span class="glyphicon glyphicon-edit"></span></a>
				<%-- </c:if> --%>
				<c:forEach var="user" items="${news.users }" begin="${status.index }" end="${status.index }">			
				<form action="${pageContext.request.contextPath }/user/reply.action?uid=${user.uid}&type=${news.type }"
				method="post" id="ly${status.index }" style="display: none;">
					<textarea class="form-control" cols="12" placeholder="请输入你的评论.." name="comment" required="required"></textarea>
					<input type="submit" class="btn btn-default" value="确定">
				</form>
				</c:forEach>
			</div>
		</div>
		<div class="row">
			<!--评论内容-->
			<div class="col-md-9">
				${comments.comment }
			</div>
			<!--评论时间-->
			<div class="col-md-3" style="margin-top: 10px">
				<fmt:formatDate value="${comments.created_at }" pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
		</div>
	</li>
	</c:forEach>
	</div>
</div>
<script type="text/javascript">
//点赞逻辑，第一次点击点赞，第二次取消赞
	var count;
	function dz(type,id) {
		//alert('count++'+type+"评论id"+id);
		var flag = $("#f"+id).text();
		var c = $("#"+id).text();
		if(flag=='true'){
			count = parseInt(c)+1;
			$("#"+id).text(count);
			$("#f"+id).text('false');
		}else{
			count = parseInt(c)-1;
			$("#"+id).text(count);
			$("#f"+id).text('true');
		}
		count = parseInt($("#"+id).text());
		//alert(count);
		$.ajax({
			url:"${pageContext.request.contextPath }/user/great.action",
			type:"post",
			dataType:"json",
			//定义回调响应的数据格式
			data:{"id":id,"count":count},
			/* contentType:"application/json;charset=UTF-8", */
			success:function(data){
				/* var c = $("#"+id).text();
				if(flag){
					//var add = parseInt(c)+1;
					//alert(add);
					//$("#"+id).text(add);
					//alert(data.zan_count);
					flag=true;
				}else{
					//var del = parseInt(c)-1;
					//alert(del);
					//$("#"+id).text(del);
					//alert(data.zan_count);
					flag=false;
				} */
			},
		});
	}
	function ms(index,uid) {
		if(uid==undefined){
			alert("留言请先登录......");
		}else{
			//alert(uid+""+type);
			$("#ly"+index).css("display","block");
			//window.location.href="${pageContext.request.contextPath }/user/reply.action";
			//$("#ly").css("display","none");
		}
	}
	function px(type) {//按赞数
		$.ajax({
			url:"${pageContext.request.contextPath }/user/news.action?type="+type,
			type:"post",
			data:{"px":"desc"},
			//dataType:"json",
			success:function(data){
				//$("#mesBox").load();
				//alert(data);
				$("#mesBox").html(data);
			},
		});
	}
	function pxt(type) {//按时间
		$.ajax({
			url:"${pageContext.request.contextPath }/user/news.action?type="+type,
			type:"post",
			data:{"pxt":"desc"},
			//dataType:"json",
			success:function(data){
				//alert(data);
				$("#mesBox").html(data);
			},
		});
	}
</script>
</body>
</html>