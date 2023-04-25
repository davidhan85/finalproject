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
<form:form method="post" action="${contextRoot}/messages/newmember" enctype="multipart/form-data" modelAttribute="member">
<table>
    <tr>
     <td>帳號：</td>
   <td><form:input path="m_account"  required="ture"/> </td>
     <td> <form:errors path="m_account"  cssClass="error"/></td>
    </tr>
    <tr>
     <td>密碼：</td>
   <td> <form:input path="m_password"  required="ture"/></td>
    <td> <form:errors path="m_password" cssClass="error" /></td>
    </tr>
    <tr>
     <td>姓名：</td>
    <td><form:input path="m_name"  required="ture"/></td>
    </tr>
    <tr>
     <td>手機：</td>
    <td> <form:input path="m_phone"  required="ture"/></td>
    <td> <form:errors path="m_phone"  cssClass="error"/></td>
    </tr>
    <tr>
     <td>地址：</td>
    <td>  <form:input path="m_address"  required="ture"/></td>
    </tr>
    <tr>
     <td>信箱</td>
    <td> <form:input path="m_email" type="email" required="ture"/></td>

    </tr>
    <tr>
     <td>生日：</td>
    <td> <form:input path="m_birth" type="date" required="ture"/></td>
    </tr>
    <tr>
     <td>身分證：</td>
    <td> <form:input path="m_id"  required="ture"/></td>
   <td> <form:errors path="m_id"  cssClass="error"/></td>
    </tr>
     <tr>
      <td>大頭貼：</td>
    <td> <form:input path="productImage" type="file"  required="ture"/></td>
</tr>
</table>
 <button type="submit">新增</button>
</form:form>

</body>
</html>
