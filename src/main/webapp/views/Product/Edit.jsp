<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="products" scope="request" type="com.final_project.beans.Product" />
<t:admin>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header  d-flex justify-content-between">
                    Sửa sản phẩm
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtPname">Tên</label>
                        <input type="text" class="form-control" id="txtPname" name="Pname" readonly value="${products.pname}">
                    </div>
                    <div class="form-group">
                        <label for="txtPrice">Gía</label>
                        <input type="text" class="form-control" id="txtPrice" name="Price" autofocus value="${products.price}">
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button style="color: red" type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>

