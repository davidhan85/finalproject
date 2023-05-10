<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>書贏遊你來決定-客服首頁</title>
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- Styles -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;0,700;1,400&family=Poppins:wght@600&display=swap"
	rel="stylesheet">
<link href="css/bootstrapSC.min.css" rel="stylesheet">
<link href="css/fontawesome-all.min.css" rel="stylesheet">
<link href="css/swiperSC.css" rel="stylesheet">
<link href="css/stylesSC.css" rel="stylesheet">

<!-- Favicon  -->
<link rel="icon" href="images/faviconSC.png">

</head>

<body>

	<jsp:include page="../layout/navebar.jsp"></jsp:include>

	<!-- Header -->
	<header id="header" class="header" style="height: 90%;">
		<div class="container">
			<div class="row">
				<!-- end of col -->
				<div class="col-lg-6" style="position: absolute; left: 35%;">
					<div class="button-container">
						<a class="btn-solid-lg page-scroll"
							href="${contextRoot}/CustomerComplaints"
							style="background-color: red;">聯絡表單</a> <a
							class="btn-solid-lg page-scroll" href="chat">真人客服</a> <a
							class="btn-outline-lg page-scroll" href="GptChat">智慧客服</a>
					</div>
					<!-- end of button-container -->
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</header>
	<!-- end of header -->
	<!-- end of header -->
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>

</html>