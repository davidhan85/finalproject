<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<title>報名</title>

<!-- CSS 相關設定 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZEK6pX6rWI7WQXkEIQ6Iw"
	crossorigin="anonymous">
<style>
.book_section {
	background: #f6f6f6;
	padding: 80px 0;
}

.form_container {
	background: #fff;
	border-radius: 10px;
	padding: 40px 20px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

.heading_container {
	margin-bottom: 30px;
}
</style>
</head>

</head>

<body>
<%-- 		<jsp:include page="../layout/navebar.jsp"></jsp:include> --%>

	<section class="book_section layout_padding">
		<div class="container">
			<div class="heading_container" style="text-align: center;">
				<h2>活動報名</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
						<form:form id="myForm" modelAttribute="111"
							action="${contextRoot}/store" method="post">

							<%-- 		demo					<form:input type="hidden" path="m_number.m_number" value="${memberss.} " /> --%>
							<%-- 							<form:input type="number" path="id" readonly="true" value="${id}" /> --%>
							<!-- value="3" -->

							<!-- 							<div style="text-align: center;"> -->
							<!-- 								<h4 style="text-align: center;">活動編號</h4> -->
							<%-- 								<form:input type="text" class="form-control" id="activity_id" --%>
							<%-- 									name="activity_id" placeholder="活動編號" --%>
							<%-- 									path="activity.activity_id" style="text-align:center;" --%>
							<%-- 									value="${activity.activity_id}" /> --%>
							<div style="text-align: center;">
								<h4 style="text-align: center;">活動編號</h4>
								<form:input type="text" class="form-control" id="activity_id"
									name="activity_id" placeholder="活動編號"
									path="activity.activity_id" style="text-align:center;"
									value="${act.activity_id}" />
								<!-- 有寫path，就會自動找到相對應的欄位並將我輸入的值注入進去，苦是如果次外來件，則必須要透過Service裡面的企業邏輯去將外外艦給save進去							</div> -->
								<div style="text-align: center;">
									<h4 style="text-align: center;">會員編號</h4>
									<form:input type="text" class="form-control" id="member_number"
										name="member_number" placeholder="會員編號"
										value="${memberbean.m_number}" path="memberss.m_number"
										style="text-align:center;" />
								</div>
								<div style="text-align: center;">
									<div>
										<h4 style="text-align: center;">姓名</h4>
										<form:input type="text" class="form-control" id="name"
											name="name" placeholder="(請輸入姓名)" path="name"
											style="text-align:center;" />
									</div>
									<h4>電子信箱</h4>
									<input type="email" class="form-control" id="email"
										name="email" placeholder="(請輸入電子信箱)"
										style="text-align: center;" required />
									<div id="email_error" style="color: red;"></div>
									<div>
										<input type="submit" value="報名" style="float: left;"
											onclick="showConfirmation();" id="submit_button" />
									</div>
						</form:form>
						<script>
							function showConfirmation() {
								if (confirm("確定資訊正確嗎？要確定捏")) {
									document.getElementById("myForm").submit();
									alert("報名成功！");
								}
							}

							var email_input = document.getElementById("email");
							var email_error = document
									.getElementById("email_error");

							email_input.addEventListener("input", function(
									event) {
								if (email_input.validity.valid) {
									email_error.innerHTML = "";
									email_error.className = "error";
								} else {
									email_error.innerHTML = "請輸入正確的電子郵件格式";
									email_error.className = "error active";
								}
							});
						</script>
					</div>
				</div>
				<div class="col-md-6">
					<div class="map_container "></div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>