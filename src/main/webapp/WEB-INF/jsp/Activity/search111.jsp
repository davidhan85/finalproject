<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>活動列表</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/5.3.1/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/2.10.2/umd/popper.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../layout/navebar.jsp"></jsp:include>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">活動列表</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><form:form class="form-inline"
						action="${contextRoot}/searching" method="get">
						<input class="form-control me-2" type="text" placeholder="請輸入活動名稱"
							name="keyword" id="keyword" value="${keyword}" required>
						<button class="btn btn-success" type="submit">搜尋</button>
					</form:form></li>
				<li class="nav-item ms-auto">
					<form action="${contextRoot}/registration" method="post">
						<input type="hidden" name="activity_id">
						<button type="submit" class="btn btn-primary">我要報名</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="container">
		<div class="row justify-content-around">
			<c:forEach items="${page.content}" var="activity">
				<div class="col-4 mb-3 aalBox"
					style="background-color: #4d3d3fa6;color:aliceblue; height: 550px; width: 40%; border: 6px solid rgb(192, 185, 185);">

					<div class="col-md-12 mt-2">活動編號：${activity.activity_id}</div>
					<div class="col-md-12">活動負責人：${activity.principle}</div>
					<div class="col-md-12">活動名稱：</div>
					<div class="col-md-12">${activity.activity_name}</div>
					<div class="col-md-12">活動日期：${activity.activity_date}</div>
					<div class="col-md-12">
						活動圖片：<img
							src="data:image/jpg;base64,${Base64.getEncoder().encodeToString(activity.activity_image)}"
							alt="Activity Image" style="width: 100%; height: 50%;" />
					</div>
					<div class="col-md-9">活動人數：${activity.attendance}</div>
					<div class="col-md-9">活動費用：${activity.activity_cost}</div>
					<div class="col-md-9">活動描述：${activity.activity_discription}</div>
				</div>
			</c:forEach>
		</div>


		<table class="table table-striped">
			<tbody>
				<tr>
					<td colspan="8" class="text-center"><jstl:forEach
							var="pageNumber" begin="1" end="${page.totalPages}">
							<jstl:choose>
								<jstl:when test="${page.number != pageNumber-1}">
									<a href="${contextRoot}/activity?p=${pageNumber}">${pageNumber}</a>
								</jstl:when>
								<jstl:otherwise>
                                ${pageNumber}
                            </jstl:otherwise>
							</jstl:choose>
						</jstl:forEach></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>

