<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/4/22
  Time: 下午 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>會員清單</title>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<h1>會員列表</h1>
<table>
    <tr>
        <th>會員編號</th>
        <th>會員姓名</th>
        <th>會員手機</th>
        <th>會員地址</th>
        <th>會員生日</th>
        <th>會員信箱</th>
        <th>會員身分證</th>
        <th>會員點數</th>
        <th>會員創建日期</th>
        <th>會員圖片</th>

    </tr>
    <c:forEach items="${member}" var="member">
        <tr>
            <td>${member.m_number}</td>
            <td>${member.m_name}</td>
            <td>${member.m_phone}</td>
            <td>${member.m_address}</td>
            <td>${member.m_birth}</td>
            <td>${member.m_email}</td>
            <td>${member.m_id}</td>
            <td>${member.point_id}</td>
            <td>${member.m_creatdate}</td>
<%--            <td>${member.m_image}</td>--%>
           <td> <img src="<c:url value='/memberlist/${member.m_number}'/>" alt="member image" /> </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
