<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增訂單成功</title>
<style>
h1 {
  font-size: 2rem; /* 設定標題字體大小 */
  margin: 40px 0; /* 設定標題上下間距為 40px，左右間距為 0 */
  text-align: center; /* 水平置中 */
}

a {
  display: inline-block; /* 設定為行內區塊元素，使得可以設定寬度和高度 */
  padding: 12px 24px; /* 設定內邊距 */
  background-color: #007bff; /* 設定背景顏色為藍色 */
  color: #fff; /* 設定文字顏色為白色 */
  font-size: 1.2rem; /* 設定字體大小 */
  text-decoration: none; /* 移除底線 */
  border-radius: 5px; /* 設定圓角 */
  margin: 20px auto; /* 設定上下間距為 20px，左右間距為自動置中 */
  width: 200px; /* 設定寬度 */
  text-align: center; /* 文字置中 */
}

a:hover {
  background-color: #0056b3; /* 設定滑鼠指到連結上時的背景顏色 */
}
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
    font-family: 'poppins', sans-serif;
}
body{
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
/* 	background: #17202A; */
	 background: linear-gradient(to bottom, #ffffff, #000000); 
/* 	 background: linear-gradient(to bottom, #000000, #ffffff); */
}
a{
	text-decoration: none;
	display: inline-block;
	position: relative;
	padding: 20px 40px;
	text-transform: uppercase;
	color: #ddd;
	background: #1C2833;
	font-size: 16px;
	margin: 20px;
	letter-spacing: 0.7em;
	border-radius: 2px;
	margin-right:-100px;
}
a p{
	position: absolute;
	display: block;
	background: #FF5722;
}

a:hover{
	transition: 0.5s;
	transition-delay: 1s;
	background: #FF5722;
}
a p{
	position: absolute;
	display: block;
	background: #FF5722;
}
a p:nth-child(1){
    left: 0;
    bottom: 0;
    width: 100%;
    height: 2px;
    transform: scaleX(0);
    transform-origin: right;
    transition: transform 0.25s;
}
a:hover p:nth-child(1){
	transform: scaleX(1);
	transform-origin: left;
	transition: transform 0.25s;
}

a p:nth-child(2){
    right: 0;
    bottom: 0;
    width: 2px;
    height: 100%;
    transform: scaleY(0);
    transform-origin: top;
    transition: transform 0.25s;
}
a:hover p:nth-child(2){
	transform: scaleY(1);
	transform-origin: bottom;
	transition: transform 0.25s;
	transition-delay: 0.25s;
}

a p:nth-child(3){
    top: 0;
    right: 0;
    width: 100%;
    height: 2px;
    transform: scaleX(0);
    transform-origin: left;
    transition: transform 0.25s;
}
a:hover p:nth-child(3){
	transform: scaleX(1);
	transform-origin: right;
	transition: transform 0.25s;
	transition-delay: 0.35s;
}

a p:nth-child(4){
    top: 0;
    left: 0;
    width: 2px;
    height: 100%;
    transform: scaleY(0);
    transform-origin: bottom;
}
a:hover p:nth-child(4){
	transform: scaleY(1);
	transform-origin: top;
	transition: transform 0.25s;
	transition-delay: 0.45s;
}

h1 {
  font-size: 36px;
  color: black;
  text-shadow: 1px 1px 1px #999;
}
.all{



}

</style>
</head>
<body>
<div class="all">
<div style="width: 300px; margin:-250px -400px">
 <img src="${contextRoot}/images/gamebook2.png" alt="img" class="logo"> 
</div>
<div style="margin:auto auto">
 <h1>新增訂單成功!</h1>
	<a href="${contextRoot}/orders/membercenter">
		前往會員中心
	<p></p>
	<p></p>
	<p></p>
	<p></p>
</a>
</div>	

</div>
</body>

	
		
</html>