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

<title>Insert title here</title>

</head>

<body>
	<%-- 	<jsp:include page="../layout/navebar.jsp"></jsp:include> --%>
	<section class="book_section layout_padding">
		<div class="container">
			<div class="heading_container" style="text-align: center;">
				<h2>活動報名</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
						<form:form modelAttribute="111" action="${contextRoot}/store"
							method="post">

							<div style="text-align: center;">
								<h4 style="text-align: center;">活動編號</h4>
								<form:input type="number" class="form-control" id="activity_id"
									name="activity_id" path="activity.activity_id"
									style="text-align:center" value="${activity_id}"
									readonly="true" />

							</div>



							<div style="text-align: center;">
								<h4 style="text-align: center;">會員編號</h4>
								<form:input type="text" class="form-control" id="member_number"
									name="member_number" placeholder="會員編號"
									path="memberss.m_number" style="text-align:center;" />
							</div>
							<div style="text-align: center;">
								<h4 style="text-align: center;">姓名</h4>
								<form:input type="text" class="form-control" id="name"
									name="name" placeholder="(請輸入姓名)" path="name"
									style="text-align:center;" />
							</div>
							<div style="text-align: center;">
								<h4 style="text-align: center;">電子郵件</h4>
								<form:input type="email" class="form-control" id="email"
									name="email" placeholder="(請輸入電子郵件)" path="email"
									style="text-align:center;" />
							</div>
							<div>
								<input type="submit" value="再新增報名者" style="float: left;" />
							</div>
						</form:form>

						<form:form modelAttribute="111" action="${contextRoot}/next"
							method="post">
							<input type="submit" value="下一步"
								style="float: right; margin-right: 10px;" />
						</form:form>
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