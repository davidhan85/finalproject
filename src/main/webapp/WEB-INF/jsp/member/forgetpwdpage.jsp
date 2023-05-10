<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
</head>
<body>
 <h1>忘記密碼</h1>
    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <p>請輸入您註冊時使用的電子郵件地址：</p>
        <input type="text" name="email" required>
        <br><br>
        <input type="submit" value="重設密碼">
    </form>

</body>
</html>