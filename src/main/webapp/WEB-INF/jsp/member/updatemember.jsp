<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>會員更新</title>
                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <!-- Font Awesome CSS -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">

                <style>
                    .container {
                        margin-top: 50px;
                    }


                    .card-body {
                        background-color: white;

                    }
                </style>
            </head>

            <body>
                <jsp:include page="../layout/navebar.jsp"></jsp:include>
                <%--<jsp:include page="../layout/navebar.jsp"></jsp:include>--%>
                    <div class="container my-5">

                        <div class="row justify-content-center">
                            <div class="col-md-8">

                                <div class="card">
                                    <div class="card-header bg-primary text-white">
                                        <h4 class="card-title mb-0">更新會員</h4>
                                    </div>
                                    <div class="card-body">

                                        <form:form method="post" action="${contextRoot}/updatemember/${m_number}"
                                            enctype="multipart/form-data" modelAttribute="member">
                                            <input type="hidden" name="_method" value="put">

                                            <div class="form-group row">
                                                <label for="m_account" class="col-sm-3 col-form-label">帳號</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_account" required="true" readonly="true"
                                                        class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_password" class="col-sm-3 col-form-label">密碼</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_password" required="true" readonly="true"
                                                        class="form-control" type="password" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_name" class="col-sm-3 col-form-label">姓名</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_name" required="true" class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_phone" class="col-sm-3 col-form-label">手機</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_phone" required="true" class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_address" class="col-sm-3 col-form-label">地址</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_address" required="true" class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_email" class="col-sm-3 col-form-label">信箱</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_email" type="email" required="true"
                                                        class="form-control" />
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="m_birth" class="col-sm-3 col-form-label">生日</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_birth" type="date" required="true"
                                                        class="form-control" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="m_id" class="col-sm-3 col-form-label">身分證</label>
                                                <div class="col-sm-9">
                                                    <form:input path="m_id" required="true" class="form-control" />
                                                </div>
                                            </div>

                                            <input type="hidden" name="m_status" value="success" />

                                            <div class="form-group row">
                                                <label for="m_Role" class="col-sm-3 col-form-label">身分</label>
                                                <div class="col-sm-9">
                                                    <form:select path="m_Role" class="form-control">
                                                        <form:option value="admin" label="管理員" />
                                                        <form:option value="user" label="一般使用者" />
                                                    </form:select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label for="productImage" class="col-sm-3 col-form-label">大頭貼</label>
                                                <div class="col-sm-9">
                                                    <form:input path="productImage" type="file"
                                                        class="form-control-file" />
                                                </div>
                                            </div>

                                            <div class="form-group row justify-content-center">
                                                <div class="col-sm-6">
                                                    <button type="submit" class="btn btn-primary btn-block">
                                                        <i class="fas fa-save mr-2"></i>更新
                                                    </button>
                                                </div>
                                            </div>

                                        </form:form>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <!-- jQuery、Popper.js 和 Bootstrap JS -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
                        crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
                        crossorigin="anonymous"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                        crossorigin="anonymous"></script>
                    <jsp:include page="../layout/footerbar.jsp"></jsp:include>
            </body>

            </html>