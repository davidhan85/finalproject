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
  <script src="${contextRoot}/js/custom.js"></script>

    <script>
        $(document).ready(function() {
            // 綁定 .filter 點擊事件
            $('.filter').on('click', function() {
                // 取得點擊的分類類別編號
                const category = $(this).data('category');
                console.log(category);
                // 呼叫 AJAX 請求
                $.ajax({
                    url: "${contextRoot}/CategoryProduct",
                    type: "GET",
                    data: {ProductCategorynumber: category,

                    },
                    success: function(data) {
                        console.log(data)
                        // 更新商品列表
                        $('.grid').html(data);
                    },
                    error: function(xhr) {
                        console.log(xhr);
                    }
                });
            });
        });
    </script>


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 
<title>書贏由你來決定</title>
</head>
<body>

<%-- 	<jsp:include page="mallnarbar.jsp"></jsp:include> --%>
		<jsp:include page="../layout/navebar.jsp"></jsp:include>
  
<%--  <!-- 導覽列 -->--%>
<%--  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <div class="container-fluid">--%>
<%--      --%>
<%--      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--      </button>--%>
<%--         --%>
<%--      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--        分類--%>
<%--      </a>--%>
<%--      --%>
<%--      <div class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">--%>
<%--        <a class="dropdown-item" href="#">所有商品</a>--%>
<%--        <a class="dropdown-item" href="#">遊戲軟體</a>--%>
<%--        <a class="dropdown-item" href="#">周邊</a>--%>
<%--        <a class="dropdown-item" href="#">書籍</a>--%>
<%--        <a class="dropdown-item" href="#">其他</a>--%>
<%--      </div>--%>
<%--      --%>
<%--          </li>--%>
<%--        </ul>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </nav>--%>

  
 
		<!-- Image Carousel -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${contextRoot}/images/activity.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="https://via.placeholder.com/800x300" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="https://via.placeholder.com/800x300" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

    <!-- End Image Carousel -->
    <div>&nbsp;</div>
    <div>&#8203;</div>
   

<!-- isell -->
<div class="d-flex justify-content-center">

  <button type="button" class="btn-hover color-10 btn-lg " onclick="location.href='${contextRoot}/Insertproduct';">我要賣</button>

</div>

    <!-- End isell -->
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
          <div class="row grid" id="products-container" >
            				<jstl:forEach var="product" items="${pPage.content}">
            				<div class="col-sm-6 col-lg-4 all">
            					<div class="box">
            						<div>
            							<div class="img-box">

            								<img src="<jstl:url value='/ProductImage/${product.productImage.productImageId}'/>" alt="" width="315" height="315" class="product-img" onclick="window.location.href='${contextRoot}/ProductDetail/${product.productId}'">

            							</div>
            							<div class="detail-box">
            								<h5>
            										${product.productName}
            								</h5>
            								<p>
            										${product.productDescription}
            								</p>
            								<div class="options">
            									<h6>
            											${product.unitPrice}
            									</h6>
            									<a href="">
            										<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background:new 0 0 456.029 456.029;" xml:space="preserve">
                                  <g>
            						  <g>
            							  <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                                   c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
            						  </g>
            					  </g>
            											<g>
            												<g>
            													<path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                                   C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                                   c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                                   C457.728,97.71,450.56,86.958,439.296,84.91z" />
            												</g>
            											</g>

            												<g>
            													<path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
            												</g>


                                </svg>
            									</a>
            								</div>
            							</div>
            						</div>
            					</div>
            				</div>


<%--                                <div>&nbsp;</div>--%>
<%--                                <div>&#8203;</div>--%>

                            </jstl:forEach>
                                <div class="btn-box">
                                    <a href="${contextRoot}/AllProduct">
                                        View More
                                    </a>
                                </div>
    </section>

    </div>

<%--<h5 class="float-right"><a href="${contextRoot}/AllProduct" class="text-muted small"> View More > </a></h5>--%>





    <!-- end food section -->




<!-- end food section -->




<!-- about section -->

<section class="about_section layout_padding">
  <div class="container  ">

        <div class="detail-box">
          <div class="heading_container">
          
          </div>
          <div class="container">
            <div class="row">
              <div class="col-md-12 mb-3">
                <h1 class="float-left">最新產品</h1>

              </div>
            </div>
            <div class="row">
              <div class="col-md-3">
                <div class="card mb-3">
                  <img class="card-img-top" src="https://via.placeholder.com/200x200" alt="產品1">
                  <div class="card-body">
                    <h5 class="card-title custom-color">產品1</h5>
                    <p class="card-text custom-color">這裡是產品1的描述文字。</p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card mb-3">
                  <img class="card-img-top" src="https://via.placeholder.com/200x200" alt="產品2">
                  <div class="card-body">
                    <h5 class="card-title custom-color">產品2</h5>
                    <p class="card-text custom-color">這裡是產品2的描述文字。</p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card mb-3">
                  <img class="card-img-top" src="https://via.placeholder.com/200x200" alt="產品3">
                  <div class="card-body">
                    <h5 class="card-title custom-color">產品3</h5>
                    <p class="card-text custom-color">這裡是產品3的描述文字。</p>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="card mb-3">
                  <img class="card-img-top" src="https://via.placeholder.com/200x200" alt="產品4">
                  <div class="card-body">
                    <h5 class="card-title custom-color">產品4</h5>
                    <p class="card-text custom-color">這裡是產品4的描述文字。</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
            <h5 class="float-right"><a href="${contextRoot}/AllProduct" class="text-muted small"> View More > </a></h5>
          
      </div>
    </div>

</section>

<!-- end about section -->


<div>&nbsp;</div>
<div>&#8203;</div>

<div>&nbsp;</div>
<div>&#8203;</div>

<div class="text-center">
  <img src="https://via.placeholder.com/1200x300" class="img-fluid mx-auto" alt="...">
</div>

<div>&nbsp;</div>
<div>&#8203;</div>
<div>&nbsp;</div>
<div>&#8203;</div>

<%-- <jsp:include page="mallfooter.jsp"></jsp:include> --%>
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>


</body>
</html>