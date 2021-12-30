<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="category" scope="request" type="com.final_project.beans.Category"/>

<t:admin>
    <jsp:attribute name="js">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
        <script>
            $('#FormCategory').on('submit', function (e) {
                e.preventDefault();
                const val = $('#txtCatID').val();
                const val1 = $('#txtLevel').val();
                if (val == null) {
                    alert('Không có danh mục !');
                    e.preventDefault();
                    return;
                }

                $.getJSON('/Final_Project/Admin/Category/IsAvailable?Cat_ID=' + val, function (data) {
                    if (data === true) {
                        if (val1 !== 1) {
                            alert("Xóa danh mục thành công !")
                            $('#FormCategory').off('submit').submit();
                        }
                    } else {
                        alert('Danh mục đang tồn tại sản phẩm !');
                    }
                });
            });
        </script>

        </jsp:attribute>
    <jsp:body>
        <form method="post" id="FormCategory">
            <div class="card">
                <div class="card-header">
                    Xóa danh mục
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtCatID">#</label>
                        <input type="text" class="form-control" id="txtCatID" name="Cat_ID" readonly
                               value="${category.cat_ID}">
                    </div>
                    <div class="form-group">
                        <label for="txtLevel">Con ID cấp cha</label>
                        <input type="text" class="form-control" id="txtLevel" name="Level" readonly
                               value="${category.level}">
                    </div>
                    <div class="form-group">
                        <label for="txtCatName">Tên</label>
                        <input type="text" class="form-control" id="txtCatName" name="Cname" readonly
                               value="${category.cname}">
                    </div>
                </div>
                <div class="card-footer d-flex justify-between">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Category/"
                       role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" onclick="return confirm('Bạn có chắc muốn xóa dữ liệu này?')" class="btn  btn-danger text-red-600"
                            formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                </div>
            </div>
        </form>

    </jsp:body>

</t:admin>
