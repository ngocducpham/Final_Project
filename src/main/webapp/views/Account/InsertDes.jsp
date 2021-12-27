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
                plugins: 'lists link media autolink table image paste autosave wordcount code',
                language: 'vi',
                menubar: false,
                toolbar: [
                    'undo redo | bold italic underline strikethrough | alignleft aligncenter alignright | numlist bullist | table | link autolink media |' +
                    ' forecolor backcolor wordcount restoredraft|',
                ],
                entity_encoding: "raw",
            });

        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="profile ">

            <div class="top_header d-flex justify-content-between">
                <h4 class="h__profile ">
                    THÊM MÔ TẢ SẢN PHẨM
                </h4>
                <div >
                    <a class="btn btn-outline-success" role="button"
                       href="${pageContext.request.contextPath}/Personal/My_Post_Products">
                        <i class="fa fa-check" aria-hidden="true"> List</i>
                    </a>
                </div>

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

                    </div>

                        <%--Up hình--%>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="fullDes">Thêm mô tả sản phẩm</label>
                            <textarea id="fullDes" name="description"></textarea>
                        </div>
                    </div>

                        <%--                Button--%>
                    <button type="submit" class="btn btn-outline-success">
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
