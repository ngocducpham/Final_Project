<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="productByID" scope="request" type="java.util.List<com.final_project.beans.Product>"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">Danh sách</h4>

            <c:choose>
                <c:when test="${productByID.size()==0}">
                    <div class="card-body">
                        <p class="card-text">DANH SÁCH TRỐNG</p>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="card-body">
                        <div class="row">
                            <c:forEach items="${productByID}" var="pro">
                                <div class="col-sm-4 mb-3">
                                    <div class="card-body h-100">
                                        <h5 class="card-title">${productByID.pname}</h5>
                                        <img src="${pageContext.request.contextPath}/public/imgProduct/${productByID.cat_ID}/main.jpg" alt="${productByID.pname}" class="card-img-top">
                                        <h6 class="card-title">
                                            <fmt:formatNumber value="${productByID.price}" type="number"/>
                                        </h6>

                                    </div>
                                    <div class="card-footer text-muted ">
                                        <a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/Product/DetailProduct?id=${pro.pro_ID}" role="button">
                                           <i class=" fa fa-eye" aria-hidden="true">
                                               Xem chi tiết
                                           </i>
                                        </a>
                                        <a class="btn btn-sm btn-outline-primary" href="#" role="button">
                                            <i class=" fa fa-cart-plus" aria-hidden="true"></i>" aria-hidden="true">
                                                Thêm vào giỏ hàng
                                            </i>
                                        </a>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:main>
