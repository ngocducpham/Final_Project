<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:attribute name="css">
         <style>
             .img__mini-preview::-webkit-scrollbar {
                 width: 5px;
             }

             .img__mini-preview::-webkit-scrollbar-track {
                 background: #f1f1f1;
             }

             .img__mini-preview::-webkit-scrollbar-thumb {
                 background: #888;
             }

             .img__mini-preview::-webkit-scrollbar-thumb:hover {
                 background: #555;
             }
         </style>
    </jsp:attribute>
    <jsp:body>
        <div class='max-w-7xl py-5 px-10 mx-auto bg-white'>
            <div>
                <div class='flex'>
                    <!-- hình ảnh -->
                    <div class='flex mr-16'>
                        <!-- hình bên -->
                        <div class='img__mini-preview flex-col space-y-5 mr-3 overflow-auto pr-2' style='height: 450px;'>
                            <div class=' border-indigo-400 rounded-md cursor-pointer'>
                                <img class='w-20 h-24 rounded-md' src="./imgs/appple-watch.jpg" alt="">
                            </div>
                            <div class=' border-indigo-400 rounded-md cursor-pointer'>
                                <img class='w-20 h-24 rounded-md' src="./imgs/appple-watch-1.jpg" alt="">
                            </div>
                            <div class=' border-indigo-400 rounded-md cursor-pointer'>
                                <img class='w-20 h-24 rounded-md' src="./imgs/appple-watch-2.jpg" alt="">
                            </div>
                            <div class=' border-indigo-400 rounded-md cursor-pointer'>
                                <img class='w-20 h-24 rounded-md' src="./imgs/appple-watch-2.jpg" alt="">
                            </div>
                        </div>
                        <!-- hình chính -->
                        <div class='rounded-lg border border-indigo-400'>
                            <img class='rounded-lg' style='width: 343px; height: 450px;' src="./imgs/appple-watch.jpg"
                                 alt="">
                        </div>
                    </div>
                    <!-- thông tin -->
                    <div>
                        <div class='text-3xl text-gray-700 font-bold'>Apple Watch S6 LTE 40mm</div>
                        <div class='flex justify-between text mt-8 font-semibold text-center w-4/5'>
                            <div>
                                <div class='text-lg'>0</div>
                                <div class='text-gray-500'>Ngày</div>
                            </div>
                            <div>
                                <div class='text-lg '>0</div>
                                <div class='text-gray-500'>Giờ</div>
                            </div>
                            <div>
                                <div class='text-lg font-bold '>0</div>
                                <div class='text-gray-500'>Phút</div>
                            </div>
                            <div>
                                <div class='text-lg font-bold '>0</div>
                                <div class='text-gray-500'>Giây</div>
                            </div>
                        </div>
                        <div class='flex mt-8'>
                            <div>
                                <div class='font-semibold text-lg text-gray-500'>GIÁ THẦU HIỆN TẠI</div>
                                <div class='text-lg text-green-600 font-semibold'>99.999.999 <span
                                        class='text-gray-700'>đ</span></div>
                            </div>
                            <div class='ml-16'>
                                <div class='font-semibold text-lg text-gray-500'>NGƯỜI ĐẶT GIÁ CAO NHẤT</div>
                                <div class='flex space-x-2 items-center text-indigo-600'>
                                    <span class="iconify text-lg" data-icon="si-glyph:champion-cup"></span>
                                    <div class='text-lg font-semibold'>Đức</div>
                                </div>
                            </div>
                        </div>
                        <div class='flex'>
                            <div>
                                <div class='font-semibold text-lg mt-3 text-gray-500'>NGƯỜI BÁN</div>
                                <div class='text-lg font-semibold'>Đức</div>
                            </div>
                            <div class='ml-32'>
                                <div class='font-semibold text-lg mt-3 text-gray-500'>THỜI ĐIỂM ĐĂNG</div>
                                <div class='text-lg font-semibold'>21/12/2021</div>
                            </div>
                        </div>
                        <div class='mt-8'>
                            <div class='font-semibold text-lg mt-3 text-gray-500'>ĐẤU GIÁ NGAY</div>
                            <div class='flex'>
                                <form action="POST" class='flex items-center'>
                                    <button type='button'
                                            class='mr-2 bg-indigo-500 text-white text-base py-2 px-2 rounded-md hover:bg-indigo-600'>
                                        <span class="iconify" data-icon="akar-icons:minus"></span>
                                    </button>
                                    <input
                                            class='text-indigo-700 text-lg shadow-md py-1 rounded-md px-2 w-40 border border-indigo-500 focus:outline-none'
                                            type="text">
                                    <button type='button'
                                            class='ml-2 bg-indigo-500 text-white text-base py-2 px-2 rounded-md hover:bg-indigo-600'>
                                        <span class="iconify" data-icon="akar-icons:plus"></span>
                                    </button>
                                    <button type='button'
                                            class='flex items-center space-x-2 bg-indigo-500 text-white text-base py-2 px-2 rounded-md hover:bg-indigo-600 ml-3'>
                                        <span class="iconify" data-icon="ri:auction-fill"></span>
                                        <span>Đặt giá thầu</span>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table mt-16">
                <thead>
                <tr>
                    <th scope="col">Người đấu giá</th>
                    <th scope="col">Giá thầu</th>
                    <th scope="col">Thời điểm</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
            <!-- mô tả sản phẩm -->
            <div class='mt-5'>
                <h4 class='text-lg font-semibold mb-3'>MÔ TẢ SẢN PHẨM</h4>
                <div class="content has-table">
                    <table>
                        <tbody>
                        <tr>
                            <td>Thời gian pin</td>
                            <td>12h</td>
                        </tr>
                        <tr>
                            <td>Thời gian sạc</td>
                            <td>8h</td>
                        </tr>
                        <tr>
                            <td>Tốc độ CPU</td>
                            <td>4.5Ghz</td>
                        </tr>
                        <tr>
                            <td>Hiển thị màu sắc</td>
                            <td>HD</td>
                        </tr>
                        <tr>
                            <td>Bluetooth</td>
                            <td>Bluetooth 5.0 </td>
                        </tr>
                        <tr>
                            <td>Bộ nhớ đồ họa</td>
                            <td>Tối đa 64GB</td>
                        </tr>
                        <tr>
                            <td>Thương hiệu</td>
                            <td>Dell</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 5 sp cung loai -->
            <div class='mt-20'>
                <div class='font-bold text-2xl text-gray-500'>Sản phẩm liên quan</div>
                <div class='flex justify-between'>

                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div
                                    class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần Bid
                                0123456</div>
                            <img class='h-60 w-full rounded-t-lg' src="./imgs/appple-watch.jpg" alt="">
                            <div class='p-3 w-full text-center'>
                                <a href='#' class='font-semibold w-full hover:underline'>Apple Watch S6 LTE 40mm</a>
                                <div class='text-sm text-gray-500 font-semibold mt-3'>
                                    Giá hiện tại:
                                    <span>1.500.000 VNĐ</span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div
                                    class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần Bid
                                0123456</div>
                            <img class='h-60 w-full rounded-t-lg' src="./imgs/appple-watch.jpg" alt="">
                            <div class='p-3 w-full text-center'>
                                <a href='#' class='font-semibold w-full hover:underline'>Apple Watch S6 LTE 40mm</a>
                                <div class='text-sm text-gray-500 font-semibold mt-3'>
                                    Giá hiện tại:
                                    <span>1.500.000 VNĐ</span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div
                                    class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần Bid
                                0123456</div>
                            <img class='h-60 w-full rounded-t-lg' src="./imgs/appple-watch.jpg" alt="">
                            <div class='p-3 w-full text-center'>
                                <a href='#' class='font-semibold w-full hover:underline'>Apple Watch S6 LTE 40mm</a>
                                <div class='text-sm text-gray-500 font-semibold mt-3'>
                                    Giá hiện tại:
                                    <span>1.500.000 VNĐ</span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div
                                    class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần Bid
                                0123456</div>
                            <img class='h-60 w-full rounded-t-lg' src="./imgs/appple-watch.jpg" alt="">
                            <div class='p-3 w-full text-center'>
                                <a href='#' class='font-semibold w-full hover:underline'>Apple Watch S6 LTE 40mm</a>
                                <div class='text-sm text-gray-500 font-semibold mt-3'>
                                    Giá hiện tại:
                                    <span>1.500.000 VNĐ</span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div
                                    class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần Bid
                                0123456</div>
                            <img class='h-60 w-full rounded-t-lg' src="./imgs/appple-watch.jpg" alt="">
                            <div class='p-3 w-full text-center'>
                                <a href='#' class='font-semibold w-full hover:underline'>Apple Watch S6 LTE 40mm</a>
                                <div class='text-sm text-gray-500 font-semibold mt-3'>
                                    Giá hiện tại:
                                    <span>1.500.000 VNĐ</span>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>