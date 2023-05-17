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
	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 	
</head>
<body>
	<h1>購物車</h1>
	<c:choose>
	<c:when test="${empty cartItem}">
		<p>Your shopping cart is empty.</p>
	</c:when>
	<c:otherwise>
	<table>
		<thead>
			<tr>
				<th>商品名稱</th>
				<th>數量</th>
				<th>單價</th>
				<th>小計</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty cartItem}">
			<c:forEach var="item" items="${cartItem}">
				<tr>
					<td>${item.listedProduct.productName}</td>
					<td>
						<input type="number" value="${item.quantity}" min="1" onchange="updateQuantity(this)">
					</td>
					<td>${item.listedProduct.unitPrice}</td>
					<td>${item.quantity}*${item.listedProduct.unitPrice}</td>
<!-- 					<td> -->
<%-- 						<form action="${contextRoot}/orders/edit"> --%>
<%-- 						  <input type="hidden" name="id" value="${cartItem.cartItemID}" /> --%>
<!-- 						  <input type="submit" class="btn btn-outline-info btn-sm" value="編輯數量" /> -->
<!-- 						</form> -->
<!-- 					</td> -->
						<td>
<form method="post" action="${contextRoot}/cart/delete/${item.cartItemID}">
  <input type="hidden" name="_method" value="delete">
  <button type="submit">刪除項目</button>
</form>
			
</td>
<td></td>					
<%-- 					<td><a href="/cart/delete?cartItemID=${item.cartItemID}" class="btn btn-danger">Remove</a></td> --%>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
			<td colspan="3">總計</td> 
 				<td id="total">0.00</td> 
				<td><a href="${contextRoot}/orders/addShoppingcartcommit"><button>商品確認</button></a></td>
			</tr> 
		</tfoot>
	</table>
	</c:otherwise>
	</c:choose>
	<div>
		<c:if test="${empty cartItem}">
			<h3>你的購物車沒有商品</h3>
		</c:if>
	</div>
		<script type="text/javascript">
    function updateTotal() {
        var total = 0;
        var rows = document.getElementsByTagName("tr");
        for (var i = 1; i < rows.length - 1; i++) {
            var row = rows[i];
            var quantity = parseInt(row.cells[3].textContent.trim());
            var unitPrice = parseFloat(row.cells[2].textContent.trim());
            var subtotal = quantity * unitPrice;
            row.cells[4].textContent = subtotal.toFixed(2);
            total += subtotal;
        }
        document.getElementById("total").textContent = total.toFixed(2);
    }

	function updateQuantity(input) {
		var row = input.parentNode.parentNode; // 取得表格列元素
		var quantity = parseInt(input.value); // 取得使用者輸入的新數量
		var entity = row.dataset.entity; // 取得該列產品的實體資料

		// 將新數量寫回到entity對應的欄位或屬性
		if (entity instanceof Object) { // 假設entity是JavaScript物件
			entity.quantity = quantity; // 將數量寫回到quantity屬性
		} else if (entity instanceof HTMLTableRowElement) { // 假設entity是表格列元素
			entity.cells[1].textContent = quantity; // 將數量寫回到表格列的第二欄
		}

		// 更新總價格
		updateTotal();
	}
// 	$(document).ready(function() {
// 	    $('#deleteForm button').click(function(event) {
// 	        event.preventDefault();
// 	        var cartItemID = cartItemID;
// 	        $.ajax({
// 	            url: '${contextRoot}/cart/delete/' + cartItemID,
// 	            type: 'DELETE',
// 	            success: function(response) {
// 	                window.location.href = '/orders/shoppingcart';
// 	            }
// 	        });
// 	    });
// 	});
 	</script> 	

</body>
</html>



