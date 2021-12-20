<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="categories" scope="request" type="com.final_project.beans.Category" />

<t:admin>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <div class="card-header">
                    Sửa danh mục
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatID">#</label>
                        <input type="text" class="form-control" id="txtCatID" name="Cat_ID" readonly value="${categories.cat_ID}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Tên</label>
                        <input type="text" class="form-control" id="txtCatName" name="Cname" autofocus value="${categories.cname}">
                    </div>
                    <div class="form-group">
                        <label for="txtlevel">Cấp danh mục</label>
                        <select class="custom-select" id="txtlevel" name="level">
                            <option value="1" >1</option>
                            <option value="2">2</option>
                        </select>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="CatparentID" id="txtCatparent" value="${categories.cname}">
                        <label class="form-check-label" for="txtCatparent">Điện thoại</label>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                    <button type="submit" class="btn btn-primary" formaction="${pageContext.request.contextPath}/Admin/Category/Update">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>
