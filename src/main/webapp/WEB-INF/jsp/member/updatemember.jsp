<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員更新</title>
</head>
<body>
<%--<jsp:include page="../layout/navebar.jsp"></jsp:include>--%>

<form:form method="post" action="${contextRoot}/updatemember/${m_number}" enctype="multipart/form-data" modelAttribute="member">
    <input type="hidden" name="_method" value="put">
<%--    <form:hidden path="m_number" value="${m_number}"/>--%>
    <table>
        <tr>
            <td>帳號：</td>
            <td><form:input path="m_account"  required="ture" readonly="true"/> </td>
        </tr>
        <tr>
            <td>密碼：</td>
            <td> <form:input path="m_password"  required="ture" readonly="true"/></td>
        </tr>
 <tr>
     <td>姓名：</td>
    <td><form:input path="m_name"  required="ture"/></td>
    </tr>
    <tr>
     <td>手機：</td>
    <td> <form:input path="m_phone"  required="ture"/></td>
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
    </tr>
     <tr>
      <td>大頭貼：</td>
    <td> <form:input path="productImage" type="file"  /></td>
</tr>
</table>
    <button type="submit">更新</button>
</form:form>

</body>
</html>