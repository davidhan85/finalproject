<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>訂單詳情</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">

	<!-- base:css -->

	<style>

		.table-custom {
			border-collapse: collapse;
			width: 100%;
			font-family: Arial, sans-serif;
		}


		.table-custom thead {
			background-color: #f8f9fa;
		}


		.table-custom th {
			padding: 10px;
			text-align: left;
			font-weight: bold;
			border-bottom: 1px solid #dee2e6;
		}


		.table-custom td {
			padding: 10px;
			border-bottom: 1px solid #dee2e6;
		}

		.table-custom tbody tr:nth-child(even) {
			background-color: #f8f9fa;
		}


		.btn-custom {
			padding: 5px 10px;
			font-size: 10px;
			border-radius: 4px;
		}


		.btn-edit {
			background-color: #17a2b8;
			color: #FF0000;
		}
		.btn btn-outline-info btn-delete{
			background-color: #FF0000;
			color: #FF0000;
		}


		body{

			background-image: url('${contextRoot}/images/showorderdetail.jpg');
			background-repeat:no-repeat;
			background-size: cover;
			background-position: 0px 0px;



		}




	</style>
</head>
<body>
<jsp:include page="navbarorder.jsp"></jsp:include>
<br>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<h1>訂單列表</h1>
							<table class="table-custom">
								<thead>
								<tr>
									<th>訂單詳情編號</th>
									<th>訂單編號</th>
									<th>產品名稱</th>
									<th>單價</th>
									<th>產品數量</th>
									<th>編輯</th>
									<th>刪除</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="orderDetail" items="${ordersDetails}">
									<tr>
										<td>${orderDetail.id}</td>
										<td>${orderDetail.orders.orderID}</td>
										<td>${orderDetail.productName}</td>
										<td>${orderDetail.unitPrice}</td>
										<td>${orderDetail.productQuantity}</td>
										<td>
											<form action="${contextRoot}/orders/edit">
												<input type="hidden" name="id" value="${orderDetail.id}" />
												<input type="submit" class="btn btn-outline-info btn-sm" value="編輯" />
											</form>
										</td>
										<td>
											<form action="${contextRoot}/orders/delete" method="post">
												<input type="hidden" name="_method" value="delete" />
												<input type="hidden" name="id" value="${orderDetail.id}" />
												<input type="submit" class="btn btn-outline-info btn-delete" onclick="showDelete(123)" value="刪除" />
											</form>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/JavaScript">
	function showDelete(orderID) {
		var flag = confirm("確定要刪除嗎?");
		if(flag){
			window.location.href = "/finalproject3/src/main/webapp/WEB-INF/jsp/orders/OrderMainPage.jsp";
		}
	}

</script>
</body>
</html>