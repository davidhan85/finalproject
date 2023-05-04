<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<title>哈哈姆特論壇</title>

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
</style>


</head>

<body>
	<jsp:include page="boardnarbar.jsp"></jsp:include>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>巴哈姆特討論區文章列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="ShowMA.js"></script>
</head>

<body>
	<div class="d-flex align-items-center justify-content-center"
		id="categorybar">
		<div class="btn-group" role="group"
			aria-label="Basic radio toggle button group">
			<input type="radio" class="btn-check" name="btnradio" id="btnradio0"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
				href="${contextRoot}/board">全部內容</a></label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio1" id="catebut"><a
				href="${contextRoot}/board/ShowMainArticlesByCategory/版主公告">版主公告</a></label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio2"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio2" id="catebut"><a
				href="${contextRoot}/board/ShowMainArticlesByCategory/電玩遊戲">電玩遊戲</a></label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
				href="${contextRoot}/board/ShowMainArticlesByCategory/輕鬆閒聊">輕鬆閒聊</a></label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
				href="${contextRoot}/board/ShowMainArticlesByCategory/動漫相關">動漫相關</a></label>
			<input type="radio" class="btn-check" name="btnradio" id="btnradio3"
				autocomplete="off" checked> <label
				class="btn btn-outline-primary" for="btnradio3" id="catebut"><a
				href="${contextRoot}/board/ShowMainArticlesByCategory/輕改小說">輕改小說</a></label>
		</div>
	</div>



	<div style="padding-left: 200px;">
		<a class="btn btn-secondary"
			href="${contextRoot}/board/AddMainArticle">新增文章</a>
	</div>





	<div class="container mt-4 border-0 ">


		<div class="row border-bottom font-weight-bold border-0">
			<div class="col-sm-2">分類</div>
			<div class="col-sm-1">權限</div>
			<div class="col-sm-4">標題</div>
			<div class="col-sm-1">作者</div>
			<div class="col-sm-3">日期</div>
			<div class="col-sm-1">人氣</div>
		</div>


		<jstl:forEach var="MainArticles" items="${page.content}">
			<div class="row border-bottom border-0">
				<div class="col-sm-2">${MainArticles.category}</div>
				<div class="col-sm-1">${MainArticles.access}</div>
				<div class="col-sm-4">
					<a
						href="${contextRoot}/board/MainArticle?ma_id=${MainArticles.main_id}">${MainArticles.title}</a>
					<!-- 					 //文章連結 -->
				</div>
				<div class="col-sm-1">${MainArticles.author_idforMA.m_number}</div>
				<div class="col-sm-3">${MainArticles.createdatetime }</div>
				<div class="col-sm-1">${MainArticles.mainarticlelikes.size()}</div>
				<a
					href="${contextRoot}/board/editMainArticle?ma_id=${MainArticles.main_id}"><button
						type="submit">修改</button></a>
				<div>
					<button id="deleteBtn" data-id="${MainArticles.main_id}">刪除</button>
				</div>
			</div>

		</jstl:forEach>
	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			
			<jstl:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<jstl:choose>
					<jstl:when test="${page.number+1 != pageNumber }">

						<li class="page-item"><a class="page-link"
							href="${contextRoot}/board?p=${pageNumber}">${pageNumber}</a></li>

					</jstl:when>

					<jstl:otherwise>
						<li class="page-item"><a class="page-link">${pageNumber}</a></li>
					</jstl:otherwise>
				</jstl:choose>
			</jstl:forEach>
			
		</ul>
	</nav>


	<div class="alert-success" style="display: none;"></div>



<!-- 	<!-- 	<script> --> -->
<!-- 	// document.getElementById('deleteBtn').addEventListener('click', -->
<!-- 	function(event) { // const main_id = -->
<!-- 	event.target.getAttribute('data-id'); // deleteMainArticle(main_id); // -->
<!-- 	}); // async function deleteMainArticle(main_id) { // try { // const -->
<%-- 	response = await axios.post('${contextRoot}/board/deleteMainArticle', { --%>
<!-- 	// main_id: main_id // }); // console.log(response.data); // -->
<!-- 	alert("文章成功刪除"); // } catch (error) { // console.error('Error during -->
<!-- 	POST request:', error); // alert("文章刪除失敗"); // } // } -->
<!-- 	<!-- </script> --> -->
	<script>
const deleteBtn = document.getElementById('deleteBtn');
deleteBtn.addEventListener('click', function() {
  const main_id = deleteBtn.getAttribute('data-id');
  axios.delete('/board/deleteMainArticle', {
    data: { main_id: main_id }
  })
  .then(function (response) {
    console.log(response.data);
    // Handle successful response
  })
  .catch(function (error) {
    console.log(error);
    // Handle error
  });
});
</script>







	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
</body>

</html>