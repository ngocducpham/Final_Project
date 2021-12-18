<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Đăng nhập</title>
</head>

<body style='background-image: url("${pageContext.request.contextPath}/public/imgs/top-5-bg.jpg");'>
<div class='max-w-sm mx-auto'>
    <div class='flex flex-col mt-10'>
        <div class='w-14 h-14 mx-auto'>
            <img src="${pageContext.request.contextPath}/public/imgs/icon.svg" alt="">
        </div>
        <div class='mt-5 text-center text-xl font-medium text-gray-700'>
            Đăng nhập
        </div>
    </div>
    <div class='mt-5'>
        <form action="#" method='POST'>
            <div class='shadow-lg rounded-lg p-8 bg-white flex flex-col'>
                <div>
                    <label for='email-address' class='font-medium text-gray-600'>Địa chỉ email</label>
                    <input id="email-address" name="email" type="email" autocomplete="email" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300 text-gray-700'>
                </div>
                <div class='mt-5'>
                    <div class='flex justify-between'>
                        <label for='password' class='font-medium text-gray-600'>Mật khẩu</label>
                        <a href="#" class='text-indigo-600 hover:underline block'>Quên mật khẩu</a>
                    </div>
                    <input id="password" name="password" type="password" autocomplete="current-password" required
                           class='mt-2 w-full px-2 py-1 outline-none block border-2 rounded-md  border-gray-300'>
                </div>
                <div class='alert__login text-red-500 mt-3 hidden'>Mật khẩu hoặc tài khoản không đúng</div>
                <div class='mt-8'>
                    <button type="submit"
                            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none">
                            <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                                <!-- Heroicon name: solid/lock-closed -->
                                <svg class="h-5 w-5 text-indigo-500 group-hover:text-indigo-400"
                                     xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                                     aria-hidden="true">
                                    <path fill-rule="evenodd"
                                          d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                                          clip-rule="evenodd" />
                                </svg>
                            </span>
                        Đăng nhập
                    </button>
                </div>
                <div class='mt-3'>
                    Chưa có tài khoản? <a href="#" class='text-indigo-600 hover:underline'>Đăng kí ngay!</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>



<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Login</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
<%--</head>--%>
<%--<body style="height: 100vh">--%>
<%--<div class="container-fluid h-100">--%>
<%--    <div class="row h-100 justify-content-center align-items-center">--%>
<%--        <div class="col-sm-4">--%>
<%--&lt;%&ndash;            <c:if test="${hasError}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="alert alert-warning alert-dismissible fade show" role="alert">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <strong>Login failed!</strong> ${errorMessage}&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <span aria-hidden="true">&times;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </c:if>&ndash;%&gt;--%>
<%--            <form action="" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label class="sr-only" for="Username">Email</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <input type="text" class="form-control form-control-lg border-right-0" id="Username" name="email" autofocus placeholder="email">--%>
<%--                        <div class="input-group-append">--%>
<%--                <span class="input-group-text bg-white">--%>
<%--                  <i class="fa fa-user" aria-hidden="true"></i>--%>
<%--                </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label class="sr-only" for="Password">Mật Khẩu</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <input type="password" class="form-control form-control-lg border-right-0" id="Password" name="password" placeholder="Password">--%>
<%--                        <div class="input-group-append">--%>
<%--                <span class="input-group-text bg-white">--%>
<%--                  <i class="fa fa-key" aria-hidden="true"></i>--%>
<%--                </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group d-flex">--%>
<%--                    <div>--%>
<%--                        <a class="btn btn-lg btn-danger" href="" role="button">--%>
<%--                            <i class="fa fa-home" aria-hidden="true"></i>--%>
<%--                            Home--%>
<%--                        </a>--%>
<%--                    </div>--%>
<%--                    <div class="flex-fill ml-1">--%>
<%--                        <button type="submit" class="btn btn-lg btn-success btn-block">--%>
<%--                            <i class="fa fa-sign-in" aria-hidden="true"></i>--%>
<%--                            Sign In--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>--%>
<%--</body>--%>
<%--</html>--%>

