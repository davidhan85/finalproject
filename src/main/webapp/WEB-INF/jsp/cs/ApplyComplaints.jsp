<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>客服回覆</title>
						<jsp:include page="../layout/sidebar.jsp"></jsp:include>
						<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
							rel="stylesheet"
							integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
							crossorigin="anonymous">
					</head>

					<body>
						<div style="position: absolute; right: 50%; top: 10%; width: 250px">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">聯絡人</label> <input type="text"
									class="form-control" value="${apply.customerName}" readonly>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">問題類型</label> <input type="text"
									class="form-control" id="exampleInputPassword1"
									value="${apply.complaintType.complaintName}" readonly>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">標題</label> <input type="text"
									class="form-control" id="exampleInputPassword1" value="${apply.title}" readonly>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">問題說明</label> <textarea
									class="form-control" id="exampleInputPassword1" style="height: 100px; width: 300px;"
									readonly>${apply.content} </textarea>
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">回覆問題</label> <textarea
									class="form-control" style="height: 150px; width: 300px;" id="apply"></textarea>
							</div>

							<button type="submit" class="btn btn-primary" id="answer">確定</button>
						</div>
					</body>
					<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
					<script>
						$("#answer").click(function () {
							let applycontent = document.getElementById('apply').value;
							fetch('http://localhost:8079/finalTopic_5/ApplyComplaints?id=${apply.customerComplaintsID}&content=' + applycontent)
								.then(response => {
									if (response.ok) {
										alert("回覆成功！");
										window.location.href = "http://localhost:8079/finalTopic_5/showAllComplaintsPage";

									} else {
										alert("回覆失敗！");
									}
								})
								.catch(error => {
									alert("出現錯誤：" + error);
								});
						})

					</script>

					</html>