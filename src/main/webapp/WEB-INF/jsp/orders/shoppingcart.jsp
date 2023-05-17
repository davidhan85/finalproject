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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>購物車</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${contextRoot}/css/styleCART.css">

    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextRoot}/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextRoot}/css/jquery-ui.css">
    <link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">


    <link rel="stylesheet" href="${contextRoot}/css/aos.css">

    <link rel="stylesheet" href="${contextRoot}/css/styleCART2.css">	
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 	

<style>

.text-black {
  font-size: 1.5em; /* 設置字體大小 */
  font-family: "Arial", sans-serif; /* 設置字體 */
  font-weight: bold; /* 設置字體加粗 */
  color: 	#0000E3; /* 設置字體顏色 */
  text-decoration: none; /* 設置文字下劃線 */
  text-transform: uppercase; /* 設置文字轉換為大寫 */
}

.site-section{

 
    background-repeat: no-repeat;
    background-size: cover;
    background-image: url('${contextRoot}/images/book-g441b655a1_1920.jpg');
  background-size: cover;
   	background-color: rgba(0,0,0,)
    padding: 10px;
    
}
table {
  font-family: Arial, sans-serif;
  font-size: 18px;
  font-weight: bold;
  color: #FCFCFC; /*文字顏色*/
  border-collapse: collapse;

}

table th, table td {
  padding: 10px;
  text-align: center;
  border: 1px solid #ccc; /*表格邊框*/
}

table th {
  background-color: #f2f2f2; /*表頭背景色*/
}

}

table td {
  background-color: rgba(255, 255, 255, 0.1);
}

.container{
    background-image: url('${contextRoot}/images/gamebookre2.png'); 
        background-repeat: no-repeat;
        background-position: -2% -10%;
background-color: rgba(255, 255, 255,0.8);
}

.col-md-12 mb-0{


}
.containerh{

/* background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 90%, rgba(211,211,211, 1) 10%); */
/* background: linear-gradient(to bottom right, #FFFFFF, #D3D3D3); */
}
button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 5px;
  box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
  transition: background-color 0.3s ease-in-out;
}

button:hover {
  background-color: #3e8e41;
}
.x{
 background-color: red;
}

.x:hover {
  background-color: blue;
}
</style>
</head>
<body>
<jsp:include page="../layout/navebar.jsp"></jsp:include>


<div class="site-wrap">
    
<div class="bg-light py-3">
      <div class="containerh">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${contextRoot}/index/cart">首頁</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">購物車</strong></div>
        </div>
      </div>
    </div>
    
     <!-- MAIN------------------------------------------------------- --> 
 <div class="site-section">
  <div class="container">
    <div class="row mb-5">
      <div class="col-md-12">
        <c:choose>
          <c:when test="${empty cartItem}">
            <p>Your shopping cart is empty.</p>
          </c:when>
          <c:otherwise>
            <table class="table">
              <thead>
                <tr>
                  <th>商品名稱</th>
                  <th>數量</th>
                  <th>單價</th>
                  <th>小計</th>
                  <th></th>
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
                      <td>
                        <form method="post" action="${contextRoot}/cart/delete/${item.cartItemID}">
                          <input type="hidden" name="_method" value="delete">
                          <button type="submit">刪除項目</button>
                        </form>
                      </td>
                    </tr>
                  </c:forEach>
                </c:if>
              </tbody>
              <tfoot>
                <tr>
          <td colspan="3" style="font-size: 40px; font-weight: bold; padding: 15px; text-align: center; color:red">總計</td>
                  <td id="total">00.00</td>
                  <td><a href="${contextRoot}/orders/addShoppingcartcommit"><button class="x">商品確認</button></a></td>
                </tr>
              </tfoot>
            </table>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>
 
        <!-- MAIN------------------------------------------------------- -->  
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
<script src="${contextRoot}/js/jquery-3.3.1.min.js"></script>
  <script src="${contextRoot}/js/jquery-ui.js"></script>
  <script src="${contextRoot}/js/popper.min.js"></script>
  <script src="${contextRoot}/js/bootstrap.minCART.js"></script>
  <script src="${contextRoot}/js/owl.carousel.min.js"></script>
  <script src="${contextRoot}/js/jquery.magnific-popup.min.js"></script>
  <script src="${contextRoot}/js/aos.js"></script>

  <script src="${contextRoot}/js/main.js"></script>


</body>
</html>



