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

	</nav>
	<br>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>會員編號</th>
					<th>活動編號</th>
					<th>報名者</th>
					<th>報名者郵件</th>
					<th>報名ID</th>
					<th>付款狀態</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${multis}" var="multiLists">
					<tr>
<%-- 						<td>${multiLists.memberss.m_number}</td> --%>
						<td>${multiLists.memberss.m_number}</td>
						<td>${multiLists.activity.activity_id}</td>
						<td>${multiLists.name}</td>
						<td>${multiLists.email}</td>
						<td>${multiLists.id}</td>
						<td>
<%-- 							<form action="${contextRoot}/ecpayCheckout" method="get"> --%>
							<form action="${contextRoot}/ecpayCheckout" method="post">
								<input type="hidden" name="id"
									value="${multiLists.id}"> <input type="submit"
									value="未付款" class="btn btn-primary">
							</form>
						</td>

						<!-- 						<td> -->
						<%-- 							<form action="${contextRoot}/registration" method="get"> --%>
						<%-- 								<input type="hidden" name="activity_id" value="${activity.activity_id}"> --%>


						<!-- 								<input type="submit" value="我要報名" class="btn btn-primary"> -->
						<%-- 							</form> --%>
						<!-- 						</td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>