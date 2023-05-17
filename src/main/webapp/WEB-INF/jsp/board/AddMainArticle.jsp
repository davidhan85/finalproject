<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
						<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
						<title>新增文章</title>
						<script type="text/javascript"
							src="${contextRoot}/js/ckeditor5-build-classic/ckeditor.js"></script>
						<script src="${contextRoot}/js/jquery-3.4.1.min.js"></script>
						<link rel="stylesheet"
							href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



						<jsp:include page="../layout/navebar.jsp"></jsp:include>
						<style>
							.card {
								background-color: transparent;
								border: 1px solid #ccc;
							}

							.card-body {
								background-color: white;
							}

							.container {
								border-radius: 1px;
								padding-bottom: 30px;
								padding-top: 30px;
								max-width: 1200px;
							}

							#editorDemo {
								min-height: 100px;
								/* 设置textarea的最小高度为100像素 */
								max-height: 300px;
								/* 设置textarea的最大高度为300像素 */
								overflow-y: scroll;
								/* 在达到最大高度后，显示滚动条 */
							}
						</style>
					</head>


					<body>


						<div class="container">
							<div class="row justify-content-center" style="height: 600px; padding-top: 20px">
								<div class="col-8">
									<h1>發表新文章</h1>
									<div class="card">
										<div class="card-header">書遊論壇</div>
										<div class="card-body">
											<form:form class="form-select" modelAttribute="MainArticles"
												action="${contextRoot}/board/addMA">
												<form:input path="title" class="form-control" value="標題"></form:input>
												<form:input path="authoridforMA" class="form-control"
													value="${memberbean.m_number}" style="display:none"></form:input>
												<form:select path="category" class="form-control" name="category" id="">
													<c:if test="${memberbean.m_Role eq'adaim'}">
														<option value="版主公告">版主公告</option>
													</c:if>
													<option value="電玩遊戲">電玩遊戲</option>
													<option value="動漫相關">動漫相關</option>
													<option value="輕改小說">輕改小說</option>
													<option value="輕鬆閒聊">輕鬆閒聊</option>
												</form:select>
												<form:select path="access" class="form-control" name="access" id="">
													<c:if test="${memberbean.m_Role eq'adaim'}">
														<option value="置頂文">置頂文</option>
														<option value="限制">限制</option>
													</c:if>
													<option value="一般">一般</option>
												</form:select>
												<br>
												<form:textarea path="content" class="form-control" id="editorDemo"
													cols="30"></form:textarea>
												<button type="submit" class="btn btn-primary">送出</button>
											</form:form>

										</div>
									</div>


								</div>
							</div>
						</div>











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




					</body>


					</html>