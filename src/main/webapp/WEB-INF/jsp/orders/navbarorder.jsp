<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">

<title></title>
<style>
.header_section {
  background-color: #fff;
  box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px;
}

.logo {
  width: 100%;
  max-width: 100%;
}

.nav {
  display: flex;
  justify-content: flex-end;
  margin-right: 0;
}

.nav-link {
  color: #000;
  font-weight: bold;
  text-transform: uppercase;
  padding: 2rem;
  margin-right: 10px;
}

.nav-link:hover {
  color: #007bff;
  text-decoration: none;
}

</style>

</head>
<body>


<div class="header_section">
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <a href="#">
<%--           <img src="${contextRoot}/images/gamebook2.png" alt="img" class="logo"> --%>
        </a>
      </div>
      <div class="col-md-10">
        <nav>
          <ul class="nav justify-content-end">
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/">首頁</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/orders/add">新增訂單</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/orders">查看訂單</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/coupon/add">新增優惠劵</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/coupon">查看優惠劵</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/memberCoupon/add">新增會員優惠劵</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${contextRoot}/memberCoupon">查看會員優惠劵</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</div>


<!--      <div class="login_menu"> -->
<%--         <a href="#"><img src="${contextRoot}/images/blog_1.jpg" alt="img"></a> --%>
<!--      </div> -->
  </nav>
</div>
<script src="${contextRoot}/css/ordercss/bootstrap.min.css"></script>
<script src="${contextRoot}/js/jquery-3.4.1.min.js"></script>
</body>
</html>