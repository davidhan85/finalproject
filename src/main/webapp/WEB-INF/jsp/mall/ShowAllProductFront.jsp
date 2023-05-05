<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--	pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>--%>
<%--<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />--%>


<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" %>--%>






<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--<meta charset="UTF-8">--%>
<%--<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />--%>

<%--<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">--%>
<%--	<!-- Bootstrap CSS -->--%>
<%--	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>

<%--<title>書贏由你來決定</title>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
	<meta charset="UTF-8">
	<title>All roducts</title>
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

<section class="food_section layout_padding-bottom">
	<div class="container">
		<div class="heading_container heading_center">
			<h2>
				所有商品
			</h2>
		</div>

		<ul class="filters_menu">
			<li class="active" data-filter="*">所有</li>
			<li data-filter=".game">遊戲軟體</li>
			<li data-filter=".accessories">周邊</li>
			<li data-filter=".books">書籍</li>
			<li data-filter=".other">其他</li>
		</ul>

	</div>


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

			</tr>
			</thead>
			<tbody>
			<c:forEach var="product" items="${pPage.content}">
				<tr class="product-row">
					<td>${product.productId}</td>
					<td>${product.productName}</td>
					<td>${product.productCategorynumber.categoryName}</td>
					<td>${product.productDescription}</td>
					<td>${product.unitPrice}</td>
					<td>${product.productQuantity}</td>
					<td>${product.productUploadStatus }</td>
					<td><img src="<c:url value='/ProductImage/${product.productImage.productImageId}'/>"
							 width="100" height="100" class="product-img"></td>

				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<c:forEach var="pageNumber" begin="1" end="${pPage.totalPages}">
		<c:choose>
			<c:when test="${pPage.number != pageNumber-1}">

				<a href="${contextRoot}/AllProduct?p=${pageNumber}">${pageNumber}</a>

			</c:when>
			<c:otherwise>

				${pageNumber}
			</c:otherwise>

		</c:choose>

		<c:if test="${pageNumber !=pPage.totalPages}">
			-
		</c:if>

	</c:forEach>

</div>

<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"
		integrity="sha512-w5+5kkCJ5q0ByG13+vqp2B6UcBzWyR1hzU0+vSP2QusflZgRswv17/8Zw1hVfSWpNcN9o7c3H+PthlakGieY/A=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>
