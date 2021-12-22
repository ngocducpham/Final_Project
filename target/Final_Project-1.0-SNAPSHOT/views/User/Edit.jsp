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
                    Sửa người dùng
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtUserID">#</label>
                        <input type="text" class="form-control" id="txtUserID" name="User_ID" readonly value="${users.user_ID}">
                    </div>
                    <div class="form-group">
                        <label for="txtUserName">Tên</label>
                        <input type="text" class="form-control" id="txtUserName" name="username" readonly value="${users.username}">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Tên</label>
                        <input type="text" class="form-control" id="txtEmail" name="email" readonly value="${users.email}">
                    </div>
                    <div class="form-group">
                        <label for="txtPass">Password</label>
                        <input type="password" class="form-control" id="txtPass" name="Pass" readonly value="${users.pass}">
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Địa chỉ</label>
                        <input type="text" class="form-control" id="txtAddress" name="Address" readonly value="${users.address}">
                    </div>
                    <div class="form-group">
                        <label for="txtDob">Ngày sinh</label>
                        <input type="date" class="form-control" id="txtDob" name="Date_o_Birth" readonly value="${users.date_o_Birth}">
                    </div>
                    <div class="form-group">
                        <label for="txtSed">Ngày hết hạn</label>
                        <input type="date" class="form-control" id="txtSed" name="Seller_Expired_Date" readonly value="${users.seller_Expired_date}">
                    </div>

                        <div class="custom-control custom-radio">
                            <input type="radio" value="1" id="customRadio1" name="userrole" class="custom-control-input" checked>
                            <label class="custom-control-label" for="customRadio1">Người mua</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" value="2" id="customRadio2" name="userrole" class="custom-control-input">
                            <label class="custom-control-label" for="customRadio2">Người bán</label>
                        </div>

                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/User/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger text-red-600" formaction="${pageContext.request.contextPath}/Admin/User/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                    <button type="submit" class="btn btn-primary text-blue-600" formaction="${pageContext.request.contextPath}/Admin/User/Update?Request_ID=${users.user_ID}">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>
