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

<title>SB Admin 2 - Tables</title>

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
</head>
<body>
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar" style="width: 10%; position: absolute;top: 3px;">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="#">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">後台管理系統</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item"><a class="nav-link" href="${contextRoot}/memberlist"> <i
				class="fas fa-fw fa-tachometer-alt"></i> <span>會員系統</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->


		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-target="#collapseTwo" aria-expanded="true"
			aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>訂單系統</span>
		</a>
			<hr class="sidebar-divider my-0"></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="${contextRoot}/backcontrol"
			data-target="#collapseUtilities" aria-expanded="true"
			aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i>
				<span>活動系統</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->


		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-target="#collapsePages" aria-expanded="true"
			aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i>
				<span>購物系統</span>
		</a></li>
		<hr class="sidebar-divider">

		<li class="nav-item"><a class="nav-link" href="${contextRoot}/showAllComplaintsPage"> <i
				class="fas fa-fw fa-table"></i> <span>客服系統</span></a></li>

		<hr class="sidebar-divider">


		<li class="nav-item"><a class="nav-link" href="#"> <i
				class="fas fa-fw fa-table"></i> <span>論壇系統</span></a></li>
				

		<li class="nav-item"><a class="nav-link" href="${contextRoot}/"> <i
				class="fas fa-fw fa-table"></i> <span>回首頁</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->

	</ul>
</body>
<!-- End of Sidebar -->