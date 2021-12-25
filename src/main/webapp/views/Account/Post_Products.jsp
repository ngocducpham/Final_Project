<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="Cate" scope="request" type="java.util.List<com.final_project.beans.Category>"/>

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
                entity_encoding: "raw",
            });

        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile ">

            <div class="top_header d-flex justify-content-between">
                <h4 class="h__profile ">
                    SẢN PHẨM ĐĂNG BÁN

                </h4><a class="btn btn-outline-success" role="button"
                        href="${pageContext.request.contextPath}/Admin/Product/">
                <i class="fa fa-check" aria-hidden="true"></i>
                List
            </a>
            </div>

            <div class="boxProfile ">
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="pname">Tên sản phẩm</label>
                            <input type="text" class="form-control background" name="Pname" id="pname"
                                   placeholder="iPhone 13"
                                   value="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="price">Giá khởi điểm</label>
                            <input type="text" class="form-control background" name="Price" id="price"
                                   value="" placeholder="16.000.000 VND">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="step_price">Bước Giá</label>
                            <input type="text" class="form-control background" name="Step-Price" id="step_price"
                                   placeholder="iPhone 13"
                                   value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="catid">Chọn danh mục</label>
                        <select class="custom-select" name="Cat_ID" id="catid">
                            <option value="6">6--Quần áo</option>
                            <option value="7">7--Giày dép</option>
                            <option value="8">8--Dụng cụ thể thao</option>
                            <option value="9">9--Thực phẩm hỗ trợ</option>
                            <option value="10">10--Laptop</option>
                            <option value="11">11--Điện thoại</option>
                            <option value="12">12--Đồng hồ</option>

                                <%--                        <c:forEach var="i" step="1">--%>
                                <%--                            <option>${Cate.Cat_ID}</option>--%>
                                <%--                        </c:forEach>--%>
                        </select>
                    </div>

                    <div class="form-group ">

                            <%--                    <label for="start_time" >--%>
                            <%--                        Ngày đấu giá: </label><br />--%>
                            <%--                    <input id="start_time" name="Start_Time" type="datetime-local" required--%>
                            <%--                       class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700">--%>

                        <label for="end_time">
                            Ngày kết thúc: </label> <br/>
                        <input id="end_time" name="End_Time" type="datetime-local" required
                               class="mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700">

                    </div>
                        <%--Up hình--%>
                    <div class="form-group">
                        <label for="img_main">Hình ảnh Chính</label>
                        <input type="file" class="form-control background" name="img_main" id="img_main"
                               value="">
                    </div>

                    <div class="form-group">
                        <label for="img1">Hình ảnh phụ 1</label>
                        <input type="file" class="form-control background" name="img1" id="img1"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="img2">Hình ảnh Phụ 2</label>
                        <input type="file" class="form-control background" name="img2" id="img2"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="img3">Hình ảnh Phụ 3</label>
                        <input type="file" class="form-control background" name="img3" id="img3"
                               value="">
                    </div>
                    <div class="form-group">
                        <label for="img4">Hình ảnh Phụ 4</label>
                        <input type="file" class="form-control background" name="img4" id="img4"
                               value="">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="fullDes">Mô tả sản phẩm</label>
                            <textarea id="fullDes" name="description"></textarea>
                        </div>
                    </div>

                        <%--                Button--%>
                    <button type="submit" class="btn btn-outline-success">

                        <i class="fa fa-check" aria-hidden="true"></i>
                        Lưu

                    </button>

                    <button type="button" class="btn btn-outline-danger" id="close_edit">
                            <%--                    <a href="${pageContext.request.contextPath}/Personal/Post_Products" role="button">--%>
                        <i class="fa fa-times" aria-hidden="true"></i>
                        Huỷ
                            <%--                    </a>--%>
                    </button>
                </form>
            </div>
        </div>
    </jsp:body>
</t:personal_page>
