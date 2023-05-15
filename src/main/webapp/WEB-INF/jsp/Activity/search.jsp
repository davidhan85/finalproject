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
<title>活動列表</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/5.3.1/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/2.10.2/umd/popper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<a class="navbar-brand" href="#">活動列表</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item active"><form:form class="form-inline"
					action="${contextRoot}/searching" method="get">
					<input class="form-control me-2" type="text"
						placeholder="輸入關鍵字" name="keyword" id="keyword"
						value="${keyword}" required>
					<button class="btn btn-success" type="submit">搜尋</button>
				</form:form>
				</li>
				<div class="ms-auto">
					<form action="${contextRoot}/registration" method="post">
						<input type="hidden" name="activity_id"
							>
						<button type="submit" class="btn btn-primary">我要報名</button>
					</form>
				</div>
		</ul>
	</div>
</nav>
	<br>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>活動編號</th>
					<th>活動負責人</th>
					<th>活動名稱</th>
					<th>活動日期</th>
					<th>活動圖片</th>
					<th>活動人數</th>
					<th>活動費用</th>
					<th>活動描述</th>
					
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.content}" var="activity">
					<tr>
						<td>${activity.activity_id}</td>
						<td>${activity.principle}</td>
						<td>${activity.activity_name}</td>
						<td>${activity.activity_date}</td>

						<td><img
							src="data:image/jpg;base64,${Base64.getEncoder().encodeToString(activity.activity_image)}"
							alt="Activity Image" style="width: 80%; height: 80%;" /></td>

						<td>${activity.attendance}</td>
						<td>${activity.activity_cost}</td>
						<td>${activity.activity_discription}</td>
<!-- 												<td> -->
<%-- 													<form action="${contextRoot}/registration" method="get">  --%>
<%-- 														<input type="hidden" name="activity_id" value="${activity.activity_id}">  --%>


<!-- 														<input type="submit" value="我要報名" class="btn btn-primary">  -->
<%-- 													</form>  --%>

<!-- 												</td> -->
					</tr>
				</c:forEach>
				
							<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
<!-- 			這裡的var="pageNumber"想像成是int i =1 ，page.number一開始是從0開始，pageNumber一開始是從1開始，所以前者+1或+1 -->
			     <jstl:choose>
			     <jstl:when test="${page.number != pageNumber-1 }">
			          <a href="${contextRoot}/activity?p=${pageNumber}">${pageNumber}</a>
			     </jstl:when>
			     <jstl:otherwise>
			            ${pageNumber}
			     </jstl:otherwise>
			  
			  </jstl:choose>
			
			</jstl:forEach>
			</tbody>
			
		</table>
	</div>
</body>
</html>