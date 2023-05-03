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
    <style>
        /* 加入樣式，讓頭像顯示在頁面正中間 */
        .avatar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .avatar {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            object-fit: cover;
        }
        table {
            margin: 0 auto; /* 水平置中 */
            text-align: center; /* 水平置中 */
        }
        td {
            vertical-align: middle; /* 垂直置中 */
        }
    </style>
</head>
<body>
<%-- 導入導覽列 --%>
<jsp:include page="../layout/navebar.jsp"></jsp:include>

<%-- 取得會員資訊 --%>
<%
    Member member = (Member) session.getAttribute("memberbean");
%>

<div class="avatar-container">
    <%-- 顯示會員頭像 --%>
        <img class="avatar" src="<c:url value='/memberlist/${memberbean.m_number}' />" alt="member image" />
    <%-- 顯示會員帳號 --%>
    <h2><%= member.getM_account() %></h2>
</div>

<%-- 顯示會員資料 --%>
<table>
    <tr>
        <td>編號：</td>
        <td><%= member.getM_number() %></td>
    </tr>
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
    <tr>
        <td></td> <!-- 空的 td 元素，用來將更新按鈕置中 -->
        <td style="text-align: center;">
            <form:form method="get" action="${contextRoot}/updatememberform/${memberbean.m_number}">
                <input type="submit" value="更新" />
            </form:form>
        </td>
    </tr>
</table>


</body>
</html>
