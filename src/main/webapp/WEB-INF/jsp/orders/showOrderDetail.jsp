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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PolluxUI Admin</title>
<!-- base:css -->
<link rel="stylesheet" href="vendors/typicons/typicons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />
<!-- <style> -->
<!-- /* .footer-navbar { */ -->
<!-- /*   position: absolute; */ -->
<!-- /*   bottom: 0; */ -->
<!-- /*   width: 150%; */ -->
<!--   </style> -->

</head>
<body>

<jsp:include page="navbarorder.jsp"></jsp:include>
<div class="main-panel">
	<div class="content-wrapper">
<div class="container">
		<div class="row">
			<!-- <div class="col-8"> -->
			<div class="col-md-12">
              <div class="card">
				<div class="table-responsive pt-3">
              <h1>訂單列表</h1>
              <table  class="table table-striped project-orders-table">
				<thead>
				  <tr>
					<th>訂單詳情編號</th>
					<th>訂單編號</th>
					<th>產品名稱<th>
					<th>單價</th>
					<th>產品數量</th>
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
						  <input type="submit" class="btn btn-outline-danger btn-sm" onclick="showDelete(123)" value="刪除" />
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