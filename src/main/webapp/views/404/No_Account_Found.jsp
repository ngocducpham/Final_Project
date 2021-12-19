<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <title>Title</title>
</head>
<body style='background-image: url("${pageContext.request.contextPath}/public/imgs/top-5-bg.jpg");'>
<div class="container-fluid h-100">
    <div class="row h-100 align-items-center">
        <div class="col-sm-12">
            <div class="card shadow w-50 mx-auto">
                <div class="card-body">
                    <h1 class="card-title"> Đã Xảy Ra Lỗi !!!</h1>
                    <h2 class="text-danger">Không tìm thấy tài khoản nào khớp với dịa chỉ email bạn vừa nhập!!!</h2>
                    <p class="card-text">
                        Hãy Tạo Một Tài Khoản và Quên Email của bạn để thực hiện chức năng này
                    </p>
                    <div>
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/" role="button">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            Trang Chủ
                        </a>
                        <a class="btn btn-success" href="${pageContext.request.contextPath}/Account/Register" role="button">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            Tạo tài Khoản
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>








