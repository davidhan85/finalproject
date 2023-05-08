<%-- Created by IntelliJ IDEA. User: admin Date: 2023/4/22 Time: 下午 11:53 To change this template use File | Settings |
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
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>註冊</title>
          <!-- Bootstrap CSS -->
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
          <style>
            .error {
              color: red;
            }
          </style>
        </head>

        <body>
          <jsp:include page="../layout/navebar.jsp"></jsp:include>
          <div class="container my-5">
            <div class="row justify-content-center">
              <div class="col-md-8">
                <div class="card">

                  <div class="card-header bg-primary text-white">註冊</div>
                  <div class="card-body">
                    <form:form method="post" action="${contextRoot}/messages/newmember" enctype="multipart/form-data"
                      modelAttribute="member" id="newmemberform" onsubmit="return submitForm();">
                      <div class="form-group row">
                        <label for="account" class="col-md-4 col-form-label text-md-right">帳號</label>

                        <div class="col-md-6">
                          <form:input path="m_account" required="true" id="account" class="form-control" />
                          <span id="accountError" class="error"></span>
                          <span id="accountMessage" ></span>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="password" class="col-md-4 col-form-label text-md-right">密碼</label>

                        <div class="col-md-6">
                          <form:input path="m_password" required="true" id="password" class="form-control" />
                          <span id="passwordError" class="error"></span>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="name" class="col-md-4 col-form-label text-md-right">姓名</label>

                        <div class="col-md-6">
                          <form:input path="m_name" required="true" id="name" class="form-control" />
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="phone" class="col-md-4 col-form-label text-md-right">手機</label>

                        <div class="col-md-6">
                          <form:input path="m_phone" required="true" id="phone" class="form-control" />
                          <span id="phoneError" class="error"></span>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="address" class="col-md-4 col-form-label text-md-right">地址</label>
                        <div class="col-md-6">
                          <form:input path="m_address" required="true" id="address" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="email" class="col-md-4 col-form-label text-md-right">信箱</label>

                        <div class="col-md-6">
                          <form:input path="m_email" type="email" required="true" id="email" class="form-control" />
                          <span id="emailError" class="error"></span>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="birth" class="col-md-4 col-form-label text-md-right">生日</label>

                        <div class="col-md-6">
                          <form:input path="m_birth" type="date" required="true" id="birth" class="form-control" />
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="role" class="col-md-4 col-form-label text-md-right">身分</label>

                        <div class="col-md-6">
                          <form:select path="m_Role" class="form-control">
                            <form:option value="adaim" label="管理員" />
                            <form:option value="user" label="一般使用者" />
                          </form:select>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="id" class="col-md-4 col-form-label text-md-right">身分證</label>

                        <div class="col-md-6">
                          <form:input path="m_id" required="true" id="id" class="form-control" />
                          <span id="idError" class="error"></span>
                        </div>
                      </div>

                      <div class="form-group row">
                        <label for="image" class="col-md-4 col-form-label text-md-right">大頭貼</label>

                        <div class="col-md-6">
                          <form:input path="productImage" type="file" required="true" id="image"
                            class="form-control-file" />
                        </div>
                      </div>

                      <div class="form-group row mb-0">
                        <div class="col-md-6 offset-md-4">
                          <button type="submit" class="btn btn-primary" onclick="sendVerificationEmail()">註冊</button>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
<%-- <jsp:include page="../layout/footerbar.jsp"></jsp:include> --%>
          <script>

            function submitForm() {
              var useraccount = document.getElementById("account").value;
              var pwd = document.getElementById("password").value;
              var phone = document.getElementById("phone").value;
              var email = document.getElementById("email").value;
              var id = document.getElementById("id").value;

              var accountRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
              var phoneRegex = /^09\d{8}$/;
              var idRegex = /^[A-Z][12]\d{8}$/;
              var emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;

              if (!accountRegex.test(useraccount)) {
                document.getElementById("accountError").innerHTML = "帳號必須包含英文字母和數字，並且長度在8-16之間";
                return false;
              } else {
                document.getElementById("accountError").innerHTML = "";
              }

              fetch(`${contextRoot}/existsAccount?account=useraccount`)
                .then(response => response.text())
                .then(data => {
                  if (data === "此帳號已有人使用") {
                    document.getElementById("accountError").innerHTML = "此帳號已被註冊"
                  } else {
                    document.getElementById("accountMessage").innerHTML = "此帳號可以使用"
                  }
                })
                .catch(error => {
                  console.error("發生錯誤", error)
                })

              if (!accountRegex.test(pwd)) {
                document.getElementById("passwordError").innerHTML = "密碼必須包含英文字母和數字，並且長度在8-16之間";
                return false;
              } else {
                document.getElementById("passwordError").innerHTML = "";
              }
              if (!phoneRegex.test(phone)) {
                document.getElementById("phoneError").innerHTML = "手機號碼格式不正確";
                return false;
              } else {
                document.getElementById("phoneError").innerHTML = "";
              }

              if (!emailRegex.test(email)) {
                document.getElementById("emailError").innerHTML = "信箱格式不正確";
                return false;
              } else {
                document.getElementById("emailError").innerHTML = "";
              }

              if (!idRegex.test(id)) {
                document.getElementById("idError").innerHTML = "身分證字號格式不正確";
                return false;
              } else {
                document.getElementById("idError").innerHTML = "";
              }
              return true;
            }

            document.querySelector('#account').addEventListener('blur', function (event
            ) {
              submitForm();
            })
            document.querySelector('#password').addEventListener('blur', function (event
            ) {
              submitForm();
            })
            document.querySelector('#phone').addEventListener('blur', function (event
            ) {
              submitForm();
            })
            document.querySelector('#email').addEventListener('blur', function (event
            ) {
              submitForm();
            })
            document.querySelector('#id').addEventListener('blur', function (event
            ) {
              submitForm();
            })

            function sendVerificationEmail() {
              var email = document.getElementById("email").value;
              var data = {
                m_email: email
              };

              console.log(data);

              fetch(`${contextRoot}/messages/newmember`, {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
              })
                .then(response => {

                  if (response.ok) {
                    // 成功發送驗證電子郵件的操作
                    console.log("發送成功")
                    alert("請去信箱接收驗證信")

                  } else {
                    // 發送驗證電子郵件失敗的操作
                    console.log("發送成功")
                    alert("驗證信發送成功")
                    window.location.href("http://localhost:8079/finalTopic_5/Login")
                  }
                })
                .catch(error => {
                  console.error('發送驗證電子郵件失敗', error);
                });

            }
          </script>
          <!-- Bootstrap JS -->
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
        </body>

        </html>