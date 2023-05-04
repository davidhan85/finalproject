<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

						<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
						<!DOCTYPE html>
						<html>

						<head>
							<meta charset="UTF-8">
							<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

							<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
							<title>Insert title here</title>
							<script src="${contextRoot}/js/jquery-3.4.1.min.js"></script>
							<link rel="stylesheet"
								href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

							<style type="text/css">
								.title {
									padding-right: 10px;
									font-size: larger;
								}
							</style>
						</head>

						<body>


							<div class="container">
								<div class="row justify-content-center">
									<div class="col-8">
										<div class="card border-secondary mb-3" style="max-width: 100rem;">
											<div>
												<div class="card-header">
													<span class="title" id="main_id">${MainArticles.main_id}</span>
													<span class="title">【${MainArticles.category}】</span> <span
														class="title">${MainArticles.title}</span>
												</div>
											</div>
											<div class="card-body text-secondary">

												<p class="card-text">${MainArticles.content}</p>
											</div>

											<div class="card-header">
												<div class="row">
													<div class="col-11 text-right">
														<button type="button" class="btn btn-outline-primary btn-sm">
															<i class="fas fa-thumbs-up"></i> Like
														</button>
													</div>
													<div class="col-1 text-right">
														<span class="badge badge-primary"
															id="likeCount">${MainArticles.mainarticlelikes.size()}</span>
													</div>
												</div>
											</div>
											<div class="row">
												<!-- <div class="col-md-3">
													<input type="text" class="form-control" placeholder="Author Name"
														id="author">
												</div> -->
												<div class="col-md-9">
													<input type="text" class="form-control" id="message"
														placeholder="Type your message here and press enter">
												</div>
											</div>

											<div>
												<table class="mytable" id="list_table_json">
													<thead>
														<tr>
															<th>留言作者</th>
															<th>留言內容</th>
															<th>留言時間</th>
														</tr>
													</thead>
													<tbody>

													</tbody>
												</table>
											</div>


										</div>
									</div>


								</div>
							</div>




							<script>
								$(document).ready(function () {
									$('#message').keypress(function (event) {
										if (event.keyCode === 13) {
											console.log("1");
											event.preventDefault();
											// let inputAuthorid = document.getElementById('author').value;
											let inputContent = document.getElementById('message').value;
											let inputMAid = '${MainArticles.main_id}';
											console.log(inputMAid)
											$('#message').val('');
											let dtoObject = {
												"content": inputContent,
												// "author_idforMAM": inputAuthorid,
												"mainarticlesformam": inputMAid
											}

											console.log(dtoObject);
											let dtoJsonString = JSON
												.stringify(dtoObject);


											$.ajax({
												url: 'http://localhost:8078/finalTopic_5/board/mainArticleMessages',
												contentType: "application/json;charset=UTF-8",
												dataType: 'json',
												method: 'post',
												data: dtoJsonString,
												success: function (
													result) {
													console
														.log(result)

													msg_data = '<tbody>';
													$.each(result.content,
														function (
															index,
															value) {
															msg_data += '<tr>'
															msg_data += '<td>'
																+ value.author_idforMAM
																+ '</td>'
															msg_data += '<td>'
																+ value.content
																+ '</td>'
															msg_data += '<td>'
																+ value.createdatetime
																+ '</td>'
															msg_data += '</tr>'
														})
													msg_data += '</tbody>';

													let myTable = document
														.getElementById('list_table_json');
													myTable
														.getElementsByTagName('tbody')[0].innerHTML = msg_data

												},
												error: function (
													err) {
													console
														.log(err)
												}
											})

										}


									})








								})

							</script>


						</body>

						</html>