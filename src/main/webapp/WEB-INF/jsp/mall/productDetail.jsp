<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

                <%-- <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">--%>
                    <!-- Bootstrap CSS -->
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                    <style>


                        @font-face {
                            font-family: 'CustomFont';
                            src: url('${contextRoot}/fonts/jf-openhuninn-2.0.ttf')
                            format('truetype');
                        }
                        * {
                            font-family: 'CustomFont', Arial, sans-serif;
                            margin: 0;
                            padding: 0;
                        }

                        .wrapper2 {
                            height: 100vh;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            background-color: #f0f0f0;
                        }

                        .wrapper2 .content {
                            width: 350px;
                            /*height:400px;*/
                            background-color: #fff;
                            padding: 40px 20px;
                            position: relative;
                            cursor: pointer;
                            border-radius: 10px;

                        }

                        .wrapper2 .content .price {
                            width: 60px;
                            height: 60px;
                            background-color: #000;
                            display: flex;
                            border-radius: 50%;
                            color: #fff;
                            justify-content: center;
                            align-items: center;
                            position: absolute;
                            top: -25px;
                            left: -25px;
                            opacity: 0;
                            transition: all 0.9s;
                        }

                        .wrapper2 .content:hover .price {
                            opacity: 1;
                        }

                        .wrapper2 .content .p-image {
                            text-align: center;
                        }

                        .wrapper2 .content .p-image img {
                            transition: all 0.5s;
                            height: 100%;

                        }

                        .wrapper2 .content:hover .p-image img {
                            transform: rotate(30deg);
                        }

                        .wrapper2 .content .line {
                            width: 30px;
                            height: 5px;
                            background-color: #000;
                            display: flex;
                            margin-top: 5px;
                            margin-bottom: 5px;
                        }

                        .wrapper2 .content h4 {
                            margin-top: 10px;
                            font-size: 20px;
                        }

                        .wrapper2 .content button {

                            height: 45px;
                            width: 100px;
                            border: none;
                            background-color: #000;
                            border-radius: 5px;
                            color: #fff;
                            position: absolute;
                            bottom: -20px;
                            right: 20px;
                            font-size: 15px;
                        }

                        .wrapper2 .content p {
                            font-size: 15px;
                        }

                        .wrapper2 .content button {
                            opacity: 0;
                            transition: all 0.5s;
                        }


                        .wrapper2 .content:hover button {
                            opacity: 1;
                            transition: all 0.5s;
                        }
                    </style>
                    <title>書贏由你來決定</title>
            </head>

            <body>

               
                    <jsp:include page="../layout/navebar.jsp"></jsp:include>
            

                <header>

                    <!-- content -->
                    <section class="py-5">
                        <div class="container">
                            <div class="row gx-5">
                                <aside class="col-lg-6">
                                    <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                        <a data-fslightbox="mygalley" class="rounded-4" target="_blank"
                                            data-type="image"
                                            href="<jstl:url value='/ProductImage/${listedProduct.productImage.productImageId}'/>">
                                            <img style="max-width: 100%; max-height: 100vh; margin: auto;"
                                                class="rounded-4 fit"
                                                src="<jstl:url value='/ProductImage/${listedProduct.productImage.productImageId}'/>" />
                                        </a>
                                    </div>

                                </aside>
                                <main class="col-lg-6">
                                    <div class="ps-lg-3">
                                        <h1 class="title text-dark"  style="font-family: 'CustomFont', Arial, sans-serif;">
                                            ${listedProduct.productName} <br />

                                        </h1>
                                        <div>&nbsp;</div>
                                        <div>&#8203;</div>
                                        <div class="mb-3">
                                            <span class="h5">$ ${listedProduct.unitPrice}</span>

                                        </div>

                                        <p>
                                            ${listedProduct.productDescription}
                                        </p>

                                        <div class="row">
                                            <dt class="col-3">剩餘數量:</dt>
                                            <dd class="col-9"> ${listedProduct.productQuantity}</dd>

                                            <dt class="col-3">商品上架時間:</dt>
                                            <dd class="col-9">${listedProduct.listedTime}</dd>

                                            <%-- <dt class="col-3">Material</dt>--%>
                                                <%-- <dd class="col-9">Cotton, Jeans</dd>--%>

                                                    <%-- <dt class="col-3">Brand</dt>--%>
                                                        <%-- <dd class="col-9">Reebook</dd>--%>
                                        </div>

                                        <hr />
                                        <br>

                                        <div class="d-flex justify-content-end">
                                            <a href="#" class="btn btn-warning shadow-0">Buy now</a>
                                            <div class="mx-2"></div>
                                            <a href="#" class="btn btn-primary shadow-0"><i
                                                    class="me-1 fa fa-shopping-basket"></i>Add to cart</a>
                                        </div>


                                    </div>

                                </main>
                            </div>
                        </div>
                    </section>


                    <%-- <div class="wrapper2">--%>

                        <%-- <div class="content">--%>
                            <%-- <span class="price">$${listedProduct.unitPrice}</span>--%>
                                <%-- <div class="p-image">--%>
                                    <%-- <img
                                        src="<jstl:url value='/ProductImage/${listedProduct.productImage.productImageId}'/>"
                                        width="200">--%>



                                        <%-- </div>--%>

                                            <%-- <h4> ${listedProduct.productName} </h4>--%>
                                                <%-- <span class="line"></span>--%>
                                                    <%-- ${listedProduct.productDescription}--%>
                                                        <%-- <br>--%>
                                                            <%-- 剩餘數量:${listedProduct.productQuantity}--%>
                                                                <%-- <br>--%>
                                                                    <%-- 商品上架日期:${listedProduct.listedTime}--%>
                                                                        <%-- <button>Buy Now</button>--%>

                                                                            <%-- </div>--%>

                                                                                <%-- </div>--%>


                                                                                <jsp:include page="../layout/footerbar.jsp"></jsp:include>


                                                                                    <!-- Bootstrap JS, because We Fucking Need It -->
                                                                                    <script
                                                                                        src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                                                                                    <script
                                                                                        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
                                                                                    <script
                                                                                        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                                                                                    <!-- owl slider -->
                                                                                    <script
                                                                                        src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
                                                                                    <!-- isotope js -->
                                                                                    <script
                                                                                        src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
                                                                                    <!-- nice select -->
                                                                                    <script
                                                                                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>


            </body>

            </html>