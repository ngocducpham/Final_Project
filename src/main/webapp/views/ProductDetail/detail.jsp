<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="proDetail" scope="request" type="com.final_project.beans.ProductDetail"/>
<jsp:useBean id="relative" scope="request" type="java.util.List<com.final_project.beans.ProductDetail>"/>
<jsp:useBean id="history" scope="request" type="java.util.List<com.final_project.beans.ProductDetail>"/>
<jsp:useBean id="Verified" scope="session" type="java.lang.Boolean"/>
<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="currentBid" scope="request" type="com.final_project.beans.ProductDetail"/>
<jsp:useBean id="blacklist" scope="request" type="com.final_project.beans.MyIntType"/>
<jsp:useBean id="bidderList" scope="request" type="java.util.List<com.final_project.beans.ProductDetail>"/>
<jsp:useBean id="owner" scope="request" type="com.final_project.beans.ProductDetail"/>
<jsp:useBean id="currentPrice" scope="request" type="java.lang.String"/>
<jsp:useBean id="minPrice" scope="request" type="java.lang.String"/>
<jsp:useBean id="lowrate" scope="request" type="java.lang.String"/>

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
            document.querySelectorAll('.sub__img').forEach(item => {
                item.addEventListener('click', e => {
                    mainImg.src = e.target.src;
                });
            });

            let index = 1;
            let contextImgPath = "${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/";
            setInterval(() => {
                let imgname = index % 4;
                if (imgname == 0) {
                    imgname = 'main';
                }
                imgname += '.jpg';
                mainImg.src = contextImgPath + imgname;
                index++;
            }, 5000)

            let minPrice = ${minPrice};
            let priceStep = ${proDetail.distance_Price};
            let frmBid = document.getElementById('frm__bid');
            let btnBid = document.getElementById('btn__bid');

            let vndFormat = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            });

            let priceDropdown = document.getElementById('price__dropdown');
            let vndPrice = minPrice;

            if (priceDropdown != null) {
                for (let i = 0; i < 300; i++) {
                    if (vndPrice >= 200000000)
                        break;

                    let li = document.createElement('li');
                    li.className = 'price__select-item py-1 px-2 border-b-2 hover:bg-gray-200';
                    li.value = vndPrice;
                    li.innerText = vndFormat.format(vndPrice);
                    priceDropdown.appendChild(li);

                    vndPrice += priceStep;
                }

                let priceSelectItems = document.querySelectorAll('#price__dropdown > li');
                let priceSelect = document.getElementById('price__select');
                let selectedItem = priceSelectItems[0];
                let inputPrice = document.getElementById('input__price');

                priceSelect.addEventListener('click', () => {
                    priceDropdown.classList.remove('hidden');
                })

                window.onclick = (e) => {
                    if (!e.target.matches('#price__select'))
                        priceDropdown.classList.add('hidden');
                }

                priceSelect.innerText = vndFormat.format(minPrice);
                inputPrice.value = minPrice;
                priceSelectItems[0].classList.add('bg-gray-400');
                priceSelectItems[0].classList.remove('hover:bg-gray-200');
                priceSelectItems[priceSelectItems.length - 1].classList.remove('border-b-2');

                priceSelectItems.forEach(item => {
                    item.addEventListener('click', (e) => {
                        selectedItem.classList.remove('bg-gray-400');
                        selectedItem.classList.add('hover:bg-gray-200')
                        selectedItem = e.target;
                        selectedItem.classList.add('bg-gray-400');
                        selectedItem.classList.remove('hover:bg-gray-200');

                        inputPrice.value = selectedItem.value;
                        priceSelect.innerText = selectedItem.innerText;
                        console.log(inputPrice.value);
                    });
                });

                if (btnBid != null) {
                    btnBid.addEventListener('click', () => {
                        let confirmBid = confirm('Bạn có chắc chắn đấu giá sản phẩm này với giá: ' + priceSelect.innerText);
                        if (confirmBid)
                            frmBid.submit();
                    });
                }
            }

            let endTime = new Date("${proDetail.end_Time}");
            let now = new Date();
            let datePerMilis = 1000 * 60 * 60 * 24;
            let timeContainer = document.getElementById('detail_count_down');

            if (timeContainer != null) {
                let diff = endTime - Date.now();
                if (diff <= 0) {
                    timeContainer.innerText = "Phiên đấu giá đã kết thúc";
                    timeContainer.classList.add("text-red-600");
                    frmBid.remove();
                } else {
                    let timeDiff = new Date(diff);
                    let days, hours, mins, secs;
                    let coutDown = setInterval(() => {
                        days = Math.floor((endTime - Date.now()) / datePerMilis);
                        hours = timeDiff.getUTCHours();
                        mins = timeDiff.getUTCMinutes();
                        secs = timeDiff.getUTCSeconds();
                        if (days < 0 || hours < 0 || mins < 0 || secs < 0) {
                            clearInterval(coutDown);
                            timeContainer.innerText = "Phiên đấu giá đã kết thúc";
                            timeContainer.classList.add("text-red-600");
                            frmBid.remove();
                        } else {
                            timeDiff.setUTCSeconds(secs - 1);
                            timeContainer.innerText = days + " ngày " + hours + " giờ " + mins + " phút " + secs + " giây";
                        }
                    }, 1000);
                }
            }


            let bidderListName = [];
            <c:forEach items="${history}" var="h">
            bidderListName.push("${h.username}");
            </c:forEach>

            let nameContainer = document.querySelectorAll('.bidderListName');
            for (let i = 0; i < bidderListName.length; i++) {
                if ('${authUser.user_ID}' != '${owner.user_ID}') {
                    let name = bidderListName[i].slice(Math.ceil(bidderListName[i].length * 0.3));
                    nameContainer[i].innerText = "****" + name;
                } else nameContainer[i].innerText = bidderListName[i];
            }
            let currentBid = document.getElementById('current__bid');
            let topBidName = '${currentBid.username}';
            if (topBidName != '') {
                if ('${authUser.user_ID}' != '${owner.user_ID}')
                    currentBid.innerText = '****' + topBidName.slice(Math.ceil(topBidName.length * 0.3));
                else
                    currentBid.innerText = topBidName;
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <fmt:setLocale value="vi_VN"/>
        <div class='max-w-7xl py-5 px-10 mx-auto bg-white'>
            <div class='max-w-5xl mx-auto'>
                <div class='flex'>

                    <div class='mr-16' style='width: 450px;'>
                            <%--                        DEADLINE--%>
                        <div class='flex justify-between items-center px-4 py-2 mb-3 rounded-md bg-gray-800 text-white '
                             style='width: 450px;'>
                            <c:if test="${proDetail.status == 0}">
                                <div class="text-lg text-red-500 font-medium">Phiên đấu giá đã kết thúc
                                </div>
                            </c:if>
                            <c:if test="${proDetail.status == 1}">
                                <div class='coutdown__lable text-lg font-medium'>
                                    Còn lại:
                                </div>
                                <div id="detail_count_down" class='font-semibold text-lg'>
                                </div>
                            </c:if>
                        </div>

                        <div class='flex'>
                            <!-- Hình ảnh -->
                            <div class='img__mini-preview flex-col space-y-4 mr-3 overflow-auto pr-2'
                                 style='height: 450px;'>
                                <div class='sub__img border rounded-md cursor-pointer'>
                                    <img id="sub__img1" class='w-20 h-24 rounded-md'
                                         src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg"
                                         alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img id="sub__img2" class='sub__img w-20 h-24 rounded-md'
                                         src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/1.jpg"
                                         alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img id="sub__img3" class='sub__img3 sub__img w-20 h-24 rounded-md'
                                         src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/2.jpg"
                                         alt="">
                                </div>
                                <div class=' border rounded-md cursor-pointer'>
                                    <img id="sub__img4" class='sub__img w-20 h-24 rounded-md'
                                         src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/3.jpg"
                                         alt="">
                                </div>

                            </div>
                            <!-- Icon Yeu thich sp -->
                            <div class='relative rounded-lg border border-indigo-400 overflow-hidden'
                                 style="height: 440px">
                                <c:if test="${Verified}">
                                    <a href="${pageContext.request.contextPath}/Personal/Add_To_Watch_List?Pro_Id=${proDetail.pro_ID}">
                                        <span class="iconify absolute top-1 right-1 text-lg text-red-400 hover:text-red-500"
                                              data-icon="ant-design:heart-filled"></span>
                                    </a>
                                </c:if>

                                <img class='rounded-lg main__img' style='width: 343px; height: 440px;'
                                     src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <!-- thông tin -->

                    <div style='width: 430px;'>
                        <div class='text-3xl text-gray-700 font-bold'>${proDetail.pname}</div>
                        <div class='mt-10'>
                            <div class='mt-10 w-28 text-xl font-semibold border-b-4 border-gray-800 mb-3'>
                                Thông tin
                            </div>
                            <div class='text-gray-600'>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Thông tin người bán:</div>

                                    <div>${owner.username}</div>

                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Thời điểm đăng bán:</div>
                                    <div id="detail_start_time">${proDetail.start_Time.toLocalDate()}</div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium mb-3'>
                                    <div>Người đặt giá cao nhất:</div>
                                    <div id="current__bid">

                                    </div>

                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium mb-xl-3'>
                                    <div>Giá hiện tại:</div>
                                    <div>
                                        <fmt:formatNumber value="${currentPrice}" type="currency"/>
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
                                        <fmt:formatNumber value="${minPrice}" type="currency"/>
                                    </div>
                                </div>
                                <div class='flex justify-between border-b-2 border-dashed font-medium  mb-3'>
                                    <div>Bước giá:</div>
                                    <div>
                                        <fmt:formatNumber value="${proDetail.distance_Price}" type="number"/>
                                    </div>
                                </div>
                            </div>
                            <div class='mt-4 relative'>
                                <c:if test="${proDetail.status == 1}">
                                    <c:if test="${blacklist.value != 1 && Verified && lowrate == 0 && owner.user_ID != authUser.user_ID}">
                                        <form id="frm__bid" method="post">
                                            <span class='flex items-center justify-center bg-gray-800 text-white px-3 h-9 rounded-l-md absolute left-0'>VNĐ</span>
                                            <input type="hidden" value="${authUser.user_ID}" name="uid">
                                            <input type="hidden" value="${proDetail.pro_Auc_ID}" name="proauid">
                                            <input type="hidden" value="${proDetail.pro_ID}" name="proid">
                                            <input type="hidden" name="bidprice" id="input__price">
                                            <span class='relative'>
                                                <button type='button' id='price__select'
                                                        class='font-medium text-left w-96 h-9 py-1 pl-20 pr-20 rounded-md border-gray-500 border-2'>
                                                </button>
                                                <ul id='price__dropdown' style='left: 70px;width: 262px;'
                                                    class='z-10 cursor-pointer hidden overflow-auto absolute top-7 border shadow-md bg-white max-h-40'>

                                                </ul>
                                             </span>
                                            <c:if test="${Verified}">
                                                <button type="button" id="btn__bid"
                                                        class='bg-gray-800 h-9 px-4 absolute right-0 rounded-r-md text-white text-lg hover:bg-gray-700'>
                                                    Ra giá
                                                </button>
                                            </c:if>
                                        </form>
                                    </c:if>
                                    <c:if test="${blacklist.value == 1}">
                                        <div class="text-lg text-red-500 font-medium">
                                            Bạn không có quyền đấu giá sản phẩm này.
                                        </div>
                                    </c:if>
                                    <c:if test="${lowrate == 1}">
                                        <div class="text-lg text-red-500 font-medium">
                                            Điểm đánh giá của bạn thấp < 80%, không thể đấu giá.
                                        </div>
                                    </c:if>
                                    <c:if test="${!Verified}">
                                        <div class="text-lg text-red-500 font-medium">
                                            Đăng nhập để đấu giá sản phẩm.
                                        </div>
                                    </c:if>
                                </c:if>
                                <c:if test="${proDetail.status == 0}">
                                    <div class="text-lg text-red-500 font-medium">Phiên đấu giá đã kết thúc.
                                    </div>
                                </c:if>

                            </div>
                        </div>
                    </div>

                </div>


                <h4 class='text-2xl font-semibold mt-16 mb-3'>LỊCH SỬ ĐẤU GIÁ</h4>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Người đấu giá</th>
                        <th scope="col">Thời điểm</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${history}" var="h">
                        <tr>
                            <td class="bidderListName"></td>
                            <td>${h.price_Time.toLocalDate()} ${h.price_Time.toLocalTime()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <c:if test="${(owner.user_ID == authUser.user_ID) && (history.size() > 0)}">
                    <h4 class='text-2xl font-semibold mt-16 mb-3'>TỪ CHỐI RA GIÁ</h4>
                    <form action="${pageContext.request.contextPath}/BlockBidder" method='post'>
                        <input type="hidden" name="proid" value="${proDetail.pro_ID}">
                        <input type="hidden" name="proauid" value="${proDetail.pro_Auc_ID}">
                        <label for="uid" class="mr-2">Bidder</label>
                        <select name="uid" id="uid" class="bg-gray-800 text-white w-56 h-8">
                            <c:forEach items="${bidderList}" var="b">
                                <c:if test="${b.user_ID != authUser.user_ID}">
                                    <option value="${b.user_ID}">${b.username} - UID: ${b.user_ID}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <button
                                class='ml-2 bg-gray-800 px-4 text-white hover:bg-gray-700 h-8'>
                            Từ chối ra giá
                        </button>
                    </form>
                </c:if>

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
                                <img class='h-60 w-full rounded-t-lg'
                                     src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg"
                                     alt="">
                                <div class='p-3 w-full text-center'>
                                    <a href='${pageContext.request.contextPath}/ProductDetail?id=${p.pro_ID}'
                                       class='font-semibold w-full hover:underline'>${p.pname}</a>
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