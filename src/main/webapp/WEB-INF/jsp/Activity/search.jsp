<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Activity List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">Activity List</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active">
					<form:form class="form-inline" action="${contextRoot}/searching" method="get">
						<input class="form-control mr-sm-2" type="text"
							placeholder="輸入關鍵字" name="keyword" id="keyword"
							value="${keyword}" required>
						<button class="btn btn-success" type="submit">搜尋</button>
					</form:form>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>活動編號</th>
					<th>活動負責人</th>
					<th>活動名稱</th>
					<th>活動日期</th>
					<th>活動圖片</th>
					<th>活動人數</th>
					<th>活動費用</th>
					<th>活動描述</th>
					<th>報名</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${activities}" var="activity">
					<tr>
						<td>${activity.activity_id}</td>
						<td>${activity.principle}</td>
						<td>${activity.activity_name}</td>
						<td>${activity.activity_date}</td>

						<td><img
							src="data:image/jpg;base64,${Base64.getEncoder().encodeToString(activity.activity_image)}"
							alt="Activity Image" style="width: 100%; height: 100%;" /></td>

						<td>${activity.attendance}</td>
						<td>${activity.activity_cost}</td>
						<td>${activity.activity_discription}</td>
						<td>
							<form action="${contextRoot}/registration" method="get">
								<input type="submit" value="我要報名" class="btn btn-primary">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>