<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="products" scope="request" type="com.final_project.beans.Product" />
<t:admin>
     <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>

        <script>
            tinymce.init({
                selector: '#fullDes',
                height: 300,
                width: 1000,
                plugins: 'lists link media autolink table image paste autosave',
                language: 'vi',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | numlist bullist | link autolink | table media | restoredraft| forecolor backcolor',
                ],
                entity_encoding :"raw",
            });

        </script>
    </jsp:attribute>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header  d-flex justify-content-between">
                    Xem sản phẩm
                </h4>
                <div class="card-body">
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
                    <div class="card">
                        <div class="card-body">
                            <label for="fullDes">Mô tả sản phẩm</label>
                            <textarea id="fullDes" name="description"></textarea>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/Admin/Product/" role="button">
                        <i class="fa fa-backward" aria-hidden="true"></i>
                        List
                    </a>
                    <button type="submit" class="btn btn-danger text-red-600" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                        Delete
                    </button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:admin>

