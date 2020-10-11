<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
	<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div>
		<table class="table table-striped table-hover table-condensed">
			<form id="heroForm" name="heroForm" action="" method="post">
			<div align="center" style="margin-bottom: 10px">
				<a class="btn btn-info" href="${pageContext.request.contextPath }/hero/toInsert.action">添加新数据</a>
				<a class="btn btn-info" href="${pageContext.request.contextPath }/hero/list.action">查询所有</a>
				<a class="btn btn-info" href="${pageContext.request.contextPath }/hero/query.action?pageNum=1">分页查询</a>
				<input class="btn btn-danger" type="button" value="批量删除" onclick="deleteAll()">
				<button id="test" type="button" class="btn btn-link">测试多选框</button>
			</div>
			  <tr align="center">
				<td>ID</td>
				<td>名称</td>
				<td>英雄背景</td>
				<td>英雄头像</td>
				<td>英雄技能</td>
				<td>属性</td>
				<!-- colspan="2"合并2列 -->
				<td colspan="2">操作</td>
				<td>
					<label style="color: #8C8C8C;">
						<input type="checkbox" id="selectAll" >全选/取消
					</label>
				</td>
			  </tr>
			  <c:forEach items="${pb.data }" var="list">
			  <tr align="center">
				<td>${list.hid }</td>
				<td>${list.hero_name }</td>
				<td width="700px">${list.hero_bg }</td>
				<td>
					<img alt="" src="/pic/${list.hero_img }" width="70" height="40"/>
				</td>
				<td>${list.skill }</td>
				<td>${list.attr }</td>
				<td>
					<a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath }/hero/delete.action?id=${list.hid}"
					onclick="return confirm('确定要删除mie！？')">删除</a>
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
		<div align="center">
		<!-- 若是第一页 首页和上一页不展示 -->
		<c:if test="${pb.pageNum > 1 }">
			<a href='${pageContext.request.contextPath}/hero/query.action?pageNum=1'>[首页]  </a>
			<a href='${pageContext.request.contextPath}/hero/query.action?pageNum=${pb.pageNum-1}'>[上一页]</a>
		</c:if>
<%-- 		<!-- 将所有的页码展示出来 -->
		<c:forEach begin="1" end="${pb.totalPage }" var="n">
			<!-- 若是当前页 不可点 -->
			<c:if test="${pb.pageNum == n }">
				${n }
			</c:if>
			<!-- 若不是当前页 可点 -->
			<c:if test="${pb.pageNum != n }">
				<a href="${pageContext.request.contextPath}/query.action?pageNum=${n}">${n }</a>
			</c:if>
		</c:forEach> --%>
		<!-- 若是最后一页 尾页和下一页不展示 -->
		<c:if test="${pb.pageNum < pb.totalPage }">
			<a href='${pageContext.request.contextPath}/hero/query.action?pageNum=${pb.pageNum+1}'>[下一页]</a>
			<a href='${pageContext.request.contextPath}/hero/query.action?pageNum=${pb.totalPage}'>[尾页]  </a>
		</c:if>
			第${pb.pageNum }页/共${pb.totalPage }页
		</div>
	</div>
</body>
</html>