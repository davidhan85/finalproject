<%-- Created by IntelliJ IDEA. User: admin Date: 2023/4/22 Time: 下午 11:53 To change this template use File | Settings |
  File Templates. --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
        <html>
        <style>
          /* 表單輸入和標籤的樣式 */
          input[type="text"],
          input[type="email"],
          input[type="date"],
          select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: none;
            border-radius: 3px;
            background-color: #f1f1f1;
          }

          label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
          }

          /* 表單容器的樣式 */
          .container {
            width: 50%;
            margin: auto;
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
          }

          /* 錯誤訊息的樣式 */
          .error {
            color: red;
            font-size: 0.8em;
            margin-top: 5px;
          }

          /* 送出按鈕的樣式 */
          button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
            float: right;
          }

          /* 檔案輸入的樣式 */
          input[type="file"] {
            margin-top: 10px;
            margin-bottom: 20px;
          }

          /* 表單標題的樣式 */
          h1 {
            text-align: center;
            margin-bottom: 20px;
          }

          /*!* 導覽列的樣式 *!*/
          /*.navbar {*/
          /*  background-color: #333;*/
          /*  overflow: hidden;*/
          /*  position: fixed;*/
          /*  top: 0;*/
          /*  width: 100%;*/
          /*}*/

          /*!* 導覽列連結的樣式 *!*/
          /*.navbar a {*/
          /*  float: left;*/
          /*  display: block;*/
          /*  color: #f2f2f2;*/
          /*  text-align: center;*/
          /*  padding: 14px 16px;*/
          /*  text-decoration: none;*/
          /*}*/

          /*!* 目前選取的導覽列連結樣式 *!*/
          /*.active {*/
          /*  background-color: #4CAF50;*/
          /*}*/

          /*!* 小螢幕時的導覽列樣式 *!*/
          /*@media screen and (max-width: 600px) {*/
          /*  .navbar a {*/
          /*    float: none;*/
          /*    display: block;*/
          /*    text-align: left;*/
          /*  }*/

          /*  .navbar a.right {*/
          /*    float: right;*/
          /*  }*/

          /*  .active {*/
          /*    background-color: #4CAF50;*/
          /*    color: white;*/
          /*  }*/
          /*}*/

        </style>

        <head>
          <title>新增會員</title>
        </head>

        <body>
          <jsp:include page="../layout/navebar.jsp"></jsp:include>
          <h1>新增會員</h1>
          <div class="container">
          <form:form method="post" action="${contextRoot}/messages/newmember" enctype="multipart/form-data"
            modelAttribute="member" id="newmemberform" onsubmit="return submitForm();">
            <table>
              <tr>
                <td>帳號：</td>
                <td>
                  <form:input path="m_account" required="ture" id="account" /><span id="accountError"
                    class="error"></span>

                </td>
              </tr>
              <tr>
                <td>密碼：</td>
                <td>
                  <form:input path="m_password" required="ture" id="password" />
                  <span id="passwordError" class="error"></span>
                </td>
              </tr>
              <tr>
                <td>姓名：</td>
                <td>
                  <form:input path="m_name" required="ture" />
                </td>
              </tr>
              <tr>
                <td>手機：</td>
                <td>
                  <form:input path="m_phone" required="ture" id="phone" />
                  <span id="phoneError" class="error"></span>
                </td>

              </tr>
              <tr>
                <td>地址：</td>
                <td>
                  <form:input path="m_address" required="ture" />
                </td>
              </tr>
              <tr>
                <td>信箱</td>
                <td>
                  <form:input path="m_email" type="email" required="ture" id="email" />
                  <span id="emailError" class="error"></span>
                  <button type="button" onclick="sendVerificationEmail()">發送驗證信</button>
                </td>
              </tr>
              <tr>
                <td>生日：</td>
                <td>
                  <form:input path="m_birth" type="date" required="ture" />
                </td>
              </tr>
              <tr>
              <td>身分:</td>
              <td>
              <form:select path="m_Role" >
              <form:option value="adaim" label="管理員" />
              <form:option value="user" label="一般使用者" />
              </form:select>
              </td>
              </tr> 
                          
              <tr>
                <td>身分證：</td>
                <td>
                  <form:input path="m_id" required="ture" id="id" />
                  <span id="idError" class="error"></span>
                </td>
              </tr>
              <tr>
                <td>大頭貼：</td>
                <td>
                  <form:input path="productImage" type="file" required="ture" />
                </td>
              </tr>
            </table>
            <button type="submit">新增</button>
          </form:form>
          </div>
          <script>

            function submitForm() {
              var account = document.getElementById("account").value;
              var pwd = document.getElementById("password").value;
              var phone = document.getElementById("phone").value;
              var email = document.getElementById("email").value;
              var id = document.getElementById("id").value;
              console.log(pwd);

              var accountRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
              var phoneRegex = /^09\d{8}$/;
              var idRegex = /^[A-Z][12]\d{8}$/;
              var emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;

              if (!accountRegex.test(account)) {
                document.getElementById("accountError").innerHTML = "帳號必須包含英文字母和數字，並且長度在8-16之間";
                return false;
              } else {
                document.getElementById("accountError").innerHTML = "";
              }

              if (!accountRegex.test(pwd)) {
                console.log("錯誤")
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

            function sendVerificationEmail(){
            var EmailInput=document.getElementById("email");
            var email=EmailInput.Value;
            console.log(email);

              fetch(`${contextRoot}/sendmail`, {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email })
              })
                      .then(response => {
                        if (response.ok) {
                          // 成功發送驗證電子郵件的操作
                          console.log("發送成功")
                        } else {
                          // 發送驗證電子郵件失敗的操作
                          console.log("發送失敗")
                        }
                      })
                      .catch(error => {
                        console.error('發送驗證電子郵件失敗', error);
                      });

            }
          </script>
        </body>
        </html>