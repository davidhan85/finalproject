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
}

h1 {
    margin-bottom: 40px;
}

label {
    color: #333;
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

.card{
	margin-left: 10px;
	margin-right: 10px;
}
.formd {
  display: block;
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
</style>



</head>
<body>
<%-- <jsp:include page="../layout/navebar.jsp"></jsp:include> --%>
<div style="width: 200px;">
 <img src="${contextRoot}/images/gamebook2.png" alt="img" class="logo"> 
</div>

<jsp:include page="navbarorder.jsp"></jsp:include>
<div class="formd">
			<div class="">
				<div class="">
					<h1>新增訂單</h1>
	<div class="formd">
	<form:form modelAttribute="orders" method="post" action="${contextRoot}/orders/post">
	<div class="formd">
		<label for="title">訂單號碼</label> <form:input path="orderNo" class="form-control" id="title" placeholder="輸入訂單號碼"></form:input>
	</div>
	<div class="">
		<label for="title">會員號碼</label> <form:input path="member_num" class="form-control" id="title" placeholder="輸入會員號碼"></form:input>
	</div>
	<div class="">
		<label for="title">買家編號</label> <form:input path="buyerID" class="form-control" id="title" placeholder="輸入買家編號"></form:input>
	</div>
	<div class="">
		<label for="category">付款方式</label> <form:select path="paymentMethoderNo" class="form-control"
			id="category">
			<option>貨到付款</option>
			<option>信用卡結帳</option>
		</form:select>
	</div>
	<div class="">
		<label for="category">運送方式</label> <form:select path="shippingMethod" class="form-control"
			id="category">
			<option>超商取貨</option>
			<option>宅配</option>
		</form:select>
	</div>
	<div class="" id="address-group">
		<label for="address">收件地址</label>
		<form:input path="address" class="form-control" id="address" placeholder="輸入地址"></form:input>
	</div>
	<div class="">
		<label for="title">優惠券編號</label> <form:input path="coupon_id" class="form-control" id="title" placeholder="輸入優惠券號碼"></form:input>
	</div>	
	<button type="submit" class="btn btn-primary" onclick="return confirmSubmit()">送出訂單</button>
	</form:form>
	</div>
	
	<br />
	<br />					
				<div>
	
		</div>
		</div>
		</div>
	</div>
	<div class="container">]
        <div class=" text-center mt-5 ">

            <h1 >Bootstrap Contact Form</h1>
                
            
        </div>

    
    <div class="row ">
      <div class="col-lg-7 mx-auto">
        <div class="card mt-2 mx-auto p-4 bg-light">
            <div class="card-body bg-light">
       
            <div class = "container">
                             <form id="contact-form" role="form">

            

            <div class="controls">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="form_name">Firstname *</label>
                            <input id="form_name" type="text" name="name" class="form-control" placeholder="Please enter your firstname *" required="required" data-error="Firstname is required.">
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="form_lastname">Lastname *</label>
                            <input id="form_lastname" type="text" name="surname" class="form-control" placeholder="Please enter your lastname *" required="required" data-error="Lastname is required.">
                                                            </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="form_email">Email *</label>
                            <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="form_need">Please specify your need *</label>
                            <select id="form_need" name="need" class="form-control" required="required" data-error="Please specify your need.">
                                <option value="" selected disabled>--Select Your Issue--</option>
                                <option >Request Invoice for order</option>
                                <option >Request order status</option>
                                <option >Haven't received cashback yet</option>
                                <option >Other</option>
                            </select>
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="form_message">Message *</label>
                            <textarea id="form_message" name="message" class="form-control" placeholder="Write your message here." rows="4" required="required" data-error="Please, leave us a message."></textarea
                                >
                            </div>

                        </div>


                    <div class="col-md-12">
                        
                        <input type="submit" class="btn btn-success btn-send  pt-2 btn-block
                            " value="Send Message" >
                    
                </div>
          
                </div>


        </div>
         </form>
        </div>
            </div>


    </div>
        <!-- /.8 -->

    </div>
    <!-- /.row-->

</div>
</div>
	<script>
function confirmSubmit() {
    return confirm("確認要送出訂單嗎？");
}
</script>
</body>
</html>