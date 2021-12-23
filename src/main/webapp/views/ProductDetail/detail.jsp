<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="proDetail" scope="request" type="com.final_project.beans.ProductDetail"/>

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
        <fmt:setLocale value="vi_VN"/>
        <div class='max-w-7xl py-5 px-10 mx-auto bg-white'>
            <div class='max-w-5xl mx-auto'>
                <div class='flex'>
                    <!-- hình ảnh -->
                    <div class='mr-16' style='width: 450px;'>
                        <div class='flex justify-between items-center px-4 py-2 mb-3 rounded-md bg-gray-800 text-white '
                             style='width: 450px;'>
                            <div class='text-sm font-medium'>
                                Giá hiện tại:
                                <div class='text-lg font-semibold'>
                                    <fmt:formatNumber value="${proDetail.current_Price}" type="currency"/>
                                </div>
                            </div>
                            <div id="detail_count_down" class='font-semibold text-lg'>
                                19D : 15H : 20M: 54S
                            </div>
                        </div>
                        <div class='flex'>
                            <!-- hình bên -->
                            <div class='img__mini-preview flex-col space-y-4 mr-3 overflow-auto pr-2'
                                 style='height: 450px;'>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/1.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/2.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/3.jpg" alt="">
                                </div>

                            </div>
                            <!-- hình chính -->
                            <div class='rounded-lg border border-indigo-400 overflow-hidden' style="height: 440px">
                                <img class='rounded-lg' style='width: 343px; height: 440px;' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <!-- thông tin -->
                    <div style='width: 430px;'>
                        <div class='text-3xl text-gray-700 font-bold'>${proDetail.pname}</div>
                        <div class='mt-10'>
                            <div class='mt-10 w-28 text-xl font-semibold border-b-4 border-gray-800 mb-3'>Thông tin</div>
                            <div class='text-gray-600'>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Thông tin người bán:</div>
                                    <div>${proDetail.owner}</div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Thời điểm đăng bán:</div>
                                    <div id="detail_start_time">23/12/2021</div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium mb-3'>
                                    <div>Người đặt giá cao nhất:</div>
                                    <div>${proDetail.holder}</div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium mb-xl-3'>
                                    <div>Giá hiện tại:</div>
                                    <div>
                                        <fmt:formatNumber value="${proDetail.current_Price}" type="currency"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class='font-medium'>
                            <div class='mt-10 w-28 text-xl font-semibold border-b-4 border-gray-800 mb-3'>Đấu giá</div>
                            <div class='text-gray-600'>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Giá thấp nhất:</div>
                                    <div id="detail_min_price">
                                        <fmt:formatNumber value="${proDetail.current_Price}" type="currency"/>
                                    </div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Bước giá:</div>
                                    <div>
                                        <fmt:formatNumber value="${proDetail.distance_Price}" type="currency"/>
                                    </div>
                                </div>
                            </div>
                            <div class='mt-4 relative'>
                                <form action="">
                                    <span class='text-lg bg-gray-800 text-white py-1 px-3 rounded-l-md absolute left-0'>VNĐ</span>
                                    <input class='tracking-wide font-medium border-2 w-96 h-9 focus:outline-none py-1 pl-20 pr-20 rounded-md border-gray-500'
                                           type="text" value='99999999'>
                                    <button
                                            class='bg-gray-800 h-9 px-4 absolute right-0 rounded-r-md text-white text-lg hover:bg-gray-700'>Ra
                                        giá</button>
                                </form>
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
            </div>

            <!-- 5 sp cung loai -->
            <div class='mt-20'>
                <div class='font-bold text-2xl text-gray-500'>Sản phẩm liên quan</div>
                <div class='flex justify-between'>
                    <div class='flex justify-between mt-10'>
                        <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                            <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
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
                            <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
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
                            <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
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
                            <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
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
                            <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
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