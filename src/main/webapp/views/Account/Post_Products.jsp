<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="Category" scope="request" type="java.util.List<com.final_project.beans.Category>"/>

<t:personal_page>
    <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>

        <script>
            tinymce.init({
                selector: '#fullDes',
                height: 300,
                plugins: 'lists link media autolink table image paste autosave wordcount code',
                language: 'vi',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | alignleft aligncenter alignright | numlist bullist | table | link autolink media |' +
                    ' forecolor backcolor wordcount restoredraft|',
                ],
                entity_encoding: "raw",
            });
            var today = new Date().toISOString().slice(0, 16);

            document.getElementsByName("End_Time")[0].min = today;

            let price = document.getElementById('price');
            let stepPrice = document.getElementById('step_price');

            document.getElementById('btnsubmitproduct').addEventListener('click', () => {
                let form = document.getElementById('postproductform');
                if (form.checkValidity()) {
                    if(isNumeric(price.value) && isNumeric(stepPrice.value))
                        form.submit();
                    else alert('Kiểm tra lại giá');
                } else form.reportValidity();
            })

            function isNumeric(value) {
                return /^\d+$/.test(value);
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile ">

            <div class="top_header d-flex justify-content-between">
                <div style="font-weight: bold;font-size: 36px">Đăng bán <span
                        style="color:red;">sản phẩm</span>
                </div>

            </div>

            <div class="boxProfile mt-5">
                <form id="postproductform" action="" method="post" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="pname">Tên sản phẩm</label>
                            <input type="text" required class="form-control background" name="Pname" id="pname"
                            >
                        </div>
                        <div class="form-group col-md-6">
                            <label for="price">Giá khởi điểm</label>
                            <input type="number" required class="form-control background" name="Price" id="price">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="step_price">Bước Giá</label>
                            <input type="number" required class="form-control background" name="Step-Price"
                                   id="step_price">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="catid">Chọn danh mục</label>
                        <select class="custom-select" name="Cat_ID" id="catid">
                            <c:forEach items="${Category}" var="p">
                                <option value="${p.cat_ID}">${p.cname}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group ">

                        <label for="end_time">
                            Ngày kết thúc: </label> <br/>
                        <input id="end_time" name="End_Time" type="datetime-local" required
                               class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700">

                    </div>
                        <%--Up hình--%>
                    <div class="form-group">
                        <label for="img_main">Hình ảnh chính</label>
                        <input type="file" required class="form-control background" name="img_main" id="img_main"
                               value="" accept=".jpg">
                    </div>

                    <div class="form-group">
                        <label for="img1">Hình ảnh phụ 1</label>
                        <input type="file" required class="form-control background" name="img1" id="img1"
                               value="" accept=".jpg">
                    </div>
                    <div class="form-group">
                        <label for="img2">Hình ảnh phụ 2</label>
                        <input type="file" required class="form-control background" name="img2" id="img2"
                               value="" accept=".jpg">
                    </div>
                    <div class="form-group">
                        <label for="img3">Hình ảnh phụ 3</label>
                        <input type="file" required class="form-control background" name="img3" id="img3"
                               value="" accept=".jpg">
                    </div>
                    <div class="form-group">
                        <label for="img4">Hình ảnh phụ 4</label>
                        <input type="file" required class="form-control background" name="img4" id="img4"
                               value="" accept=".jpg">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="fullDes">Mô tả sản phẩm</label>
                            <textarea id="fullDes" name="description"></textarea>
                        </div>
                    </div>

                        <%--                Button--%>
                    <button id="btnsubmitproduct" type="button" class="btn btn-outline-success">
                        <i class="fa fa-check" aria-hidden="true"></i>
                        Lưu
                    </button>

                    <button type="button" class="btn btn-outline-danger" id="close_edit">
                        <i class="fa fa-times" aria-hidden="true"></i>
                        Huỷ
                    </button>
                </form>
            </div>
        </div>
    </jsp:body>
</t:personal_page>
