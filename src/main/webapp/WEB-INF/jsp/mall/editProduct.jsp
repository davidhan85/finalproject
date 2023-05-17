<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
	<title>編輯產品</title>
	<!-- 引入 Bootstrap 4 CSS -->
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		@font-face {
			font-family: 'CustomFont';
			src: url('${contextRoot}/fonts/jf-openhuninn-2.0.ttf') format('truetype');
		}

		* {
			font-family: 'CustomFont', Arial, sans-serif;
		}
	</style>
</head>

<body>
<div class="container mt-5">
	<div class="row">
		<div class="col-md-8 offset-md-2">
			<h2 class="text-center mb-4">產品編輯表單</h2>
			<form:form method="post"
					   action="${contextRoot}/updateListedProducts/${listedProduct.productId}"
					   modelAttribute="listedProduct" enctype="multipart/form-data">
				<input type="hidden" name="_method" value="put">
				<div class="form-group">
					<label for="m_number">會員編號:</label>
					<form:input path="m_number" required="true"
								readonly="true" class="form-control" />
				</div>
				<div class="form-group">
					<label for="productId">產品ID:</label>
					<form:input path="productId" required="true"
								readonly="true" class="form-control" />
				</div>
				<div class="form-group">
					<label for="productName">產品名稱:</label>
					<form:input path="productName" required="true"
								class="form-control" />
				</div>
				<div class="form-group">
					<label for="productCategory">產品分類:</label>
					<form:select class="form-control" id="productCategory"
								 name="productCategory" path="productCategoryNumber">
						<option value="1">遊戲軟體</option>
						<option value="2">周邊</option>
						<option value="3">書籍</option>
						<option value="4">其他</option>
					</form:select>
				</div>
				<div class="form-group">
					<label for="productDescription">產品描述:</label>
					<form:input path="productDescription" required="true"
								class="form-control" />
				</div>
				<div class="form-group">
					<label for="unitPrice">產品價格:</label>
					<form:input type="number" class="form-control" id="unitPrice"
								name="unitPrice" path="unitPrice" />
				</div>
				<div class="form-group">
					<label for="productQuantity">產品數量:</label>
					<form:input type="number" class="form-control"
								id="productQuantity" name="productQuantity" path="productQuantity" />
				</div>
				<div class="form-group">
					<label for="productUploadStatus">產品狀態：</label>
					<form:select class="form-control" id="productUploadStatus"
								 name="productUploadStatus" path="productUploadStatus">
						<option value="上架">上架</option>
						<option value="下架">下架</option>
					</form:select>
				</div>
				<div class="form-group">
					<label for="productImage">上傳圖片:</label>
					<form:input class="form-control" type="file" path="imgFile" />
				</div>
				<button type="submit" class="btn btn-primary btn-block">提交</button>
			</form:form>
		</div>
	</div>
</div>
<!-- 引入 Bootstrap 4 JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
