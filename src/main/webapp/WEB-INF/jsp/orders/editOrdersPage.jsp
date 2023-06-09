<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>修改頁面</title>

  <style>

    body {

      background-image: url('${contextRoot}/images/editorder.jpg');
      background-repeat:repeat;
      background-size: cover;
    }

    .card{
      background: linear-gradient(to right, #808080, #ffffff);
    }


    .col-lg-8{

    }

    .card-body{
      border: 1px solid 	#FFFFFF;
    }
  </style>
</head>
<body>

<jsp:include page="navbarorderedit.jsp"></jsp:include>
<div class="container">
  <div class="">
    <div class="col-lg-8">

      <div class="card-header">
        <h1 class="text-center"><span style="color: white;">修改頁面</span></h1>
      </div>
      <div class="card-body">
        <form:form class="form-control1" modelAttribute="orders" method="put" action="${contextRoot}/orders/edit">
          <form:input type="hidden" path="orderID" />
          <br>
          <br>
          <div class="form-group">
            <label for="orderNo"><span style="color: white;">訂單號碼</span></label>
            <form:input path="orderNo" class="form-control" id="orderNo" />
          </div>

          <div class="form-group">
            <label for="member_num"><span style="color: white;">會員號碼</span></label>
            <form:input path="member" class="form-control" id="member_num" readonly="true" />
          </div>

          <div class="form-group">
            <label for="buyerID"><span style="color: white;">買家編號</span></label>
            <form:input path="buyerID" class="form-control" id="buyerID" />
          </div>

          <div class="form-group">
            <label for="category"><span style="color: white;">付款方式</span></label>
            <form:select path="paymentMethoderNo" class="form-control" id="category">
              <option>貨到付款</option>
              <option>信用卡結帳</option>
            </form:select>
          </div>

          <div class="form-group">
            <label for="category"><span style="color: white;">運送方式</span></label>
            <form:select path="shippingMethod" class="form-control" id="category">
              <option>超商取貨</option>
              <option>宅配</option>
            </form:select>
          </div>

          <div class="form-group">
            <label for="coupon_id"><span style="color: white;">優惠券編號</span></label>
            <form:input path="coupon_id" class="form-control" id="coupon_id" />
          </div>

          <button type="submit" class="btn btn-primary">編輯完成</button>
        </form:form>
      </div>
    </div>
  </div>
</div>



<%-- 	<jsp:include page="../layout/footerbar.jsp"></jsp:include> --%>
</body>
</html>