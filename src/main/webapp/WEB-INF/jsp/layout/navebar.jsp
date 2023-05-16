<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<!DOCTYPE>
			<html>

			<head>
				<!-- Basic -->
				<meta charset="utf-8" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<!-- Mobile Metas -->
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
				<!-- Site Metas -->
				<meta name="keywords" content="" />
				<meta name="description" content="" />
				<meta name="author" content="" />
				<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<title>Feane</title>


				<link rel="shortcut icon" href="${contextRoot}/images/favicon.png" type="">
				<!-- bootstrap core css -->
				<link rel="stylesheet" type="text/css" href="${contextRoot}/css/bootstrap.css" />

				<!--owl slider stylesheet -->
				<link rel="stylesheet" type="text/css"
					href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
				<!-- nice select  -->
				<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
					integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
					crossorigin="anonymous" />
				<!-- font awesome style -->
				<link href="${contextRoot}/css/font-awesome.min.css" rel="stylesheet" />

				<!-- Custom styles for this template -->
				<link href="${contextRoot}/css/style.css" rel="stylesheet" />
				<!-- responsive style -->
				<link href="${contextRoot}/css/responsive.css" rel="stylesheet" />
				<style>
					@font-face {
						font-family: 'CustomFont';
						src: url('${contextRoot}/fonts/jf-openhuninn-2.0.ttf') format('truetype');
					}

					li {
						font-family: 'CustomFont', sans-serif;
						font-size: 18px;
					}
				</style>
			</head>

			<body class="sub_page">
				<div class="hero_area">
					<div class="bg-box">
						<img src="${contextRoot}/images/hero-bg.jpg" alt="">
					</div>
					<!-- header section strats -->
					<header class="header_section">
						<div class="container">
							<nav class="navbar navbar-expand-lg custom_nav-container ">
								<a class="navbar-brand" href="${contextRoot}/"> <span> <img
											src="${contextRoot}/images/bookGaming.png"
											style="width: 150px; height: 150px;">
									</span>
								</a>
								<button class="navbar-toggler" type="button" data-toggle="collapse"
									data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
									aria-expanded="false" aria-label="Toggle navigation">
									<span class=""> </span>
								</button>

								<div class="collapse navbar-collapse" id="navbarSupportedContent">
									<ul class="navbar-nav  mx-auto " style="transform: scale(1.3);">


										<li class="nav-item"><a class="nav-link" href="${contextRoot}/mall">商城 </a></li>

										<li class="nav-item"><a class="nav-link" href="${contextRoot}/board">論壇</a></li>
										<li class="nav-item active"><a class="nav-link"
												href="${contextRoot}/activity">活動 <span class="sr-only">(current)</span>
											</a></li>
										<li class="nav-item">
											<c:if test="${not empty memberbean}">
												<a class="nav-link" href="${contextRoot}/customerService">客服</a>
											</c:if>
											<c:if test="${empty memberbean}">
												<a class="nav-link" href="${contextRoot}/Login">客服</a>
											</c:if>
										</li>

										<c:if test="${not empty memberbean}">
											<li class="nav-item"><a class="nav-link"
													href="${contextRoot}/checkout">登出</a></li>
										</c:if>
										<c:if test="${sessionScope.memberbean.m_Role eq'adaim'}">
											<li class="nav-item"><a class="nav-link" href="${contextRoot}/CMS">後台系統 </a>
											</li>
										</c:if>
									</ul>


									<div class="user_option">
										<c:if test="${not empty memberbean}">
											<a href="${contextRoot}/membercenter" class="user_link"
												style="position: absolute; right: -10%; transform: scale(1.3);">
												<i class="fa fa-user" aria-hidden="true"></i>
											</a>
										</c:if>
										<c:if test="${empty memberbean}">
											<a href="${contextRoot}/Login" class="user_link" data-toggle="modal"
												data-target="#myModal"
												style="position: absolute; right: -10%; transform: scale(1.3);">
												<i class="fa fa-user" aria-hidden="true"></i>
											</a>
										</c:if>

									

											<<<<<<< HEAD <li class="nav-item"><a class="nav-link"
													href="${contextRoot}/mall">商城 </a></li>

												<li class="nav-item"><a class="nav-link"
														href="${contextRoot}/board">論壇</a></li>
												<li class="nav-item active"><a class="nav-link"
														href="${contextRoot}/activity">活動 <span
															class="sr-only">(current)</span>
													</a></li>
												<li class="nav-item">
													<c:if test="${not empty memberbean}">
														<a class="nav-link" href="${contextRoot}/customerService">客服</a>
													</c:if>
													<c:if test="${empty memberbean}">
														<a class="nav-link" href="${contextRoot}/Login">客服</a>
													</c:if>
												</li>

												<c:if test="${not empty memberbean}">
													<li class="nav-item"><a class="nav-link"
															href="${contextRoot}/checkout">登出</a></li>
												</c:if>
												<c:if test="${sessionScope.memberbean.m_Role eq'adaim'}">
													<li class="nav-item"><a class="nav-link"
															href="${contextRoot}/CMS">後台系統 </a>
													</li>
												</c:if>
												</ul>


												<div class="user_option">
													<c:if test="${not empty memberbean}">
														<a href="${contextRoot}/membercenter" class="user_link"
															style="position: absolute; right: -10%; transform: scale(1.3);">
															<i class="fa fa-user" aria-hidden="true"></i>
														</a>
													</c:if>
													<c:if test="${empty memberbean}">
														<a href="${contextRoot}/Login" class="user_link"
															data-toggle="modal" data-target="#myModal"
															style="position: absolute; right: -10%; transform: scale(1.3);">
															<i class="fa fa-user" aria-hidden="true"></i>
														</a>
													</c:if>

													<c:if test="${not empty memberbean}">

														<a href="${contextRoot}/membercenter" class="order_online"
															style="width: 100px; height: 80px; font-size: 20px; right: -30%; position: absolute;">會員中心</a>
														<a class="cart_link"
															href="${contextRoot}/cart/find/${memberbean.m_number}"
															style="position: absolute; right: -14%;transform: scale(1.3); ">
															<svg version="1.1" id="Capa_1"
																xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
																y="0px" viewBox="0 0 456.029 456.029"
																style="enable-background: new 0 0 456.029 456.029;"
																xml:space="preserve">
																=======
																<a href="${contextRoot}/membercenter"
																	class="order_online"
																	style="width: 100px; height: 80px; font-size: 20px; right: -30%; position: absolute;">會員中心</a>
																<a class="cart_link" href="${contextRoot}/shoppingcart"
																	style="position: absolute; right: -14%; transform: scale(1.3);">
																	<svg version="1.1" id="Capa_1"
																		xmlns="http://www.w3.org/2000/svg"
																		xmlns:xlink="http://www.w3.org/1999/xlink"
																		x="0px" y="0px" viewBox="0 0 456.029 456.029"
																		style="enable-background: new 0 0 456.029 456.029;"
																		xml:space="preserve">
																		>>>>>>> e368430 (20230516board)

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
																			<g>
																				<path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
																			</g>
																		</g>
																	</svg>
																</a>

													</c:if>
													<c:if test="${empty memberbean}">
														<a href="${contextRoot}/newmember" class="order_online"
															style="width: 100px; height: 80px; font-size: 20px; right: -30%; position: absolute;">加入會員</a>

														<a class="cart_link" href="${contextRoot}/Login"
															style="position: absolute; right: -14%;transform: scale(1.3); ">
															<svg version="1.1" id="Capa_1"
																xmlns="http://www.w3.org/2000/svg"
																xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
																y="0px" viewBox="0 0 456.029 456.029"
																style="enable-background: new 0 0 456.029 456.029;"
																xml:space="preserve">

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
																	<g>
																		<path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
								   c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
																	</g>
																</g>
															</svg>
														</a>
													</c:if>
												</div>
												</a>

									</div>
								</div>
								<c:if test="${not empty memberbean}">
									<a href="${contextRoot}/membercenter" class="mx-2"> <span class="fa fa-user">
											${memberbean.m_name},你好</span></a>
								</c:if>
							</nav>
						</div>

						</nav>
				</div>
				</header>
				<!-- end header section -->
				</div>

				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">

							<div class="modal-header" style="background-color: #ffc107;">
								<h4 class="modal-title" id="myModalLabel">登入</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- 登入表單 -->
								<form action="${contextRoot}/checkLogin" method="post">
									<div class="form-group">
										<label for="username">帳號:</label> <input type="text" class="form-control"
											id="username" placeholder="請輸入您的帳號" name="username">
									</div>
									<div class="form-group">
										<label for="pwd">密碼:</label> <input type="password" class="form-control"
											id="pwd" placeholder="請輸入您的密碼" name="pwd">
									</div>
									<button type="submit" class="btn btn-warning btn-block">登入</button>
								</form>
								<c:if test="${not empty error}">
									<div class="alert alert-danger">
										<strong>错误:</strong>
										<c:forEach var="entry" items="${error}">
											${entry.value}<br />
										</c:forEach>
									</div>
								</c:if>
								<hr>
								<div class="text-center">
									<a href="${contextRoot}/forgetpwdpage">忘記密碼</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>


			</body>

			</html>