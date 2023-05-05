<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Listed Products</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
<style>
.product-row:hover {
	background-color: #f2f2f2;
}

.product-row td {
	vertical-align: middle;
}

.product-row .product-img {
	max-width: 100%;
	height: auto;
}

@media ( max-width : 767px) {
	.product-row td {
		display: block;
		text-align: center;
		padding: 8px;
		border: none;
	}
	.product-row td:first-child {
		border-top: 1px solid #dee2e6;
	}
	.product-row td:last-child {
		border-bottom: 1px solid #dee2e6;
	}
	.product-row .product-img {
		max-width: 50%;
		margin: 0 auto;
	}
}
</style>
</head>
<body>
	<div class="container py-5">
		<h1 class="text-center mb-4">All Listed Products</h1>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Product Category</th>
						<th>Product Description</th>
						<th>Unit Price</th>
						<th>Product Quantity</th>
						<th>Status</th>
						<th>Product Image</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${pList}">
						<tr class="product-row">
							<td>${product.productId}</td>
							<td>${product.productName}</td>
							<td>${product.productCategorynumber.categoryName}</td>
							<td>${product.productDescription}</td>
							<td>${product.unitPrice}</td>
							<td>${product.productQuantity}</td>
							<td>${product.productUploadStatus }</td>
							<td><img
								src="<c:url value='/ProductImage/${product.productImage.productImageId}'/>"
								width="100" height="100" class="product-img"></td>
							<td>
								<div class="btn-group" role="group">
									
<%-- 									<form --%>
<%-- 										action="${pageContext.request.contextPath}/editListedProducts"> --%>
<!-- 										<input type="hidden" name="ProductId" -->
<%-- 											value="${product.productId}" /> --%>
<!-- 										<button type="submit" class="btn btn-primary">Edit</button> -->
<%-- 									</form> --%>

									<form:form method="get"
										action="${pageContext.request.contextPath}/editListedProducts/${product.productId}">
										<input type="submit" value="更新" />
									</form:form>


									<form
										action="${pageContext.request.contextPath}/listedProducts/${product.productId}"
										method="post" onsubmit="return confirm('您確定要刪除嗎?')">
										<input type="hidden" name="_method" value="delete" />

										<button type="submit" class="btn btn-danger">Delete</button>
									</form>

								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"
		integrity="sha512-w5+5kkCJ5q0ByG13+vqp2B6UcBzWyR1hzU0+vSP2QusflZgRswv17/8Zw1hVfSWpNcN9o7c3H+PthlakGieY/A=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
