<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">
<title>新增文章</title>
<script type="text/javascript"
	src="${contextRoot}/js/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="">
</head>


<body>

	<jsp:include page="../layout/navebar.jsp"></jsp:include>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<h1>發表新文章</h1>
				<div class="card">
					<div class="card-header">Featured</div>
					<div class="card-body">
						<form:form class="form-select" modelAttribute="mainarticles"
							action="${contextRoot}/board/editMainArticle" method="put">
							<form:input path="mainid" class="form-control" value="${mainarticles.mainid}"></form:input>
							<form:input path="title" class="form-control" value="${mainarticles.title}"></form:input>
							<form:input path="authoridforMA" class="form-control" value="${mainarticles.authoridforMA.m_number}"></form:input>
							<form:select path="category" class="form-control" name="category"
								id="">
								<option value="${mainarticles.category}">${mainarticles.category}</option>
								<option value="版主公告">版主公告</option>
								<option value="電玩遊戲">電玩遊戲</option>
								<option value="動漫相關">動漫相關</option>
								<option value="輕改小說">輕改小說</option>
								<option value="輕鬆閒聊">輕鬆閒聊</option>
							</form:select>
							<form:select path="access" class="form-control" name="access"
								id="">
								<option value="${mainarticles.access}">${mainarticles.access}</option>
								<option value="置頂文">置頂文</option>
								<option value="限制">限制</option>
								<option value="一般">一般</option>
							</form:select>
							<br>
							<form:textarea  path="content" class="form-control"
								id="editorDemo" cols="30" value="${mainarticles.content}"></form:textarea>
							<button type="submit" class="btn btn-primary">送出</button>
						</form:form>

					</div>
				</div>


			</div>
		</div>
	</div>











<!-- <script> -->
//     ClassicEditor.create( document.querySelector( '#editorDemo' ), {
//     	console.log("ok");
//         simpleUpload: {
//             // 設定上傳的 URL
//             uploadUrl: '/upload/image'
//         },
//         // 設定載入的套件
//         plugins: [
//             SimpleUploadAdapter,
//             // 其他套件
//         ]
//     } )
//     .then( editorDemo => {
//         console.log( editorDemo );
//     } )
//     .catch( error => {
//         console.error( error );
//     } );
<!-- </script> -->




<!-- 	<script> -->
// 		var editor = CKEDITOR.replace('editorDemo');

// 		$('#alertContent').click(function() {
// 			// CKEDITOR.instances.editorDemo.updateElement();
// 			console.log($('form:textarea[id=editorDemo]').val());
// 			console.log(CKEDITOR.instances.editorDemo.getData());
// 		});
<!-- 	</script> -->
	
	


	
	<jsp:include page="../layout/footerbar.jsp"></jsp:include>
</body>

</html>