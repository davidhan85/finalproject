<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>Activity List</title>
</head>
<body>
	<h1>Activity List</h1>
	<form action="/searching" method="get">
		<input type="text" placeholder="輸入關鍵字" name="keyword" id="keyword"
			value="${keyword}" required>
		<a class="nav-link" href="${contextRoot}/keyword">關鍵字搜尋</a>
		<input type="submit" value="搜尋">
	</form>
	<br />
	<table border="1">
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
		<c:forEach items="${searchactivities}" var="activity">
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
					<form action="${contextRoot}/registration" method="post">
						<input type="hidden" name="activity_id" value="${activity.activity_id}">
						<input type="submit" value="我要報名">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
