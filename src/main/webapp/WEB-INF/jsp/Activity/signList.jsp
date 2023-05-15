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
<title>活動報名列表</title>
<!-- 引入Bootstrap CSS樣式 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 引入自訂CSS樣式 -->
<link rel="stylesheet" href="${contextRoot}/resources/css/style.css">

<script>
	alert("活動結帳成功！");

    setTimeout(function() {
        if(confirm("結帳成功，是否繼續結帳？")) {
            window.location = "http://localhost:8079/finalTopic_5/next?id=1";
        } else {
        	 window.location = "http://localhost:8079/finalTopic_5/";
        }
    }, 5000); // 設定5秒後觸發計時器
    
    </script>
</head>
<body>
	<!-- 導覽列 -->
	<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">活動報名列表</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
			</ul>
		</div>
	</nav>
	<br>
	<!-- 活動報名列表 -->
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>會員編號</th>
					<th>活動編號</th>
					<th>報名者ID</th>
					<th>報名日期</th>
					<th>報名金額</th>
					<th>付款狀態</th>
				</tr>
			</thead>
			<tbody>
				<!-- 顯示每筆活動報名紀錄 -->
				<c:forEach items="${sign}" var="signs">
					<tr>
						<td>${signs.member.m_number}</td>
						<td>${signs.signactivity.activity_id}</td>
						<td>${signs.memberSign.id}</td>
						<td>${signs.signup_date}</td>
						<td>${signs.amounts}</td>
						<td>${signs.paystatus}</td>
						

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 結帳成功的JavaScript -->

	</div>
	<!-- 引入jQuery -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	<!-- <!-- 引入Bootstrap JavaScript -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</body>
</html>