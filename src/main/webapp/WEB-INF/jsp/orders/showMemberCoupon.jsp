<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示會員優惠券清單</title>
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
}
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
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
					<th class="ml-5">會員優惠券編號</th>
					<th>會員號碼</th>
					<th>優惠券編號</th>
					<th>優惠券使用期限</th>
					<th>優惠券狀態</th>
					<th>訂單編號</th>					
					<th>編輯</th>
					<th>刪除</th>
				  </tr>
				</thead>
				<tbody>
				  <c:forEach var="MemberCoupon" items="${page.content}">
					<tr>
					  <td>${MemberCoupon.MemberCouponID}</td>
					  <td>${MemberCoupon.member_number}</td>
					  <td>${MemberCoupon.coupon_id}</td>
					  <td>${MemberCoupon.coupon_gettime}</td>
					  <td>${MemberCoupon.coupon_status}</td>
					  <td>${MemberCoupon.orderID}</td>
					  <td>
						<form action="${contextRoot}/memberCoupon/edit" method="get">
						  <input type="hidden" name="id" value="${MemberCoupon.MemberCouponID}" />
						  <input type="submit" class="btn btn-outline-info btn-sm" value="編輯" />
						</form>
					  </td>
					  <td>
						<form action="${contextRoot}/memberCoupon/delete" method="post">
						  <input type="hidden" name="_method" value="delete" />
						  <input type="hidden" name="id" value="${MemberCoupon.MemberCouponID}" />
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
			<br />
			<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				  <jstl:choose>
				     <jstl:when test="${page.number != pageNumber-1 }">
				          <a href="${contextRoot}/memberCoupon?p=${pageNumber}">${pageNumber}</a>
				     </jstl:when>
				     <jstl:otherwise>
				            ${pageNumber}
				     </jstl:otherwise>
				  
				  </jstl:choose>
			
				  <jstl:if test="${pageNumber != page.totalPages}">
				    -
				  </jstl:if>
			
			
			</jstl:forEach>
 </div>
 </div>
 </div>
 
 <script type="text/JavaScript">
    function showDelete(OrderID) {
        var flag = confirm("確定要刪除嗎?");
        if(flag){
        	 window.location.href = "/finalproject3/src/main/webapp/WEB-INF/jsp/orders/OrderMainPage.jsp";
        }
    }

 </script>
 
 	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>
</html>