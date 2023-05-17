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
							<script type="text/javascript"
								src="${contextRoot}/js/ckeditor5-build-classic/ckeditor.js"></script>
							<script src="${contextRoot}/js/jquery-3.4.1.min.js"></script>
							<link rel="stylesheet"
								href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">





							<jsp:include page="../layout/navebar.jsp"></jsp:include>










							<style type="text/css">
							
							.body{
							padding-top: 200px
							}
								.title {
									padding-right: 10px;
									font-size: larger;
								}

								.border-bottom {
									border: 1px solid red;
									background-color: #f9f9f9;
									box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
									padding: 10px;
								}

								.pagination {
									display: flex;
									justify-content: center;
									padding-top: 10px;
								}

								.container {
									border-radius: 1px;
									

								}

								.card {
									background-color: transparent;
									border: 1px solid #ccc;
								}

								.card-body {
									background-color: white;
								}
							</style>
						</head>

						<body style="background-image: url('./back.jpg')">


							<div class="container" style="padding-top:10px">
								<div class="row justify-content-center">
									<div class="col-8">
										<div class="card border-info border-5 mb-3" style="max-width: 100rem;">
											<div>
												<div class="card-header bg-success p-2 text-dark bg-opacity-10">
													<span class="title" id="main_id"
														style="display:none">${MainArticles.mainid}</span> <span
														class="title">【${MainArticles.category}】</span> <span
														class="title">${MainArticles.title}</span>
													<span class="title">${MainArticles.authoridforMA.m_account}</span>
												</div>
											</div>
											<div class="card-body text-secondary">

												<p class="card-text">${MainArticles.content}</p>
											</div>

											<div class="card-header">
												<div class="row">
													<div class="col-11 text-right">
														<button type="button" class="btn btn-outline-primary btn-sm"
															id="malike">
															<i class="fas fa-thumbs-up"></i> Like
														</button>
													</div>
													<div class="col-1 text-right">
														<span class="badge badge-primary"
															id="likeCount">${MainArticles.mainarticlelikes.size()}</span>
													</div>
													<!-- //之後會刪掉改成當前登入的人id -->
													<div id="mainlikeid" style="display:none">${memberbean.m_number}
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-0">
													<input type="text" class="form-control" style="display:none"
														value="${memberbean.m_number}" id="author">

												</div>
												<div class="col-md-12">
													<input type="text" class="form-control" id="message"
														placeholder="我要留言">
												</div>
												<div class="col-md-0">
													<input type="text" class="form-control" id="mainid"
														placeholder="${MainArticles.mainid}" style="display:none"
														value="${MainArticles.mainid}">
												</div>
											</div>

											<div>
												<table class="table table-striped" id="list_table_json">
													<thead class="bg-success p-2 text-dark bg-opacity-10">
														<tr>
															<th class="col-2">留言作者</th>
															<th class="col-7">留言內容</th>
															<th class="col-2">留言時間</th>
															<th class="col-1">

																刪除留言

															</th>
														</tr>
													</thead>
													<tbody>
														<jstl:forEach var="MainArticleMessage"
															items="${MainArticleMessages}">
															<tr>
																<td>${MainArticleMessage.authoridforMAM.m_account }</td>
																<td>${MainArticleMessage.content }</td>
																<td>${MainArticleMessage.updatedatetime }</td>
																<td>
																	<c:if
																		test="${memberbean.m_number eq MainArticleMessage.authoridforMAM.m_number }">
																		<a
																			href="${contextRoot}/board/deleteMAM?mamid=${MainArticleMessage.mamessageid}"><button
																				type="submit">刪除</button></a>
																	</c:if>
																</td>
															</tr>

														</jstl:forEach>
													</tbody>


												</table>
											</div>

										</div>
									</div>


								</div>
							</div>

							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<!-- --------------------------------這是主文回文分隔線----------------------------------------------------- -->
							<jstl:forEach var="subArticles" items="${page.content}">
								<div class="container">
									<div class="row justify-content-center">
										<div class="col-8">
											<div class="card border-primary mb-3" style="max-width: 100rem;">
												<div>
													<div class="card-header bg-primary p-2 text-dark bg-opacity-10">
														<span class="subidforsam" data-id="subid"
															style="display:none">${subArticles.subid}</span>
														<span class="author"
															id="authorid">${subArticles.authoridforSA.m_account}</span>
													</div>
												</div>
												<div class="card-body text-secondary">

													<p class="card-text">${subArticles.content}</p>
												</div>

												<div class="card-header">
													<div class="row">
														<div class="col-11 text-right">
															<button type="button" class="btn btn-outline-primary btn-sm"
																data-id="salike">
																<i class="fas fa-thumbs-up"></i> Like
															</button>
														</div>
														<div class="col-1 text-right">
															<span class="badge badge-primary"
																data-id="SublikeCount">${subArticles.subarticlelikes.size()}</span>
														</div>
														<!-- //之後會刪掉改成當前登入的人id -->
														<div id="sublikeid" style="display:none">${memberbean.m_number}
														</div>
													</div>
												</div>

												<!-- 	=====================================回文留言=================================================================					 -->
												<form class="subform">
													<div class="row">
														<div class="col-md-0">
															<input type="text" class="form-control"
																value="${memberbean.m_number }" style="display:none"
																data-id="subauthor">
														</div>
														<div class="col-md-12">
															<input type="text" class="form-control" data-id="submessage"
																placeholder="我要留言">
														</div>
														<div class="col-md-2">
															<input type="text" class="form-control" style="display:none"
																data-id="submessageid" style="display:none"
																value="${subArticles.subid}">
														</div>
													</div>

												</form>
												<!-- =====================================================顯示回文留言====================================== -->

												<div>
													<table class="table table-striped" data-subid="${subArticles.subid}"
														data-id="list_subtable_json">
														<thead>
															<tr>
																<th class="col-2">留言作者</th>
																<th class="col-7">留言內容</th>
																<th class="col-2">留言時間</th>
																<th class="col-1">刪除留言</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${subArticles.subarticlemessages}"
																var="sam">
																<tr>
																	<td>${sam.authoridforSAM.m_account}</td>
																	<td>${sam.content}</td>
																	<td>${sam.updatedatetime}</td>
																	<td><button
																			class="btn btn-danger btn-sm">刪除</button>
																	</td>
																</tr>
															</c:forEach>

														</tbody>



													</table>
												</div>


											</div>
										</div>


									</div>
								</div>
							</jstl:forEach>
							<!-- ========================================新增回文====================================================================== -->
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-8">
										<div class="card border-secondary mb-3" style="max-width: 100rem;">
											<h2>我要回文</h2>
											<form:form class="form-select" modelAttribute="SubArticles"
												action="${contextRoot}/board/addSA/${MainArticles.mainid}/${page.totalPages}">

												<form:input path="mainarticlesforsa.mainid" class="form-control"
													value="${MainArticles.mainid}" style="display:none"></form:input>
												<form:input path="authoridforSA.m_number" class="form-control"
													value="${memberbean.m_number }" style="display:none"></form:input>
												<form:textarea path="content" class="form-control" id="editorDemo"
													cols="30"></form:textarea>
												<button type="submit" class="btn btn-primary">送出</button>
											</form:form>
										</div>
									</div>
								</div>
							</div>
							<!-- ========================================回文分頁====================================================================== -->




							<nav aria-label="Page navigation example">
								<ul class="pagination">

									<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
										<jstl:choose>
											<jstl:when test="${page.number+1 != pageNumber }">

												<li class="page-item"><a class="page-link"
														href="${contextRoot}/board/MainArticle?p=${pageNumber}&maid=${MainArticles.mainid} ">${pageNumber}</a>
												</li>

											</jstl:when>

											<jstl:otherwise>
												<li class="page-item"><a class="page-link">${pageNumber}</a></li>
											</jstl:otherwise>
										</jstl:choose>
									</jstl:forEach>

								</ul>
							</nav>

							<!-- ========================================================主文章留言上傳=========================================== -->
							<script>
								$(document).ready(function () {
									$('#message').keypress(
										function (event) {
											if (event.keyCode === 13) {
												event.preventDefault();
												let inputAuthorid = document
													.getElementById('author').value;
												let inputContent = document
													.getElementById('message').value;
												let inputMAid = document
													.getElementById('mainid').value;
												let inputMAidint = parseInt(inputMAid);
												;

												console.log(inputMAidint)
												$('#message').val('');
												let dtoObject = {
													"content": inputContent,
													"auid": inputAuthorid,
													"mainid": inputMAidint
												}
												let dtoJsonString = JSON
													.stringify(dtoObject);

												$
													.ajax({
														url: 'http://localhost:8079/finalTopic_5/board/mainArticleMessages',
														contentType: "application/json;charset=UTF-8",
														dataType: 'json',
														method: 'post',
														data: dtoJsonString,
														success: function (result) {
															console.log(result.MainArticleMessageDTO);
															msg_data = '<tbody>';
															$.each(result, function (index, value) {
																msg_data += '<tr>'
																msg_data += '<td>' + value.auaccount + '</td>'
																msg_data += '<td>' + value.content + '</td>'
																msg_data += '<td>' + value.updatedatetime + '</td>'
																msg_data += '<td>' + '</td>'
																msg_data += '</tr>'
															})
															msg_data += '</tbody>';
															let myTable = document.getElementById('list_table_json');
															myTable.getElementsByTagName('tbody')[0].innerHTML = msg_data

														},


														error: function (
															err) {
															console
																.log(err)
															if (err.status === 500) {
																alert("請先登入");
																 window.location.href = "http://localhost:8079/finalTopic_5/Login";
															}
														}
													})

											}

										})

								})
							</script>
							<!-- ========================================================回文留言上傳=========================================== -->
							<script>

								$('.subform').each(function () {
									let subtable = null;
									let msg_data = '<tr>';
									$(this).keypress(function (event) {
										if (event.keyCode === 13) {
											event.preventDefault();
											let inputAuthorid = $(this).find("[data-id='subauthor']").val();  // 獲取當前form中subauthor輸入框的值
											console.log("xxxx" + inputAuthorid)
											let inputContent = $(this).find("[data-id='submessage']").val();  // 獲取當前form中submessage輸入框的值
											let inputSAid = $(this).find("[data-id='submessageid']").val();
											console.log(inputAuthorid, inputContent, inputSAid);


											let dtoObject = {
												"content": inputContent,
												"auid": inputAuthorid,
												"subid": inputSAid
											};
											let dtoJsonString = JSON.stringify(dtoObject);
											console.log(dtoJsonString);

											$.ajax({
												url: 'http://localhost:8079/finalTopic_5/board/subArticleMessages',
												contentType: "application/json;charset=UTF-8",
												dataType: 'json',
												method: 'post',
												data: dtoJsonString,
												async: false,
												success: function (result) {
													console.log(result);


													$.each(result, function (index, value) {
														var subid = value.subid;

														subtable = $($("[data-id='list_subtable_json']")).filter(function () {
															return $(this).data('subid') === subid;
														});

														console.log(subtable);

														msg_data += '<td>' + value.auaccount + '</td>';
														msg_data += '<td>' + value.content + '</td>';
														msg_data += '<td>' + value.updatedatetime + '</td>';
														msg_data += '<td><button class="btn btn-danger btn-sm">刪除</button></td>'
														msg_data += '</tr>';
													});
													subtable.find('tbody').empty();

													console.log("msg_data" + msg_data)
													subtable.find('tbody').html(msg_data);


												},
												error: function (err) {
													console.log(err);
													if (err.status === 500) {
														alert("請先登入");
														window.location.href = "http://localhost:8079/finalTopic_5/Login";
													}
												}
											});
										}
									});
								})





							</script>

							<!-- =========================================按讚系統========================================== -->
							<!-- =============================主文按讚系統============================= -->
							<script>
								$(document).ready(function () {

									$("#malike").click(function () {
										let mainid = parseInt($("#main_id").text());
										let auid = parseInt($("#mainlikeid").text());

										console.log(mainid);
										let dtoObject = {
											"mainid": mainid,
											"auid": auid
										};
										console.log(dtoObject);
										let dtoJsonString = JSON.stringify(dtoObject);
										console.log(dtoJsonString);
										// let likeCount = parseInt($("#likeCount").text());
										// $("#likeCount").text(likeCount + 1);
										$.ajax({
											url: 'http://localhost:8079/finalTopic_5/board/addMainArticleLike',
											contentType: "application/json;charset=UTF-8",
											dataType: 'json',
											method: 'post',
											data: dtoJsonString,
											success: function (result) {
												$("#likeCount").text(result.likeCount);


											},
											error: function (
												err) {
												console
													.log(err)
												if (err.status === 500) {
													alert("請先登入");
													window.location.href = "http://localhost:8079/finalTopic_5/Login";
												}
											}
										})
									});

								})

								// ==============================秀主文按讚人======================
								const likeCount = document.getElementById('likeCount');
								let tooltip;
								let requestTimer = null;
								likeCount.addEventListener('mouseenter', function (event) {
									if (tooltip) {
										return;
									}
									let mainid = document.getElementById("main_id").textContent;
									console.log(mainid);
									let dtoObject = {
										"mainid": mainid,
									};
									let dtoJsonString = JSON.stringify(dtoObject);
									console.log(dtoJsonString);

									requestTimer = setTimeout(() => {
										$.ajax({
											url: 'http://localhost:8079/finalTopic_5/board/showMainArticleLikeAuthors',
											contentType: "application/json;charset=UTF-8",
											dataType: 'json',
											method: 'post',
											data: dtoJsonString,
											success: function (result) {

												const auidList = result.auidlist;
												let links = ""; // 這裡是要放在 tooltip 內的超連結的 HTML 字串
												for (let i = 0; i < auidList.length; i++) {
													links += "<a href='http://localhost:8079/finalTopic_5/membercenter/" + auidList[i] + "'>" + auidList[i] + "</a><br>";
												}

												console.log(auidList);
												console.log(links);

												tooltip = document.createElement('div');
												tooltip.innerHTML = links;
												tooltip.style.position = 'absolute';
												tooltip.style.left = event.pageX + 'px';
												tooltip.style.top = event.pageY + 'px';
												tooltip.style.backgroundColor = '#f5f5f5'; //增加背景顏色
												tooltip.style.padding = '10px'; //增加padding
												tooltip.style.borderRadius = '5px'; //增加圓角
												document.body.appendChild(tooltip);
												tooltip.addEventListener('mouseleave', function () {
													if (tooltip) {
														tooltip.remove();
														tooltip = null;
													}
												});


											},
											error: function (
												err) {
												console
													.log(err)
												if (err.status === 500) {
													alert("請先登入");
													window.location.href = "http://localhost:8079/finalTopic_5/Login";
												}
											}
										})

									}, 300);
								});
								likeCount.addEventListener('mouseleave', function () {
									clearTimeout(requestTimer);
								});
								tooltip.addEventListener('mouseenter', function () {
									clearTimeout(requestTimer);
								});

								tooltip.addEventListener('mouseleave', function () {
									if (tooltip) {
										tooltip.remove();
										tooltip = null;
									}
								});

							</script>
							<!-- =============================回文按讚系統============================= -->
							<script>
								$(document).ready(function () {
									// 按讚文章
									$($("[data-id='salike']")).each(function () {
										$(this).click(function () {
											let subid = $(this).closest('.container').find("[data-id='subid']").text();
											let subLikeCount = $(this).closest('.container').find("[data-id='SublikeCount']");
											let auid = parseInt($("#sublikeid").text());
											let dtoObject = {
												"subid": subid,
												"auid": auid
											};
											let dtoJsonString = JSON.stringify(dtoObject);
											$.ajax({
												url: 'http://localhost:8079/finalTopic_5/board/addSubArticleLike',
												contentType: "application/json;charset=UTF-8",
												dataType: 'json',
												method: 'post',
												data: dtoJsonString,
												success: function (result) {
													subLikeCount.text(result.likeCount);
												},
												error: function (err) {
													console.log(err)
													if (err.status === 500) {
														alert("請先登入");
														window.location.href = "http://localhost:8079/finalTopic_5/Login";
													}
												}
											})
										});
									});

									// 秀回文按讚人
									const SublikeCount = $("[data-id='SublikeCount']");
									SublikeCount.each(function () {
										const $this = $(this);
										const $container = $this.closest('.container');
										const subid = $container.find("[data-id='subid']").text();
										const dtoObject = {
											"subid": subid,
										};
										const dtoJsonString = JSON.stringify(dtoObject);
										let subtooltip = null;
										let timer = null;

										$this.mouseenter(function (event) {
											if (subtooltip) {
												return;
											}
											timer = setTimeout(function () {
												$.ajax({
													url: 'http://localhost:8079/finalTopic_5/board/showSubArticleLikeAuthors',
													contentType: "application/json;charset=UTF-8",
													dataType: 'json',
													method: 'post',
													data: dtoJsonString,
													success: function (result) {
														const auidList = result.auidlist;
														let links = "";
														for (let i = 0; i < auidList.length; i++) {
															links += "<a href='http://localhost:8079/finalTopic_5/membercenter/" + auidList[i] + "'>" + auidList[i] + "</a><br>";
														}
														subtooltip = $container.data('subtooltip');
														if (!subtooltip && !$container.data('subtooltip')) {
															subtooltip = document.createElement('div');
															subtooltip.style.position = 'absolute';
															subtooltip.style.backgroundColor = '#f5f5f5';
															subtooltip.style.padding = '10px';
															subtooltip.style.borderRadius = '5px';
															$container.data('subtooltip', subtooltip);
														}
														subtooltip.innerHTML = links;
														subtooltip.style.left = event.pageX + 'px';
														subtooltip.style.top = event.pageY + 'px';
														document.body.appendChild(subtooltip);
														subtooltip.addEventListener('mouseleave', function () {
															subtooltip.remove();
															$container.removeData('subtooltip');
															subtooltip = null;
														});
													},
													error: function (err) {
														console.log(err)
														if (err.status === 500) {
															alert("請先登入");
															window.location.href = "http://localhost:8079/finalTopic_5/Login";
														}
													}
												});
											}, 500); // 設定延遲時間
										}).mouseleave(function () {
											clearTimeout(timer);
										});
									});
								});
							</script>



















							<!-- 						============================回文留言秀 (失敗)==================================	 -->

							<!--  	<script> -->

							<!-- // 								$(document).ready(function () { -->

							<!-- // 									var subidforsam = $('.subidforsam'); -->
							<!-- // 									console.log(subidforsam) -->

							<!-- // 									var subidList = subidforsam.map(function () { -->
							<!-- // 										return $(this).text(); -->
							<!-- // 									}).get(); -->

							<!-- // 									var intArr = subidList.map(function (str) { -->
							<!-- // 										return parseInt(str); -->
							<!-- // 									}); -->

							<!-- // 									console.log(subidList) -->
							<!-- // 									console.log(intArr) -->
							<!-- // 									let dtoObject = { -->
							<!-- // 										subArticleIds: intArr -->
							<!-- // 									} -->
							<!-- // 									let dtoJsonString = JSON.stringify(dtoObject); -->
							<!-- // 									console.log(typeof dtoJsonString); -->
							<!-- // 									console.log(dtoJsonString); -->

							<!-- // 									// 傳送AJAX請求 -->
							<!-- // 									$.ajax({ -->
							<!-- // 										contentType: "application/json;charset=UTF-8", -->
							<!-- // 										dataType: 'json', -->
							<!-- // 										method: 'post', -->
							<!-- <%-- // // url: '${contextRoot}/board/showSubArticleMessages' , --%> -->
							<!-- // 										data: dtoJsonString, -->
							<!-- // 										success: function (result) { -->
							<!-- // 											// 成功取得留言資料後，處理資料並顯示在頁面上 -->
							<!-- // 											$.each(result, function (index, value) { -->
							<!-- // 												var subArticleId = value.subArticleId; -->
							<!-- // 												var authorId = value.authorId; -->
							<!-- // 												var content = value.content; -->
							<!-- // 												var updateDatetime = value.updateDatetime; -->

							<!-- // 												// 將資料顯示在頁面上 -->
							<!-- // 												$('.subarticle-id').each(function () { -->
							<!-- // 													if ($(this).text() === subArticleId) { -->
							<!-- // 														$(this).closest('tr').after('<tr><td>' + authorId + '</td><td>' + content + '</td><td>' + updateDatetime + '</td></tr>'); -->
							<!-- // 													} -->
							<!-- // 												}); -->
							<!-- // 											}); -->
							<!-- // 										}, -->
							<!-- // 										error: function (xhr, status, error) { -->
							<!-- // 											console.log(error); -->
							<!-- // 										} -->
							<!-- // 									}); -->
							<!-- // 								}); -->



							<!--  							</script> -->
							<!-- ==================================================CK5============================================== -->
							<script>
								ClassicEditor
									.create(document.querySelector('#editorDemo'), {
										extraPlugins: [CustomUploadAdapterPlugin],


										customUploadAdapter: {
											uploadUrl: 'http://localhost:8079/finalTopic_5/upload/image'
										}
									})
									.then(editor => {
										console.log(editor);
									})
									.catch(error => {
										console.error(error);
									});

								function CustomUploadAdapterPlugin(editor) {
									editor.plugins.get('FileRepository').createUploadAdapter = loader => {
										return new CustomUploadAdapter(loader, editor.config.get('customUploadAdapter.uploadUrl'));
									};
								}





								class CustomUploadAdapter {
									constructor(loader, uploadUrl) {
										this.loader = loader;
										this.uploadUrl = uploadUrl;
									}

									upload() {
										return this.loader.file
											.then(file => new Promise((resolve, reject) => {
												this._uploadFile(file).then(response => {
													if (response.url) {
														resolve({ default: response.url });
													} else {
														reject(`Upload failed: ${response.message}`);
													}
												});
											}));
									}

									_uploadFile(file) {
										const data = new FormData();
										data.append('file', file);

										return fetch(this.uploadUrl, {
											method: 'POST',
											body: data
										})
											.then(response => response.json())
											.catch(error => {
												console.error('Upload error:', error);
												throw error;
											});
									}
								}
							</script>
							<jsp:include page="../layout/footerbar.jsp"></jsp:include>
						</body>

						</html>