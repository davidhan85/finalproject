<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/4/25
  Time: 下午 04:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登入</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <style>
    /* 套用基本樣式 */
    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    /* 套用表單樣式 */
    form {
      border: 3px solid #f1f1f1;
    }

    /* 設定表單元素樣式 */
    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    /* 設定表單按鈕樣式 */
    button[type=submit] {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    /* 設定表單按鈕懸浮樣式 */
    button[type=submit]:hover {
      opacity: 0.8;
    }

    /* 設定表單容器樣式 */
    .container {
      padding: 16px;
    }
    /* 設定表單容器標題樣式 */
    h2 {
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<div class="container">
  <h2>登入</h2>
  <form action="${contextRoot}/checkLogin" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" id="username" placeholder="Enter username" name="username">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" id="password" placeholder="Enter password" name="password">
    </div>
    <button type="submit">登入</button>
     <p>如果您忘記了密碼，請<a href="${contextRoot}/forgetpwdpage">點擊這裡</a>以重設密碼。</p>
    <c:if test="${not empty error}">
      <div class="alert-danger">
        <strong>錯誤:</strong>
        <c:forEach var="errors" items="${error}">
          ${errors.value}<br />
        </c:forEach>
      </div>
    </c:if>
  </form>
</div>

</body>
</html>
