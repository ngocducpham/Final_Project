<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="Watch_List" scope="request" type="java.util.List<com.final_project.beans.ProductAuction>"/>

<t:personal_page>
      <jsp:attribute name="js">
        <script>
            let timeEndList = [];
            <c:forEach items="${Watch_List}" var="p">
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
                        if(timecout != null){
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
    <jsp:body>
        <c:choose>
            <c:when test="${Watch_List.size()==0}">
                <div style="font-size: 50px;  color:darkred"></div>
<%--                <div class=' h-screen mx-auto flex flex-col'>--%>
                <div class='max-w-4xl h-25 mx-auto flex flex-col'>

                    <div class="d-flex justify-between align-items-end">
                        <div>
                            <h6 style="font-size: 40px" class='text-danger font-weight-bold mt-12'>Không có sản phẩm yêu thích!</h6>
                        </div>
                        <div >
                            <a class="btn btn-primary btn-lg active"  role="button" href="${pageContext.request.contextPath}/Search?searchproduct">
                                <i class="fas fa-arrow-alt-circle-right"></i> Tới trang Đấu Giá!
                            </a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div style="font-weight: bold;font-size: 36px">Sản Phẩm Bạn Đã Thêm Vào Mục <span style="color:red;">Yêu Thích</span>
                </div>
                <div class='flex space-x-3 space-y-3 mt-10 flex-wrap'>
                    <c:forEach items="${Watch_List}" var="p">
                        <a href="${pageContext.request.contextPath}/ProductDetail?id=${p.pro_ID}">
                            <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>
                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>
                                Số lần bid: ${p.total_Bid}
                            </span>
                                <img class='h-60 w-full rounded-t-lg'
                                     src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg"
                                     alt="">
                                <div class='px-2 w-full text-center mt-2'>
                                    <a class='font-semibold w-full hover:underline'
                                        href="/Final_Project/ProductDetail?id=${p.pro_ID}">${p.pname}</a>
                                    <div class='text-sm text-gray-500 font-semibold mt-3'>
                                        Giá hiện tại:
                                        <c:choose>
                                            <c:when test="${p.max_price >0}">
                                                <span><fmt:formatNumber value="${p.max_price}" type="number"/> đ</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span><fmt:formatNumber value="${p.current_Price}" type="number"/> đ</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div><i class="red fa fa-trophy fa-sm"> ${p.username}</i></div>
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
                        </a>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:personal_page>