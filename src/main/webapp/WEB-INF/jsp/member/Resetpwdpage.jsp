<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設密碼</title>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<form:form method="Get" action="${contextRoot}/resetpwd">
	<input type="hidden" name="id" value="${member.m_number}">
	<label for="password">新密碼:</label>
	<input type="password" name="password" id="password">
	<span id="passwordError" ></span>
	<button type="submit" id="submit">送出</button>				
	</form:form>
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
</body>
</html>