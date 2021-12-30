<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="adminlogin" scope="session" type="java.lang.Boolean" />
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/public/scripts/tailwindcss.js"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <jsp:invoke fragment="css"/>
    <title>Admin Dashboard</title>
    <style>
        a:hover {text-decoration: none; color: black;}
    </style>
</head>

<body>

<form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Admin/Logout"></form>
<main class="bg-white container-fluid">
    <div class="row">
        <div class="col-2 bg-dark">
            <div class="d-flex justify-content-center mt-10 ">
                <p class="font-bold text-xl">
                    <svg class='h-10' fill="none" viewBox="0 0 143 32" xmlns="http://www.w3.org/2000/svg">
                        <path fill="#6366f1"
                              d="M15.258 26.865a4.043 4.043 0 01-1.133 2.917A4.006 4.006 0 0111.253 31a3.992 3.992 0 01-2.872-1.218 4.028 4.028 0 01-1.133-2.917c.009-.698.2-1.382.557-1.981.356-.6.863-1.094 1.47-1.433-.024.109.09-.055 0 0l1.86-1.652a8.495 8.495 0 002.304-5.793c0-2.926-1.711-5.901-4.17-7.457.094.055-.036-.094 0 0A3.952 3.952 0 017.8 7.116a3.975 3.975 0 01-.557-1.98 4.042 4.042 0 011.133-2.918A4.006 4.006 0 0111.247 1a3.99 3.99 0 012.872 1.218 4.025 4.025 0 011.133 2.917 8.521 8.521 0 002.347 5.832l.817.8c.326.285.668.551 1.024.798.621.33 1.142.826 1.504 1.431a3.902 3.902 0 01-1.504 5.442c.033-.067-.063.036 0 0a8.968 8.968 0 00-3.024 3.183 9.016 9.016 0 00-1.158 4.244zM19.741 5.123c0 .796.235 1.575.676 2.237a4.01 4.01 0 001.798 1.482 3.99 3.99 0 004.366-.873 4.042 4.042 0 00.869-4.386 4.02 4.02 0 00-1.476-1.806 3.994 3.994 0 00-5.058.501 4.038 4.038 0 00-1.175 2.845zM23.748 22.84c-.792 0-1.567.236-2.226.678a4.021 4.021 0 00-1.476 1.806 4.042 4.042 0 00.869 4.387 3.99 3.99 0 004.366.873A4.01 4.01 0 0027.08 29.1a4.039 4.039 0 00-.5-5.082 4 4 0 00-2.832-1.18zM34 15.994c0-.796-.235-1.574-.675-2.236a4.01 4.01 0 00-1.798-1.483 3.99 3.99 0 00-4.367.873 4.042 4.042 0 00-.869 4.387 4.02 4.02 0 001.476 1.806 3.993 3.993 0 002.226.678 4.003 4.003 0 002.832-1.18A4.04 4.04 0 0034 15.993z"/>
                        <path fill="#6366f1"
                              d="M5.007 11.969c-.793 0-1.567.236-2.226.678a4.021 4.021 0 00-1.476 1.807 4.042 4.042 0 00.869 4.386 4.001 4.001 0 004.366.873 4.011 4.011 0 001.798-1.483 4.038 4.038 0 00-.5-5.08 4.004 4.004 0 00-2.831-1.181z"/>
                        <path fill="#6366f1"
                              d="M58.664 11.136l-2.04 7.392-2.184-7.392h-2.928l-2.184 7.368-2.04-7.368H44l3.816 12h2.952l2.208-7.272 2.208 7.272h2.952l3.816-12h-3.288zM68.864 23.472c3.528 0 6.36-2.76 6.36-6.336 0-3.576-2.832-6.336-6.36-6.336-3.528 0-6.336 2.76-6.336 6.336 0 3.576 2.808 6.336 6.336 6.336zm0-3.024c-1.824 0-3.24-1.368-3.24-3.312 0-1.944 1.416-3.312 3.24-3.312 1.848 0 3.264 1.368 3.264 3.312 0 1.944-1.416 3.312-3.264 3.312zM80.498 13.2v-2.064h-3.096v12h3.096V17.4c0-2.52 2.04-3.24 3.648-3.048v-3.456c-1.512 0-3.024.672-3.648 2.304zM97.02 23.136l-4.967-6.072 4.824-5.928H93.18l-4.128 5.28V6.336h-3.096v16.8h3.096v-5.448l4.368 5.448h3.6zM105.022 6c-3.816 0-5.64 1.704-5.64 5.016v.12h-1.728v2.976h1.728v9.024h3.096v-9.024h1.992v-2.976h-1.992v-.12c0-1.632.936-2.304 2.544-2.304.312 0 .648 0 .984.024v14.4h3.096V6.504c-1.32-.264-2.568-.504-4.08-.504zM117.637 23.472c3.528 0 6.36-2.76 6.36-6.336 0-3.576-2.832-6.336-6.36-6.336-3.528 0-6.336 2.76-6.336 6.336 0 3.576 2.808 6.336 6.336 6.336zm0-3.024c-1.824 0-3.24-1.368-3.24-3.312 0-1.944 1.416-3.312 3.24-3.312 1.848 0 3.264 1.368 3.264 3.312 0 1.944-1.416 3.312-3.264 3.312zM139.219 11.136l-2.04 7.392-2.184-7.392h-2.928l-2.184 7.368-2.04-7.368h-3.288l3.816 12h2.952l2.208-7.272 2.208 7.272h2.952l3.816-12h-3.288z"/>
                    </svg>
                </p>
            </div>
            <!--Thanh bên-->
            <div class="mt-10 w-100">
                <c:if test="${adminlogin}">
                    <div>
                        <button  style="border-radius: 1vw;" type="button" class="btn btn-light w-full p-3 text-white mb-2 ">
                            <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/Admin/Dashboard/">
                                <span class="iconify h-5 w-5" data-icon="ant-design:home-filled"></span>
                                <span class="mx-4 text-md font-normal">
                                    Trang chính
                                </span>
                            </a>
                        </button>
                    </div>
                    <div>
                        <button style="border-radius: 1vw;"  type="button" class="btn btn-light w-full  p-3 text-white mb-2">
                            <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/Admin/User/">
                                <span class="iconify" data-icon="bx:bxs-user"></span>
                                <span class="mx-4 text-md font-normal">
                                    Người dùng
                                </span>
                            </a>
                        </button>
                    </div>
                    <div>
                        <button  style="border-radius: 1vw;" type="button" class="btn btn-light w-full  p-3 text-white mb-2">
                            <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/Admin/Category/">
                                <span class="w-5 h-5 iconify" data-icon="bx:bx-category"></span>
                                <span class="mx-4 text-md font-normal">
                                     Danh mục
                                </span>
                            </a>
                        </button>
                    </div>
                    <div>
                        <button  style="border-radius: 1vw;" type="button" class="btn btn-light w-full  p-3 text-white mb-2 ">
                            <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/Admin/Product/">
                                <span class="iconify" data-icon="gridicons:product"></span>
                                <span class="mx-4 text-md font-normal">
                                      Sản phẩm
                                </span>
                            </a>
                        </button>
                    </div>
                    <div>
                        <button  style="border-radius: 1vw;" type="button" class="btn btn-light w-full  p-3 text-white mb-2">
                            <a class="d-flex justify-content-center" href="${pageContext.request.contextPath}/Admin/Request/">
                                <span class="iconify" data-icon="bi:chat-dots-fill"></span>
                                <span class="mx-4 text-md font-normal">
                                      Yêu cầu
                                </span>
                            </a>
                        </button>
                    </div>
                    <div>
                        <button  style="border-radius: 1vw;" type="button" class="btn btn-light w-full  p-3 text-white mb-2 ">
                            <a class="d-flex justify-content-center" href="javascript: $('#frmLogout').submit()">
                                <span class="iconify" data-icon="entypo:log-out"></span>
                                <span class="mx-4 text-md font-normal">
                                       Đăng xuất
                                </span>
                            </a>
                        </button>
                    </div>

                </c:if>
            </div>
        </div>
        <div class="col-10">
            <div class="overflow-auto h-screen mt-10">
                <jsp:doBody/>
            </div>

        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<jsp:invoke fragment="js"/>
</body>

</html>