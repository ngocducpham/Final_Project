<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.final_project.beans.Product>" />
<t:admin>
    <jsp:body>

        <div class="card ">
            <h3 class="card-header d-flex justify-content-between text-success font-weight-bold">
                Danh sách sản phẩm
            </h3>
            <c:choose>
                <c:when test="${products.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Tên sản phẩm</th>
                                <th>Tình trạng</th>
                                <th>Giá hiện tại</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>&nbsp;</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="c">
                                <tr>
                                    <td class="font-weight-bold">${c.pro_ID}</td>
                                    <td>${c.pname}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.status != 1}">
                                                <div class="text-warning ">Đã bán</div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-success">Còn bán</div>
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${c.current_Price}" type="number" />
                                    </td>
                                    <td>${c.start_Time.toLocalDate()}</td>
                                    <td>${c.end_Time.toLocalDate()}</td>
                                    <td class="text-right">
                                        <a title="Sửa sản phẩm" class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${c.pro_ID}" role="button">
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
