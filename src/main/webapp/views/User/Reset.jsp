<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="users" scope="request" type="com.final_project.beans.User" />

<t:admin>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <div class="card-header">
                    Reset mật khẩu
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtUserID">#</label>
                        <input type="text" class="form-control" id="txtUserID" name="User_ID" readonly value="${users.user_ID}">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Tên</label>
                        <input type="text" class="form-control" id="txtEmail" name="email" readonly value="${users.email}">
                    </div>
                    <div class="form-group">
                        <label for="txtPass">Password</label>
                        <input type="password" class="form-control" id="txtPass" name="Pass" readonly value="${users.pass}">
                    </div>
                </div>
                <div class="card-footer d-flex justify-between">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/User/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-primary text-blue-600" formaction="${pageContext.request.contextPath}/Admin/User/Reset">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Reset
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>
