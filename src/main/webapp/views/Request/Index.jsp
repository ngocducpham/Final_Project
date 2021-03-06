<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="requests" scope="request" type="java.util.List<com.final_project.beans.Request>" />
<t:admin>
    <jsp:body>

        <div class="card ">
            <h4 class="card-header d-flex justify-content-between text-success font-weight-bold">
                Danh sách yêu cầu nâng Seller
            </h4>
            <c:choose>
                <c:when test="${requests.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover table-striped table-bordered">
                            <thead class="thead-dark" >
                            <tr>
                                <th>#</th>
                                <th>ID người dùng</th>
                                <th>Tên user</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requests}" var="r">
                                <tr>
                                    <td>${r.request_ID}</td>
                                    <td>${r.user_ID}</td>
                                    <td>${r.username}</td>
                                    <td class="text-right">
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/User/Edit?id=${r.user_ID}&userRequest=${r.request_ID}" role="button">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:admin>
