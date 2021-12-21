<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="top5Time" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="top5Price" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>
<jsp:useBean id="top5Bid" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>

<t:main>
    <jsp:attribute name="js">
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

                    timeContainer[i].querySelector('.days').textContent = days;
                    timeContainer[i].querySelector('.hours').textContent = hours;
                    timeContainer[i].querySelector('.minutes').textContent = mins;
                    timeContainer[i].querySelector('.seconds').textContent = secs;

                    timeDiff[i].setUTCSeconds(secs - 1);
                }
            }, 1000);


        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Hero-->
        <div class='w-full h-screen'
             style='background-image: url("${pageContext.request.contextPath}/public/imgs/main-banner-bg.png");'>
            <div class='max-w-7xl mx-auto flex items-center justify-between'>
                <div class='max-w-md'>
                    <div class='text-white text-7xl font-bold'>Hot Deal <br> For You</div>
                    <div class='text-gray-200 text-xl font-normal mt-5'>We’re constantly bringing new properties market
                        so
                        keep visiting our website
                        that you don’t miss out on the next opportunity.
                    </div>
                    <a href='#getting_scroll'
                       class='block font-semibold bg-indigo-600 hover:bg-indigo-700 text-white text-xl px-7 py-3 w-64 mt-8 rounded-full text-center'>GETTING
                        STARTED</a>
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/public/imgs/main-banner.png" alt="">
                </div>
            </div>
            <img id="getting_scroll" src="${pageContext.request.contextPath}/public/imgs/main-banner-bottom.png" alt="">
        </div>

        <div class='max-w-7xl mx-auto'>
            <div class='mt-20'>
                <div class='font-bold text-3xl text-gray-500'>Sắp hết giờ</div>
                <div class='flex justify-between mt-10'>
                    <c:forEach items="${top5Time}" var="p">
                        <div>
                            <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần bid: ${p.total_Bid}
                            </span>
                                <img class='h-60 w-full rounded-t-lg'
                                     src="${pageContext.request.contextPath}/public/imgs/appple-watch.jpg" alt="">
                                <div class='px-2 w-full text-center mt-2'>
                                    <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                    <div class='text-sm text-gray-500 font-semibold mt-3'>
                                        Giá hiện tại:
                                        <span>${p.current_Price} đ</span>
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
            <div class='mt-20'>
                <div class='font-bold text-3xl text-gray-500'>Giá cao nhất</div>
                <div class='flex justify-between mt-10'>
                    <c:forEach items="${top5Price}" var="p">
                        <div>
                            <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                    Số lần bid: ${p.total_Bid}
                                 </span>
                                <img class='h-60 w-full rounded-t-lg'
                                     src="${pageContext.request.contextPath}/public/imgs/appple-watch.jpg" alt="">
                                <div class='px-2 w-full text-center mt-2'>
                                    <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                    <div class='text-sm text-gray-500 font-semibold mt-3'>
                                        Giá hiện tại:
                                        <span>${p.current_Price} đ</span>
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
            <div class='mt-20'>
                <div class='font-bold text-3xl text-gray-500'>Nhiều lượt đấu giá</div>
                <div class='flex justify-between mt-10'>
                    <c:forEach items="${top5Bid}" var="p">
                        <div>
                            <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                    Số lần bid: ${p.total_Bid}
                                </span>
                                <img class='h-60 w-full rounded-t-lg'
                                     src="${pageContext.request.contextPath}/public/imgs/appple-watch.jpg" alt="">
                                <div class='px-2 w-full text-center mt-2'>
                                    <a href='#' class='font-semibold w-full hover:underline'>${p.pname}</a>
                                    <div class='text-sm text-gray-500 font-semibold mt-3'>
                                        Giá hiện tại:
                                        <span>${p.current_Price} đ</span>
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
    </jsp:body>
</t:main>