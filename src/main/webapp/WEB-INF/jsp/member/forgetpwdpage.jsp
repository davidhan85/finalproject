<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>忘記密碼</title>
                <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
                <style>
                    html, body {
                        height: 100%;
                        margin: 0;
                        padding: 0;
                        position: relative;


                    }

                    .content {
                        min-height: 53%;
                        padding-bottom: 50px; /* 頁面底部footer的高度 */
                        text-align: center

                    }
                </style>
            </head>

            <body style="background-image: url('https://images.unsplash.com/photo-1519327232521-1ea2c736d34d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2338&q=80')">
                <jsp:include page="../layout/navebar.jsp"></jsp:include>
                <div class="content">
                <h1>忘記密碼</h1>
                <form action="${pageContext.request.contextPath}/forgotPassword" method="get">
                    <h5>請輸入您註冊時使用的電子郵件地址：</h5>
                    <input type="text" name="email" id="email" required>
                    <br><br>
                    <input type="submit" value="重設密碼">
                </form>
                </div>
                <jsp:include page="../layout/footerbar.jsp"></jsp:include>
            </body>

            </html>