<%-- Created by IntelliJ IDEA. User: admin Date: 2023/4/25 Time: 下午 04:09 To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>

<head>
<title>登入</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 引入Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	position: relative;
}

.content {
	min-height: 50%;
	padding-bottom: 50px; /* 頁面底部footer的高度 */
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 50px; /* 調整footer的高度 */
	background-color: #f5f5f5;
	/* 其他footer的樣式 */
}
</style>
<script type="text/javascript">
 function Membernull() {
	 alert("<c:out value='${msg}'/>")
	
}
</script>
</head>

<body
	style="background-image: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=2128&amp;q=80')">
	<jsp:include page="../layout/navebar.jsp"></jsp:include>
	  <div class="content">
		<div class="container mt-5">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header bg-warning text-white">
							<h4 class="text-center">登入</h4>
						</div>
						<div class="card-body">
							<form action="${contextRoot}/checkLogin" method="post">
								<div class="form-group">
									<label for="username">帳號:</label> <input type="text"
										class="form-control" id="username" placeholder="請輸入您的帳號"
										name="username">
								</div>
								<div class="form-group">
									<label for="password">密碼:</label> <input type="password"
										class="form-control" id="password" placeholder="請輸入您的密碼"
										name="password">
								</div>
								<button type="submit" class="btn btn-warning btn-block">登入</button>
							</form>
							<c:if test="${not empty error}">
								<div class="alert alert-danger">
									<strong>错误:</strong>
									<c:forEach var="entry" items="${error}">									
                          ${entry.value}<br />
									</c:forEach>
								</div>
							</c:if>
							<hr>							
							<div class="text-center">
								<a href="${contextRoot}/forgetpwdpage">忘記密碼</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty msg}">
	<script>
	Membernull();
    </script>	
	</c:if>
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmIxFfdJPyB6UksJXn3Z"></script>

</body>
</html>