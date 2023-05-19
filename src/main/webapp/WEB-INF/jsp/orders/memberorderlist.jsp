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
	<title>Show Message Page</title>
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
	<link href='https://unpkg.com/css.gg@2.0.0/icons/css/file.css' rel='stylesheet'>
	<style>
		<!-- /* .footer-navbar { */ -->
		<!-- /*   position: absolute; */ -->
		<!-- /*   bottom: 0; */ -->
		<!-- /*   width: 150%; */ -->

		/* table{ */

		/* background-color:white; */
		/* } */


		/* .h1{ */
		/* background-color:white; */


		/* } */
		.col-md-12{

			background-color:white;
		}
		.card{
			background-color:white;
			font:white;

		}
		.btn-outline-purple {
			border: 1px solid yellow;
			color: yellow;
			background-color: transparent;
			/* 其他可能的樣式設定 */
		}

		.btn-outline-orange{
			border: 1px solid white;
			color: red;
			background-color: transparent;


		}
		.main-panel{


			background-image: url('${contextRoot}/images/gamebookre2.png');
			background-repeat: no-repeat;
			background-position: -2% -10%;
		}

		tr{
			font-color:white;


		}
	</style>
	<link rel="stylesheet" href="../css/ordercss/showOrdersstyle.css">
</head>
<body>

<div>
	<jsp:include page="../layout/navebar.jsp"></jsp:include>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">會員中心</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
			aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav">
			<li class="nav-item text-center">
				<a class="nav-link" href="#">個人資料</a>
			</li>
			<li class="nav-item text-center">
				<a class="nav-link" href="${contextRoot}/changePwdPage">修改密碼</a>
			</li>
			<!--  ordermanage -------------------------------------------------------------->
			<li class="nav-item active text-center">
				<a class="nav-link" href="${contextRoot}/order/findmember/${memberbean.m_number}">訂單紀錄</a>
			</li>
			<!--  ordermanage -------------------------------------------------------------->
		</ul>
	</div>
</nav>
<!--   <div class="content-container"> -->

<!-- 	  <div class="wrapper"> -->
<!-- 		  <div class="cardhead"> -->
<%-- <%--			  <div class="card-header">--%>
<%-- <%--				  <h3>這是一個範例標題</h3>--%>
<%-- <%--			  </div>--%>
<!-- 			  <div class="card-body"> -->
<!-- 				  <div class="row"> -->
<!-- 					  <div class="col-sm-12"> -->
<%-- 						  <a class="colorindex" href="${contextRoot}/">首頁</a> --%>
<!-- 					  </div> -->
<!-- 					  <div class="col-sm-12"> -->
<%-- 						  <a class="colorindex" href="${contextRoot}/orders">查看訂單</a> --%>
<!-- 					  </div> -->
<!-- 					  <div class="col-sm-12"> -->
<%-- 						  <a class="colorindex" href="${contextRoot}/coupon">查看優惠劵</a> --%>
<!-- 					  </div> -->
<!-- 					  <div class=" col-sm-12"> -->
<%-- 						  <a class="colorindex" href="${contextRoot}/memberCoupon">查看會員優惠劵</a> --%>
<!-- 					  </div> -->
<!-- 				  </div> -->
<!-- 			  </div> -->
<!-- 		  </div> -->
<!-- 	  </div> -->
<!-- </div> -->
<br>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="container">
			<div class="row">
				<!-- <div class="col-8"> -->
				<div class="col-md-12">
					<div class="card">
						<div class="table-responsive pt-3">

							<h1 class="text-center" style="color:white; font-size: 3.5rem; text-transform: uppercase; letter-spacing: 0.25rem; font-weight: bold ;">會員訂單列表</h1>
							<h3><a  href="${contextRoot}/orders/add" class="btn-outline-danger" style="margin-left: 10px">新增訂單</a></h3>
							<table  class="table table-striped project-orders-table">
								<thead>
								<tr>
									<th class="ml-5" ><span style="color: white;">新增時間</span></th>
									<th><span style="color: white;">訂單編號</span></th>
									<th><span style="color: white;">訂單號碼</span></th>
									<th><span style="color: white;">會員號碼</span></th>
									<th><span style="color: white;">買家編號</span></th>
									<th><span style="color: white;">付款方式</span></th>
									<th><span style="color: white;">運送方式</span></th>
									<th><span style="color: white;">優惠券號碼</span></th>
									<th><span style="color: white;">明細</span></th>
									<th><span style="color: white;">編輯</span></th>
									<th><span style="color: white;">刪除</span></th>
									<th><span style="color: white;">付款</span></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach var="Orders" items="${pagemember.content}">
									<tr>
										<td><span style="color: white;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${Orders.createdTime}"/></span></td>
										<td><span style="color: white;">${Orders.orderID}</span></td>
										<td><span style="color: white;">${Orders.orderNo}</span></td>
										<td><span style="color: white;">${Orders.member.m_number}</span></td>
										<td><span style="color: white;">${Orders.buyerID}</span></td>
										<td><span style="color: white;">${Orders.paymentMethoderNo}</span></td>
										<td><span style="color: white;">${Orders.shippingMethod}</span></td>
										<td><span style="color: white;">${Orders.coupon_id}</span></td>
										<td>
											<form action="${contextRoot}/OrdersDetail/${Orders.orderID}">
													<%-- 						  <input type="hidden" name="id" value="${OrdersDetail.ID}" /> --%>
													<%--   						  <input type="text" name="id" value="${Orders.orderDetails}" /> --%>
												<input type="submit" class="btn btn-outline-info btn-sm" value="查看訂單詳情" />
											</form>
										</td>
										<td>
											<form action="${contextRoot}/orders/edit">
												<input type="hidden" name="id" value="${Orders.orderID}" />
												<input type="submit" class="btn btn-outline-info btn-sm" value="編輯" />
											</form>
										</td>
										<td>
											<form action="${contextRoot}/orders/delete" method="post">
												<input type="hidden" name="_method" value="delete" />
												<input type="hidden" name="id" value="${Orders.orderID}" />
												<input type="submit" class="btn btn-outline-danger btn-sm" onclick="showDelete(123)" value="刪除" />
											</form>
										</td>
										<td>
											<form action="${contextRoot}/orderecpay" method="post">
												<input type="hidden" name="orderID" value="${Orders.orderID}" />
												<c:choose>
													<c:when test="${Orders.paymentStatus eq '已付款'}">
														<input type="submit" value="已付款" class="btn-outline-purple" disabled>
													</c:when>
													<c:otherwise>
														<input type="submit" value="未付款" class="btn-outline-orange">
													</c:otherwise>
												</c:choose>
												<!-- 						  <input type="submit" class="btn btn-outline-danger btn-sm" onclick="" value="付款" /> -->
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
		<div class="pagination">
			<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<jstl:choose>
					<jstl:when test="${page.number != pageNumber-1 }">
						<a href="${contextRoot}/orders?p=${pageNumber}" class="pagination-link">${pageNumber}</a>
					</jstl:when>
					<jstl:otherwise>
						<a class="pagination-link">${pageNumber}</a>
					</jstl:otherwise>

				</jstl:choose>

				<jstl:if test="${pageNumber != page.totalPages}">
					-
				</jstl:if>


			</jstl:forEach>
		</div>
	</div>
</div>

<jsp:include page="../layout/footerbar.jsp"></jsp:include>
<script type="text/JavaScript">
	function showDelete(OrderID) {
		var flag = confirm("確定要刪除嗎?");
		if(flag){
			window.location.href = "/finalproject3/src/main/webapp/WEB-INF/jsp/orders/OrderMainPage.jsp";
		}
	}

</script>

</body>
</html>