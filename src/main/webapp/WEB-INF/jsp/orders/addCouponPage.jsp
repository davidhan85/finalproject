<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">

<title>Insert title here</title>
 <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    font-family: 'Montserrat', sans-serif;
}

body {
/*     background-color: rgb(10, 11, 11); */
/*     background-repeat: no-repeat; */
/*     background-size: cover; */
/*     background-image: url("images/gamebook.png"); */
/*     padding: 10px; */
    
}

.container {
    max-width: 1000px;
    max-height: 1000px;
    margin:auto;
    background-color: rgb(240, 243, 244,0.8);
    border: 2px solid rgb(237, 5, 5);
  border-radius: 40px;
}

.line {
    max-height: 10em;
    width: 100px;
    border-top: 3px solid #b444a3;
}


option {
    font-size: 14px;
}

.text-muted {
    font-size: 20px;
    color: #e90aa3 !important;
    font-style: italic
}

.c-g {
    color: #110b12;
    font-weight: 800;
}

.dropdown-toggle::after {
    content: '';
    border: none;
}

.form-select {
    font-size: 14px;
}

.form-select:focus {
    box-shadow: 3px 3px 5px 0 #bd4d4d, -3px -3px 3px 0 #bb80cc;
    border: 2px solid #ed12c5;
}

.btn.btn-primary {
/*     text-transform: uppercase; */
/*     font-size: 14px; */
/*     height: 40px; */
/*     display: flex; */
/*     flex-direction: column; */
/*     align-items: center;         */
/*     justify-content: center; */
/*     /* background-color: #f7fbf8; */ */
/*     font-weight: 600; */
/*     outline: none; */
     border: none; */
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<jsp:include page="navbarorder.jsp"></jsp:include>
<div class="container">
<form:form modelAttribute="Coupon" method="post" action="${contextRoot}/coupon/post">
<div class="d-flex flex-column align-items-center">
                <p class="fs-1   fw-bold m-0 mt-4">新增優惠券</p>
                <span style="color: #f61c23; font-style: italic;">Provide the best service for you.</span>
                <span class="line my-3"></span>
</div>
<div class="row p-0">
            <form:input  class="form-select d-flex align-items-center my-2" path="coupon_id" id="amount" modelAttribute="Coupon"
            method="post" action="${contextRoot}/Coupon/post"></form:input>
</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券編號</span>
</div>
<div class="col-12 p-0 px-4">
   <form:textarea path="coupon_id" class="form-select d-flex align-items-center my-2" id="orderNo" aria-label="Order number" placeholder="輸入訂單號碼" />

</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券類型</span>
</div>
<div class="col-12 p-0 px-4">
      <form:input path="coupon_type" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入訂單號碼"></form:input>
</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券名稱</span>
</div>
<div class="col-12 p-0 px-4">
      <form:input path="coupon_name" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入訂單號碼"></form:input>
</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券說明</span>
</div>
<div class="col-12 p-0 px-4">
      <form:input path="coupon" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入訂單號碼"></form:input>
</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券數量</span>
</div>
<div class="col-12 p-0 px-4">
      <form:input path="coupon_count" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入訂單號碼"></form:input>
</div>
<div class="col-12 p-0 px-4">
            <span class="text-uppercase text-muted">優惠券總額</span>
</div>
<div class="col-12 p-0 px-4">
      <form:input path="coupon_amount" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入訂單號碼"></form:input>
</div>
<!-- <div class="col-12 p-0 px-4"> -->
<!--             <span class="text-uppercase text-muted">收件地址</span> -->
<!-- </div> -->
<!-- <div class="col-12 p-0 px-4"> -->
<!--       <form:input path="address" class="form-select d-flex align-items-center my-2" id="title" placeholder="輸入地址"></form:input> -->
<!-- </div> -->

<div class="col-12 p-0 px-4">
<button type="submit" class="btn btn-primary w-100">送出訂單</button>
</div>
                <div class="col-12 p-0 px-4">
                    <div class="text-muted text-center mb-4 mt-3">LOSE OR WIN,UP TO YOU.</div>
                </div>
</div>
</form:form>
</div>


<jsp:include page="../layout/footerbar.jsp"></jsp:include>
    <script>

var amnt = document.querySelector("#amount")
var money = document.querySelector("#money")
money.textContent = 0
amnt.addEventListener("change", function () {
    money.textContent = amnt.value
})

    </script>
</body>
</html>