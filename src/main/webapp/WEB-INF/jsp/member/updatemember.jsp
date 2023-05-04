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
    <style>
        /* Styles for form input and label */
        input[type="text"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
        }
        label {
            font-weight: bold;
            display: inline-block;
            width: 100px;
            margin-right: 20px;
            text-align: right;
        }
        /* Style for form container */
        .container {
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            width: 50%;
            margin-left: auto;
            margin-right: auto;
        }
        /* Style for submit button */
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        /* Style for file input */
        input[type="file"] {
            margin-top: 6px;
            margin-bottom: 16px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<%--<jsp:include page="../layout/navebar.jsp"></jsp:include>--%>
<div class="container">
<form:form method="post" action="${contextRoot}/updatemember/${m_number}" enctype="multipart/form-data" modelAttribute="member">
    <input type="hidden" name="_method" value="put">
<%--    <form:hidden path="m_number" value="${m_number}"/>--%>
    <table>
        <tr>
            <td> <label for="m_account">帳號：</label> </td>
            <td><form:input path="m_account"  required="ture" readonly="true"/> </td>
        </tr>
        <tr>
            <td>  <label for="m_password">密碼：</label> </td>
            <td> <form:input path="m_password"  required="ture" readonly="true"/></td>
        </tr>
 <tr>
     <td>  <label for="m_name">姓名：</label> </td>
    <td><form:input path="m_name"  required="ture"/></td>
    </tr>
    <tr>
     <td><label for="m_phone">手機：</label></td>
    <td> <form:input path="m_phone"  required="ture"/></td>
    </tr>
    <tr>
     <td><label for="m_address">地址：</label></td>
    <td>  <form:input path="m_address"  required="ture"/></td>
    </tr>
    <tr>
     <td><label for="m_email">信箱：</label></td>
    <td> <form:input path="m_email" type="email" required="ture"/></td>
    </tr>
    <tr>
     <td><label for="m_birth">生日：</label></td>
    <td> <form:input path="m_birth" type="date" required="ture"/></td>
    </tr>
    <tr>
     <td> <label for="m_id">身分證：</label></td>
    <td> <form:input path="m_id"  required="ture"/></td>
    </tr>
   <tr>
                  <td>身分:</td>
                  <td>
                    <form:select path="m_Role">
                      <form:option value="adaim" label="管理員" />
                      <form:option value="user" label="一般使用者" />
                    </form:select>
                  </td>
                </tr>
     <tr>
      <td><label for="productImage">大頭貼：</label></td>
    <td> <form:input path="productImage" type="file"  /></td>
</tr>
</table>
    <button type="submit">更新</button>
</form:form>
</div>
</body>
</html>