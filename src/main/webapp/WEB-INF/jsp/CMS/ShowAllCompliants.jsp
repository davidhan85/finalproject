<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../layout/sidebar.jsp"></jsp:include>
</head>
<body>

	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
				style="width: 90%; left: 10%; margin-bottom: 0%;">

				<!-- Sidebar Toggle (Topbar) -->
				<form class="form-inline">
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
				</form>

				<!-- Topbar Search -->
				<form class="     ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					action="GetComplientsByID">
					抱怨序號 :<br> <input type="text" name="username" /> <input
						type="submit" value="確定" />
				</form>


				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					action="GetComplientsByName">
					姓名 :<br> <input type="text" name="name" /> <input
						type="submit" value="確定" />
				</form>

				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					action="GetComplientsByType">
					提問類型 : <br> <select name="complaintID">
						<option value="member">帳戶問題</option>
						<option value="purchase">購買問題</option>
						<option value="order">訂單問題</option>
						<option value="service">服務問題</option>
						<option value="dispute">消費爭議</option>
						<option value="forum">論壇問題</option>
						<option value="other">其他</option>
					</select> <input type="submit" value="確定" />
				</form>
				<li class="nav-item dropdown no-arrow mx-1"><a
					class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->

				</a>


					<div class="topbar-divider d-none d-sm-block"></div>


					</ul>
			</nav>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- DataTales Example -->
				<div class="card shadow mb-4"
					style="left: 10%; width: 90%; margin-top: 0%; position: absolute;">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">

								<thead>
									<tr>
										<td>提問日期</td>
										<td>姓名</td>
										<td>信箱</td>
										<td>提問類型</td>
										<td>標題</td>
										<td>提問內容</td>
										<td>查看</td>
										<td>回信</td>
									</tr>
								</thead>
								 <tbody id="complaintsTableBody">						
									<c:forEach items="${AllComplaints}" var="c">
										<tr>
											<td>${c.createDate}</td>
										    <td>${c.customerName}</td>
											<td>${c.email}</td>
											<td>${c.complaintType.complaintName}</td>
											<td>${c.title}</td>
											<td>${c.content}</td> 
											<td><a
												href="*">
													<button>查看</button>
											</a></td>
											<td><a
												href="*">
													<button>回信</button>
											</a></td>
										</tr>
									</c:forEach> 
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
</body>
</html>