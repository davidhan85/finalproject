<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="UTF-8">
<title>重設密碼</title>
 <!-- 引入 Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style >
  html, body {
	height: 100%;
	margin: 0;
	padding: 0;
	position: relative;
}

.content {
	min-height: 53%;
	padding-bottom: 50px; /* 頁面底部footer的高度 */
}
label{
font-size: 24px;
font-color:black;
}
  </style>
</head>
<body style="background-image: url('https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80')">
<jsp:include page="../layout/navebar.jsp"></jsp:include>
			<div class="content">
	 <div class="container mt-4">
    <form method="GET" action="${contextRoot}/resetpwd">
      <input type="hidden" name="id" value="${member.m_number}">
      <div class="form-group">
        <label for="password">新密碼：</label>
        <input type="password" class="form-control" name="password" id="password">     
        <small class="text-danger" id="passwordError"></small>
      </div>
      <button type="submit" class="btn btn-primary">送出</button>
    </form>
  </div>
</div>
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
	<script>
	function submitForm() {
		 var pwd = document.getElementById("password").value;
		 var pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
		 if (!accountRegex.test(pwd)) {
             document.getElementById("passwordError").innerHTML = "密碼必須包含英文字母和數字，並且長度在8-16之間";
             return false;
           } else {
             document.getElementById("passwordError").innerHTML = "";
           }
		
	}	
	 document.querySelector('#password').addEventListener('blur', function (event
     ) {
       submitForm();
     })      
	</script>
	 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>