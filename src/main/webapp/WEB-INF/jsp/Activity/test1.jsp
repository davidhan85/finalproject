<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="UTF-8">
  <title>新增活動</title>
  <!-- 引入 Bootstrap CSS 檔案 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!-- 引入 Bootstrap JavaScript 檔案 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
    <h2>新增活動</h2>
    <form id="addActivityForm" method="post" enctype="multipart/form-data" action="<c:url value='/addActivity' />">
      <div class="form-group">
        <label for="activity_id">活動編號：</label>
        <input type="text" class="form-control" id="activity_id" name="activity_id" required>
      </div>
      <div class="form-group">
        <label for="principle">負責人：</label>
        <input type="text" class="form-control" id="principle" name="principle" required>
      </div>
      <div class="form-group">
        <label for="activity_name">活動名稱：</label>
        <input type="text" class="form-control" id="activity_name" name="activity_name" required>
      </div>
      <div class="form-group">
        <label for="activity_date">活動日期：</label>
        <input type="datetime-local" class="form-control" id="activity_date" name="activity_date" required>
      </div>
      <div class="form-group">
        <label for="activity_image">活動圖像：</label>
        <input type="file" class="form-control" id="activity_image" name="activity_image" accept="image/*" required>
      </div>
      <div class="form-group">
        <label for="attendance">出席人數：</label>
        <input type="number" class="form-control" id="attendance" name="attendance" min="0" required>
      </div>
      <div class="form-group">
        <label for="activity_cost">活動成本：</label>
        <input type="number" class="form-control" id="activity_cost" name="activity_cost" min="0" required>
      </div>
      <div class="form-group">
        <label for="activityDescription">活動描述：</label>
        <textarea class="form-control" id="activityDescription" name="activityDescription" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">提交</button>
    </form>
  </div>
  <!-- 在表單提交後顯示成功訊息 -->
  <script>
    var form = document.getElementById("addActivityForm");
    form.addEventListener("submit", function(event) {
      event.preventDefault(); // 防止表單直接提交

      // 使用 AJAX 提交表單資料
      var xhr = new XMLHttpRequest();
      xhr.open("POST", form.action);
      xhr.onreadystatechange = function()
      xhr.onreadystatechange = function() {
    	  if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
    	  // 提交成功，顯示成功訊息
    	  alert("活動新增成功！");
    	  // 清除表單資料
    	  form.reset();
    	  }
    	  };
    	  xhr.send(new FormData(form));
    	  });
    	  </script>

    	  </body>
    	  </html>