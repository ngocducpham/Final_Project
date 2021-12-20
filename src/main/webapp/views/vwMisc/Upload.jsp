<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>UPLOAD</title>
</head>
<body>

</body>
</html>

<t:main>
    <jsp:attribute name="css">
    <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
   <%-- <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js">--%>
    </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/themes/fa/theme.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.2.5/js/locales/vi.min.js"></script>
    <script>
        $('#fuMain').fileinput({
            theme: 'fa',
            language: 'vi',
            dropZoneEnabled: false,
            allowedFileExtensions: ['jpg', 'png', 'gif']
        });
    </script>

    </jsp:attribute>
    <jsp:body>
        <form  method="post" action="" enctype="multipart/form-data">
            <div class="card">
                <h4 class="card-header">UPLOAD</h4>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="txtPro">Products</label>
                    <input type="text" class="form-control" id="txtPro" name="namePro" autofocus>
                </div>

                <div class="form-group">
                    <input id="fuMain" name="fuMain" type="file"/>
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-check" aria-hidden="false"></i>
                    Save
                </button>
            </div>
        </form>
    </jsp:body>
</t:main>
