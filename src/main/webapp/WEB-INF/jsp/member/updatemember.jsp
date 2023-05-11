<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>會員更新</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css"
                    integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
                    crossorigin="anonymous">

            </head>

            <body>
                <jsp:include page="../layout/navebar.jsp"></jsp:include>
                <%--<jsp:include page="../layout/navebar.jsp"></jsp:include>--%>
                    <div class="container mt-5">
                        <h2 class="mb-5">更新會員</h2>
                        <form:form method="post" action="${contextRoot}/updatemember/${m_number}"
                            enctype="multipart/form-data" modelAttribute="member">
                            <input type="hidden" name="_method" value="put">

                            <div class="form-group row">
                                <label for="m_account" class="col-sm-2 col-form-label">帳號：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_account" required="true" readonly="true" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="m_password" class="col-sm-2 col-form-label">密碼：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_password" required="true" readonly="true" class="form-control"
                                        type=password />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="m_name" class="col-sm-2 col-form-label">姓名：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_name" required="true" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="m_phone" class="col-sm-2 col-form-label">手機：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_phone" required="true" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="m_address" class="col-sm-2 col-form-label">地址：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_address" required="true" class="form-control" />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="m_email" class="col-sm-2 col-form-label">信箱：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_email" type="email" required="true" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="m_birth" class="col-sm-2 col-form-label">生日：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_birth" type="date" required="true" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="m_id" class="col-sm-2 col-form-label">身分證：</label>
                                <div class="col-sm-10">
                                    <form:input path="m_id" required="true" class="form-control" />
                                </div>
                            </div>

                            <input type="hidden" name="m_status" value="success" />

                            <div class="form-group row">
                                <label for="m_Role" class="col-sm-2 col-form-label">身分：</label>
                                <div class="col-sm-10">
                                    <form:select path="m_Role" class="form-control">
                                        <form:option value="adaim" label="管理員" />
                                        <form:option value="user" label="一般使用者" />
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="productImage" class="col-sm-2 col-form-label">大頭貼：</label>
                                <div class="col-sm-10">
                                    <form:input path="productImage" type="file" class="form-control-file" />
                                </div>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary">更新</button>
                            </div>
                        </form:form>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
                        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                        crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"
                        integrity="sha384-EAuwFkLWgGKfQWoiv49tuzf3qdQiqq3eBStDD5XKMF5vHkCG//20Tk5hxFw0JGKj"
                        crossorigin="anonymous"></script>
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.1/js/bootstrap.min.js"
                        integrity="sha384-2o3h3nJu3z5FYnOzKAtn0IlRyUITLfkt2w5veLGMoNs/72CvaptU8I6UweJXMEhl"
                        crossorigin="anonymous"></script>
                    <jsp:include page="../layout/footerbar.jsp"></jsp:include>
            </body>

            </html>