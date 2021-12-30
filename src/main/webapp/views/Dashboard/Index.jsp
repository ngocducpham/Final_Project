<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="top5Time" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="top5Price" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="top5Bid" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>

<t:admin>
    <jsp:attribute name="js">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
        <script>
            let timeEndList = [];
            <c:forEach items="${top5Time}" var="p">
            timeEndList.push(new Date("${p.end_Time}"));
            </c:forEach>
            <c:forEach items="${top5Price}" var="p">
            timeEndList.push(new Date("${p.end_Time}"));
            </c:forEach>
            <c:forEach items="${top5Bid}" var="p">
            timeEndList.push(new Date("${p.end_Time}"));
            </c:forEach>

            let timeContainer = document.querySelectorAll('.timeContainer');
            let timeNow = new Date();
            let datePerMilis = 1000 * 60 * 60 * 24;
            let timeDiff = [], days, hours, mins, secs;

            for (let i = 0; i < timeEndList.length; i++) {
                timeDiff.push(new Date(timeEndList[i].getTime() - timeNow));
            }

            setInterval(() => {
                for (let i = 0; i < timeEndList.length; i++) {
                    days = Math.floor((timeEndList[i].getTime() - Date.now()) / datePerMilis);
                    hours = timeDiff[i].getUTCHours();
                    mins = timeDiff[i].getUTCMinutes();
                    secs = timeDiff[i].getUTCSeconds();

                    if (days < 0 || hours < 0 || mins < 0 || secs < 0) {
                        let timecout = timeContainer[i].querySelectorAll('div');
                        if(timecout.length != 0){
                            timecout.forEach(item=>{
                                item.remove();
                            })
                            timeContainer[i].innerText = "Phiên đấu giá đã kết thúc";
                            timeContainer[i].classList.add("text-red-600");
                            timeContainer[i].classList.add("text-base");
                        }
                        continue;
                    }
                    timeContainer[i].querySelector('.days').textContent = days;
                    timeContainer[i].querySelector('.hours').textContent = hours;
                    timeContainer[i].querySelector('.minutes').textContent = mins;
                    timeContainer[i].querySelector('.seconds').textContent = secs;

                    timeDiff[i].setUTCSeconds(secs - 1);
                }
            }, 1000);


        </script>
    </jsp:attribute>
    <jsp:attribute name="css">
        <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    </jsp:attribute>
    <jsp:body>
        <main class="bg-gray-100  h-screen overflow-hidden relative">
            <div class="flex items-start justify-between">
                <div class="flex flex-col w-full md:space-y-4">
                    <div class="mt-10 overflow-auto h-screen pb-24 px-4 md:px-6">
                        <h1 class="text-4xl font-semibold text-success ">
                            Wellcome back, Admin
                        </h1>
                        <h2 class="text-md text-gray-400">
                            Here&#x27;s what&#x27;s happening with your website today.
                        </h2>
                        <div class='mt-10 flex space-x-5'>
                            <!-- Nội dung-->
                            <div class='bg-white w-full shadow-lg px-5 py-4'>

                                <!-- Phần chính -->
                                <div class='mt-2'>
                                    <div class='font-bold text-3xl text-gray-500'>Sắp hết giờ</div>
                                    <div class='grid grid-cols-5 mt-10'>
                                        <c:forEach items="${top5Time}" var="p">
                                            <div>
                                                <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần bid: ${p.total_Bid}
                            </span>
                                                    <img class='h-60 w-full rounded-t-lg'
                                                         src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg" alt="">
                                                    <div class='px-2 w-full text-center mt-2'>
                                                        <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                                        <div class='text-sm text-gray-500 font-semibold mt-3'>
                                                            Giá hiện tại:
                                                            <fmt:formatNumber value="${p.current_Price}" type="currency"/>
                                                        </div>
                                                        <div class='timeContainer flex justify-around text-xs mt-3 font-semibold'>
                                                            <div>
                                                                <div class='days text-sm'>05</div>
                                                                <div class='text-gray-500'>Ngày</div>
                                                            </div>
                                                            <div>
                                                                <div class='hours text-sm'>05</div>
                                                                <div class='text-gray-500'>Giờ</div>
                                                            </div>
                                                            <div>
                                                                <div class='minutes text-sm'>05</div>
                                                                <div class='text-gray-500'>Phút</div>
                                                            </div>
                                                            <div>
                                                                <div class='seconds text-sm'>05</div>
                                                                <div class='text-gray-500'>Giây</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class='mt-5'>
                                    <div class='font-bold text-3xl text-gray-500'>Giá cao nhất</div>
                                    <div class='grid grid-cols-5 mt-10'>
                                        <c:forEach items="${top5Price}" var="p">
                                            <div>
                                                <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                    Số lần bid: ${p.total_Bid}
                                 </span>
                                                    <img class='h-60 w-full rounded-t-lg'
                                                         src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg" alt="">
                                                    <div class='px-2 w-full text-center mt-2'>
                                                        <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                                        <div class='text-sm text-gray-500 font-semibold mt-3'>
                                                            Giá hiện tại:
                                                            <fmt:formatNumber value="${p.current_Price}" type="currency"/>
                                                        </div>
                                                        <div class='timeContainer flex justify-around text-xs mt-3 font-semibold'>
                                                            <div>
                                                                <div class='days text-sm'>05</div>
                                                                <div class='text-gray-500'>Ngày</div>
                                                            </div>
                                                            <div>
                                                                <div class='hours text-sm'>05</div>
                                                                <div class='text-gray-500'>Giờ</div>
                                                            </div>
                                                            <div>
                                                                <div class='minutes text-sm'>05</div>
                                                                <div class='text-gray-500'>Phút</div>
                                                            </div>
                                                            <div>
                                                                <div class='seconds text-sm'>05</div>
                                                                <div class='text-gray-500'>Giây</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class='mt-5'>
                                    <div class='font-bold text-3xl text-gray-500'>Nhiều lượt đấu giá</div>
                                    <div class='grid grid-cols-5  mt-10'>
                                        <c:forEach items="${top5Bid}" var="p">
                                            <div>
                                                <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                    Số lần bid: ${p.total_Bid}
                                </span>
                                                    <img class='h-60 w-full rounded-t-lg'
                                                         src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg" alt="">
                                                    <div class='px-2 w-full text-center mt-2'>
                                                        <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                                        <div class='text-sm text-gray-500 font-semibold mt-3'>
                                                            Giá hiện tại:
                                                            <fmt:formatNumber value="${p.current_Price}" type="currency"/>
                                                        </div>
                                                        <div class='timeContainer flex justify-around text-xs mt-3 font-semibold'>
                                                            <div>
                                                                <div class='days text-sm'>05</div>
                                                                <div class='text-gray-500'>Ngày</div>
                                                            </div>
                                                            <div>
                                                                <div class='hours text-sm'>05</div>
                                                                <div class='text-gray-500'>Giờ</div>
                                                            </div>
                                                            <div>
                                                                <div class='minutes text-sm'>05</div>
                                                                <div class='text-gray-500'>Phút</div>
                                                            </div>
                                                            <div>
                                                                <div class='seconds text-sm'>05</div>
                                                                <div class='text-gray-500'>Giây</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
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