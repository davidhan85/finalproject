<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<section class="book_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>我要提問</h2>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form_container">
						<form:form modelAttribute="form" action="ComplaintsForm">

							<form:input type="hidden" path="Customer.m_number" value="6" />
							<div>
								<h4>聯絡人</h4>
								<form:input type="text" class="form-control"
									placeholder="(請輸入聯絡人)" path="CustomerName" />
							</div>
							<div>
								<h4>電子郵件</h4>
								<form:input type="text" class="form-control"
									placeholder="(請輸入電子郵件)" path="Email" />
							</div>
							<div>
								<h4>問題類型</h4>
							
									<form:select class="form-control nice-select wide"
										path="ComplaintType.ComplaintTypeID">
										<option value="0" selected>請選擇問題類型</option>
										<option value="1" >帳戶問題</option>
										<option value="2">購買問題</option>
										<option value="3">訂單問題</option>
										<option value="4">服務問題</option>
										<option value="5">消費爭議</option>
										<option value="6">論壇問題</option>
										<option value="7">其他</option>
									</form:select>
							</div>
							<div>
								<h4>標題</h4>
								<form:input type="text" class="form-control"
									placeholder="(請輸入標題)" path="Title" />
							</div>

							<div>
								<h4>問題說明</h4>
								<form:textarea style="height: 150px;" class="form-control"
									path="Content" />
							</div>
							<div class="btn_box">
								<button>確定</button>
							</div>
						</form:form>
						<a class="nav-link" href="${contextRoot}/finalTopic_5/chat">聊天室</a>
								
					</div>
				</div>
				<div class="col-md-6">
					<div class="map_container ">
						<div id="googleMap"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

</html>