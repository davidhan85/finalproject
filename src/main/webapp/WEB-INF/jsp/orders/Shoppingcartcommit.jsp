<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 

<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextRoot}/css/magnific-popup.css">
<link rel="stylesheet" href="${contextRoot}/css/jquery-ui.css">
<link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">


<link rel="stylesheet" href="${contextRoot}/css/aos.css">

<link rel="stylesheet" href="${contextRoot}/css/styleCART.css">
<link rel="stylesheet" href="${contextRoot}/css/styleCART2.css">



<style>
	table {
		width: 100%;
		border-collapse: collapse;
		table-layout: fixed;
	}
	
	th, td {
		padding: 10px;
		text-align: left;
		border: 1px solid #ddd;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	th {
		background-color: #f2f2f2;
	}
	
	tr:hover {
		background-color: #f5f5f5;
	}
	
	.text-black{
  font-size: 1.2em; /* 設置字體大小 */
  font-family: "Arial", sans-serif; /* 設置字體 */
  font-weight: bold; /* 設置字體加粗 */
  color: 	#0031e3; /* 設置字體顏色 */
  text-decoration: none; /* 設置文字下劃線 */
  text-transform: uppercase; /* 設置文字轉換為大寫 */
}
.h1{

  font-size: 1.5em; /* 設置字體大小 */
  font-family: "Arial", sans-serif; /* 設置字體 */
  font-weight: bold; /* 設置字體加粗 */
  color: 	#0031e3; /* 設置字體顏色 */
  text-decoration: none; /* 設置文字下劃線 */
  text-transform: uppercase; /* 設置文字轉換為大寫 */
  margin-left:280px;

}
.text-black1{
  font-size: 1.5em; /* 設置字體大小 */
  font-family: "Arial", sans-serif; /* 設置字體 */
  font-weight: bold; /* 設置字體加粗 */
  color: 	#0000E3; /* 設置字體顏色 */
  text-decoration: none; /* 設置文字下劃線 */
  text-transform: uppercase; /* 設置文字轉換為大寫 */


}

form{
/*   border: 2px solid #ccc; */
/*   padding: 10px; */
/*   margin: 10px; */
 
}




body{
 background-image: url('${contextRoot}/images/backgroundorder3.png');
  background-repeat: no-repeat;
  background-size: cover;	


}
</style>


</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<div class="bg-light py-3">
      <div class="containerh">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${contextRoot}/index/cart">首頁</a> <span class="mx-2 mb-0">/</span> <strong style="color:blue">購物車</strong>
        <span class="mx-2 mb-0">/</span><strong class="text-black1">訂單確認</strong></div>
        </div>
      </div>
    </div>
    <br>
<h1 class="h1">訂單商品</h1>
<table>
		<thead>
			<tr>
				<th>商品名稱</th>
				<th>數量</th>
				<th>單價</th>
				<th>小計</th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="item" items="${cartItem}">
				<tr>
					<td>${item.listedProduct.productName}</td>
					<td>${item.listedProduct.productQuantity}</td>
					<td>${item.listedProduct.unitPrice}</td>
					<td>${item.quantity}</td>
				</tr>
</c:forEach>
</tbody>
</table>
<hr>
<%-- <form:form action="${contextRoot}/orders/post2" method="post" modelAttribute="orders"> --%>
<%-- <form:input path="orderNo" class="createdTime" id="title" placeholder="輸入訂單號碼" type="text"></form:input>					 --%>
<%-- <form:input path="member_num" class="form-control" id="title" placeholder="輸入會員號碼"></form:input> --%>
<%-- <form:input path="buyerID" class="form-control" id="title" placeholder="輸入買家編號"></form:input> --%>
<%-- <form:select path="paymentMethoderNo" class="form-control" id="category"> --%>
<!-- <option>超商取貨</option> -->
<!-- <option>宅配</option> -->
<%-- </form:select> --%>
<%-- <form:select path="shippingMethod" class="form-control" id="category"> --%>
<!-- <option>超商取貨</option> -->
<!-- <option>宅配</option> -->
<%-- </form:select> --%>
<%-- <form:input path="address" class="form-control" id="address" placeholder="輸入地址"></form:input> --%>
<%-- <form:input path="coupon_id" class="form-control" id="title" placeholder="輸入優惠券號碼"></form:input> --%>
<!-- <button type="submit" class="btn btn-primary">送出訂單</button> -->
<%-- </form:form> --%>
<!-- 在表單中添加必要的欄位 -->
<%-- <form:form action="${contextRoot}/orders/post2" method="post" modelAttribute="orders"> --%>
<%--   <form:input path="orderNo" class="createdTime" id="title" placeholder="輸入訂單號碼" type="text"></form:input>					 --%>
<%--   <form:input path="member_num" class="form-control" id="title" placeholder="輸入會員號碼"></form:input> --%>
<%--   <form:input path="buyerID" class="form-control" id="title" placeholder="輸入買家編號"></form:input> --%>
<%--   <form:select path="paymentMethoderNo" class="form-control" id="category"> --%>
<!--     <option value="CREDIT">信用卡付款</option> -->
<!--     <option value="WEBATM">WebATM</option> -->
<!--     <option value="ATM">ATM 轉帳</option> -->
<!--     <option value="CVS">超商代碼繳費</option> -->
<%--   </form:select> --%>
<%--   <form:select path="shippingMethod" class="form-control" id="category"> --%>
<!--     <option value="delivery">宅配</option> -->
<!--     <option value="pickup">超商取貨</option> -->
<%--   </form:select> --%>
<%--   <form:input path="address" class="form-control" id="address" placeholder="輸入地址"></form:input> --%>
<%--   <form:input path="coupon_id" class="form-control" id="title" placeholder="輸入優惠券號碼"></form:input> --%>

<%-- </form:form> --%>

<form:form action="${contextRoot}/orders/post2" method="post" modelAttribute="orders">
  <div class="row">
    <div class="col-md-6 mb-5 mb-md-0">
      <h2 class="h3 mb-3 text-black" style="margin-left:300px;">訂單填寫</h2>
      <div class="p-3 p-lg-5 border">
        <div class="form-group row">
          <div class="col-md-6">
            <label for="order_No" class="text-black">訂單號碼<span class="text-danger">*</span></label>
            <form:input path="orderNo" class="form-control" id="order_No" placeholder="輸入訂單號碼" type="text"></form:input>
          </div>
          <div class="col-md-6">
            <label for="member_num" class="text-black">會員號碼 <span class="text-danger">*</span></label>
            <form:input path="member_num" class="form-control" id="member_num" placeholder="輸入會員號碼"></form:input>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-6">
            <label for="buyerID" class="text-black">買家編號</label>
            <form:input path="buyerID" class="form-control" id="buyerID" placeholder="輸入買家編號"></form:input>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-6">
            <label for="coupon_id" class="text-black">優惠券號碼</label>
            <form:input path="coupon_id" class="form-control" id="coupon_id" placeholder="輸入優惠券號碼"></form:input>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-12">
            <label for="address" class="text-black">地址<span class="text-danger">*</span></label>
              <form:input path="address" class="form-control" id="address" placeholder="輸入地址"></form:input>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-md-12">
          <label for="category" class="text-black">付款方式<span class="text-danger">*</span></label>
            <form:select path="paymentMethoderNo" class="form-control" id="category">
		    <option value="1">信用卡付款</option>
		    <option value="2">貨到付款</option>
  			</form:select>
          </div>
           </div>
           <div class="form-group row">
          <div class="col-md-12">
           <label for="category" class="text-black">運送方式<span class="text-danger">*</span></label>
        	<form:select path="shippingMethod" class="form-control" id="category">
   		 	<option value="delivery">宅配</option>
<!--     		<option value="pickup">超商取貨</option> -->
 		 	</form:select>		 	
          </div> 
          </div>      
        </div>
        </div>
        </div>
	<br>
   <div>
          <button type="submit" class="btn btn-primary" style="margin-left:300px">送出訂單</button>
       </div>
     <br>  
</form:form>

<script src="${contextRoot}/js/jquery-3.3.1.min.js"></script>
<script src="${contextRoot}/js/jquery-ui.js"></script>
<script src="${contextRoot}/js/popper.min.js"></script>
<script src="${contextRoot}/js/bootstrap.min.js"></script>
<script src="${contextRoot}/js/owl.carousel.min.js"></script>
<script src="${contextRoot}/js/jquery.magnific-popup.min.js"></script>
<script src="${contextRoot}/js/aos.js"></script>

<script src="${contextRoot}/js/main.js"></script>






</body>
</html>