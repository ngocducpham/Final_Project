<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<t:personal_page>
    <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>

        <script>
            tinymce.init({
                selector: '#fullDes',
                height: 300,
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
    <div class="profile">

        <div class="top_header">
            <p class="h__profile">SẢN PHẦM ĐĂNG BÁN</p>
        </div>

        <div class="boxProfile container-fluid">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="pname">Tên sản phẩm</label>
                        <input type="text" class="form-control background" name="Pname" id="pname"
                               value="">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="startprice">Giá khởi điểm</label>
                        <input type="text" class="form-control background" name="Start_Price" id="startprice"
                               value="" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="catid">Chọn danh mục</label>
                    <select class="custom-select" name="Cat_ID" id="catid">
                        <option value="1">đổ dữ liệu vào</option>
                    </select>
                </div>

                <div class="form-group">

                    <label for="start_time" class="#">
                        Ngày đấu giá: </label>
                    <input id="start_time" name="start_time" type="date" required
                       class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700">

                    <label for="end_time" class="#">
                        Ngày kết thúc: </label>
                    <input id="end_time" name="end_time" type="date" required
                       class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700">

                </div>

                <div class="form-group">
                    <label for="img">Hình ảnh</label>
                    <input type="file" class="form-control background" name="img" id="img"
                           value="">
                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="fullDes">Mô tả sản phẩm</label>
                        <textarea id="fullDes" name="description"></textarea>
                    </div>
                </div>
                <button type="submit" class="btn btn-outline-success"><i class="fa fa-check"></i>
                    Lưu
                </button>
                <button type="button" class="btn btn-outline-danger" id="close_edit"><i class="fa fa-times"></i>
                    Huỷ
                </button>
            </form>
        </div>
    </div>
    </jsp:body>
</t:personal_page>
