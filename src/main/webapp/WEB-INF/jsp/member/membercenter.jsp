<%@ page import="com.team5.finalTopic.model.member.Member" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/4/30
  Time: 下午 03:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>會員中心</title>
</head>
<body>
<%-- 導入導覽列 --%>
<jsp:include page="../layout/navebar.jsp"></jsp:include>

<%-- 取得會員資訊 --%>
<%
    Member member = (Member) session.getAttribute("memberbean");
%>

<%-- 顯示會員名稱 --%>
<h1>歡迎，<%= member.getM_name() %>！</h1>

<%-- 顯示會員資料 --%>
<table>
    <tr>
        <td>帳號：</td>
        <td><%= member.getM_account() %></td>
    </tr>
    <tr>
        <td>姓名：</td>
        <td><%= member.getM_name() %></td>
    </tr>
    <tr>
        <td>手機：</td>
        <td><%= member.getM_phone() %></td>
    </tr>
    <tr>
        <td>地址：</td>
        <td><%= member.getM_address() %></td>
    </tr>
    <tr>
        <td>信箱：</td>
        <td><%= member.getM_email() %></td>
    </tr>
    <tr>
        <td>生日：</td>
        <td><%= member.getM_birth() %></td>
    </tr>
    <tr>
        <td>身分證：</td>
        <td><%= member.getM_id() %></td>
    </tr>
</table>
<%-- 登出按鈕 --%>
<form method="post" action="${contextRoot}/logout">
    <button type="submit">登出</button>
</form>

</body>
</html>
