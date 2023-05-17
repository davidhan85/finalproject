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
<title>Insert title here</title>

<style>

.logo{
	width: 100px;
  height: 100px;

}

.img{


}
body {
  font-family: 'Lato', sans-serif;
  margin: 0;
  background-image: url('${contextRoot}/images/book-g441b655a1_1920.jpg');
  background-repeat:repeat-y;
  background-size: contain;
}

h1 {
  margin-bottom: 40px;
}

label {
  color: white;
}

.btn-send {
  font-weight: 300;
  text-transform: uppercase;
  letter-spacing: 0.2em;
  width: 80%;
  margin-left: 3px;
}

.help-block.with-errors {
  color: #ff5050;
  margin-top: 5px;
}

.card {
  margin: 10px 200px;
  padding: 20px;
  background-color: #f5f5f5;
  border-radius: 5px;
  box-shadow: 0px 0px 10px 
.form-group{
  font-size: 20px; /* 設定字體大小為 24px */
}
.form-control {
  display: gray;
  width: 100%;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #495057;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.h1{


}

.h1d{
style="text-align: center;


}


</style>



</head>
<body>
<%-- <jsp:include page="../layout/navebar.jsp"></jsp:include> --%>

<jsp:include page="../layout/navebar.jsp"></jsp:include>
<jsp:include page="navbarorderadd.jsp"></jsp:include>
<div class="h1d">
  
  </div>
  <br>
<div class="card">
  <div class="card-body">
    <form:form modelAttribute="orders" method="post" action="${contextRoot}/orders/post">
     <h1>新增訂單</h1>
      <div class="form-group">
        <label for="title">訂單號碼</label>
        <form:input path="orderNo" class="form-control" id="title" placeholder="輸入訂單號碼"></form:input>
      </div>
      <br>
      <div class="form-group">
        <label for="title">會員號碼</label>
        <form:input path="member" class="form-control" id="title" placeholder="輸入會員號碼"></form:input>
      </div>
      <br>
      <div class="form-group">
        <label for="title">買家編號</label>
        <form:input path="buyerID" class="form-control" id="title" placeholder="輸入買家編號"></form:input>
      </div>
      <br>
      <div class="form-group">
        <label for="category">付款方式</label>
        <form:select path="paymentMethoderNo" class="form-control" id="category">
          <option>貨到付款</option>
          <option>信用卡結帳</option>
        </form:select>
      </div>
      <br>
      <div class="form-group">
        <label for="category">運送方式</label>
        <form:select path="shippingMethod" class="form-control" id="category">
          <option>超商取貨</option>
          <option>宅配</option>
        </form:select>
      </div>
      <br>
      <div class="form-group" id="address-group">
        <label for="address">收件地址</label>
        <form:input path="address" class="form-control" id="address" placeholder="輸入地址"></form:input>
      </div>
      <br>
      <div class="form-group">
        <label for="title">優惠券編號</label>
        <form:input path="coupon_id" class="form-control" id="title" placeholder="輸入優惠券號碼"></form:input>
      </div>
      <br>
      <button type="submit" class="btn btn-outline-info btn" onclick="return confirmSubmit()">送出訂單</button>
    </form:form>
  </div>
</div>

	<script>
function confirmSubmit() {
    return confirm("確認要送出訂單嗎？");
}
</script>
</body>
</html>