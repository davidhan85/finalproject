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
<title>新增產品</title>
<!-- 引入 Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>

<body>
	<!DOCTYPE html>
<html>
<head>
<title>產品上架表單</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<h2>產品上架表單</h2>
				<form:form action="${contextRoot}/Insertproduct" method="post"
					modelAttribute="listedProduct" enctype="multipart/form-data">
					<div class="form-group">
						<label for="member">會員編號:</label>
						<form:input class="form-control" id="member"
							path="m_number.m_number" name="number" type="text" />
					</div>



					<div class="form-group">
						<label for="productName">產品名稱:</label>
						<form:input type="text" class="form-control" id="productName"
							path="productName" name="productName" placeholder="請輸入產品名稱" />
					</div>
					<div class="form-group">
						<label for="productCategory">產品分類:</label>
						<form:select class="form-control"
							path="productCategoryNumber.productCategoryNumber"
							id="productCategory" name="productCategory">
							<option value="1">遊戲軟體</option>
							<option value="2">周邊</option>
							<option value="3">書籍</option>
							<option value="4">其他</option>
						</form:select>
					</div>
					<div class="form-group">
						<label for="productDescription">產品描述:</label>
						<form:textarea class="form-control" id="productDescription"
							path="productDescription" name="productDescription" rows="3"
							placeholder="請輸入產品描述"></form:textarea>
					</div>
					<div class="form-group">
						<label for="unitPrice">產品價格:</label>
						<form:input type="number" class="form-control" id="unitPrice"
							path="unitPrice" name="unitPrice" placeholder="請輸入產品價格" />
					</div>
					<div class="form-group">
						<label for="productQuantity">產品數量:</label>
						<form:input type="number" class="form-control"
							id="productQuantity" path="productQuantity"
							name="productQuantity" placeholder="請輸入產品數量" />
					</div>
					<div class="form-group">
						<label for="productUploadStatus">產品狀態：</label>
						<form:select class="form-control" id="productUploadStatus"
							path="productUploadStatus" name="productUploadStatus">
							<option value="上架">上架</option>
							<option value="下架">下架</option>
						</form:select>


						<div class="mb-3">
							<label for="formFile" class="form-label">上傳圖片:</label>
							<form:input class="form-control" type="file" id="ProductImage"
								path="imgFile" name="ProductImage" />
						</div>


						<button type="submit" class="btn btn-primary">提交</button>
				</form:form>
			</div>
		</div>

	</div>



</body>

</html>



