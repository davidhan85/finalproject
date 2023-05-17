<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改頁面</title>
</head>
<body>
<jsp:include page="${contextRoot}/layout/navbar.jsp"></jsp:include>
<jsp:include page="navbarorder.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<h1>修改頁面</h1>
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<form:form class="form-control" modelAttribute="memberCoupon"
							method="put" action="${contextRoot}/orders/edit">
							<form:input type="hidden" path="coupon_id"/>
							<form:textarea path="coupon_type" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="coupon_name" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="coupon" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="coupon_count" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="coupon_amount" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="coupon_enabletime" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="note" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="MemberCouponID" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<button type="submit" class="btn btn-primary">送出</button>
						</form:form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>
</html>