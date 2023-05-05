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
						<form:form modelAttribute="111" action="${contextRoot}/store" method="post">

							<%-- 							<form:input type="hidden" path="m_number.m_number" value="${memberss.} " /> --%>
							<%-- 							<form:input type="number" path="id" readonly="true" value="${id}" /> --%>
							<!-- value="3" -->

							<div style="text-align: center;">
								<h4 style="text-align: center;">活動編號</h4>
								<form:input type="text" class="form-control" id="activity_id"
									name="activity_id" placeholder="活動編號"
									path="activity.activity_id" style="text-align:center;"
									value="${activity.activity_id}" />
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
									<h4 style="text-align: center;">電子郵件</h4>
									<form:input type="date-location" class="form-control"
										id="email" name="email" placeholder="(請輸入電子郵件)" path="email"
										style="text-align:center;" />
								</div>
								<div>
									<input type="submit" value="儲存" style="float: left;" />
								</div>
						</form:form>
						<%-- 						<form:form modelAttribute="multiMember" --%>
						<%-- 							action="${contextRoot}/next" method="post"> --%>
						<!-- 							<input type="hidden" name="memberss.m_number" -->
						<%-- 								value="${multiMember.memberss.m_number}" /> --%>
						<!-- 							<input type="submit" value="下一步" -->
						<!-- 								style="float: right; margin-right: 10px;" /> -->
						<%-- 						</form:form> --%>

						<%-- 						<form:form modelAttribute="multiMember" --%>
						<%-- 							action="${contextRoot}/next" method="post"> --%>
						<!-- 							<input type="hidden" name="memberss.m_number" -->
						<%-- 								value="${multiMember.memberss.m_number}" /> --%>
						<!-- 							<input type="submit" value="下一步" -->
						<!-- 								style="float: right; margin-right: 10px;" /> -->
						<%-- 						</form:form> --%>
<%-- 						<form:form modelAttribute="multiMember" --%>
<%-- 							action="${contextRoot}/next" method="post"> --%>
<%-- 							<form:input type="hidden" path="memberss.m_number" --%>
<%-- 								value="${memberbean.m_number}" /> --%>
<!-- 														<input type="submit" value="下一步" -->
<!-- 															style="float: right; margin-right: 10px;" /> -->
<!-- 							<button type="submit" style="float: right; margin-right: 10px;">下一步</button> -->
<%-- 						</form:form> --%>

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