<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.final_project.beans.Product>" />

<t:admin>
    <jsp:body>

        <div class="card ">
            <h4 class="card-header d-flex justify-content-between">
                Danh sách sản phẩm
                <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/Add"    role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Thêm
                </a>
            </h4>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Tình trạng</th>
                                <th>&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="c">
                                <tr>
                                    <td>${c.pro_ID}</td>
                                    <td>${c.pname}</td>
                                    <td>
                                        <fmt:formatNumber value="${c.price}" type="number" />
                                    </td>
                                    <td>${c.status}</td>
                                    <td class="text-right">
                                        <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${c.pro_ID}" role="button">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                        <a class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}" role="button">
                                            <i class=" fa fa-trash" aria-hidden="true"></i>
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
