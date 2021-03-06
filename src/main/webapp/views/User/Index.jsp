<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="users" scope="request" type="java.util.List<com.final_project.beans.User>" />
<t:admin>
    <jsp:body>

        <div class="card">
            <h3 class="card-header d-flex justify-content-between text-success font-weight-bold">
                Danh sách người dùng
            </h3>
            <c:choose>
                <c:when test="${users.size() == 0}">
                    <div class="card-body">
                        <p class="card-text text-danger">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Tên user</th>
                                <th>Email</th>
                                <th>Vai trò</th>
                                <th>&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="c">
                                <c:if test="${c.user_ID != 7}">
                                    <tr>
                                        <td class="font-weight-bold">${c.user_ID}</td>
                                        <td>${c.username}</td>
                                        <td>${c.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${c.userrole== 1}">
                                                    Bidder
                                                </c:when>
                                                <c:when test="${c.userrole== 2}">
                                                    Seller
                                                </c:when>
                                                <c:otherwise>
                                                    Admin
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-right">
                                            <a title="Sửa người dùng" class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/User/Edit?id=${c.user_ID}" role="button">
                                                <i class="fa fa-pencil" aria-hidden="true"></i>
                                            </a>

                                            <a title="Reset mật khẩu" class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/Admin/User/Reset?id1=${c.user_ID}" role="button">
                                                <i class="fa fa-key" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:if>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:admin>
