<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023/5/7
  Time: 下午 01:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>修改密碼</title>
</head>
<body>
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
<h1>修改密碼</h1>
<form:form method="post" action="${contextRoot}/frontSave">
    <label for="password">現在的密碼：</label>
    <input type="password" id="password" name="password"/><br>
    <label for="newPassword">新密碼：</label>
    <input type="password" id="newPassword" name="newPassword"/><br>
    <span id="passwordError2" style="color:red;"></span><br>
    <label for="newPassword2">再輸入一次新密碼：</label>
    <input type="password" id="newPassword2" name="newPassword2"/><br>
    <span id="passwordError" style="color:red;"></span><br>
    <input type="submit" value="確認修改" id="submitButton" disabled/>
</form:form>

<script>

    var pwd1=document.getElementById("newPassword");
    var pwd2=document.getElementById("newPassword2");
    var submit=document.getElementById("submitButton")


    pwd2.addEventListener("input",function () {
        if(pwd2.value!=pwd1.value){
            document.getElementById("passwordError2").innerHTML=("兩次密碼不同,請檢查輸入的密碼");
            submit.disabled=true;
        }else{
            document.getElementById("passwordError2").innerHTML=("");
            submit.disabled=false;
        }

    })

  function submitForm(){
      let pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
      let pwd=document.getElementById("newPassword").value;
        if(!pwdRegex.test(pwd)){
            document.getElementById("passwordError2").innerHTML="密碼必須包含英文字母和數字，並且長度在8-16之間";
        }else {
            document.getElementById("passwordError2").innerHTML="";
        }
  }

  document.querySelector('#newPassword').addEventListener('blur',function (event){
      submitForm();
  })
    document.querySelector('#password').addEventListener('blur',function (event){
        submitForm();
    })


</script>

</body>
</html>
