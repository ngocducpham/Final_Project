<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<t:admin>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <div class="card-header">
                    + Thêm danh mục
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatName">Category</label>
                        <input type="text" class="form-control" id="txtCatName" name="Cname" autofocus>
                    </div>
                </div>
                <div class="card-footer d-flex justify-between">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button style="color: blue" type="submit" class="btn btn-success">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Save
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>
