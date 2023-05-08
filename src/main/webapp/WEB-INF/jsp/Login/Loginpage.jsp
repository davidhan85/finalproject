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
  <!-- 引入Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header bg-primary text-white">
          <h4 class="text-center">登入</h4>
        </div>
        <div class="card-body">
          <form action="${contextRoot}/checkLogin" method="post">
            <div class="form-group">
              <label for="username">帳號:</label>
              <input type="text" class="form-control" id="username" placeholder="請輸入您的帳號" name="username">
            </div>
            <div class="form-group">
              <label for="password">密碼:</label>
              <input type="password" class="form-control" id="password" placeholder="請輸入您的密碼" name="password">
            </div>
            <button type="submit" class="btn btn-primary btn-block">登入</button>
          </form>
          <hr>
          <div class="text-center">
            <a href="#">忘記密碼</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmIxFfdJPyB6UksJXn3Z"></script>
<jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>
</html>
