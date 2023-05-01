<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%-- <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" /> --%>
<!-- <!DOCTYPE html> -->
<!-- <html xmlns:th="http://www.thymeleaf.org"> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>修改頁面</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- 	<h1>修改頁面</h1> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-8"> -->
<!-- 				<div class="card"> -->

<!-- 					<div class="card-header">訊息</div> -->
<!-- 					<div class="card-body"> -->
<%-- 						<form:form class="form-control" modelAttribute="product" --%>
<%-- 							method="post" action="${contextRoot}/editListedProducts" --%>
<%-- 							enctype="multipart/form-data"> --%>
<%-- 							<form:hidden path="productId" /> --%>
<%-- 							<form:input path="productName" class="form-control" --%>
<%-- 								name="productName" id="productName" /> --%>
<!-- 							<select th:field="*{productCategorynumber}"> -->
<%-- 								<option th:each="category : ${categories}" --%>
<%-- 									th:value="${category}" th:text="${category.categoryName}"></option> --%>
<!-- 							</select> -->
<!-- 							<br> -->
<%-- 							<form:textarea path="productDescription" class="form-control" --%>
<%-- 								name="productDescription" id="productDescription" rows="10" --%>
<%-- 								cols="30" /> --%>
<%-- 							<form:input path="unitPrice" class="form-control" --%>
<%-- 								name="unitPrice" id="unitPrice" /> --%>
<%-- 							<form:input path="productQuantity" class="form-control" --%>
<%-- 								name="productQuantity" id="productQuantity" /> --%>
<%-- 							<form:input path="productUploadStatus" class="form-control" --%>
<%-- 								name="productUploadStatus" id="productUploadStatus" /> --%>
<%-- 														<form:input path="productImage.imageFile" class="form-control" --%>
<%-- 															name="productImage.imageFile" id="productImage" type="file" /> --%>
<!-- 							<button type="submit" class="btn btn-primary">送出</button> -->
<%-- 						</form:form> --%>

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </body> -->
<!-- </html> -->




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
<!-- 引入 Bootstrap 5 CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>

<body>
	<!DOCTYPE html>
<html>
<head>
<title>產品編輯表單</title>
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
				<h2>產品編輯表單</h2>
				<form:form action="${contextRoot}/Editproduct" method="post"
					modelAttribute="listedProduct" enctype="multipart/form-data">
					<div class="form-group">
						<label for="member">會員編號:</label>
						<form:input class="form-control" id="member"
							path="m_number.m_number" name="number" type="text"
							readonly="true" />
					</div>

					<div class="form-group">
						<label for="productID">產品ID:</label>
						<form:input type="text" class="form-control" id="productID"
							path="productID" name="productID" readonly="true" />
					</div>

					<div class="form-group">
						<label for="productName">產品名稱:</label>
						<form:input type="text" class="form-control" id="productName"
							path="productName" name="productName" placeholder="請輸入產品名稱" />
					</div>
					<div class="form-group">
						<label for="productCategory">產品分類:</label>
						<form:select class="form-control"
							path="ProductCategorynumber.ProductCategorynumber"
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
					</div>

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

