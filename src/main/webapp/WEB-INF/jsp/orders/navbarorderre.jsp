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

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<title></title>
<style>
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.card {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
  max-width: 800px;
  width: 100%;
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
  margin-bottom: 1rem;
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

</style>

</head>
<body>

<!-- <div class="header_section my-header-section"> -->
<!--   <div class="container"> -->
<!--     <div class="row"> -->
<!--       <div class="col-md-2"> -->
<!--         <a href="#"> -->
<%--           <img src="${contextRoot}/images/gamebook2.png" alt="img" class="logo"> --%>
<!--         </a> -->
<!--       </div> -->
<!--       <div class="col-md-10"> -->
<!--         <nav> -->
<!--           <ul class="nav justify-content-end menu"> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/">首頁</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/orders/add">新增訂單</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class=" href="${contextRoot}/orders">查看訂單</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/coupon/add">新增優惠劵</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/coupon">查看優惠劵</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/memberCoupon/add">新增會員優惠劵</a> --%>
<!--             </li> -->
<!--             <li class=""> -->
<%--               <a class="" href="${contextRoot}/memberCoupon">查看會員優惠劵</a> --%>
<!--             </li> -->
<!--           </ul> -->
<!--         </nav> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
</div>

<div class="wrapper">
  <div class="card">
    <div class="card-header">
      <h3>這是一個範例標題</h3>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-3 col-sm-12">
           <a class="" href="${contextRoot}/">首頁</a>
        </div>
        <div class="col-md-3 col-sm-12">
          <a class=" href="${contextRoot}/orders">查看訂單</a>
        </div>
         <div class="col-md-3 col-sm-12">
         <a class="" href="${contextRoot}/coupon">查看優惠劵</a>
        </div>
        <div class="col-md-3 col-sm-12">
           <a class="" href="${contextRoot}/memberCoupon">查看會員優惠劵</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!--      <div class="login_menu"> -->
<%--         <a href="#"><img src="${contextRoot}/images/blog_1.jpg" alt="img"></a> --%>
<!--      </div> -->

<script src="${contextRoot}/css/ordercss/bootstrap.min.css"></script>
<script src="${contextRoot}/js/jquery-3.4.1.min.js"></script>
 
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