<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<jsp:useBean id="proDetail" scope="request" type="com.final_project.beans.Product"/>
<jsp:useBean id="proAuction" scope="request" type="com.final_project.beans.ProductAuction"/>
<jsp:useBean id="proUser" scope="request" type="com.final_project.beans.User"/>

<t:main>
    <jsp:attribute name="css">
        <style>

            .img__mini-preview::-webkit-scrollbar{width: 5px;}
            .img__mini-preview::-webkit-scrollbar-track{background: aliceblue}
            .img__mini-preview::-webkit-scrollbar-thumb{background: azure;}
            .img__mini-preview::-webkit-scrollbar-thumb:hover{background: #555555;}
        </style>
    </jsp:attribute>
    <jsp:body>


        <div class="flex">
            <%-- Img Blcok --%>
            <div class="flex mr-auto">
            <%-- Img Mini --%>
                <div class="img__mini-preview flex-column space-y-5 mr-3 overflow-auto pr-2" style="height: 450px">
                    <div class="border-indigo-400 rounded-md cursor-pointer">
                        <img class="w-20 h-25 rounded-md"
                         src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/1.jpg"
                         alt="${proDetail.pname}">
                    </div>

                    <div class="border-indigo-400 rounded-md cursor-pointer">
                        <img class="w-20 h-25 rounded-md"
                             src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/2.jpg"
                             alt="${proDetail.pname}">
                    </div>

                    <div class="border-indigo-400 rounded-md cursor-pointer">
                        <img class="w-20 h-25 rounded-md"
                             src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/3.jpg"
                             alt="${proDetail.pname}">
                    </div>
                    <%--3anh--%>
                </div>
            <%-- Img Main --%>
                <div class="rounded-lg border border-indigo-400" style="height: 450px">
                    <div class="border-indigo-400 rounded-md cursor-pointer">
                        <img class="rounded-lg" style="height: 450px; width: 350px"
                             src="${pageContext.request.contextPath}/public/imgProduct/${proDetail.pro_ID}/main.jpg"
                             alt="${proDetail.pname}">
                    </div>
                </div>
            </div>

            <%--Info --%>
           <div>
               <div class="text-3xl text-gray-700 font-weight-bold">${proDetail.pname}</div>
               <%--Deadline--%>
               <div class="flex justify-content-between text mt-8 font-weight-light text-center w-4/5">
                   <div>
                       <div class="text-lg">#</div>
                       <div class="text-gray-500">Ngày</div>
                   </div>
                   <div>
                       <div class="text-lg">#</div>
                       <div class="text-gray-500">Giờ</div>
                   </div>
                   <div>
                       <div class="text-lg">#</div>
                       <div class="text-gray-500">Phút</div>
                   </div>
                   <div>
                       <div class="text-lg">#</div>
                       <div class="text-gray-500">Giây</div>
                   </div>
               </div>

               <div class="flex mt-8">
                       <%--Gia --%>
                   <div>
                       <div class="font-weight-light text-lg text-gray-500">
                           GIÁ HIỆN TẠI:
                       </div>
                       <div class="text-lg text-green-600 font-weight-light">
                           <fmt:formatNumber value="${proAuction.current_Price}" type="number"/>
                           <span class="text-gray-700">vnd</span>
                       </div>
                   </div>

                   <%--Bidder cao nhat--%>
                   <div class="ml-16">
                       <div class="font-weight-light text-lg text-gray-500">
                           NGƯỜI ĐẶT GIÁ CAO NHẤT:
                       </div>
                       <div class="flex-space-x-2 align-items-center text-indigo-600">
                           <span class="iconify text-lg" data-icon="si-glyph:champion-cup"></span>
                           <div class="text-lg font-weight-light">${proAuctio.user_ID}
                           </div>
                       </div>
                   </div>

               </div>
               <div class="flex">
                   <div>
                       <div class="font-weight-light text-lg mt-3 text-gray-500">NGƯỜI BÁN: </div>
                       <div class="text-lg font-weight-light">${proUser.username}<span>${proUser.user_ID}</span></div>
                   </div>
                   <div class="ml-32">
                       <div class="font-weight-light text-lg mt-3 text-gray-500">THỜI ĐIỂM ĐĂNG:</div>
                       <div class="text-lg font-weight-light">${proAuction.start_Time}</div>
                   </div>
               </div>


               <div class="mt-8">
                   <div class="font-weight-light text-lg mt-3 text-gray-500">ĐẤU GIÁ NGAY</div>
                   <div class="flex">
                       <form action="POST" class="flex align-items-center">
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
                               <span>ĐẶT GIÁ THẦU</span>
                           </button>
                       </form>
                   </div>
               </div>
           </div>

        </div>

        <table class="table mt-16">
            <thead>
            <tr>
                <th scope="col">NGƯỜI ĐẤU GIÁ</th>
                <th scope="col">GIÁ THẦU</th>
                <th scope="col">THỜI ĐIỂM</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td></td>
            </tr>
            </tbody>
        </table>
        <%--mo ta sp--%>
        <div class="mt-5">
            <h4 class="text-lg font-weight-light mb-3">MÔ TẢ SẢN PHẦM</h4>
            <div class="card-text">
                ${proDetail.description}
            </div>
        </div>

        <div class="mt-20">
            <h4 class="font-weight-bold text-2xl text-gray-500">CÁC SẢN PHẦM CÙNG LOẠI</h4>
            <div class="flex justify-content-between mt-10">
                <img class="h-60 w-100 rounded-t-lg" src="" alt></img>
                <div class="p-3 w-100 text-center">
                    <a href="#" class="font-weight-bold w-100 hover:underline">

                    </a>
                    <div class="text-sm text-gray-500 font-weight-bold mt-3">
                        Giá hiện tại:  <span> </span>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>

