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
	<title>購物車</title>
</head>
<body>
	<h1>購物車</h1>
	<table>
		<thead>
			<tr>
				<th>商品名稱</th>
				<th>數量</th>
				<th>單價</th>
				<th>小計</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cartItem}" var="cartItem">
				<tr>
					<td>${cartItem.listedProduct.productName}</td>
					<td><input type="number" name="quantity" value="${cartItem.quantity}" /></td>
					<td>${cartItem.listedProduct.unitPrice}</td>
					<td>${cartItem.listedProduct.unitPrice * cartItem.quantity}</td>
					<td><a href="/removeCartItem?id=${cartItem.id}">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
<!-- 				<td colspan="3">總計</td> -->
<%-- 				<td>${totalPrice}</td> --%>
<!-- 				<td><a href="/checkout">結算</a></td> -->
			</tr>
		</tfoot>
	</table>
	<div>
		<c:if test="${empty cartItems}">
			<h3>你的購物車沒有商品</h3>
		</c:if>
	</div>
</body>
</html>
