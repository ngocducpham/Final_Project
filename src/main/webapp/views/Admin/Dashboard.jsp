<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:admin>
    <jsp:attribute name="js">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    </jsp:attribute>
    <jsp:attribute name="css">
        <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    </jsp:attribute>
    <jsp:body>
        <main class="bg-gray-100  h-screen overflow-hidden relative">
            <div class="flex items-start justify-between">
                <div class="h-screen hidden lg:block shadow-lg relative w-80">
                    <div class="bg-white h-full ">
                        <div class="flex items-center justify-start pt-6 ml-5">
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
                        <nav class="mt-10">
                            <!--   Thanh bên -->
<%--                            <div>--%>
<%--                                <a class="w-full text-gray-800  flex items-center pl-6 p-2 my-2 transition-colors duration-200 justify-start border-l-4 border-purple-500"--%>
<%--                                   href="#">--%>
<%--                                <span class="text-left">--%>
<%--                                    <svg width="20" height="20" fill="currentColor" viewBox="0 0 1792 1792"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path--%>
<%--                                                d="M1472 992v480q0 26-19 45t-45 19h-384v-384h-256v384h-384q-26 0-45-19t-19-45v-480q0-1 .5-3t.5-3l575-474 575 474q1 2 1 6zm223-69l-62 74q-8 9-21 11h-3q-13 0-21-7l-692-577-692 577q-12 8-24 7-13-2-21-11l-62-74q-8-10-7-23.5t11-21.5l719-599q32-26 76-26t76 26l244 204v-195q0-14 9-23t23-9h192q14 0 23 9t9 23v408l219 182q10 8 11 21.5t-7 23.5z">--%>
<%--                                        </path>--%>
<%--                                    </svg>--%>
<%--                                </span>--%>
<%--                                    <span class="mx-2 text-sm font-normal">--%>
<%--                                    Người dùng--%>
<%--                                </span>--%>
<%--                                </a>--%>
<%--                                <a class="w-full text-gray-400 flex items-center pl-6 p-2 my-2 transition-colors duration-200 justify-start hover:text-gray-800 border-l-4 border-transparent"--%>
<%--                                   href="#">--%>
<%--                                <span class="text-left">--%>
<%--                                    <svg width="20" height="20" fill="currentColor" viewBox="0 0 2048 1792"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path--%>
<%--                                                d="M1070 1178l306-564h-654l-306 564h654zm722-282q0 182-71 348t-191 286-286 191-348 71-348-71-286-191-191-286-71-348 71-348 191-286 286-191 348-71 348 71 286 191 191 286 71 348z">--%>
<%--                                        </path>--%>
<%--                                    </svg>--%>
<%--                                </span>--%>
<%--                                    <span class="mx-2 text-sm font-normal">--%>
<%--                                    Cấu hình--%>
<%--                                </span>--%>
<%--                                </a>--%>
<%--                                <a class="w-full text-gray-400 flex items-center pl-6 p-2 my-2 transition-colors duration-200 justify-start hover:text-gray-800 border-l-4 border-transparent"--%>
<%--                                   href="#">--%>
<%--                                    <span class="w-5 h-5 iconify" data-icon="bx:bx-category"></span>--%>
<%--                                    <span class="mx-4 text-sm font-normal">--%>
<%--                                    Danh mục--%>
<%--                                </span>--%>
<%--                                </a>--%>
<%--                                <a class="w-full text-gray-400 flex items-center pl-6 p-2 my-2 transition-colors duration-200 justify-start hover:text-gray-800 border-l-4 border-transparent"--%>
<%--                                   href="">--%>
<%--                                <span class="text-left">--%>
<%--                                    <svg width="20" height="20" fill="currentColor" viewBox="0 0 1792 1792"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path--%>
<%--                                                d="M1728 608v704q0 92-66 158t-158 66h-1216q-92 0-158-66t-66-158v-960q0-92 66-158t158-66h320q92 0 158 66t66 158v32h672q92 0 158 66t66 158z">--%>
<%--                                        </path>--%>
<%--                                    </svg>--%>
<%--                                </span>--%>
<%--                                    <span class="mx-4 text-sm font-normal">--%>
<%--                                    Sản phẩm--%>
<%--                                </span>--%>
<%--                                </a>--%>
<%--                                <a class="w-full text-gray-400 flex items-center pl-6 p-2 my-2 transition-colors duration-200 justify-start hover:text-gray-800 border-l-4 border-transparent"--%>
<%--                                   href="#">--%>
<%--                                <span class="text-left">--%>
<%--                                    <svg width="20" height="20" fill="currentColor" viewBox="0 0 2048 1792"--%>
<%--                                         xmlns="http://www.w3.org/2000/svg">--%>
<%--                                        <path--%>
<%--                                                d="M580 461q0-41-25-66t-66-25q-43 0-76 25.5t-33 65.5q0 39 33 64.5t76 25.5q41 0 66-24.5t25-65.5zm743 507q0-28-25.5-50t-65.5-22q-27 0-49.5 22.5t-22.5 49.5q0 28 22.5 50.5t49.5 22.5q40 0 65.5-22t25.5-51zm-236-507q0-41-24.5-66t-65.5-25q-43 0-76 25.5t-33 65.5q0 39 33 64.5t76 25.5q41 0 65.5-24.5t24.5-65.5zm635 507q0-28-26-50t-65-22q-27 0-49.5 22.5t-22.5 49.5q0 28 22.5 50.5t49.5 22.5q39 0 65-22t26-51zm-266-397q-31-4-70-4-169 0-311 77t-223.5 208.5-81.5 287.5q0 78 23 152-35 3-68 3-26 0-50-1.5t-55-6.5-44.5-7-54.5-10.5-50-10.5l-253 127 72-218q-290-203-290-490 0-169 97.5-311t264-223.5 363.5-81.5q176 0 332.5 66t262 182.5 136.5 260.5zm592 561q0 117-68.5 223.5t-185.5 193.5l55 181-199-109q-150 37-218 37-169 0-311-70.5t-223.5-191.5-81.5-264 81.5-264 223.5-191.5 311-70.5q161 0 303 70.5t227.5 192 85.5 263.5z">--%>
<%--                                        </path>--%>
<%--                                    </svg>--%>
<%--                                </span>--%>
<%--                                    <span class="mx-4 text-sm font-normal">--%>
<%--                                    Yêu cầu--%>
<%--                                </span>--%>
<%--                                </a>--%>
<%--                            </div>--%>
                        </nav>
                    </div>
                </div>
                <div class="flex flex-col w-full md:space-y-4">
                    <div class="mt-10 overflow-auto h-screen pb-24 px-4 md:px-6">
                        <h1 class="text-4xl font-semibold text-gray-800 ">
                            Wellcome back, Admin
                        </h1>
                        <h2 class="text-md text-gray-400">
                            Here&#x27;s what&#x27;s happening with your website today.
                        </h2>
                        <div class='mt-10 flex space-x-5'>
                            <!-- Nội dung-->
                            <div class='bg-white w-full shadow-lg px-5 py-4'>
                                <!-- Tìm kiếm, sort-->
                                <form action="" method='get'>
                                    <div class='flex justify-between'>
                                        <div class='relative mr-5'>
                                            <div class='absolute left-2 top-2 flex items-center justify-center text-center'>
                                                <svg class='fill-gray-400' xmlns="http://www.w3.org/2000/svg"
                                                     xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img"
                                                     width="1.5em" height="1.5em" preserveAspectRatio="xMidYMid meet"
                                                     viewBox="0 0 24 24">
                                                    <path
                                                            d="M19.023 16.977a35.13 35.13 0 0 1-1.367-1.384c-.372-.378-.596-.653-.596-.653l-2.8-1.337A6.962 6.962 0 0 0 16 9c0-3.859-3.14-7-7-7S2 5.141 2 9s3.14 7 7 7c1.763 0 3.37-.66 4.603-1.739l1.337 2.8s.275.224.653.596c.387.363.896.854 1.384 1.367l1.358 1.392l.604.646l2.121-2.121l-.646-.604c-.379-.372-.885-.866-1.391-1.36zM9 14c-2.757 0-5-2.243-5-5s2.243-5 5-5s5 2.243 5 5s-2.243 5-5 5z"/>
                                                </svg>
                                            </div>
                                            <input type="text"
                                                   class='h-9 w-72 rounded-md bg-white pl-10 pr-5 text-gray-600 focus:outline-none border'
                                                   placeholder='Tìm sản phẩm'>
                                        </div>
                                        <select class='focus:outline-none' name="sort" id="sort">
                                            <option value="">Lọc sản phẩm</option>
                                            <option value="saphetgio">Sắp hết thời gian</option>
                                            <option value="hetgio">Đã hết thời gian</option>
                                            <option value="daugianhieu">Được đấu giá nhiều</option>
                                        </select>
                                    </div>
                                </form>

                                <!-- Phần chính -->
                                <div class='mt-5 flex flex-wrap'>
                                    <!-- Card-->
                                    <div class=' flex space-x-2 bg-white border-2 border-indigo-400 w-fit mr-10 mb-8'>
                                        <div>
                                            <img class='w-48 ' src="${pageContext.request.contextPath}/public/imgs/product.jpg" alt="">
                                        </div>
                                        <div class='p-2'>
                                            <a href='#' class='font-semibold hover:underline truncate  block'>CRAFIX Hộp công cụ
                                                12" balla</a>
                                            <div class='text-gray-400 text-sm truncate'>12 inch bla labl adal balsd ad ldasdla
                                                d
                                            </div>

                                            <div class='mt-2'>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="fluent:barcode-scanner-20-filled"></span>
                                                    <div>ID:</div>
                                                    <span>#1312321</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-user"></span>
                                                    <div>ID seller:</div>
                                                    <span>#1312321</span>
                                                </div>

                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="ri:auction-fill"></span>
                                                    <div>Đấu giá:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="cryptocurrency:start"></span>
                                                    <div>Mua ngay:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-edit"></span>
                                                    <div>Ngày bắt đầu:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-exclamation"></span>
                                                    <div>Ngày hết hạn:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='inline-block w-full text-right mt-3'>
                                                    <a href='#'
                                                       class='bg-sky-600 inline-block hover:bg-sky-500 py-1 px-2  text-white'>
                                                        Vô hiệu sản phẩm
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class=' flex space-x-2 bg-white border-2 border-indigo-400 w-fit mr-10 mb-8'>
                                        <div>
                                            <img class='w-48 ' src="${pageContext.request.contextPath}/public/imgs/product.jpg" alt="">
                                        </div>
                                        <div class='p-2'>
                                            <a href='#' class='font-semibold hover:underline truncate  block'>CRAFIX Hộp công cụ
                                                12" balla</a>
                                            <div class='text-gray-400 text-sm truncate'>12 inch bla labl adal balsd ad ldasdla
                                                d
                                            </div>

                                            <div class='mt-2'>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="fluent:barcode-scanner-20-filled"></span>
                                                    <div>ID:</div>
                                                    <span>#1312321</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-user"></span>
                                                    <div>ID seller:</div>
                                                    <span>#1312321</span>
                                                </div>

                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="ri:auction-fill"></span>
                                                    <div>Đấu giá:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="cryptocurrency:start"></span>
                                                    <div>Mua ngay:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-edit"></span>
                                                    <div>Ngày bắt đầu:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-exclamation"></span>
                                                    <div>Ngày hết hạn:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='inline-block w-full text-right mt-3'>
                                                    <a href='#'
                                                       class='bg-sky-600 inline-block hover:bg-sky-500 py-1 px-2  text-white'>
                                                        Vô hiệu sản phẩm
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class=' flex space-x-2 bg-white border-2 border-indigo-400 w-fit mr-10 mb-8'>
                                        <div>
                                            <img class='w-48 ' src="${pageContext.request.contextPath}/public/imgs/product.jpg" alt="">
                                        </div>
                                        <div class='p-2'>
                                            <a href='#' class='font-semibold hover:underline truncate  block'>CRAFIX Hộp công cụ
                                                12" balla</a>
                                            <div class='text-gray-400 text-sm truncate'>12 inch bla labl adal balsd ad ldasdla
                                                d
                                            </div>

                                            <div class='mt-2'>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="fluent:barcode-scanner-20-filled"></span>
                                                    <div>ID:</div>
                                                    <span>#1312321</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-user"></span>
                                                    <div>ID seller:</div>
                                                    <span>#1312321</span>
                                                </div>

                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="ri:auction-fill"></span>
                                                    <div>Đấu giá:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="cryptocurrency:start"></span>
                                                    <div>Mua ngay:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-edit"></span>
                                                    <div>Ngày bắt đầu:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-exclamation"></span>
                                                    <div>Ngày hết hạn:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='inline-block w-full text-right mt-3'>
                                                    <a href='#'
                                                       class='bg-sky-600 inline-block hover:bg-sky-500 py-1 px-2  text-white'>
                                                        Vô hiệu sản phẩm
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class=' flex space-x-2 bg-white border-2 border-indigo-400 w-fit mr-10 mb-8'>
                                        <div>
                                            <img class='w-48 ' src="${pageContext.request.contextPath}/public/imgs/product.jpg" alt="">
                                        </div>
                                        <div class='p-2'>
                                            <a href='#' class='font-semibold hover:underline truncate  block'>CRAFIX Hộp công cụ
                                                12" balla</a>
                                            <div class='text-gray-400 text-sm truncate'>12 inch bla labl adal balsd ad ldasdla
                                                d
                                            </div>

                                            <div class='mt-2'>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="fluent:barcode-scanner-20-filled"></span>
                                                    <div>ID:</div>
                                                    <span>#1312321</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-user"></span>
                                                    <div>ID seller:</div>
                                                    <span>#1312321</span>
                                                </div>

                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="ri:auction-fill"></span>
                                                    <div>Đấu giá:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="cryptocurrency:start"></span>
                                                    <div>Mua ngay:</div>
                                                    <span>99.999.999 đ</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-edit"></span>
                                                    <div>Ngày bắt đầu:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='flex items-center space-x-1'>
                                                    <span class="iconify" data-icon="bx:bxs-calendar-exclamation"></span>
                                                    <div>Ngày hết hạn:</div>
                                                    <span>17:02:20 17/12/2021</span>
                                                </div>
                                                <div class='inline-block w-full text-right mt-3'>
                                                    <a href='#'
                                                       class='bg-sky-600 inline-block hover:bg-sky-500 py-1 px-2  text-white'>
                                                        Vô hiệu sản phẩm
                                                    </a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </jsp:body>
</t:admin>