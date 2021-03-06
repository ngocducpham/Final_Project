<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="Select" scope="request"  type="com.final_project.beans.Rates"/>
<jsp:useBean id="voted" scope="request" type="java.lang.Boolean"/>

<t:personal_page>
    <jsp:attribute name="css">
        <style>
            .fs-12 {
                font-size: 24px
            }

            .shadow-none {
                box-shadow: none
            }


            .cursor:hover {
                color: blue
            }

            .cursor {
                cursor: pointer
            }

            .textarea {
                resize: none
            }

        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            let voted = document.getElementById('voted').getAttribute('voted');
            let btnSubmit = document.getElementById('btnSubmit');
            let formVote = document.getElementById('formVote');

            btnSubmit.addEventListener('click', ()=>{
                if(voted == 'true')
                    alert("Bạn đã đánh giá người này rồi");
                else formVote.submit();
            })

        </script>
    </jsp:attribute>
    <jsp:body>
        <div>


        </div>
        <figure class="avatar"><img src="${pageContext.request.contextPath}/public/imgs/user.svg" alt="User picture">
        </figure>
        <div class="text-center">
            <div>Người bán: <span style="color: red">${Select.username}</span><span style="color: #2fa5e9; font-size: 20px;"> (Điểm: ${Select.total}%)</span></div>
        </div>

        <div class="d-flex justify-content-around text-sm text-gray-500 font-semibold mt-3">
            <div>Ngày hết hạn bán: ${Select.seller_Expired_date}</div>
        </div>
        <!-- cmt -->

        <div class="container-fluid mt-3">
            <form id="formVote" method="post">
                <div class="">
                        Đánh giá người bán này:
                        <input class="ml-3" title="Vote +1" id="Vote1" type="radio" name="Vote" value="1" > Like(+1)
                        <input class="ml-3" title="Vote -1" id="Vote2" type="radio" name="Vote" value="-1" > Không thích(-1)
                </div>
                <input name="Seller_ID" type="text" style="visibility: hidden" value="${Select.seller_ID}">
                <input name="Pro_ID" type="text" style="visibility: hidden" value="${Select.pro_ID}">
                <div id="voted" class="hidden" voted="${voted}">
                </div>
                <div class="d-flex justify-content-center row">
                    <div class="col-12">
                        <div class="d-flex flex-column comment-section">

                            <div class="bg-light">
                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Nhận xét của bạn về người bán này:</label>
                                        <textarea class="form-control ml-1 shadow-none textarea" id="exampleFormControlTextarea1" rows="6" name="Comment"></textarea>
                                    </div>
                                <div class="mt-2 text-right">
                                    <button type="button" id="btnSubmit" class="btn btn-outline-primary btn-sm shadow-none text-blue"
                                             >Gửi đi
                                    </button>
                                    <button class="btn btn-outline-danger btn-sm ml-1 shadow-none" type="button">
                                        <a href="${pageContext.request.contextPath}/Personal/MyBidder_Rates" class="hover:underline">Hủy</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

<%--        <c:choose>--%>
<%--            <c:when test="${User_Won_Auction_Product_List.size()==0}">--%>
<%--                <div style="font-size: 50px;  color:darkred"></div>--%>
<%--                <div class='max-w-4xl h-screen mx-auto flex flex-col'>--%>
<%--                    <div>--%>
<%--                        <svg class='h-16 w-30' viewBox="0 0 143 32" xmlns="http://www.w3.org/2000/svg">--%>
<%--                            <path fill="#6366f1"--%>
<%--                                  d="M15.258 26.865a4.043 4.043 0 01-1.133 2.917A4.006 4.006 0 0111.253 31a3.992 3.992 0 01-2.872-1.218 4.028 4.028 0 01-1.133-2.917c.009-.698.2-1.382.557-1.981.356-.6.863-1.094 1.47-1.433-.024.109.09-.055 0 0l1.86-1.652a8.495 8.495 0 002.304-5.793c0-2.926-1.711-5.901-4.17-7.457.094.055-.036-.094 0 0A3.952 3.952 0 017.8 7.116a3.975 3.975 0 01-.557-1.98 4.042 4.042 0 011.133-2.918A4.006 4.006 0 0111.247 1a3.99 3.99 0 012.872 1.218 4.025 4.025 0 011.133 2.917 8.521 8.521 0 002.347 5.832l.817.8c.326.285.668.551 1.024.798.621.33 1.142.826 1.504 1.431a3.902 3.902 0 01-1.504 5.442c.033-.067-.063.036 0 0a8.968 8.968 0 00-3.024 3.183 9.016 9.016 0 00-1.158 4.244zM19.741 5.123c0 .796.235 1.575.676 2.237a4.01 4.01 0 001.798 1.482 3.99 3.99 0 004.366-.873 4.042 4.042 0 00.869-4.386 4.02 4.02 0 00-1.476-1.806 3.994 3.994 0 00-5.058.501 4.038 4.038 0 00-1.175 2.845zM23.748 22.84c-.792 0-1.567.236-2.226.678a4.021 4.021 0 00-1.476 1.806 4.042 4.042 0 00.869 4.387 3.99 3.99 0 004.366.873A4.01 4.01 0 0027.08 29.1a4.039 4.039 0 00-.5-5.082 4 4 0 00-2.832-1.18zM34 15.994c0-.796-.235-1.574-.675-2.236a4.01 4.01 0 00-1.798-1.483 3.99 3.99 0 00-4.367.873 4.042 4.042 0 00-.869 4.387 4.02 4.02 0 001.476 1.806 3.993 3.993 0 002.226.678 4.003 4.003 0 002.832-1.18A4.04 4.04 0 0034 15.993z" />--%>
<%--                            <path fill="#6366f1"--%>
<%--                                  d="M5.007 11.969c-.793 0-1.567.236-2.226.678a4.021 4.021 0 00-1.476 1.807 4.042 4.042 0 00.869 4.386 4.001 4.001 0 004.366.873 4.011 4.011 0 001.798-1.483 4.038 4.038 0 00-.5-5.08 4.004 4.004 0 00-2.831-1.181z" />--%>
<%--                            <path fill="#6366f1"--%>
<%--                                  d="M58.664 11.136l-2.04 7.392-2.184-7.392h-2.928l-2.184 7.368-2.04-7.368H44l3.816 12h2.952l2.208-7.272 2.208 7.272h2.952l3.816-12h-3.288zM68.864 23.472c3.528 0 6.36-2.76 6.36-6.336 0-3.576-2.832-6.336-6.36-6.336-3.528 0-6.336 2.76-6.336 6.336 0 3.576 2.808 6.336 6.336 6.336zm0-3.024c-1.824 0-3.24-1.368-3.24-3.312 0-1.944 1.416-3.312 3.24-3.312 1.848 0 3.264 1.368 3.264 3.312 0 1.944-1.416 3.312-3.264 3.312zM80.498 13.2v-2.064h-3.096v12h3.096V17.4c0-2.52 2.04-3.24 3.648-3.048v-3.456c-1.512 0-3.024.672-3.648 2.304zM97.02 23.136l-4.967-6.072 4.824-5.928H93.18l-4.128 5.28V6.336h-3.096v16.8h3.096v-5.448l4.368 5.448h3.6zM105.022 6c-3.816 0-5.64 1.704-5.64 5.016v.12h-1.728v2.976h1.728v9.024h3.096v-9.024h1.992v-2.976h-1.992v-.12c0-1.632.936-2.304 2.544-2.304.312 0 .648 0 .984.024v14.4h3.096V6.504c-1.32-.264-2.568-.504-4.08-.504zM117.637 23.472c3.528 0 6.36-2.76 6.36-6.336 0-3.576-2.832-6.336-6.36-6.336-3.528 0-6.336 2.76-6.336 6.336 0 3.576 2.808 6.336 6.336 6.336zm0-3.024c-1.824 0-3.24-1.368-3.24-3.312 0-1.944 1.416-3.312 3.24-3.312 1.848 0 3.264 1.368 3.264 3.312 0 1.944-1.416 3.312-3.264 3.312zM139.219 11.136l-2.04 7.392-2.184-7.392h-2.928l-2.184 7.368-2.04-7.368h-3.288l3.816 12h2.952l2.208-7.272 2.208 7.272h2.952l3.816-12h-3.288z" />--%>
<%--                        </svg>--%>
<%--                    </div>--%>
<%--                    <h6 style="font-size: 40px" class='text-danger font-weight-bold mt-12'>Bạn Chưa Thắng Cuộc Đấu Giá Nào!</h6>--%>
<%--                </div>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>

<%--                <div style="font-weight: bold;font-size: 36px">Sản Phẩm Bạn <span--%>
<%--                        style="color:red;">Đã Thắng</span> Đấu Giá--%>
<%--                </div>--%>
<%--                <div class='flex space-x-3 space-y-3 mt-10 flex-wrap'>--%>
<%--                    <c:forEach items="${User_Won_Auction_Product_List}" var="p">--%>
<%--                        <a href="${pageContext.request.contextPath}/ProductDetail?id=${p.pro_ID}">--%>
<%--                            <div class='relative w-56 pb-4 border rounded-lg bg-white overflow-hidden shadow-md'>--%>
<%--                                <span class='rounded-br-full absolute top-0 left-0 pl-2 py-2 pr-5 bg-gray-300 text-xs font-bold'>--%>
<%--                                Số lần bid: ${p.total_Bid}--%>
<%--                            </span>--%>
<%--                                <img class='h-60 w-full rounded-t-lg'--%>
<%--                                     src="${pageContext.request.contextPath}/public/imgProduct/${p.pro_ID}/main.jpg"--%>
<%--                                     alt="">--%>
<%--                                <div class='px-2 w-full text-center mt-2'>--%>
<%--                                    <a class='font-semibold w-full hover:underline'--%>
<%--                                        href="/Final_Project/ProductsDetail?id=${p.pro_ID}">--%>
<%--                                            ${p.pname}--%>
<%--                                    </a>--%>
<%--                                    <div class="text-sm text-blue-500 font-semibold mt-2">--%>
<%--                                        <a href="${pageContext.request.contextPath}/Personal/Rate_Seller" class="hover:underline">--%>
<%--                                        Người bán: ${p.seller_name}--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class='text-sm text-gray-500 font-semibold mt-3'>--%>
<%--                                        Giá hiện tại:--%>
<%--                                        <span><fmt:formatNumber value="${p.max_price}" type="number"/> đ</span>--%>
<%--                                    </div>--%>
<%--                                    <div><i class="red fa fa-trophy fa-sm"> ${p.winner_name}</i></div>--%>
<%--                                    <div class='timeContainer flex justify-around text-xs mt-3 font-semibold'>--%>
<%--                                        <div>--%>
<%--                                            <div class='days text-sm'>05</div>--%>
<%--                                            <div class='text-gray-500'>Ngày</div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class='hours text-sm'>05</div>--%>
<%--                                            <div class='text-gray-500'>Giờ</div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class='minutes text-sm'>05</div>--%>
<%--                                            <div class='text-gray-500'>Phút</div>--%>
<%--                                        </div>--%>
<%--                                        <div>--%>
<%--                                            <div class='seconds text-sm'>05</div>--%>
<%--                                            <div class='text-gray-500'>Giây</div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--&lt;%&ndash;                                    <div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <a href="${pageContext.request.contextPath}/Rate?id=${p.pro_ID}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </a>--%>
<%--                    </c:forEach>--%>
<%--                </div>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
    </jsp:body>
</t:personal_page>