<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="wpOceans">
    <link rel="shortcut icon" type="image/png" href="assets/images/favicon.png">
   <title>Themart - eCommerce HTML5 Template</title>
    <link href="${contextRoot}/css/themify-icons.css" rel="stylesheet">
    <link href="${contextRoot}/css/mall/font-awesome.min.css" rel="stylesheet">
    <link href="${contextRoot}/css/flaticon_ecommerce.css" rel="stylesheet">
    <link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextRoot}/css/animate.css" rel="stylesheet">
    <link href="${contextRoot}/css/owl.carousel.css" rel="stylesheet">
    <link href="${contextRoot}/css/owl.theme.css" rel="stylesheet">
    <link href="${contextRoot}/css/slick.css" rel="stylesheet">
    <link href="${contextRoot}/css/slick-theme.css" rel="stylesheet">
    <link href="${contextRoot}/css/swiper.min.css" rel="stylesheet">
    <link href="${contextRoot}/css/owl.transitions.css" rel="stylesheet">
    <link href="${contextRoot}/css/jquery.fancybox.css" rel="stylesheet">
    <link href="${contextRoot}/css/odometer-theme-default.css" rel="stylesheet">
    <link href="${contextRoot}/css//style.css" rel="stylesheet">
</head>

<body>

    <!-- start page-wrapper -->
    <div class="page-wrapper">
        <!-- start preloader -->
        <div class="preloader">
            <div class="vertical-centered-box">
                <div class="content">
                    <div class="loader-circle"></div>
                    <div class="loader-line-mask">
                        <div class="loader-line"></div>
                    </div>
                    <img src="https://via.placeholder.com/300x300" alt="">
                </div>
            </div>
        </div>
        <!-- end preloader -->

        <!-- start header -->
        <header id="header">
            <div class="topbar">
                <div class="container">
                    <div class="row">
                        <div class="col col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="contact-intro">
                                <span>A Marketplace Initiative by Themart Theme - save more with coupons</span>
                            </div>
                        </div>
                        <div class="col col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="contact-info">
                                <ul>
                                    <li><a href="tel:869968236"><span>Need help? Call Us:</span>+ +869 968 236</a></li>
                                    <li>
                                        <div class="dropdown">
                                            <button class="dropdown-toggle" type="button" id="dropdownMenuButton1"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                English
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                <li><a class="dropdown-item" href="#">English</a></li>
                                                <li><a class="dropdown-item" href="#">Germany</a></li>
                                                <li><a class="dropdown-item" href="#">Turki</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown">
                                            <button class="dropdown-toggle" type="button" id="dropdownMenuButton2"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                USD
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                                <li><a class="dropdown-item" href="#">AUD</a></li>
                                                <li><a class="dropdown-item" href="#">EUR</a></li>
                                                <li><a class="dropdown-item" href="#">CNY</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end topbar -->
            <!--  start header-middle -->
            <div class="header-middle">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-2">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="index.html"><img src="https://via.placeholder.com/30x30"
                                        alt="logo"></a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                            <form action="#" class="middle-box">
                                <div class="category">
                                    <select name="service" class="form-control">
                                        <option disabled="disabled" selected="">All Category</option>
                                        <option>Men</option>
                                        <option>Women</option>
                                        <option>Kids</option>
                                        <option>Sales</option>
                                        <option>Perfect Cake</option>
                                        <option>All Of The Above</option>
                                    </select>
                                </div>
                                <div class="search-box">
                                    <div class="input-group">
                                        <input type="search" class="form-control"
                                            placeholder="What are you looking for?">
                                        <button class="search-btn" type="submit"> <i class="fi flaticon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="middle-right">
                                <ul>
                                    <li><a href="compare.html"><i class="fi flaticon-right-and-left"></i><span>Compare</span></a>
                                    </li>
                                    <li><a href="login.html"><i class="fi flaticon-user-profile"></i><span>Login</span></a></li>
                                     <li>
                                        <div class="header-wishlist-form-wrapper">
                                            <button class="wishlist-toggle-btn"> <i class="fi flaticon-heart"></i>
                                                <span class="cart-count">3</span></button>
                                            <div class="mini-wislist-content">
                                                <button class="mini-cart-close"><i class="ti-close"></i></button>
                                                <div class="mini-cart-items">
                                                    <div class="mini-cart-item clearfix">
                                                        <div class="mini-cart-item-image">
                                                            <a href="product.html"><img src="https://via.placeholder.com/300x300" alt></a>
                                                        </div>
                                                        <div class="mini-cart-item-des">
                                                            <a href="product.html">Stylish Pink Coat</a>
                                                            <span class="mini-cart-item-price">$150 x 1</span>
                                                            <span class="mini-cart-item-quantity"><a href="#"><i
                                                                        class="ti-close"></i></a></span>
                                                        </div>
                                                    </div>
                                                    <div class="mini-cart-item clearfix">
                                                        <div class="mini-cart-item-image">
                                                            <a href="product.html"><img
                                                                    src="https://via.placeholder.com/300x300"
                                                                    alt></a>
                                                        </div>
                                                        <div class="mini-cart-item-des">
                                                            <a href="product.html">Blue Bag</a>
                                                            <span class="mini-cart-item-price">$120 x 2</span>
                                                            <span class="mini-cart-item-quantity"><a href="#"><i
                                                                        class="ti-close"></i></a></span>
                                                        </div>
                                                    </div>
                                                    <div class="mini-cart-item clearfix">
                                                        <div class="mini-cart-item-image">
                                                            <a href="product.html"><img
                                                                    src="https://via.placeholder.com/300x300"
                                                                    alt></a>
                                                        </div>
                                                        <div class="mini-cart-item-des">
                                                            <a href="product.html">Kids Blue Shoes</a>
                                                            <span class="mini-cart-item-price">$120 x 1</span>
                                                            <span class="mini-cart-item-quantity"><a href="#"><i
                                                                        class="ti-close"></i></a></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mini-cart-action clearfix">
                                                    <span class="mini-checkout-price">Subtotal:
                                                        <span>$410</span></span>
                                                    <div class="mini-btn">
                                                        <a href="checkout.html" class="view-cart-btn s1">Checkout</a>
                                                        <a href="wishlist.html" class="view-cart-btn">View Wishlist</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="mini-cart">
                                            <button class="cart-toggle-btn"> <i class="fi flaticon-add-to-cart"></i>
                                                <span class="cart-count">2</span></button>
                                            <div class="mini-cart-content">
                                                <button class="mini-cart-close"><i class="ti-close"></i></button>
                                                <div class="mini-cart-items">
                                                    <div class="mini-cart-item clearfix">
                                                        <div class="mini-cart-item-image">
                                                            <a href="product.html"><img src="https://via.placeholder.com/300x300" alt></a>
                                                        </div>
                                                        <div class="mini-cart-item-des">
                                                            <a href="product.html">Stylish Pink Coat</a>
                                                            <span class="mini-cart-item-price">$150 x 1</span>
                                                            <span class="mini-cart-item-quantity"><a href="#"><i
                                                                        class="ti-close"></i></a></span>
                                                        </div>
                                                    </div>
                                                    <div class="mini-cart-item clearfix">
                                                        <div class="mini-cart-item-image">
                                                            <a href="product.html"><img
                                                                    src="https://via.placeholder.com/300x300"
                                                                    alt></a>
                                                        </div>
                                                        <div class="mini-cart-item-des">
                                                            <a href="product.html">Blue Bag</a>
                                                            <span class="mini-cart-item-price">$120 x 2</span>
                                                            <span class="mini-cart-item-quantity"><a href="#"><i
                                                                        class="ti-close"></i></a></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mini-cart-action clearfix">
                                                    <span class="mini-checkout-price">Subtotal:
                                                        <span>$390</span></span>
                                                    <div class="mini-btn">
                                                        <a href="checkout.html" class="view-cart-btn s1">Checkout</a>
                                                        <a href="cart.html" class="view-cart-btn">View Cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  end header-middle -->
            <div class="wpo-site-header">
                <nav class="navigation navbar navbar-expand-lg navbar-light">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-3 d-lg-none dl-block">
                                <div class="mobail-menu">
                                    <button type="button" class="navbar-toggler open-btn">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar first-angle"></span>
                                        <span class="icon-bar middle-angle"></span>
                                        <span class="icon-bar last-angle"></span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-lg-1 col-md-6 col-sm-5 col-6 d-block d-lg-none">
                                <div class="navbar-header">
                                    <a class="navbar-brand" href="index.html"><img src="https://via.placeholder.com/30x30"
                                            alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-3 col-sm-4 col-3">
                                <div class="header-shop-item">
                                    <button class="header-shop-toggle-btn"><span>Shop By Category</span> </button>
                                    <div class="mini-shop-item">
                                        <ul id="metis-menu">
                                            <li>
                                                <a href="product.html">Feature Product</a>
                                            </li>
                                            <li class="header-catagory-item">
                                                <a class="menu-down-arrow" href="#">Perfunsee & Cologne</a>
                                                <ul class="header-catagory-single">
                                                    <li><a href="#">Men's Clothing</a></li>
                                                    <li><a href="#">Computer & Office</a></li>
                                                    <li><a href="#">Jewelry & Watches</a></li>
                                                    <li><a href="#">Phones & Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="product.html">Best Sellers</a>
                                            </li>
                                            <li class="header-catagory-item">
                                                <a class="menu-down-arrow" href="#">Men Fashion</a>
                                                <ul class="header-catagory-single">
                                                    <li><a href="#">Men's Clothing</a></li>
                                                    <li><a href="#">Computer & Office</a></li>
                                                    <li><a href="#">Jewelry & Watches</a></li>
                                                    <li><a href="#">Phones & Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="product.html">Bags & Shoes</a>
                                            </li>
                                            <li class="header-catagory-item">
                                                <a class="menu-down-arrow" href="#">Women Fashion</a>
                                                <ul class="header-catagory-single">
                                                    <li><a href="#">Men's Clothing</a></li>
                                                    <li><a href="#">Computer & Office</a></li>
                                                    <li><a href="#">Jewelry & Watches</a></li>
                                                    <li><a href="#">Phones & Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li class="header-catagory-item">
                                                <a class="menu-down-arrow" href="#">Toys & kids Baby</a>
                                                <ul class="header-catagory-single">
                                                    <li><a href="#">Men's Clothing</a></li>
                                                    <li><a href="#">Computer & Office</a></li>
                                                    <li><a href="#">Jewelry & Watches</a></li>
                                                    <li><a href="#">Phones & Accessories</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="product.html">Men's Clothing</a>
                                            </li>
                                            <li>
                                                <a href="product.html">On Sale</a>
                                            </li>
                                            <li>
                                                <a href="product.html">All Accessories</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-1 col-1">
                                <div id="navbar" class="collapse navbar-collapse navigation-holder">
                                    <button class="menu-close"><i class="ti-close"></i></button>
                                    <ul class="nav navbar-nav mb-2 mb-lg-0">
                                      <li class="menu-item-has-children">
                                            <a class=" menu-down-arrow" href="#">Home</a>
                                            <ul class="sub-menu">
                                                <li><a href="index.html">Home style 1</a></li>
                                                <li><a href="index-2.html">Home style 2</a></li>
                                                <li><a href="index-3.html">Home style 3</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="about.html">About</a></li>
                                        <li class="menu-item-has-children">
                                            <a class="menu-down-arrow" href="#">Shop</a>
                                            <ul class="sub-menu">
                                                <li><a href="shop.html">Shop</a></li>
                                                <li><a class="active" href="product-single.html">Shop Single</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="cart.html">Cart</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                            </ul>
                                        </li>
                                         <li><a href="deals.html">Deals</a></li>
                                        <li class="menu-item-has-children">
                                            <a class="menu-down-arrow" href="#">Vendors</a>
                                          <ul class="sub-menu">
                                                <li><a href="vendors.html">Vendors</a></li>
                                                <li><a href="vendors-single.html">Vendors Single</a></li>
                                            </ul>
                                        </li>
                                           <li class="menu-item-has-children">
                                            <a class="menu-down-arrow" href="#">Pages</a>
                                            <ul class="sub-menu">
                                                <li><a href="compare.html">Compare</a></li>
                                                <li><a href="order.html">Order</a></li>
                                                <li><a href="contact.html">Contact Us</a></li>
                                                <li><a href="login.html">Login</a></li>
                                                <li><a href="register.html">Register</a></li>
                                                <li><a href="faq.html">FAQ</a></li>
                                                <li><a href="404.html">404 Error</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a class="menu-down-arrow" href="#">Blog</a>
                                            <ul class="sub-menu">
                                                <li><a href="blog.html">Blog right sidebar</a></li>
                                                <li><a href="blog-left-sidebar.html">Blog left sidebar</a></li>
                                                <li><a href="blog-fullwidth.html">Blog fullwidth</a></li>
                                                <li class="menu-item-has-children">
                                                    <a href="#">Blog details</a>
                                                    <ul class="sub-menu">
                                                        <li><a href="blog-single.html">Blog details right sidebar</a>
                                                        </li>
                                                        <li><a href="blog-single-left-sidebar.html">Blog details left
                                                                sidebar</a></li>
                                                        <li><a href="blog-single-fullwidth.html">Blog details
                                                                fullwidth</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>

                                </div><!-- end of nav-collapse -->
                            </div>
                            <div class="col-lg-2 col-md-1 col-1">
                                <div class="header-right">
                                    <a href="recent-view.html" class="recent-btn"><i class="fi flaticon-refresh"></i> <span>Recently
                                            Viewed</span></a>
                                </div>
                            </div>
                        </div>
                    </div><!-- end of container -->
                </nav>
            </div>
        </header>
        <!-- end of header -->

        <!-- start wpo-page-title -->
        <section class="wpo-page-title">
            <h2 class="d-none">Hide</h2>
            <div class="container">
                <div class="row">
                    <div class="col col-xs-12">
                        <div class="wpo-breadcumb-wrap">
                            <ol class="wpo-breadcumb-wrap">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="product.html">Product</a></li>
                                <li>Product Single</li>
                            </ol>
                        </div>
                    </div>
                </div> <!-- end row -->
            </div> <!-- end container -->
        </section>
        <!-- end page-title -->

        <!-- product-single-section  start-->
        <div class="product-single-section section-padding">
            <div class="container">
                <div class="product-details">
                    <div class="row align-items-center">
                        <div class="col-lg-5">
                            <div class="product-single-img">
                                <div class="product-active owl-carousel">
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                </div>
                                <div class="product-thumbnil-active  owl-carousel">
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                    <div class="item">
                                        <img src="https://via.placeholder.com/300x300" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="product-single-content">
                                <h2>Stylish Pink Coat</h2>
                                <div class="price">
                                    <span class="present-price">$150.00</span>
                                    <del class="old-price">$200.00</del>
                                </div>
                                <div class="rating-product">
                                    <i class="fi flaticon-star"></i>
                                    <i class="fi flaticon-star"></i>
                                    <i class="fi flaticon-star"></i>
                                    <i class="fi flaticon-star"></i>
                                    <i class="fi flaticon-star"></i>
                                    <span>120</span>
                                </div>
                                <p>Aliquam proin at turpis sollicitudin faucibus.
                                    Non nunc molestie interdum nec sit duis vitae vestibulum id.
                                    Ipsum non donec egestas quis. A habitant tellus nibh blandit.
                                    Faucibus dictumst nibh et aliquet in auctor. Amet ultrices urna ullamcorper
                                    sagittis.
                                    Hendrerit orci ac fusce pulvinar. Diam tincidunt integer eget morbi diam scelerisque
                                    mattis.
                                </p>
                                <div class="product-filter-item color">
                                    <div class="color-name">
                                        <span>Color :</span>
                                        <ul>
                                            <li class="color1"><input id="a1" type="radio" name="color" value="30">
                                                <label for="a1"></label>
                                            </li>
                                            <li class="color2"><input id="a2" type="radio" name="color" value="30">
                                                <label for="a2"></label>
                                            </li>
                                            <li class="color3"><input id="a3" type="radio" name="color" value="30">
                                                <label for="a3"></label>
                                            </li>
                                            <li class="color4"><input id="a4" type="radio" name="color" value="30">
                                                <label for="a4"></label>
                                            </li>
                                            <li class="color5"><input id="a5" type="radio" name="color" value="30">
                                                <label for="a5"></label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="product-filter-item color filter-size">
                                    <div class="color-name">
                                        <span>Sizes:</span>
                                        <ul>
                                            <li class="color"><input id="sz1" type="radio" name="size" value="30">
                                                <label for="sz1">S</label>
                                            </li>
                                            <li class="color"><input id="sz2" type="radio" name="size" value="30">
                                                <label for="sz2">M</label>
                                            </li>
                                            <li class="color"><input id="sz3" type="radio" name="size" value="30">
                                                <label for="sz3">L</label>
                                            </li>
                                            <li class="color"><input id="sz4" type="radio" name="size" value="30">
                                                <label for="sz4">X</label>
                                            </li>
                                            <li class="color"><input id="sz5" type="radio" name="size" value="30">
                                                <label for="sz5">XL</label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="pro-single-btn">
                                    <div class="quantity cart-plus-minus">
                                        <input class="text-value" type="text" value="1">
                                    </div>
                                    <a href="#" class="theme-btn-s2">Add to cart</a>
                                    <a href="#" class="wl-btn"><i class="fi flaticon-heart"></i></a>
                                </div>
                                <ul class="important-text">
                                    <li><span>SKU:</span>FTE569P</li>
                                    <li><span>Categories:</span>Best Seller, sale</li>
                                    <li><span>Tags:</span>Fashion, Coat, Pink</li>
                                    <li><span>Stock:</span>12 Items In Stock</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product-tab-area">
                    <ul class="nav nav-mb-3 main-tab" id="tab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="descripton-tab" data-bs-toggle="pill"
                                data-bs-target="#descripton" type="button" role="tab" aria-controls="descripton"
                                aria-selected="true">Description</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="Ratings-tab" data-bs-toggle="pill" data-bs-target="#Ratings"
                                type="button" role="tab" aria-controls="Ratings" aria-selected="false">Reviews
                                (3)</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="Information-tab" data-bs-toggle="pill"
                                data-bs-target="#Information" type="button" role="tab" aria-controls="Information"
                                aria-selected="false">Additional info</button>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="descripton" role="tabpanel"
                            aria-labelledby="descripton-tab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="Descriptions-item">
                                            <p>Amet consectetur proin diam cras egestas augue habitant integer turpis
                                                egestas egestas. A lectus proin suscipit viverra venenatis eget eget
                                                libero scelerisque. Lacinia parturient id eu vel justo cursus eu. Libero
                                                cursus nisl sollicitudin commodo magnis quam ultrices morbi. Et vitae
                                                eget bibendum quam sed velit. Eget ornare urna nibh ullamcorper sed.
                                                Habitant adipiscing dignissim aliquet laoreet ultrices etiam nulla sed
                                                ut. Lectus ut vitae dignissim in cum id id velit egestas. Magna vel leo
                                                hac massa at.

                                                <br> <br> Urna fermentum id eget turpis eleifend id vitae. Mauris
                                                malesuada ac arcu adipiscing etiam velit at tortor cras. Lacus eget
                                                mollis gravida vulputate sed habitasse enim tempor ullamcorper. Dictum
                                                enim quis morbi tincidunt. Nibh congue massa et arcu viverra lobortis.
                                                Lectus ullamcorper id ut dictumst odio elit. Tristique dapibus diam
                                                velit pharetra quisque odio. </p>
                                            <div class="Description-table">
                                                <ul>
                                                    <li>While thus cackled sheepishly rigid after due one assenting</li>
                                                    <li>Et vitae eget bibendum quam sed velit. Eget ornare urna nibh ullamcorper sed.</li>
                                                    <li>Habitant adipiscing dignissim aliquet laoreet ultrices etiam nulla sed ut.</li>
                                                    <li>Lacinia parturient id eu vel justo cursus eu.</li>
                                                    <li>Mauris malesuada ac arcu adipiscing etiam velit at tortor cras.</li>
                                                    
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Ratings" role="tabpanel" aria-labelledby="Ratings-tab">
                            <div class="container">
                                <div class="rating-section">
                                    <div class="row">
                                        <div class="col-lg-12 col-12">
                                            <div class="comments-area">
                                                <div class="comments-section">
                                                    <h3 class="comments-title">3 reviews for Stylish Pink Coat</h3>
                                                    <ol class="comments">
                                                        <li class="comment even thread-even depth-1" id="comment-1">
                                                            <div id="div-comment-1">
                                                                <div class="comment-theme">
                                                                    <div class="comment-image"><img
                                                                            src="https://via.placeholder.com/300x300"
                                                                            alt></div>
                                                                </div>
                                                                <div class="comment-main-area">
                                                                    <div class="comment-wrapper">
                                                                        <div class="comments-meta">
                                                                            <h4>Lily Zener</h4>
                                                                            <span class="comments-date">December 25, 2022 at 5:30 am</span>
                                                                            <div class="rating-product">
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="comment-area">
                                                                            <p>Turpis nulla proin donec a ridiculus. Mi suspendisse faucibus sed lacus. Vitae risus eu nullam sed quam.
                                                                                 Eget aenean id augue pellentesque turpis magna egestas arcu sed. 
                                                                                Aliquam non faucibus massa adipiscing nibh sit. Turpis integer aliquam aliquam aliquam.
                                                                                <a class="comment-reply-link"
                                                                                        href="#"><span>Reply...</span></a>
                                                                            </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="children">
                                                                <li class="comment">
                                                                    <div>
                                                                        <div class="comment-theme">
                                                                            <div class="comment-image"><img
                                                                                    src="https://via.placeholder.com/300x300"
                                                                                    alt></div>
                                                                        </div>
                                                                        <div class="comment-main-area">
                                                                            <div class="comment-wrapper">
                                                                                <div class="comments-meta">
                                                                                    <h4>Leslie Alexander</h4>
                                                                                    <div class="rating-product">
                                                                                        <i class="fi flaticon-star"></i>
                                                                                        <i class="fi flaticon-star"></i>
                                                                                        <i class="fi flaticon-star"></i>
                                                                                        <i class="fi flaticon-star"></i>
                                                                                        <i class="fi flaticon-star"></i>
                                                                                    </div>
                                                                                    <span class="comments-date">December 26, 2022 at 5:30 am</span>
                                                                                </div>
                                                                                <div class="comment-area">
                                                                                    <p>Turpis nulla proin donec a ridiculus. Mi suspendisse faucibus sed lacus. Vitae risus eu nullam sed quam.
                                                                                        Eget aenean id augue pellentesque turpis magna egestas arcu sed. 
                                                                                       Aliquam non faucibus massa adipiscing nibh sit. Turpis integer aliquam aliquam aliquam.
                                                                                       <a class="comment-reply-link"
                                                                                               href="#"><span>Reply...</span></a>
                                                                                   </p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li class="comment">
                                                            <div>
                                                                <div class="comment-theme">
                                                                    <div class="comment-image"><img
                                                                            src="https://via.placeholder.com/300x300"
                                                                            alt></div>
                                                                </div>
                                                                <div class="comment-main-area">
                                                                    <div class="comment-wrapper">
                                                                        <div class="comments-meta">
                                                                            <h4>Jenny Wilson</h4>
                                                                            <div class="rating-product">
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                                <i class="fi flaticon-star"></i>
                                                                            </div>
                                                                            <span class="comments-date">December 30, 2022 at 3:12 pm</span>
                                                                        </div>
                                                                        <div class="comment-area">
                                                                            <p>Turpis nulla proin donec a ridiculus. Mi suspendisse faucibus sed lacus. Vitae risus eu nullam sed quam.
                                                                                Eget aenean id augue pellentesque turpis magna egestas arcu sed. 
                                                                               Aliquam non faucibus massa adipiscing nibh sit. Turpis integer aliquam aliquam aliquam.
                                                                               <a class="comment-reply-link"
                                                                                       href="#"><span>Reply...</span></a>
                                                                           </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </ol>
                                                </div> <!-- end comments-section -->
                                                <div class="col col-lg-10 col-12 review-form-wrapper">
                                                    <div class="review-form">
                                                        <h4>Add a review</h4>
                                                        <form>
                                                            <div class="give-rat-sec">
                                                                <div class="give-rating">
                                                                    <label>
                                                                        <input type="radio" name="stars" value="1">
                                                                        <span class="icon">â</span>
                                                                    </label>
                                                                    <label>
                                                                        <input type="radio" name="stars" value="2">
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                    </label>
                                                                    <label>
                                                                        <input type="radio" name="stars" value="3">
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                    </label>
                                                                    <label>
                                                                        <input type="radio" name="stars" value="4">
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                    </label>
                                                                    <label>
                                                                        <input type="radio" name="stars" value="5">
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                        <span class="icon">â</span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <textarea class="form-control"
                                                                    placeholder="Write Comment..."></textarea>
                                                            </div>
                                                            <div class="name-input">
                                                                <input type="text" class="form-control" placeholder="Name"
                                                                    required>
                                                            </div>
                                                            <div class="name-email">
                                                                <input type="email" class="form-control" placeholder="Email"
                                                                    required>
                                                            </div>
                                                            <div class="rating-wrapper">
                                                                <div class="submit">
                                                                    <button type="submit" class="theme-btn-s2">Post
                                                                        review</button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div> <!-- end comments-area -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="Information" role="tabpanel" aria-labelledby="Information-tab">
                            <div class="container">
                                <div class="Additional-wrap">
                                    <div class="row">
                                        <div class="col-12">
                                            <table class="table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Weight (w/o wheels)</td>
                                                        <td>2 LBS</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Weight Capacity</td>
                                                        <td>60 LBS</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Width</td>
                                                        <td>50â³</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Seat back height</td>
                                                        <td>30.4â³</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Color</td>
                                                        <td>Black, Blue, Red, White</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Size</td>
                                                        <td>S, M, L, X, XL</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="related-product">
            </div>
        </div>
        <!-- product-single-section  end-->

        <!-- start of wpo-site-footer-section -->
        <footer class="wpo-site-footer">
            <div class="wpo-upper-footer">
                <div class="container">
                    <div class="row">
                        <div class="col col-lg-3 col-md-6 col-sm-12 col-12">
                            <div class="widget about-widget">
                                <div class="logo widget-title">
                                    <img src="https://via.placeholder.com/30x30" alt="blog">
                                </div>
                                <p>Elit commodo nec urna erat morbi at hac turpis aliquam.
                                    In tristique elit nibh turpis. Lacus volutpat ipsum convallis tellus pellentesque
                                    etiam.</p>
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-twitter-alt"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-linkedin"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-instagram"></i>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                        <div class="col col-lg-3 col-md-6 col-sm-12 col-12">
                            <div class="widget link-widget">
                                <div class="widget-title">
                                    <h3>Contact Us</h3>
                                </div>
                                <div class="contact-ft">
                                    <ul>
                                        <li><i class="fi flaticon-mail"></i>themart@gmail.com</li>
                                        <li><i class="fi flaticon-phone"></i>(208) 555-0112 <br>(704) 555-0127</li>
                                        <li><i class="fi flaticon-pin"></i>4517 Washington Ave. Manchter,
                                            Kentucky 495</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col col-xl-3 col-lg-2 col-md-6 col-sm-12 col-12">
                            <div class="widget link-widget">
                                <div class="widget-title">
                                    <h3>Popular</h3>
                                </div>
                                <ul>
                                    <li><a href="product.html">Men</a></li>
                                    <li><a href="product.html">Women</a></li>
                                    <li><a href="product.html">Kids</a></li>
                                    <li><a href="product.html">Shoe</a></li>
                                    <li><a href="product.html">Jewelry</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col col-xl-3 col-lg-4 col-md-6 col-sm-12 col-12">
                            <div class="widget instagram">
                                <div class="widget-title">
                                    <h3>Instagram</h3>
                                </div>
                                <ul class="d-flex">
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                    <li><a href="project-single.html"><img src="https://via.placeholder.com/300x300"
                                                alt=""></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div> <!-- end container -->
            </div>
            <div class="wpo-lower-footer">
                <div class="container">
                    <div class="row">
                        <div class="col col-xs-12">
                            <p class="copyright"> Copyright &copy; 2023 Themart by <a href="http://www.bootstrapMB.com">bootstrapMB</a>.
                                All
                                Rights Reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end of wpo-site-footer-section -->

        <!-- popup-quickview  -->
        <div id="popup-quickview" class="modal fade" tabindex="-1">
            <div class="modal-dialog quickview-dialog">
                <div class="modal-content">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i
                            class="ti-close"></i></button>
                    <div class="modal-body d-flex">
                        <div class="product-details">
                            <div class="row align-items-center">
                                <div class="col-lg-5">
                                    <div class="product-single-img">
                                        <div class="modal-product">
                                            <div class="item">
                                                <img src="https://via.placeholder.com/300x300" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <div class="product-single-content">
                                        <h5>Wireless Headphones</h5>
                                        <h6>120.00 USD</h6>
                                        <ul class="rating">
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                            <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis ultrices
                                            lectus lobortis, dolor et tempus porta, leo mi efficitur ante, in varius
                                            felis
                                            sem ut mauris. Proin volutpat lorem inorci sed vestibulum tempus. Lorem
                                            ipsum
                                            dolor sit amet, consectetur adipiscing elit. Aliquam
                                            hendrerit.
                                        </p>
                                        <div class="pro-single-btn">
                                            <div class="quantity cart-plus-minus">
                                                <input type="text" value="1">
                                                <div class="dec qtybutton">-</div>
                                                <div class="inc qtybutton"></div>
                                            </div>
                                            <a href="#" class="theme-btn">Add to cart</a>
                                        </div>
                                        <div class="social-share">
                                            <span>Share with : </span>
                                            <ul class="socialLinks">
                                                <li><a href='#'><i class="fa fa-facebook"></i></a></li>
                                                <li><a href='#'><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href='#'><i class="fa fa-twitter"></i></a></li>
                                                <li><a href='#'><i class="fa fa-instagram"></i></a></li>
                                                <li><a href='#'><i class="fa fa-youtube-play"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- popup-quickview -->
        </div>

    </div>
    <!-- end of page-wrapper -->

    <!-- All JavaScript files
    ================================================== -->
    <script src="${contextRoot}/js/jquery.min.js"></script>
    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <!-- Plugins for this template -->
    <script src="${contextRoot}/js/modernizr.custom.js"></script>
    <script src="${contextRoot}/js/jquery.dlmenu.js"></script>
    <script src="${contextRoot}/js/jquery-plugin-collection.js"></script>
    <!-- Custom script for this template -->
    <script src="${contextRoot}/js/script.js"></script>
</body>

</html>