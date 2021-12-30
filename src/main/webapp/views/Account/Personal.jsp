<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>

<jsp:useBean id="email_used" scope="session" type="java.lang.Boolean"/>

<t:personal_page>
    <jsp:attribute name="css">
         <link rel="stylesheet"
               href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css"
               integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g=="
               crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            let old_dob = document.getElementById('dob').value;
            let old_day = old_dob.substring(8, 10);
            let old_month = old_dob.substring(5, 7);
            let old_year = old_dob.substring(0, 4);
            old_dob = old_day + "/" + old_month + "/" + old_year;
            document.getElementById('open_edit').addEventListener("click", function () {
                // alert("Bạn đang chỉnh sửa thông tin người dùng");
                document.getElementById('username').disabled = false;
                document.getElementById('email').disabled = false;
                document.getElementById('dob').disabled = false;
                document.getElementById('address').disabled = false;
                $('#dob').datetimepicker({
                    format: 'd/m/Y',
                    timepicker: false,
                    mask: true
                });
            });

            document.getElementById('close_edit').addEventListener("click", function () {
                // alert("Hủy chỉnh sửa thông tin người dùng ");
                window.location.reload();
            });

            $('#personalForm').on('submit', function (e) {
                e.preventDefault();
                let new_dob = $('#dob');
                if (new_dob.val() === '__/__/____') {
                    new_dob.val(old_dob);
                }
                $('#personalForm').off('submit').submit();
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"
                integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile">
            <div class="top_header">
                <p class="h__profile">Hồ sơ của tôi</p>
                <button class="btn btn-warning small" id="open_edit">Chỉnh Sửa Hồ Sơ
                    <i class="fa fa-pencil"></i>
                </button>
            </div>
            <c:if test="${email_used}">
                <div class='alert__login text-red-500 mt-3'>Email đã có người sử dụng</div>
            </c:if>
            <div class="boxProfile">
                <form method="post" id="personalForm">
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
                    <c:if test="${authUser.userrole==2}">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="">Được Quyền Bán Đến Ngày</label>
                                <input type="text" class="form-control background" id=""
                                       value="${authUser.seller_Expired_date}" readonly>
                            </div>
                        </div>
                    </c:if>
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