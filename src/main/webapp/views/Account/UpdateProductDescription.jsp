<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="proname" scope="request" type="java.lang.String"/>
<jsp:useBean id="proid" scope="request" type="java.lang.String"/>

<t:personal_page>
    <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js"
                referrerpolicy="origin"></script>
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
        <div>Tên sản phẩm: ${proname}</div>
        <div class="mt-5">Bổ sung mô tả sản phẩm:</div>
        <form method="post">
            <textarea id="fullDes" name="description"></textarea>
            <input type="hidden" name="proid" value="${proid}">
            <button class="btn btn-success mt-3">
                Lưu</button>
            <a href="${pageContext.request.contextPath}/Personal/My_Post_Products?option=1" class="btn btn-primary mt-3">
                Quay về</a>
        </form>

    </jsp:body>
</t:personal_page>