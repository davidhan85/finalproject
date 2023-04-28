<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>刪除活動</title>
<!-- 引入 Bootstrap 的 CSS 檔案 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<form action="<c:url value='/deleteActivity11' />" method="POST">
			<div class="form-group">
				<label for="activity_id">請輸入想刪除的活動編號:</label> <input type="text"
					class="form-control" id="activity_id" name="activity_id">
			</div>
			<button type="submit" class="btn btn-primary">刪除</button>
		</form>
	</div>
	<!-- 引入 jQuery 和 Bootstrap 的 JavaScript 檔案 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>