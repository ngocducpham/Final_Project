<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
    <jsp:attribute name="js">
        <script src="https://cdn.tiny.cloud/1/tqma32h5o4jgstj9c1lfgu7ap5gaygxnz1x7xsumn9l0ivcn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
        tinymce.init({
            selector: '#fullDes',
            height: 500,
            plugins: 'lists link',
            menubar:false,
            toolbar: ['undo redo | bold italic underlight strikerthrough | numlist bullist | link']
        });
        </script>
    </jsp:attribute>
    <jsp:body>
    <form method="post" action="">
        <div class="card">
            <h4 class="card-header">THÔNG TIN SẢN PHẨM</h4>
            <div class="card-body">
                <div class="form-group">
                    <label for="shortDes">Mô tả sản phẩm</label>
                    <input type="text" class="form-control" id="shortDes" name="ShortDes">
                </div>
                <div class="form-group">
                    <label for="fullDes">Mô tả sản phẩm</label>
                    <textarea id="fullDes" name="FullDes"></textarea>
                </div>
            </div>
            <div class="=card-footer">
                <div class="">
                    <button type="submit" class="btn btn-primay">
                       <i class=" fa fa-check" aria-hidden="true"></i> SAVE
                    </button>
                </div>
            </div>
        </div>
    </form>
    </jsp:body>
</t:main>

