<%-- Created by IntelliJ IDEA. User: admin Date: 2023/4/22 Time: 下午 11:23 To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html>

                <head>
                    <title>會員清單</title>
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
                        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                        crossorigin="anonymous">
                    <style>
                        body {
                            background-color: #AE0000;
                        }

                        .member-image {
                            width: 200px;
                            height: 200px;
                        }

                        th,
                        td {
                            text-align: center;
                            vertical-align: middle;
                        }

                        .container-fluid {
                            max-width: 84%;
                        }
                        .sidebar {
                            position: fixed;
                            top: 0;
                            left: 0;
                            height: 100vh; /* 设置sidebar的高度占满整个屏幕 */
                            width: 200px; /* 设置sidebar的宽度 */
                            padding: 20px; /* 设置sidebar内容的内边距 */
                            z-index: 1; /* 确保sidebar在其他内容之上 */
                        }
                    </style>
                </head>

                <body>
                <div class="sidebar">
                    <jsp:include page="../layout/sidebar.jsp"></jsp:include>
                </div>
                    <div class="container-fluid" style="right: 2%; position: absolute;">
                        <h1 class="mb-5">會員列表</h1>
                        <table class="table" >
                            <thead class="thead-dark" style="margin-top: 0%">
                                <tr >
                                    <th scope="col">會員編號</th>
                                    <th scope="col" >會員<br>姓名</th>
                                    <th scope="col">會員<br>手機</th>
                                    <th scope="col">會員<br>地址</th>
                                    <th scope="col">會員<br>生日</th>
                                    <th scope="col">會員<br>信箱</th>
                                    <th scope="col">會員<br>身分證</th>
                                    <th scope="col">會員<br>腳色</th>
                                    <th scope="col">認證<br>狀態</th>
                                    <th scope="col">會員<br>點數</th>
                                    <th scope="col">會員創建日期</th>
                                    <th scope="col">會員<br>圖片</th>
                                    <th scope="col">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${member}" var="member">
                                    <tr>
                                        <td>${member.m_number}</td>
                                        <td>${member.m_name}</td>
                                        <td>${member.m_phone}</td>
                                        <td>${member.m_address}</td>
                                        <td><fmt:formatDate value="${member.m_birth}"  pattern="yyyy-MM-dd"/></td>
                                        <td>${member.m_email}</td>
                                        <td>${member.m_id}</td>
                                        <td>${member.m_Role}</td>
                                        <td>${member.m_status}</td>
                                        <td>${member.point_id}</td>
                                        <td>${member.m_creatdate}</td>
                                        <td>
                                            <img class="member-image"
                                                src="<c:url value='/memberlist/${member.m_number}'/>"
                                                alt="member image" />
                                        </td>
                                        <td>
                                            <form:form method="get"
                                                action="${contextRoot}/updatememberform/${member.m_number}">
                                                <button type="submit" class="btn btn-primary">更新</button>
                                            </form:form>
                                            <form:form method="post"
                                                action="${contextRoot}/deletemember/${member.m_number}">
                                                <input type="hidden" name="_method" value="delete">
                                                <button type="submit" class="btn btn-danger"
                                                    onclick="return confirm('確定要刪除嗎？')">刪除 </button>
                                            </form:form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                        crossorigin="anonymous"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                        crossorigin="anonymous"></script>

                </body>

                </html>