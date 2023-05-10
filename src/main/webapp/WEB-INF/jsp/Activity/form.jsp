<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%> 
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
 <%@page import="java.util.*"%> 

<!-- <!DOCTYPE html> -->
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 引入 Bootstrap 樣式 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<!-- 引入 jQuery 库 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- 引入 Bootstrap JavaScript 插件 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
	<br>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>id</th>
					<th>activity_id</th>
					<th>paystatus</th>
					<th>amounts</th>
					<th>signup_date</th>
					<th>member_number</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${form}" var="forms">
					<tr>
						<td>${forms.id}</td>
						<td>${forms.activity.signactivity}</td>
						<td>${forms.activity_name}</td>
						<td>${forms.paystatus}</td>
						<td>${forms.amounts}</td>
						<td>${forms.signup_date}</td>
						<td>${forms.memberss.m_number}</td>
						<td>
						<form action="${contextRoot}/ButtonDelete" method="post">
							<input type="hidden" name="activity_id" value="${activity.activity_id}" />
							<button type="submit" class="btn btn-danger">刪除</button>
						</form>
					</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

















