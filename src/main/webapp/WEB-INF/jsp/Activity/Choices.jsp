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
<%-- 	<jsp:include page="../layout/sidebar.jsp"></jsp:include> --%>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<div class="container">
		<h1 class="text-center">新增資訊嗎？是的話請選擇「新增」，否則請點選「下一步」。</h1>
		<br>
		<div class="row">
			<div class="col-md-6">
				<form id="myForm" action="${contextRoot}/registration" method="post">
					<button type="submit" class="btn btn-primary btn-block">新增</button>
				</form>
			</div>
			<div class="col-md-6">
				<form action="${contextRoot}/next" method="get">
					<input type="hidden" class="form-control" id="member_number" name="id"
						value="${memberbean.m_number}" style="text-align: center;" />
					<button type="submit" class="btn btn-success btn-block">下一步</button>
				</form>
			</div>
			
		</div>
	</div>
</body>
</html>

















