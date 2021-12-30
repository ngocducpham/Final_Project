<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="false_old_pass" scope="session" type="java.lang.Boolean"/>
<jsp:useBean id="success_change_pass" scope="session" type="java.lang.Boolean"/>

<t:personal_page>
    <jsp:attribute name="js">
        <script>
            document.getElementById('open_edit').addEventListener("click", function () {
                // alert("open edit");
                document.getElementById('old_pass').disabled = false;
                document.getElementById('new-pass').disabled = false;
                document.getElementById('re-new-pass').disabled = false;
            });

            document.getElementById('close_edit').addEventListener("click", function () {
                // alert("close edit");
                window.location.reload();
            });

            document.getElementById('s').addEventListener("click", function (e) {
                if (document.getElementById('new-pass').value !== document.getElementById('re-new-pass').value) {
                    e.preventDefault();
                    alert("Password không khớp!");
                    window.location.reload();
                }
            })
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile">
            <div class="top_header">
                <p class="h__profile text-danger">Đổi Mật Khẩu</p>
                <button class="btn btn-warning small" id="open_edit">Đổi Mật Khẩu <i
                        class="fa fa-pencil"></i></button>
            </div>
            <div class="boxProfile">
                <form method="post">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="old_pass">Nhập Mật Khẩu Cũ</label>
                            <input type="password" class="form-control background" name="old_pass" id="old_pass"
                                   disabled required
                            >
                        </div>
                    </div>
                    <c:if test="${false_old_pass}">
                        <div class='alert__login text-red-400'>Sai Mật Khẩu Cũ. Vui lòng nhập lại !</div>
                    </c:if>
                    <c:if test="${success_change_pass}">
                        <div class='alert__login ' style="color: limegreen">Đổi Mật Khẩu Thành Công</div>
                    </c:if>
                    <div class="form-row mt-3">
                        <div class="form-group col-md-6">
                            <label for="new-pass">Nhập Mật Khẩu Mới</label>
                            <input type="password" class="form-control background" name="new_pass" id="new-pass"
                                   disabled required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="re-new-pass">Xác Nhận Mật Khẩu Mới</label>
                            <input type="password" class="form-control background" name="re_new_pass" id="re-new-pass"
                                   disabled required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-outline-success" id="s"><i class="fa fa-check"></i>
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