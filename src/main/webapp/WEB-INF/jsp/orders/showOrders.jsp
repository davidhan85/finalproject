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

.content-container {
    margin-left: 230px;

  }
 
  .main-panel{
margin-left: 200px;
	  border-collapse: separate;
  }

.pagination a{


}

body::before {
  content: "";
  background-image: url('${contextRoot}/images/book-g441b655a1_1920.jpg');
  background-repeat: repeat;
  background-size: contain;
  filter: blur(5px);
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
}
body {
  position: relative;
  z-index: 1;
}


.background-image{

filter: blur(5px);
}
 .pagination-link{
 margin-left: 30px;
  font-size: 1.5em;
}

 #sidebar{
	width: 224px;
 }
 .pagination{
 margin-left: 100px;
 }
 .container{
 	margin-left: 230px;
 	margin-top: -700px;
/*   background-image: url('${contextRoot}/images/gamebook.png'); */
/*   background-repeat: no-repeat; */
/*   background-size: contain; */

 }
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin-left:0px;
}

.card {

	background-color: #fff;
	border-radius: 5px;
	box-shadow: inset 2px 2px 10px rgba(0, 0, 0, 0.3);
	max-width: 1300px;
	  background-image: url('${contextRoot}/images/gamebookre3.png'); 
  	 background-repeat: no-repeat; 
	  background-size: 60% 40%; 
	  background-position: 200px -40px;
	  
}
.cardhead {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
	max-width: 10px;
	/*width: 10%;*/
	margin-left:-1280px;
}
.card-header {
	background-color: #007bff;
	border-radius: 5px 5px 0 0;
	color: #fff;
	padding: 1rem;
	height: 3rem;
}

.card-body {
	padding: 1rem;

}

.row {
	display: flex;
	justify-content: space-between;
	/*margin-bottom: 1rem;*/
}

.col-md-6,
.col-sm-12 {
	padding: 0.5rem;
}

a {
	color: #007bff;
	font-weight: bold;
	text-decoration: none;
	transition: color 0.2s ease-in-out;
}

a:hover {
	color: red;
}

.wrapper{
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	
	.btn btn-outline-danger btn-sm1{
	
	}
}

.img{

}


.logo {
  background-image: url('${contextRoot}/images/gamebook.png');
  background-repeat: no-repeat;
  background-size: contain;
}

.colorindex{
color:		#E800E8;	
font-size:15px;
/* background-color: white; */

}
.colorindex:hover {

  font-size:25px;
}
.col-sm-12{


}

.btn-outline-purple {
  color: #6f42c1;
  border-color: #6f42c1;
  font-weight: bold;
}
.btn-outline-purple:hover {
  color: #fff;
  background-color: #6f42c1;
  border-color: #6f42c1;
  font-weight: bold;
}



.btn-outline-orange {
  color: #F75000;
  border-color: #6f42c1;
  font-weight: bold;
}
.btn-outline-orange:hover {
  color: 	#FFFFFF;
  background-color: #6f42c1;
  border-color: #6f42c1;
  font-weight: bold;
}
</style>
 <link rel="stylesheet" href="../css/ordercss/showOrdersstyle.css">
</head>
<body>

<div id="sidebar">
  <jsp:include page="../layout/sidebar.jsp"></jsp:include>
</div>
  <div class="content-container">

	  <div class="wrapper">
		  <div class="cardhead">
<%--			  <div class="card-header">--%>
<%--				  <h3>這是一個範例標題</h3>--%>
<%--			  </div>--%>
			  <div class="card-body">
				  <div class="row">
					  <div class="col-sm-12">
						  <a class="colorindex" href="${contextRoot}/">首頁</a>
					  </div>
					  <div class="col-sm-12">
						  <a class="colorindex" href="${contextRoot}/orders">查看訂單</a>
					  </div>
					  <div class="col-sm-12">
						  <a class="colorindex" href="${contextRoot}/coupon">查看優惠劵</a>
					  </div>
					  <div class=" col-sm-12">
						  <a class="colorindex" href="${contextRoot}/memberCoupon">查看會員優惠劵</a>
					  </div>
				  </div>
			  </div>
		  </div>
	  </div>
</div>
<div class="main-panel">
	<div class="content-wrapper">
<div class="container">
		<div class="row">
			<!-- <div class="col-8"> -->
			<div class="col-md-12">
              <div class="card">
				<div class="table-responsive pt-3">
				
             <h1 class="text-center" style="color: #007bff; font-size: 3.5rem; text-transform: uppercase; letter-spacing: 0.25rem; font-weight: bold ;">訂單列表</h1> 
              <h3><a  href="${contextRoot}/orders/add" class="btn-outline-danger" style="margin-left: 10px">新增訂單</a></h3>
              <table  class="table table-striped project-orders-table">
				<thead>
				  <tr>
					<th class="ml-5" >新增時間</th>
					<th>訂單編號</th>
					<th>訂單號碼</th>
					<th>會員號碼</th>
					<th>買家編號</th>
					<th>付款方式</th>
					<th>運送方式</th>
					<th>優惠券號碼</th>					
					<th>明細</th>
					<th>編輯</th>
					<th>刪除</th>
					<th>付款</th>					
				  </tr>
				</thead>
				<tbody>
				  <c:forEach var="Orders" items="${page.content}">
					<tr>
					  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE" value="${Orders.createdTime}"/></td>
					  <td>${Orders.orderID}</td>
					  <td>${Orders.orderNo}</td>
					  <td>${Orders.member_num}</td>
					  <td>${Orders.buyerID}</td>
					  <td>${Orders.paymentMethoderNo}</td>
					  <td>${Orders.shippingMethod}</td>
					  <td>${Orders.coupon_id}</td>
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