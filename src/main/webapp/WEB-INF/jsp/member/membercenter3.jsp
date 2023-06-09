<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="com.team5.finalTopic.model.member.Member" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>小屋</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
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
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      position: relative;
    }

    .content {
      min-height: 50%;
      padding-bottom: 50px; /* 頁面底部footer的高度 */
    }
  </style>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">會員中心</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active text-center">
        <a class="nav-link" href="#">個人資料</a>
      </li>
      <li class="nav-item text-center">
        <a class="nav-link" href="${contextRoot}/changePwdPage">修改密碼</a>
      </li>
      <li class="nav-item text-center">
        <a class="nav-link" href="#">訂單紀錄</a>
      </li>
    </ul>
  </div>
</nav>
<div class="content" >
<div class="container mt-4">
  <div class="row">
    <div class="col-md-4">
      <div class="avatar-container">
        <%-- 顯示會員頭像 --%>
        <img class="avatar" src="<c:url value='/memberlist/${member.m_number}' />" alt="member image" />
        <%-- 顯示會員帳號 --%>
        <h2 class="mt-3">${member.m_account}</h2>
      </div>
    </div>
    <div class="col-md-8">
      <table class="table table-hover">
        <tbody>
        <tr>
          <td class="font-weight-bold">帳號</td>
          <td>${member.m_account}</td>
        </tr>
        <tr>
          <td class="font-weight-bold">姓名</td>
          <td>${member.m_name}</td>
        </tr>
        <tr>
          <td class="font-weight-bold">手機</td>
          <td>${member.m_phone}</td>
        </tr>
        <tr>
          <td class="font-weight-bold">地址</td>
          <td>${member.m_address}</td>
        </tr>
        <tr>
          <td class="font-weight-bold">信箱</td>
          <td>${member.m_email}</td>
        </tr>
        <tr>
          <td class="font-weight-bold">生日</td>
          <td><fmt:formatDate value="${member.m_birth}"  pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <td class="font-weight-bold">身分證</td>
          <td>${member.m_id}</td>
        </tr>
        <tr>
          <td></td> <!-- 空的 td 元素，用來將更新按鈕置中 -->
          <td style="text-align: center;">
            <form:form method="get" action="${contextRoot}/updatememberform/${member.m_number}">
              <input type="submit" class="btn btn-primary"  value="更新" />
            </form:form>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
</div>
<jsp:include page="../layout/footerbar.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi4jq7Y"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNVQ8vc"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>