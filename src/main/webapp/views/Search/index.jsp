<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="searchProducts" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="searchProductGetBidder" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="searchProductGetTotalProduct" scope="request"
             type="java.lang.String"/>
<jsp:useBean id="productPage" scope="request" type="java.lang.String"/>
<jsp:useBean id="sortType" scope="request" type="java.lang.String"/>
<jsp:useBean id="searchProductName" scope="request" type="java.lang.String"/>
<jsp:useBean id="totalPage" scope="request" type="java.lang.String"/>

<t:main>
    <jsp:attribute name="js">
        <script>
            let bidderList = [];
            <c:forEach items="${searchProductGetBidder}" var="p">
                bidderList.push(["${p.pro_Auc_ID}", "${p.username}"]);
            </c:forEach>

            let productTime = [];
            <c:forEach items="${searchProducts}" var="p">
                productTime.push([new Date("${p.start_Time}"), new Date("${p.end_Time}")]);
            </c:forEach>

            // current bidder
           let productCard = document.querySelectorAll('.product_Card');

            productCard.forEach(card =>{
                let proID = card.querySelector('.productID').value;
                let currentBidder = card.querySelector('.current_Bidder');
                let startTime = card.querySelector('.start_Time');
                for (const bidder of bidderList) {
                    if(bidder[0] == proID){
                        currentBidder.innerText =  "Bidder hiện tại: " + bidder[1];
                    }
                    else currentBidder.innerText =  "Bidder hiện tại: chưa có";
                }

            });

            // time animation
            let timeContainer = document.querySelectorAll('.timeContainer');
            let timeNow = new Date();
            let datePerMilis = 1000 * 60 * 60 * 24;
            let timeDiff = [], days, hours, mins, secs;

            for (let i = 0; i < productTime.length; i++) {
                timeDiff.push(new Date(productTime[i][1].getTime() - timeNow));
                // start time
                productCard[i].querySelector('.start_Time').innerText =
                    productTime[i][0].getUTCDate() + "/" + productTime[i][0].getUTCMonth() + "/" + productTime[i][0].getUTCFullYear();
            }

            setInterval(() => {
                for (let i = 0; i < productTime.length; i++) {
                    days = Math.floor((productTime[i][1].getTime() - Date.now()) / datePerMilis);
                    hours = timeDiff[i].getUTCHours();
                    mins = timeDiff[i].getUTCMinutes();
                    secs = timeDiff[i].getUTCSeconds();

                    timeContainer[i].querySelector('.days').textContent = days;
                    timeContainer[i].querySelector('.hours').textContent = hours;
                    timeContainer[i].querySelector('.minutes').textContent = mins;
                    timeContainer[i].querySelector('.seconds').textContent = secs;

                    timeDiff[i].setUTCSeconds(secs - 1);
                }
            }, 1000);

            // page
            let paginationChoose = document.querySelector('.pagination_choose');
            let totalPage = ${totalPage};

            for (let i = 1; i <= totalPage; i++) {
                let option = document.createElement('option');
                option.value = i;
                option.innerText = "Trang " + i
                paginationChoose.appendChild(option);
            }

            paginationChoose.addEventListener('change', () =>{
                let url = new URL(location.href);
                url.searchParams.set('page', paginationChoose.value);
                location.href = url.href;
            });

            // sort
            let productSort = document.getElementById('productsort');

            productSort.addEventListener('change', () =>{
                let url = new URL(location.href);
                url.searchParams.set('sort', productSort.value);
                location.href = url.href;
            });

            let url = new URL(location.href);
            let sortType = url.searchParams.get('sort');
            if(sortType != null){
                productSort.options.selectedIndex = +sortType - 1;
            }

        </script>
    </jsp:attribute>
    <jsp:body>
        <div class='max-w-7xl mx-auto mt-20'>
            <div class='flex justify-between items-center py-4 px-4 bg-indigo-50 font-semibold rounded-lg'>
                <div>Hiển thị 1-10 trên ${searchProductGetTotalProduct} sản phẩm</div>
                    <select class="focus:outline-none bg-indigo-50" name="sort" id="productsort">
                        <option value="1">Thời gian kết thúc giảm dần</option>
                        <option value="2">Thời gian kết thúc tăng dần</option>
                        <option value="3">Giá tăng dần</option>
                        <option value="4">Giá giảm dần</option>
                    </select>
            </div>
            <div class='flex flex-wrap justify-between mt-8'>
                <c:forEach items="${searchProducts}" var="p">
                    <div class='product_Card relative w-56 border rounded-lg bg-white overflow-hidden mb-14'>
                        <input hidden class="productID" value="${p.pro_Auc_ID}">
                        <div class='text-center total_Bid rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                            Số lần bid: ${p.total_Bid}
                        </div>
                        <img class='h-60 w-full rounded-t-lg'
                             src="${pageContext.request.contextPath}/public/imgs/appple-watch.jpg" alt="">
                        <div class='p-3 w-full text-center'>
                            <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                            <div class='text-sm text-gray-500 font-semibold'>
                                <div class=' mt-3'>
                                    Giá hiện tại: ${p.current_Price}
                                </div>
                                <div class='w-full truncate mt-1 current_Bidder'>
                                </div>
                                <div class='mt-1'>Ngày đăng:
                                    <span class="start_Time">

                                    </span>
                                </div>
                            </div>
                            <div class='timeContainer flex justify-around text-xs mt-3 font-semibold'>
                                <div>
                                    <div class='days text-sm'>0</div>
                                    <div class='text-gray-500'>Ngày</div>
                                </div>
                                <div>
                                    <div class='hours text-sm'>0</div>
                                    <div class='text-gray-500'>Giờ</div>
                                </div>
                                <div>
                                    <div class='minutes text-sm'>0</div>
                                    <div class='text-gray-500'>Phút</div>
                                </div>
                                <div>
                                    <div class='seconds text-sm'>0</div>
                                    <div class='text-gray-500'>Giây</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>

            <!-- Pagination -->
            <div class='w-full relative h-10 mt-8'>
                <div class='absolute right-0'>
                    <nav class="pagination py-2 px-4 border-2 mr-auto relative z-0 inline-flex -space-x-px border-gray-300" aria-label="Pagination">
                        <span class="mr-3 font-semibold">
                        Chuyển đến:
                        </span>
                        <select name="page" id="page"
                                class='pagination_choose px-5 focus:outline-none bg-white font-medium text-gray-500 hover:bg-gray-50'>
                        </select>
                    </nav>
                </div>
            </div>

        </div>
    </jsp:body>
</t:main>