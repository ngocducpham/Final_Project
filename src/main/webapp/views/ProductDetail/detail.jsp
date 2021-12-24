<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="proDetail" scope="request" type="com.final_project.beans.ProductDetail"/>
<jsp:useBean id="relative" scope="request" type="java.util.List<com.final_project.beans.ProductDetail>"/>
<jsp:useBean id="history" scope="request" type="java.util.List<com.final_project.beans.ProductDetail>"/>
<jsp:useBean id="Verified" scope="session" type="java.lang.Boolean"/>
<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>


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
    <jsp:attribute name="js">
        <script>
            let mainImg = document.querySelector('.main__img');
            document.querySelectorAll('.sub__img').forEach(item =>{
                item.addEventListener('click', e =>{
                    mainImg.src = e.target.src;
                });
            });

            let minPrice = ${proDetail.min_Price};
            let priceStep = ${proDetail.distance_Price};
            let frmBid = document.getElementById('frm__bid');
            let btnBid = document.getElementById('btn__bid');


            btnBid.addEventListener('click', ()=>{
                let inputPrice = document.getElementById('input__price').value;
                let priceUp = inputPrice - minPrice;
                if(inputPrice < minPrice){
                    alert('Giá phải từ giá thấp nhất trở lên');
                    return;
                }
                else if(priceUp % priceStep != 0) {
                    alert('Giá phải là bội của bước giá');
                    return;
                }
                frmBid.submit();
            })

        </script>
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
                                <div class='sub__img border rounded-md cursor-pointer'>
                                    <img class='w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='sub__img w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/1.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='sub__img w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/2.jpg" alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img class='sub__img w-20 h-24 rounded-md' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/3.jpg" alt="">
                                </div>

                            </div>
                            <!-- hình chính -->
                            <div class='relative rounded-lg border border-indigo-400 overflow-hidden' style="height: 440px">
                                <c:if test="${Verified}">
                                    <a href="#">
                                    <span class="iconify absolute top-1 right-1 text-lg text-red-400 hover:text-red-500" data-icon="ant-design:heart-filled"></span>
                                    </a>
                                </c:if>

                                <img class='rounded-lg main__img' style='width: 343px; height: 440px;' src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg"
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
                                        <fmt:formatNumber value="${proDetail.min_Price}" type="currency"/>
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
                                <form id="frm__bid" method="post">
                                    <span class='flex items-center justify-center bg-gray-800 text-white px-3 h-9 rounded-l-md absolute left-0'>VNĐ</span>
                                    <input type="hidden" value="${authUser.user_ID}" name="uid">
                                    <input type="hidden" value="${proDetail.pro_Auc_ID}" name="proauid">
                                    <input type="hidden" value="${proDetail.pro_ID}" name="proid">
                                    <input id="input__price" class='tracking-wide font-medium border-2 w-96 h-9 focus:outline-none py-1 pl-20 pr-20 rounded-md border-gray-500'
                                           name="bidprice" type="text" value='${proDetail.min_Price}'>
                                    <c:if test="${Verified}">
                                        <button type="button" id="btn__bid"
                                                class='bg-gray-800 h-9 px-4 absolute right-0 rounded-r-md text-white text-lg hover:bg-gray-700'>Ra
                                            giá</button>
                                    </c:if>
                                    <c:if test="${!Verified}">
                                        <a href="javascript: alert('Bạn chưa đăng nhập')"
                                                class='py-1 bg-gray-800 h-9 px-4 absolute right-0 rounded-r-md text-white text-lg hover:bg-gray-700'>Ra
                                            giá</a>
                                    </c:if>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <h4 class='text-2xl font-semibold mt-16 mb-3'>LỊCH SỬ ĐẤU GIÁ</h4>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Người đấu giá</th>
                        <th scope="col">Giá thầu</th>
                        <th scope="col">Thời điểm</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${history}" var="h">
                        <tr>
                            <td>${h.username}</td>
                            <td><fmt:formatNumber value="${h.price_of_User}" type="currency"/></td>
                            <td>${h.price_Time.toLocalDate()} ${h.price_Time.toLocalTime()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- mô tả sản phẩm -->
                <div class='mt-5'>
                    <h4 class='text-2xl font-semibold mb-3'>MÔ TẢ SẢN PHẨM</h4>
                    ${proDetail.description}
                </div>
            </div>

            <!-- 5 sp cung loai -->
            <div class='mt-20'>
                <div class='font-bold text-2xl text-gray-500'>Sản phẩm liên quan</div>
                <div class='grid grid-cols-5'>
                    <c:forEach items="${relative}" var="p">
                        <div class='flex justify-between mt-10'>
                            <div class='relative w-56 border rounded-lg bg-white overflow-hidden'>
                                <div class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                    Số lần Bid
                                        ${p.total_Bid}</div>
                                <img class='h-60 w-full rounded-t-lg' src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg" alt="">
                                <div class='p-3 w-full text-center'>
                                    <a href='${pageContext.request.contextPath}/ProductDetail?id=${p.pro_ID}' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                    <div class='text-sm text-gray-500 font-semibold mt-3'>
                                        Giá hiện tại:
                                        <span><fmt:formatNumber value="${p.current_Price}" type="currency"/></span>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>
    </jsp:body>
</t:main>