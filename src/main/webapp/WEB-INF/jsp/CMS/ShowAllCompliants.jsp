‵<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>所有表單</title>
<jsp:include page="../layout/sidebar.jsp"></jsp:include>
</head>

<body>

	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
				style="width: 90%; left: 12%; margin-bottom: 0%;">

				<!-- Sidebar Toggle (Topbar) -->
				<form class="form-inline" >
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
				</form>

				<!-- Topbar Search -->
					<div  style="max-width: 80%;"> 
						<div class="ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="display: inline-block;">
							抱怨序號 :<br> <input type="text" id="complaintid" />
							<button id="ButtonID">確定</button>
						</div>

						<div class="ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="display: inline-block;">
							姓名 :<br> <input type="text" id="complaintname" />
							<button id="ButtonName">確定</button>
						</div>

						<div
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" style="display: inline-block;">
							提問類型 : <br> <select id="complaint_type">
								<option value="member">帳戶問題</option>
								<option value="purchase">購買問題</option>
								<option value="order">訂單問題</option>
								<option value="service">服務問題</option>
								<option value="dispute">消費爭議</option>
								<option value="forum">論壇問題</option>
								<option value="other">其他</option>
							</select>
							<button id="ButtonType">確定</button>
						</div>
					</div>
			</nav>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- DataTales Example -->
				<div class="card shadow mb-4"
					style="left: 11%; width: 90%; top: 3px; position: relative;">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" >

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

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<script>

							document.addEventListener("DOMContentLoaded", function () {
								fetch('http://localhost:8079/finalTopic_5/showAllComplaints')
									.then(response => response.json())
									.then(data => {

										let tableBody = document.getElementById('complaintsTableBody');
										let tableData = '';
										data.forEach(complaint => {
											console.log(complaint.customerName)
											tableData += '<tr>';
											tableData += '<td>' + complaint.CreateDate + '</td>';
											tableData += '<td>' + complaint.customerName + '</td>';
											tableData += '<td>' + complaint.email + '</td>';
											tableData += '<td>' + complaint.complaintType.complaintName + '</td>';
											tableData += '<td>' + complaint.title + '</td>';
											tableData += '<td>' + complaint.content + '</td>';
											tableData += '<td>' + "<a href=/finalTopic_5/ViewComplient?id="+ complaint.customerComplaintsID +">查看</a></td>";
											tableData += '<td>' + '<a href=/finalTopic_5/ApplyComplaintsPage?id=' + complaint.customerComplaintsID + ">回信</a></td>";
											tableData += '</tr>';
										});
										tableBody.innerHTML = '';
										tableBody.innerHTML = tableData;
									})
									.catch(error => console.error(error));
							})

							$("#ButtonID").click(function () {
								let complaintid = document.getElementById('complaintid').value;
								// console.log(complaintid);
								fetch('http://localhost:8079/finalTopic_5/getComplaintsByID?id=' + complaintid)
									.then(response => response.json())
									.then(data => {
										// console.log(data)
										if (data.length === 0) {
											alert("無對應序號，請重新輸入")
										}
										let tableBody = document.getElementById('complaintsTableBody');
										let tableData = '';
										data.forEach(complaint => {
											tableData += '<tr>';
											tableData += '<td>' + complaint.CreateDate + '</td>';
											tableData += '<td>' + complaint.customerName + '</td>';
											tableData += '<td>' + complaint.email + '</td>';
											tableData += '<td>' + complaint.complaintType.complaintName + '</td>';
											tableData += '<td>' + complaint.title + '</td>';
											tableData += '<td>' + complaint.content + '</td>';
											tableData += '<td>' + '<a href=/finalTopic_5/ViewComplient?id='+ complaint.customerComplaintsID + ">查看</a></td>";
											tableData += '<td>' + '<a href=/finalTopic_5/ApplyComplaintsPage?id=' + complaint.customerComplaintsID + ">回信</a></td>";
											tableData += '</tr>';
										});
										tableBody.innerHTML = '';
										tableBody.innerHTML = tableData;
									})
									.catch(error => alert("無對應序號，請重新輸入"));
							})


							$("#ButtonType").click(function () {
								console.log("123456")
								let complainttype = document.getElementById('complaint_type').value;
								fetch('http://localhost:8079/finalTopic_5/getComplaintsByType?type=' + complainttype)
									.then(response => response.json())
									.then(data => {
										// console.log(data)
										if (data.length === 0) {
											alert("無對應類型，請重新輸入")
										}
										let tableBody = document.getElementById('complaintsTableBody');
										let tableData = '';
										data.forEach(complaint => {
											tableData += '<tr>';
											tableData += '<td>' + complaint.CreateDate + '</td>';
											tableData += '<td>' + complaint.customerName + '</td>';
											tableData += '<td>' + complaint.email + '</td>';
											tableData += '<td>' + complaint.complaintType.complaintName + '</td>';
											tableData += '<td>' + complaint.title + '</td>';
											tableData += '<td>' + complaint.content + '</td>';
											tableData += '<td>' + '<a href=/finalTopic_5/ViewComplient?id='+ complaint.customerComplaintsID + ">查看</a></td>";
											tableData += '<td>' + '<a href=/finalTopic_5/ApplyComplaintsPage?id=' + complaint.customerComplaintsID + ">回信</a></td>";
											tableData += '</tr>';
										});
										tableBody.innerHTML = '';
										tableBody.innerHTML = tableData;
									})
									.catch(error => alert("無對應類型，請重新輸入"));
							}
							)

							$("#ButtonName").click(function () {
								let complaintname = document.getElementById('complaintname').value;
								fetch('http://localhost:8079/finalTopic_5/getComplaintsByName?name=' + complaintname)
									.then(response => response.json())
									.then(data => {
										// console.log(data)
										if (data.length === 0) {
											alert("無對應姓名，請重新輸入")
										}
										let tableBody = document.getElementById('complaintsTableBody');
										let tableData = '';
										data.forEach(complaint => {
											tableData += '<tr>';
											tableData += '<td>' + complaint.CreateDate + '</td>';
											tableData += '<td>' + complaint.customerName + '</td>';
											tableData += '<td>' + complaint.email + '</td>';
											tableData += '<td>' + complaint.complaintType.complaintName + '</td>';
											tableData += '<td>' + complaint.title + '</td>';
											tableData += '<td>' + complaint.content + '</td>';
											tableData += '<td>' + '<a href=/finalTopic_5/ViewComplient?id='+ complaint.customerComplaintsID + ">查看</a></td>";
											tableData += '<td>' + '<a href=/finalTopic_5/ApplyComplaintsPage?id=' + complaint.customerComplaintsID + ">回信</a></td>";
											tableData += '</tr>';
										});
										tableBody.innerHTML = '';
										tableBody.innerHTML = tableData;
									})
									.catch(error => alert("無對應姓名，請重新輸入"));
							}
							)
						</script>

</body>

</html>