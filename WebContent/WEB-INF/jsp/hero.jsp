<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dota2后台管理系统</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script> --%>
<style type="text/css">
	body { padding-top: 50px; }
</style>
<script type="text/javascript">
	//批量删除
	/*在jQuery中设置form表单中action的值的方法。
	$("#FormId").attr("action", "userinfo.html");
	$("#FormId").action="XXX";这种写法不起作用*/
	function deleteAll(){
		var ids =[];
	  	$(".itemSelect:checked").each(function(){
	   		ids.push($(this).val());
	   	});
        if(ids==null||ids==''){
         	alert("请选择英雄！");
        }else{
	  		var flag = confirm("确定删除选择的么？");
	  		if(flag){
	 			$("#heroForm").attr("action","${pageContext.request.contextPath }/hero/deleteAll.action");
	 			$("#heroForm").submit();
	  		}
        }
	}
</script>
</head>
<body>
	<!-- 导入导航，和左侧菜单 -->
	<%@ include file="header.jsp" %>
	<!-- 右侧数据  -->
	<div class="col-xs-10 col-sm-10 col-md-10" id="right">
		<h1>管理后台</h1>
		<!-- 表格数据 -->	
		<font color="#cc0066" size="5px">英雄数据</font><br>
		<table class="table table-striped table-hover table-condensed">
			<div style="margin: 10px">
				<form action="${pageContext.request.contextPath }/hero/search.action" method="post">
					<input type="text" name="condition" class="col-md-3" value="${condition }" placeholder="请输入..">
					<button type="submit" class="btn btn-sm" style="margin-left: 30px">
						搜索
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
				<!-- 提示    消息框 -->
				<p class="bg-info">${msg }</p>
			</div>
			<form id="heroForm" name="heroForm" action="" method="post">
			<div align="center" style="margin-bottom: 10px">
				<a class="btn btn-info" href="${pageContext.request.contextPath }/hero/toInsert.action">添加新数据</a>
				<a class="btn btn-info" href="${pageContext.request.contextPath }/hero/list.action?pageNum=1">查询所有</a>
				<%-- <a class="btn btn-info" href="${pageContext.request.contextPath }/hero/query.action?pageNum=1">分页查询</a> --%>
				<input class="btn btn-danger" type="button" value="批量删除" onclick="deleteAll()">
				<button id="test" type="button" class="btn btn-link">测试多选框</button>
			</div>
			  <tr align="center">
				<td>ID</td>
				<td>名称</td>
				<td>英雄背景</td>
				<td>英雄头像</td>
				<!-- <td>英雄技能</td> -->
				<td>属性</td>
				<td>类型</td>
				<!-- colspan="2"合并2列 -->
				<td colspan="2">操作</td>
				<td>
					<label style="color: #8C8C8C;">
						<input type="checkbox" id="selectAll" >全选/取消
					</label>
				</td>
			  </tr>
			  <c:forEach items="${list }" var="list">
			  <tr align="center">
				<td>${list.hid }</td>
				<td>${list.hero_name }</td>
				<td width="700px">${list.hero_bg }</td>
				<td>
					<img alt="" src="/pic/${list.hero_img }" width="70" height="40"/>
				</td>
				<%-- <td>${list.skill }</td> --%>
				<td>${list.attr }</td>
				<td>${list.type }</td>
				<td>
					<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath }/hero/delete.action?id=${list.hid}"
					onclick="return confirm('确定删除“${list.hero_name }”么？')">删除</a>
				</td>
				<td>
					<!-- 修改先查询，点击修改，传递参数id -->
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath }/hero/detail.action?id=${list.hid}">
					修改</a>
				</td>
				<td>
					<div class="checkbox">
					  <label style="color: #8C8C8C;">
					    <input type="checkbox" name="ids" class="itemSelect" value="${list.hid}">
						 选择项
					  </label>
					</div>
				</td>
			  </tr>
			  </c:forEach>
		  	</form>
		</table>
		<!--分页控件-->
		<c:if test="${pageInfo!=null }">
		<div align="center">
			<a href="${pageContext.request.contextPath }/hero/list.action?pageNum=1">
				<button type="button" class="btn btn-link">首页</button>
			</a>
			<c:if test="${pageInfo.hasPreviousPage }">
			<a href="${pageContext.request.contextPath }/hero/list.action?pageNum=${pageInfo.pageNum-1}">
				<button type="button" class="btn btn-link"><span class="glyphicon glyphicon-menu-left"></span>上一页</button>
			</a>
			</c:if>
			<c:if test="${pageInfo.hasNextPage }">
			<a href="${pageContext.request.contextPath }/hero/list.action?pageNum=${pageInfo.pageNum+1}">
				<button type="button" class="btn btn-link">下一页<span class="glyphicon glyphicon-menu-right"></span></button>
			</a>
			</c:if>
			<a href="${pageContext.request.contextPath }/hero/list.action?pageNum=${pageInfo.pages}">
				<button type="button" class="btn btn-link">尾页</button>
			</a>
		</div>
		</c:if>
	</div>
</body>
</html>