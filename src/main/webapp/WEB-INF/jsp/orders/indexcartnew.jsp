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
		<link rel="stylesheet" href="2_main.css">
		<script src="${contextRoot}/3_new.js"></script>
		<title></title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
	</head>
	<body>
		<div id="big_wrapper">
			<header>
				<div id="newItem">
					<!-- <img src="imgs/formosa.jpg">
					<span>Formosa</span>
					<span>5000</span> -->
				</div>
				<div id="content">	
					<nav>
						Item : <span id="itemCount">0</span> item(s)
					</nav>
					<nav>
						Subtotal : $ <span id="subtotal">0</span>
					</nav>
				</div>
				<div id="shopButton">
					<span class="cartProcess"><a href="4_cartEdit.html">Edit Cart</a></span>
					<span class="cartProcess">Checkout</span>
				</div>
				<div style="clear:both;"></div>
			</header>
			<hr>
			<section>
				<ul>
					<li>
						<div>
							<img src="imgs/formosa.jpg">
							Formosa
						</div>
						<div>
							Price : $5000
						</div>
						<div>
							<span id="A1001" class="addButton">
								Add Cart
								<input type="hidden" value="Formosa|formosa.jpg|5000">
							</span>	
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/brown.jpg">
							Teddy Brown
						</div>
						<div>
							Price : $7000
						</div>
						<div>
							<span id="A1002" class="addButton">
								Add Cart
								<input type="hidden" value="Teddy Brown|brown.jpg|7000">
							</span>
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/cinnamon.jpg">
							Teddy Cinnamon
						</div>
						<div>
							Price : $6800
						</div>
						<div>
							<span id="A1003" class="addButton">
								Add Cart
								<input type="hidden" value="Teddy Cinnamon|cinnamon.jpg|6800">
							</span>
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/innocent.jpg">
							Innocent Bear
						</div>
						<div>
							Price : $7200
						</div>
						<div>
							<span id="A1004" class="addButton">
								Add Cart
								<input type="hidden" value="Innocent Bear|innocent.jpg|7200">
							</span>
						</div>
					</li>
				</ul>
				<ul>
					<li>
						<div>
							<img src="imgs/lion.jpg">
							Lion Bear
						</div>
						<div>
							Price : $8000
						</div>
						<div>
							<span id="A1005" class="addButton">
								Add Cart
								<input type="hidden" value="Lion Bear|lion.jpg|8000">
							</span>
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/milk.jpg">
							Teddy Milk
						</div>
						<div>
							Price : $6000
						</div>
						<div>
							<span id="A1006" class="addButton">
								Add Cart
								<input type="hidden" value="Teddy Milk|milk.jpg|6000">
							</span>
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/panda.jpg">
							Panda
						</div>
						<div>
							Price : $6800
						</div>
						<div>
							<span id="A1007" class="addButton">
								Add Cart
								<input type="hidden" value="Panda|panda.jpg|6800">
							</span>
						</div>
					</li>
					<li>
						<div>
							<img src="imgs/peterRabbit.jpg">
							Peter Rabbit
						</div>
						<div>
							Price : $5500
						</div>
						<div>
							<span id="A1008" class="addButton">
								Add Cart
								<input type="hidden" value="Peter Rabbit|peterRabbit.jpg|5500">
							</span>
						</div>
					</li>
				</ul>
			</section>
		</div>
	</body>
</html>
