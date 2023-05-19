<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!-- Sidebar -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>footer</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
	<style>
		@font-face {
			font-family: 'CustomFont';
			src: url('${contextRoot}/fonts/jf-openhuninn-2.0.ttf')
			format('truetype');
		}
		* {
			font-family: 'CustomFont', Arial, sans-serif;
		}



	</style>
</head>
<body>
	<footer class="footer_section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 footer-col">
					<div class="footer_contact">
						<h4 style="font-family: 'CustomFont', Arial, sans-serif;">聯繫方式</h4>
						<div class="contact_link_box">
							<a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
								<span> Location </span>
							</a> <a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
									Call +01 1234567890 </span>
							</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i>
								<span> demo@gmail.com </span>
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<div class="footer_detail">
						<a href="" class="footer-logo" style="font-family: 'CustomFont', Arial, sans-serif;"> 書贏遊你來決定 </a>
						<p>將你的收藏交換成新的冒險!</p>
<%--						<div class="footer_social">--%>
<%--							<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>--%>
<%--							</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>--%>
<%--							</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>--%>
<%--							</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>--%>
<%--							</a> <a href=""> <i class="fa fa-pinterest" aria-hidden="true"></i>--%>
<%--							</a>--%>
<%--						</div>--%>
					</div>
				</div>
				<div class="col-md-4 footer-col">
					<h4 style="font-family: 'CustomFont', Arial, sans-serif;">服務時間</h4>
					<p>24小時全年無休</p>
<%--					<p></p>--%>
				</div>
			</div>
			<div class="footer-info">
				<p>
					&copy; <span id="displayYear"></span> All Rights Reserved By <a
						href="https://html.design/">Free Html Templates</a><br> <br>
					&copy; <span id="displayYear"></span> Distributed By <a
						href="https://themewagon.com/" target="_blank">ThemeWagon</a>
				</p>
			</div>
		</div>
	</footer>
</body>
</html>