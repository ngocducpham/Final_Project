<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.final_project.beans.Category>" />

<t:admin>
    <jsp:body>

        <div class="card ">
            <h4 class="card-header d-flex justify-content-between">
                Danh sách danh mục
                <a title="Thêm danh mục" class="btn btn-outline-success"
                   href="${pageContext.request.contextPath}/Admin/Category/Add"    role="button">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Thêm
                </a>
            </h4>
            <c:choose>
                <c:when test="${categories.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover table-primary">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mặt hàng</th>
                                <th>ID Danh mục cấp 1</th>
                                <th>&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categories}" var="c">
                                <tr>
                                    <td>${c.cat_ID}</td>
                                    <td>${c.cname}</td>
                                    <td>
                                       ${c.cparent_ID}
                                    </td>
                                    <td class="text-right">
                                        <a title="Sửa danh mục" class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Category/Edit?id=${c.cat_ID}"  role="button">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                        <a title="Xóa danh mục" class="btn btn-sm btn-outline-danger" href="${pageContext.request.contextPath}/Admin/Category/Delete?id=${c.cat_ID}"  role="button">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
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
