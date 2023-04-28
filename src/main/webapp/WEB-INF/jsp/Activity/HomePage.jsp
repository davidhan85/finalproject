<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MVC 範例</title>
<!-- 引用 Bootstrap CSS 檔 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- 引用自訂 CSS 檔 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />"
	type="text/css" />
</head>
<body>
	<div class="container">
		<h1 class="text-center my-4">Hello, 歡迎來到活動詳細資訊</h1>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form method="POST" action="<c:url value='/activityInfo' />">
					<button type="submit" class="btn btn-primary btn-sm btn-block">查詢所有活動</button>
				</form>
				<br>
			</div>
			<div class="col-md-4">
				<form method="GET" action="<c:url value='/activityDelete' />">
					<button type="submit" class="btn btn-danger btn-sm btn-block">刪除活動</button>
				</form>
				<br>
			</div>
			<div class="col-md-4">
				<form method="POST" action="<c:url value='/test1' />">
					<button type="submit" class="btn btn-info btn-sm btn-block">新增活動</button>
				</form>
				<br>
			</div>
		</div>
	</div>

	<!-- 引用 Bootstrap JavaScript 檔 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<!-- <!DOCTYPE html> -->
<!-- <html lang="zh-TW"> -->
<!-- <head> -->
<!--     <meta charset="UTF-8"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
<!--     <title>MVC 範例</title> -->
<!--     引用 Bootstrap CSS 檔 -->
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<!--     引用自訂 CSS 檔 -->
<%--     <link rel="stylesheet" href="<c:url value='/css/styles.css' />" type="text/css" /> --%>
<!-- </head> -->
<!-- <body> -->
<!--     <div class="container"> -->
<!--         <h1 class="text-center">Hello, 歡迎來到活動詳細資訊</h1> -->
<!--         <hr> -->
<!--         <div class="row"> -->
<!--             <div class="col-md-4"> -->
<%--                 <form method="POST" action="<c:url value='/activityInfo' />"> --%>
<!--                     <button type="submit" class="btn btn-primary btn-block">查詢所有活動</button> -->
<!--                 </form> -->
<!--                 <br> -->
<!--             </div> -->
<!--             <div class="col-md-4"> -->
<%--                 <form method="GET" action="<c:url value='/activityDelete' />"> --%>
<!--                     <button type="submit" class="btn btn-danger btn-block">刪除活動</button> -->
<!--                 </form> -->
<!--                 <br> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div class="row"> -->

<!--             <div class="col-md-6"> -->
<%--                 <form method="POST" action="<c:url value='/test1' />"> --%>
<!--                     <button type="submit" class="btn btn-info btn-block">新增活動</button> -->
<!--                 </form> -->
<!--                 <br> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     引用 Bootstrap JavaScript 檔 -->
<!--     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<!-- </body> -->
<!-- </html> -->