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