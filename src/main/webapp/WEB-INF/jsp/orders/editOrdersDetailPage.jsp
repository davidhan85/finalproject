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
  <jsp:include page="../layout/sidebar.jsp"></jsp:include>
<jsp:include page="navbarorder.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<h1>修改頁面</h1>
				<div class="card">
					<div class="card-header">訂單詳情</div>
					<div class="card-body">
						<form:form class="form-control" modelAttribute="OrdersDetail"
							method="put" action="${contextRoot}/OrdersDetail/edit">
							<form:input type="hidden" path="ID"/>
							<div class="form-group">
              				<label for="orderNo">產品名稱</label>
							<form:textarea path="ProductName" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							</div>
							<form:textarea path="UnitPrice" class="form-control" id="" cols="10"
								rows="10"></form:textarea>
							<form:textarea path="ProductQuantity" class="form-control" id="" cols="10"
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