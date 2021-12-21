<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:useBean id="productDetail" scope="request" type="com.final_project.beans.Product"/>

<t:main>
    <jsp:body>
        <div class="card">
            <h4 class="card-header">
                ${productDetail.pname}
            </h4>
            <div class="card-body mb-3">
                <img src="${pageContext.request.contextPath}/public/imgProduct/${productDetail.pro_ID}/main.jsp"
                     alt="${productDetail.pname}" title="${productDetail.pname}">
                <div class="card-text mt-3">
                    <p>Gía bán:
                    <span class="card-text mt-3">
                        <fmt:formatNumber value="${productDetail.price}" type="number"/>
                    </span></p>
                    <p>Số lượng: ${productDetail.price}</p>
                    <h6>Mô tả <br/></h6>
                    <div class="card-text">${productDetail.description}</div>
                </div>
            </div>


        </div>
    </jsp:body>
</t:main>

