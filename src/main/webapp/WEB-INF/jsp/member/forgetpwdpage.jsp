<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>忘記密碼</title>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
    <h1>忘記密碼</h1>
    <form action="${pageContext.request.contextPath}/forgotPassword" method="get" >
        <p>請輸入您註冊時使用的電子郵件地址：</p>
        <input type="text" name="email" id="email" required>
        <br><br>
        <input type="submit" value="重設密碼">
    </form>
    <jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>
</html>