<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Listed Products</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>

	<%--@font-face {--%>
	<%--	font-family: 'CustomFont';--%>
	<%--	src: url('${contextRoot}/fonts/jf-openhuninn-2.0.ttf')--%>
	<%--	format('truetype');--%>
	<%--}--%>


	<%--* {--%>
	<%--	font-family: 'CustomFont', Arial, sans-serif;--%>
	<%--}--%>


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

	.sidebar {
		position: fixed;
		top: 0;
		height: 300px;
		width: 20%;
		padding: 500px;
		z-index: 1;
	}
.th-style{

}

}
</style>
</head>
<body>
<div class="sidebar">
	<jsp:include page="../layout/sidebar.jsp"></jsp:include>
</div>


	<div class="container-fluid"  style="width:85%;right:0%;top:1%;position:absolute;">
		<h1 class="text-center mb-4">所有商品列表</h1>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>

						<th style="width:120px;">商品<br>編號</th>
						<th style="width:120px;">商品<br>名稱</th>
						<th style="width:120px;">商品<br>分類</th>
						<th style="width:500px;">商品<br>描述</th>
						<th style="width:120px;">商品<br>價格</th>
						<th style="width:120px;">商品<br>剩餘數量</th>
						<th style="width:120px;">商品<br>狀態</th>
						<th style="width:120px;">商品<br>圖片</th>
						<th style="width:120px;">商品<br>編輯</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${pList}">
						<tr class="product-row">
							<td>${product.productId}</td>
							<td>${product.productName}</td>
							<td>${product.productCategoryNumber.categoryName}</td>
							<td>${product.productDescription}</td>
							<td>$${product.unitPrice}</td>
							<td>${product.productQuantity}</td>
							<td class="product-status">${product.productUploadStatus}</td>
							<td><img
								src="<c:url value='/ProductImage/${product.productImage.productImageId}'/>"
								width="100" height="100" class="product-img"></td>
							<td>
								<div class="btn-group" role="group">
									<form:form method="get" action="${pageContext.request.contextPath}/editListedProducts/${product.productId}">
										<button type="submit" class="btn btn-primary">更新</button>
									</form:form>

									<form action="${pageContext.request.contextPath}/listedProducts/${product.productId}" method="post" onsubmit="return confirm('您確定要刪除嗎?')">
										<input type="hidden" name="_method" value="delete">
										<button type="submit" class="btn btn-danger">刪除</button>
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
