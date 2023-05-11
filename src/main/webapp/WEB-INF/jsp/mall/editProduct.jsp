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
				<form:form method="post"
					action="${contextRoot}/updateListedProducts/${listedProduct.productId}"
					modelAttribute="listedProduct" enctype="multipart/form-data">
					<input type="hidden" name="_method" value="put">
					<table>
						<tr>
							<td><label for=m_number>會員編號:</label></td>
							<td><form:input path="m_number" required="ture"
									readonly="true" /></td>
						</tr>



						<tr>
							<td><label for=productId>產品ID:</label></td>
							<td><form:input path="productId" required="ture"
									readonly="true" /></td>
						</tr>

						<tr>
							<td><label for=productName>產品名稱:</label></td>
							<td><form:input path="productName" required="ture"
									/></td>
						</tr>

						<tr>
							<td><label for="productCategory">產品分類:</label></td>
							<td><form:select class="form-control" id="productCategory"
								name="productCategory" path="productCategoryNumber">
									<option value="1">遊戲軟體</option>
									<option value="2">周邊</option>
									<option value="3">書籍</option>
									<option value="4">其他</option>
							</form:select></td>
						</tr>

						<tr>
							<td><label for=productDescription>產品描述:</label></td>
							<td><form:input path="productDescription" required="ture"
									 /></td>
						</tr>


						<tr>
							<td><label for="unitPrice">產品價格:</label></td>
							<td><form:input type="number" class="form-control" id="unitPrice"
								name="unitPrice" path="unitPrice"/></td>
						</tr>


						<tr>
							<td><label for="productQuantity">產品數量:</label></td>
							<td><form:input type="number" class="form-control"
								id="productQuantity" name="productQuantity" path="productQuantity"/></td>
						</tr>

						<tr>
							<td><label for="productUploadStatus">產品狀態：</label></td>
							<td><form:select class="form-control" id="productUploadStatus"
								name="productUploadStatus" path="productUploadStatus">
									<option value="上架">上架</option>
									<option value="下架">下架</option>
							</form:select></td>
						</tr>

						<tr>
							<td><label for="productImage">上傳圖片:</label></td>
							<td><form:input class="form-control" type="file"
								path="imgFile"/></td>
						</tr>


</table>
						<button type="submit" class="btn btn-primary">提交</button>
				</form:form>
			</div>
		</div>

	</div>

</body>

</html>

