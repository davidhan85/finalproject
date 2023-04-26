<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/4/22
  Time: 下午 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>新增會員</title>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<h1>新增會員</h1>
<form:form method="post" action="${contextRoot}/messages/newmember" enctype="multipart/form-data" modelAttribute="member" id="newmemberform">
<table>
    <tr>
     <td>帳號：</td>
   <td><form:input path="m_account"  required="ture"  id="accountError"/> </td>
     <td> <form:errors path="m_account"  cssClass="error" /></td>
    </tr>
    <tr>
     <td>密碼：</td>
   <td> <form:input path="m_password"  required="ture" id="passwordError"/></td>
    <td> <form:errors path="m_password" cssClass="error"  /></td>
    </tr>
    <tr>
     <td>姓名：</td>
    <td><form:input path="m_name"  required="ture"/></td>
    </tr>
    <tr>
     <td>手機：</td>
    <td> <form:input path="m_phone"  required="ture" id="phoneError"/></td>
    <td> <form:errors path="m_phone"  cssClass="error" /></td>
    </tr>
    <tr>
     <td>地址：</td>
    <td>  <form:input path="m_address"  required="ture"/></td>
    </tr>
    <tr>
     <td>信箱</td>
    <td> <form:input path="m_email" type="email" required="ture" id="emailError"/></td>
     <td> <form:errors path="m_email"  cssClass="error" /></td>

    </tr>
    <tr>
     <td>生日：</td>
    <td> <form:input path="m_birth" type="date" required="ture"/></td>
    </tr>
    <tr>
     <td>身分證：</td>
    <td> <form:input path="m_id"  required="ture" id="idError"/></td>
   <td> <form:errors path="m_id"  cssClass="error" /></td>
    </tr>
     <tr>
      <td>大頭貼：</td>
    <td> <form:input path="productImage" type="file"  required="ture"/></td>
</tr>
</table>
 <button type="submit">新增</button>
</form:form>
<script>

 const form=function submitForm() {
  var account=document.getElementById("m_account").value();
  var  pwd=document.getElementById("m_password").value();
  var phone=document.getElementById("m_phone").value();
  var email=document.getElementById("m_email").value();
  var id=document.getElementById("m_id").value();

  var accountRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
  var phoneRegex = /^09\d{8}$/;
  var idRegex = /^[A-Z][12]\d{8}$/;
  var emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;

  if (!accountRegex.test(account)) {
   document.getElementById("accountError").innerHTML = "帳號必須包含英文字母和數字，並且長度在8-16之間";
   return false;
  } else {
   document.getElementById("accountError").innerHTML = "";
  }

  if (!accountRegex.test(pwd)) {
   document.getElementById("passwordError").innerHTML = "密碼必須包含英文字母和數字，並且長度在8-16之間";
   return false;
  } else {
   document.getElementById("passwordError").innerHTML = "";
  }
  if (!phoneRegex.test(phone)) {
   document.getElementById("phoneError").innerHTML = "手機號碼格式不正確";
   return false;
  } else {
   document.getElementById("phoneError").innerHTML = "";
  }

  if (!emailRegex.test(email)) {
   document.getElementById("emailError").innerHTML = "信箱格式不正確";
   return false;
  } else {
   document.getElementById("emailError").innerHTML = "";
  }

  if (!idRegex.test(id)) {
   document.getElementById("idError").innerHTML = "身分證字號格式不正確";
   return false;
  } else {
   document.getElementById("idError").innerHTML = "";
  }

  document.querySelector('#newmemberform').addEventListener('submit',function (event) {
   event.preventDefault();
   if (submitForm()){
    this.submit();
   }else {

   }
  })
 }
</script>
</body>
</html>
