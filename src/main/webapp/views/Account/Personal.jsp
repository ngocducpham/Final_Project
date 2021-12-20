<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>

<t:personal_page>
    <jsp:attribute name="js">
        <script>
            document.getElementById('open_edit').addEventListener("click", function () {
                alert("open edit");
                document.getElementById('username').disabled = false;
                document.getElementById('email').disabled = false;
                document.getElementById('dob').disabled = false;
                document.getElementById('address').disabled = false;
            });

            document.getElementById('close_edit').addEventListener("click", function () {
                alert("close edit");
                window.location.reload();
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile">
            <div class="top_header">
                <p class="h__profile">Hồ sơ của tôi</p>
                <button class="btn btn-warning small" id="open_edit">Chỉnh Sửa Hồ Sơ <i
                        class="fa fa-pencil"></i></button>
            </div>
            <div class="boxProfile">
                <form method="post">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="username">Họ Tên</label>
                            <input type="text" class="form-control background" name="username" id="username" disabled
                                   value="${authUser.username}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">Email</label>
                            <input type="email" class="form-control background" name="email" id="email"
                                   value="${authUser.email}"
                                   disabled>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="dob">Ngày sinh</label>
                            <input type="text" class="form-control background" name="dob" id="dob"
                                   value="${authUser.date_o_Birth}"
                                   disabled>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="address">Địa Chỉ</label>
                            <input type="text" class="form-control background" name="address" id="address"
                                   value="${authUser.address}"
                                   disabled>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="">Được Quyền Bán Đến Ngày</label>
                            <input type="text" class="form-control background" id=""
                                   value="${authUser.seller_Expired_date}" readonly>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-success"><i class="fa fa-check"></i>
                        Lưu
                    </button>
                    <button type="button" class="btn btn-outline-danger" id="close_edit"><i class="fa fa-times"></i>
                        Huỷ
                    </button>
                </form>
            </div>
        </div>
    </jsp:body>
</t:personal_page>