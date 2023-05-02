<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../layout/sidebar.jsp"></jsp:include>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>

<body>
	<c:set var="Complaint" value="${Complaint}" /> 
	<form style="position: absolute; right: 50%; top: 15%; width: 250px" action="showAllComplaintsPage">
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">聯絡人</label> <input
				type="text" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" value="${Complaint.customerName}" readonly>

		</div>
		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">電子郵件</label> <input
				type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" value="${Complaint.email}" readonly>
			<div id="emailHelp" class="form-text">.</div>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">問題類型</label> <input
				type="text" class="form-control" id="exampleInputPassword1" value="${Complaint.complaintType.complaintName}" readonly>
		</div>
		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">標題</label> <input
				type="text" class="form-control" id="exampleInputPassword1" value="${Complaint.title}" readonly>
		</div>

		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">問題說明</label> <textarea
				 class="form-control" id="exampleInputPassword1" style="height: 100px; width: 300px;" readonly>${Complaint.content} </textarea>
		</div>

		<!-- 							<div class="mb-3 form-check"> -->
		<!-- 								<input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
		<!-- 								<label class="form-check-label" for="exampleCheck1">Check me -->
		<!-- 									out</label> -->
		<!-- 							</div> -->
		<button type="submit" class="btn btn-primary">返回</button>
	</form>
</body>