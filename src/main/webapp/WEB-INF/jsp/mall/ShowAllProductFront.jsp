<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<meta charset="UTF-8">
	<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
	<!-- Bootstrap JS, because We Fucking Need It -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- owl slider -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<!-- isotope js -->
	<script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
	<!-- nice select -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>



	<script>
		<%--$(document).ready(function() {--%>
		<%--	// 綁定 .filter 點擊事件--%>
		<%--	$('.filter').on('click', function() {--%>
		<%--		// 取得點擊的分類類別編號--%>
		<%--		const category = $(this).data('category');--%>
		<%--		console.log(category);--%>
		<%--		// 呼叫 AJAX 請求--%>
		<%--		$.ajax({--%>
		<%--			url: "${contextRoot}/CategoryProduct",--%>
		<%--			type: "GET",--%>
		<%--			data: {ProductCategorynumber: category,--%>
		<%--					--%>
		<%--			},--%>
		<%--			success: function(data) {--%>
		<%--				console.log(data)--%>
		<%--				// 更新商品列表--%>
		<%--				$('.grid').html(data);--%>
		<%--			},--%>
		<%--			error: function(xhr) {--%>
		<%--				console.log(xhr);--%>
		<%--			}--%>
		<%--		});--%>
		<%--	});--%>
		<%--});--%>



	</script>
	<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>

	.wrapper {
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 20vh;
		margin: 0;
		padding: 0;
	}

	.pagination {
		display: flex;
		justify-content: center;
		margin-top: 10px;
		list-style: none;
		padding: 0;
	}

	.page-item {
		display: flex;
	}

	.page-link {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 5px 10px;
		margin: 0 5px;
		border: 1px solid black;
		border-radius: 4px;
		color: black;
		text-decoration: none;

	}

	.page-link:hover {
		background-color: black;
	}


</style>
	<title>書贏由你來決定</title>
</head>
<body>

<jsp:include page="mallnarbar.jsp"></jsp:include>

<div>&nbsp;</div>
<div>&#8203;</div>

<!-- food section -->

<section class="food_section">
	<div class="container">
		<div class="heading_container heading_center">
			<h2>
				所有商品
			</h2>
		</div>

		<ul class="filters_menu">
			<li class="active filter" data-category="0" data-filter="*">所有</li>
			<li class="filter" data-category="1" data-filter=".game">遊戲軟體</li>
			<li class="filter" data-category="2" data-filter=".peripheral">周邊</li>
			<li class="filter" data-category="3" data-filter=".book">書籍</li>
			<li class="filter" data-category="4" data-filter=".others">其他</li>
		</ul>

		<div class="filters-content">
			<div class="row grid" id="products-container">
<%--				<jstl:forEach var="product" items="${pPage.content}">--%>
<%--				<div class="col-sm-6 col-lg-4 all">--%>
<%--					<div class="box">--%>
<%--						<div>--%>
<%--							<div class="img-box">--%>

<%--								<img src="<jstl:url value='/ProductImage/${product.productImage.productImageId}'/>" alt="" width="315" height="315" class="product-img" onclick="window.location.href='${contextRoot}/ProductDetail/${product.productId}'">--%>

<%--							</div>--%>
<%--							<div class="detail-box">--%>
<%--								<h5>--%>
<%--										${product.productName}--%>
<%--								</h5>--%>
<%--								<p>--%>
<%--										${product.productDescription}--%>
<%--								</p>--%>
<%--								<div class="options">--%>
<%--									<h6>--%>
<%--											${product.unitPrice}--%>
<%--									</h6>--%>
<%--									<a href="">--%>
<%--										<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">--%>
<%--                      <g>--%>
<%--						  <g>--%>
<%--							  <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248--%>
<%--                       c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />--%>
<%--						  </g>--%>
<%--					  </g>--%>
<%--											<g>--%>
<%--												<g>--%>
<%--													<path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48--%>
<%--                       C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064--%>
<%--                       c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4--%>
<%--                       C457.728,97.71,450.56,86.958,439.296,84.91z" />--%>
<%--												</g>--%>
<%--											</g>--%>

<%--												<g>--%>
<%--													<path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296--%>
<%--                       c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />--%>
<%--												</g>--%>


<%--                    </svg>--%>
<%--									</a>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				</jstl:forEach>--%>

</section>
</div>

	<div class="wrapper">
		<ul class="pagination">
			<jstl:forEach var="pageNumber" begin="1" end="${pPage.totalPages}">
				<jstl:choose>
					<jstl:when test="${pPage.number != pageNumber - 1}">
						<li class="page-item"><a class="page-link" style="color: black"  href="${contextRoot}/AllProduct?p=${pageNumber}">${pageNumber}</a></li>
					</jstl:when>
					<jstl:otherwise>
						<li class="page-item active"><a class="page-link" style="background-color: #222831;border: 1px solid black;"   href="#">${pageNumber}</a></li>
					</jstl:otherwise>
				</jstl:choose>
			</jstl:forEach>
		</ul>
	</div>








<!-- end food section -->

<div>&nbsp;</div>
<div>&#8203;</div>
<div>&nbsp;</div>
<div>&#8203;</div>

<%--<jsp:include page="mallfooter.jsp"></jsp:include>--%>


<script>
	const filtersList = document.querySelectorAll('.filters_menu li');
	filtersList.forEach(function(filter) {
		filter.addEventListener('click', function() {
			loadProducts(1, '', filter.getAttribute('data-category'));
		});
	});




	async function loadProducts(page, keyword,category) {
		try {
			const response = await axios.get('${contextRoot}/front/product/list', {
				params: {page, keyword, category}
			});
			console.log(response)
			console.log(response.data.products.content)
			renderProducts(response.data.products.content);
			// displayProducts(response.data.products.content);
			// setupPagination(response.data);
		} catch (error) {
			console.error('Error loading products:', error);
		}
	}

	window.onload = () => {
		Promise.all(Array.from(document.getElementsByTagName('jsp:include')).map((include) => {
			return new Promise((resolve, reject) => {
				include.addEventListener('load', resolve);
			});
		})).then(() => {
			loadProducts(1, '',  0);
		});
	};

	function createProductElement(product) {
		const col = document.createElement("div");
		col.classList.add("col-sm-6", "col-lg-4", "all");

		const box = document.createElement("div");
		box.classList.add("box");

		const imgBox = document.createElement("div");
		imgBox.classList.add("img-box");

		const img = document.createElement("img");
		img.src =' ${contextRoot}/ProductImage/'+product.productImage.productImageId;
		img.alt = "";
		img.width = "315";
		img.height = "315";
		img.classList.add("product-img");
		img.onclick = () => {
			window.location.href = '${contextRoot}/ProductDetail/'+product.productId;
		};

		imgBox.appendChild(img);

		const detailBox = document.createElement("div");
		detailBox.classList.add("detail-box");

		const h5 = document.createElement("h5");
		h5.textContent = product.productName;

		const p = document.createElement("p");
		p.textContent = product.productDescription;

		const options = document.createElement("div");
		options.classList.add("options");

		const h6 = document.createElement("h6");
		h6.textContent = product.unitPrice;

		const a = document.createElement("a");
		a.href = "";

		// SVG元素的創建過程，省略以節省空間
		const svg = createSvgElement();

		a.appendChild(svg);
		options.appendChild(h6);
		options.appendChild(a);

		detailBox.appendChild(h5);
		detailBox.appendChild(p);
		detailBox.appendChild(options);

		box.appendChild(imgBox);
		box.appendChild(detailBox);

		col.appendChild(box);

		return col;
	}

	function renderProducts(products) {
		const container = document.getElementById("products-container"); // 假設有一個id為products-container的div元素
		container.innerHTML='';
		products.forEach((product) => {
			const productElement = createProductElement(product);
			container.appendChild(productElement);
		});
	}

	// 執行渲染


	function createSvgElement() {
		const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
		svg.setAttribute("version", "1.1");
		svg.setAttribute("id", "Capa_1");
		svg.setAttribute("xmlns", "http://www.w3.org/2000/svg");
		svg.setAttribute("xmlns:xlink", "http://www.w3.org/1999/xlink");
		svg.setAttribute("x", "0px");
		svg.setAttribute("y", "0px");
		svg.setAttribute("viewBox", "0 0 456.029 456.029");
		svg.setAttribute("style", "enable-background:new 0 0 456.029 456.029;");
		svg.setAttribute("xml:space", "preserve");

		const g1 = document.createElementNS("http://www.w3.org/2000/svg", "g");
		const g2 = document.createElementNS("http://www.w3.org/2000/svg", "g");
		const path1 = document.createElementNS("http://www.w3.org/2000/svg", "path");
		path1.setAttribute("d", "M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z");
		g2.appendChild(path1);
		g1.appendChild(g2);

		const g3 = document.createElementNS("http://www.w3.org/2000/svg", "g");
		const g4 = document.createElementNS("http://www.w3.org/2000/svg", "g");
		const path2 = document.createElementNS("http://www.w3.org/2000/svg", "path");
		path2.setAttribute("d", "M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4C457.728,97.71,450.56,86.958,439.296,84.91z");
		g4.appendChild(path2);
		g3.appendChild(g4);

		const g5 = document.createElementNS("http://www.w3.org/2000/svg", "g");
		const path3 = document.createElementNS("http://www.w3.org/2000/svg", "path");
		path3.setAttribute("d", "M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z");
		g5.appendChild(path3);

		svg.appendChild(g1);
		svg.appendChild(g3);
		svg.appendChild(g5);
		return svg;
	}
</script>

</body>
</html>