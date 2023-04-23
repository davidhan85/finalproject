<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">

        <jstl:set var="contextRoot" value="${pageContext.request.contextPath}" />

        <link href="${contextRoot}/css/bootstrap.css" rel="stylesheet">

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
        </style>


      </head>

      <body>
        <jsp:include page="boardnarbar.jsp"></jsp:include>

        <head>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          <title>巴哈姆特討論區文章列表</title>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        </head>

        <body>
          <div class="d-flex align-items-center justify-content-center" id="categorybar">
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
              <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked> <label
                class="btn btn-outline-primary" for="btnradio1">版主公告</label> <input type="radio" class="btn-check"
                name="btnradio" id="btnradio2" autocomplete="off"> <label class="btn btn-outline-primary"
                for="btnradio2">電玩遊戲</label> <input type="radio" class="btn-check" name="btnradio" id="btnradio3"
                autocomplete="off"> <label class="btn btn-outline-primary" for="btnradio3">輕鬆閒聊</label> <input
                type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"> <label
                class="btn btn-outline-primary" for="btnradio3">動漫相關</label> <input type="radio" class="btn-check"
                name="btnradio" id="btnradio3" autocomplete="off"> <label class="btn btn-outline-primary"
                for="btnradio3">輕改小說</label>
            </div>
          </div>

          <div class="container mt-4 border-0 ">

            <div class="row border-bottom font-weight-bold border-0">
              <div class="col-sm-2">分類</div>
              <div class="col-sm-4">標題</div>
              <div class="col-sm-1">權限</div>
              <div class="col-sm-2">作者</div>
              <div class="col-sm-2">日期</div>
              <div class="col-sm-1">人氣</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

            <div class="row border-bottom border-0">
              <div class="col-sm-2">電腦遊戲</div>
              <div class="col-sm-4">
                <a href="#">如何提高遊戲FPS</a>
              </div>
              <div class="col-sm-1">公開</div>
              <div class="col-sm-2">小明</div>
              <div class="col-sm-2">2023/04/18</div>
              <div class="col-sm-1">300</div>
            </div>

          </div>






          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span
                    aria-hidden="true">&laquo;</span>
                </a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span
                    aria-hidden="true">&raquo;</span>
                </a></li>
            </ul>
          </nav>




          <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
          <script src="${contextRoot}/js/jquery-3.6.4.min.js"></script>
        </body>

      </html>