<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
						<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


							<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
							<!DOCTYPE html>
							<html>

							<head>
								<meta charset="UTF-8">

								<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

								<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
								<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

								<title>哈哈姆特論壇</title>
								<jsp:include page="../layout/navebar.jsp"></jsp:include>
								<style>
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

									#categorybar {
										padding-top: 20px;
										border-radius: 10px solid green;
									}

									.aa {
										background-color: red;
									}

									.data-id.rowarticle:hover {
										box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
										transform: translateY(-2px);
									}

									.container {
										max-width: 1200px;
										/* 修改为你想要的宽度 */
										margin-left: auto;
										margin-right: auto;
										padding-left: 15px;
										/* 添加左侧内边距 */
										padding-right: 15px;
										/* 添加右侧内边距 */
									}

									.row {
										margin-left: -15px;
										/* 添加左侧负外边距 */
										margin-right: -15px;
										/* 添加右侧负外边距 */
									}

									.border-bottom {
										margin-bottom: 0;
										/* 移除底部边框的下方外边距 */
									}
								</style>


							</head>




							<head>
								<meta charset="utf-8">
								<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
								<title>巴哈姆特討論區文章列表</title>
								<link rel="stylesheet"
									href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
								<script src="ShowMA.js"></script>
							</head>

							<body>
								<div class="d-flex align-items-center justify-content-center" id="categorybar">
									<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
										<label class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
												href="${contextRoot}/board">全部內容</a></label> <label
											class="btn btn-outline-primary" for="btnradio1" id="catebut"><a
												href="${contextRoot}/board/ShowMainArticlesByCategory/版主公告">版主公告</a></label>
										<label class="btn btn-outline-primary" for="btnradio2" id="catebut"><a
												href="${contextRoot}/board/ShowMainArticlesByCategory/電玩遊戲">電玩遊戲</a></label>
										<label class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
												href="${contextRoot}/board/ShowMainArticlesByCategory/輕鬆閒聊">輕鬆閒聊</a></label>
										<label class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
												href="${contextRoot}/board/ShowMainArticlesByCategory/動漫相關">動漫相關</a></label>
										<label class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
												href="${contextRoot}/board/ShowMainArticlesByCategory/輕改小說">輕改小說</a></label>
									</div>
								</div>



								<div style="margin-left: 200px;margin-right: 200px">
									<form action="${contextRoot}/board/search" method="GET">
										<div class="form-group">
											<label for="search-input">搜尋文章標題或內容</label> <input type="text" name="search"
												class="form-control" id="search-input" placeholder="請輸入關鍵字...">
										<button type="submit" class="btn btn-primary">搜尋</button>
										</div>
									</form>
								</div>
<br>
								<div style="padding-left: 200px;">
									<a class="btn btn-secondary" href="${contextRoot}/board/AddMainArticle">新增文章</a>
								</div>





								<div class="container mt-4">


									<div
										class="row border-bottom font-weight-bold border-0 bg-success  text-dark bg-opacity-10">
										<div class="col-sm-2">分類</div>
										<div class="col-sm-1">權限</div>
										<div class="col-sm-4">標題</div>
										<div class="col-sm-1">作者</div>
										<div class="col-sm-3">日期</div>
										<div class="col-sm-1">人氣</div>
									</div>


									<jstl:forEach var="results" items="${Results}">
										<div class="row border-bottom border-0" data-id="rowarticle">
											<div class="col-sm-2">${results.category}</div>
											<div class="col-sm-1">${results.access}</div>
											<div class="col-sm-4">
												<a
													href="${contextRoot}/board/MainArticle?maid=${results.mainid}">${results.title}</a>
												<!-- 					 //文章連結 -->
											</div>
											<div class="col-sm-1">${results.authoridforMA.m_number}</div>
											<div class="col-sm-3">${results.createdatetime }</div>
											<div class="col-sm-1">${results.mainarticlelikes.size()}</div>			
										</div>

									</jstl:forEach>
								</div>

								


								<div class="alert-success" style="display: none;"></div>



								<!-- 	<!-- 	<script> -->
								-->
								<!-- 	// document.getElementById('deleteBtn').addEventListener('click', -->
								<!-- 	function(event) { // const mainid = -->
								<!-- 	event.target.getAttribute('data-id'); // deleteMainArticle(mainid); // -->
								<!-- 	}); // async function deleteMainArticle(mainid) { // try { // const -->
								<%-- response=await axios.post('${contextRoot}/board/deleteMainArticle', { --%>
									<!-- 	// mainid: mainid // }); // console.log(response.data); // -->
									<!-- 	alert("文章成功刪除"); // } catch (error) { // console.error('Error during -->
									<!-- 	POST request:', error); // alert("文章刪除失敗"); // } // } -->
									<!-- 	<!-- </script> -->
									-->
									<!-- 	<script> -->
									<!-- // const deleteBtn = document.getElementById('deleteBtn'); -->
									<!-- // deleteBtn.addEventListener('click', function() { -->
									<!-- //   const mainid = deleteBtn.getAttribute('data-id'); -->
									<!-- //   axios.delete('/board/deleteMainArticle', { -->
									<!-- //     data: { mainid: mainid } -->
									<!-- //   }) -->
									<!-- //   .then(function (response) { -->
									<!-- //     console.log(response.data); -->
									<!-- //     // Handle successful response -->
									<!-- //   }) -->
									<!-- //   .catch(function (error) { -->
									<!-- //     console.log(error); -->
									<!-- //     // Handle error -->
									<!-- //   }); -->
									<!-- // }); -->
									<!-- </script> -->







									<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
									<script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
							</body>
							<jsp:include page="../layout/footerbar.jsp"></jsp:include>

							</html>