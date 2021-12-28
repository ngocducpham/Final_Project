<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="products" scope="request" type="com.final_project.beans.Product" />
<t:admin>
    <jsp:body>
        <form method="post">
            <div class="card">
                <h4 class="card-header  d-flex justify-content-between">
                    Xem sản phẩm
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtProID">#</label>
                        <input type="text" class="form-control" id="txtProID" name="Pro_ID" readonly value="${products.pro_ID}">
                    </div>
                    <div class="form-group">
                        <label for="txtPname">Tên</label>
                        <input type="text" class="form-control" id="txtPname" name="Pname" readonly value="${products.pname}">
                    </div>
                    <div class="form-group">
                        <label for="txtSPrice">Giá bắt đầu</label>
                        <input type="text" class="form-control" id="txtSPrice" name="Start_Price" readonly value="${products.start_Price}">
                    </div>
                    <div class="form-group">
                        <label for="txtEPrice">Giá hiện tại</label>
                        <input type="text" class="form-control" id="txtEPrice" name="Current_Price" readonly value="${products.current_Price}">
                    </div>
                    <div class="form-group">
                        <label for="txtSdate">Thời gian bắt đầu</label>
                        <input type="text" class="form-control" id="txtSdate" name="Start_Time" readonly value="${products.start_Time}">
                    </div>
                    <div class="form-group">
                        <label for="txtEdate">Thời gian kết thúc</label>
                        <input type="text" class="form-control" id="txtEdate" name="End_Time" readonly value="${products.end_Time}">
                    </div>
                    <div class="form-group">
                        <label for="txtTotal">Tổng bidder</label>
                        <input type="text" class="form-control" id="txtTotal" name="Total_Bid" readonly value="${products.total_Bid}">
                    </div>
                    <c:choose>
                        <c:when test="${products.status == 1}">
                            <div class="custom-control custom-radio">
                                <input type="radio" value="1" id="customRadio1" name="Status" class="custom-control-input" checked>
                                <label class="custom-control-label" for="customRadio1">Duyệt</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" value="0" id="customRadio2" name="Status" class="custom-control-input">
                                <label class="custom-control-label" for="customRadio2">Không duyệt</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="custom-control custom-radio">
                                <input type="radio" value="1" id="customRadio3" name="Status" class="custom-control-input" >
                                <label class="custom-control-label" for="customRadio3">Duyệt</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" value="0" id="customRadio4" name="Status" class="custom-control-input" checked>
                                <label class="custom-control-label" for="customRadio4">Không duyệt</label>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>

                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-primary text-blue-600" formaction="${pageContext.request.contextPath}/Admin/Product/Update">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>

