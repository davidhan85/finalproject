<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@page import="java.util.*"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> --%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<%-- <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" /> --%>

<!-- <title>新增成功</title> -->
<!-- <!-- 引入Bootstrap的CSS檔案 --> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- </head> -->
<!-- <body> -->
<!-- <div class="container"> -->
<!--     <div class="jumbotron"> -->
<!--         <h1>新增錯誤！</h1> -->
<%--         <form  method="post" action="${contextRoot}/HomePage"> --%>
<!--             <button type="submit" class="btn btn-primary">回首頁</button> -->
<%--         </form> --%>
<!--     </div> -->
<!-- </div> -->
<!-- <!-- 引入jQuery和Bootstrap的JavaScript檔案 --> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script> -->
<!-- </script> -->
<!-- </body> -->
<!-- </html> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>新增成功</title>
<!-- 引入Bootstrap的CSS檔案 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="jumbotron" style="background-color: #e74c3c; color: #fff;">
        <h1>新增錯誤！</h1>
        <p>請檢查您輸入的資料是否正確。</p>
        <form id="homeForm" method="post" action="${contextRoot}/HomePage">
            <button type="submit" class="btn btn-primary">回首頁</button>
        </form>
    </div>
</div>
<!-- 引入jQuery和Bootstrap的JavaScript檔案 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    // 5秒後自動跳轉回首頁
    setTimeout(function() {
        $('#homeForm').submit();
    }, 5000);
});
</script>
</body>
</html>