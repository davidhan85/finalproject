<%-- Created by IntelliJ IDEA. User: admin Date: 2023/5/7 Time: 下午 01:14 To change this template use File | Settings |
  File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <html>

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>修改密碼</title>
          <!-- Bootstrap 4 CSS -->
          <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
            integrity="sha512-JBO3qQ0M5rMfRUzRdjst9X+5ScdQu0vGeiG3OWly/m3HTqImlHmdFAvzCZ6OTxg9XOj6YH/C6l09Ug2+yhh6Kw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
          <style>
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
        </head>

        <body style="background-image: url('https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=2128&amp;q=80')">
          <jsp:include page="../layout/navebar.jsp"></jsp:include>
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="${contextRoot}/membercenter">會員中心</a>
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
          <div class="content">
          <div class="container mt-4">
            <div class="row justify-content-center">
              <div class="col-md-6">
                <div class="card">
                  <div class="card-header bg-primary text-white">
                    <h5 class="card-title mb-0">修改密碼</h5>
                  </div>
                  <div class="card-body">
                    <form:form method="post" action="${contextRoot}/frontSave">
                      <div class="form-group">
                        <label for="password">現在的密碼：</label>
                        <input type="password" class="form-control" id="password" name="password" />
                      </div>
                      <div class="form-group">
                        <label for="newPassword">新密碼：</label>
                        <input type="password" class="form-control" id="newPassword" name="newPassword" />
                        <small id="passwordError" class="form-text text-danger"></small>
                      </div>
                      <div class="form-group">
                        <label for="newPassword2">再輸入一次新密碼：</label>
                        <input type="password" class="form-control" id="newPassword2" name="newPassword2" />
                        <small id="passwordError2" class="form-text text-danger"></small>
                      </div>
                      <button type="submit" class="btn btn-primary" id="submitButton" disabled>確認修改</button>
                    </form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
          <script>

            var pwd1 = document.getElementById("newPassword");
            var pwd2 = document.getElementById("newPassword2");
            var submit = document.getElementById("submitButton")


            pwd2.addEventListener("input", function () {
              if (pwd2.value != pwd1.value) {
                document.getElementById("passwordError2").innerHTML = ("兩次密碼不同,請檢查輸入的密碼");
                submit.disabled = true;
              } else {
                document.getElementById("passwordError2").innerHTML = ("");
                submit.disabled = false;
              }

            })

            function submitForm() {
              let pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
              let pwd = document.getElementById("newPassword").value;
              if (!pwdRegex.test(pwd)) {
                document.getElementById("passwordError").innerHTML = "密碼必須包含英文字母和數字，並且長度在8-16之間";
              } else {
                document.getElementById("passwordError").innerHTML = "";
              }
            }

            document.querySelector('#newPassword').addEventListener('blur', function (event) {
              submitForm();
            })
            document.querySelector('#password').addEventListener('blur', function (event) {
              submitForm();
            })

          </script>

          <!-- Bootstrap 4 JS -->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-7JL8vHYcE7B9gBC9QV7bW8QvXEqtPTcNJw+L6ZkBKTWG8sNOc+JlwI1G9lTnA6UdJ6UaDnRrctLTKZjKOMLrjA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"
            integrity="sha512-RK8BZ4ur20dc/JtAvKjJc+uOXzX9ftJk/qdSv2jK5x3qEUPKZmiYXMl2FJfbHI3q3C9rFTex+DyP6oECxYoNrA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"
            integrity="sha512-lzT9QI9l1MZjHvOGUf91JnZcLDKbdCMYwfyQryGzO3vpHTD7Ft1QJ3q3vUb+v+jO+TAVTJ+yHfXQuhT/nEiLCg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
          <jsp:include page="../layout/footerbar.jsp"></jsp:include>
        </body>

        </html>