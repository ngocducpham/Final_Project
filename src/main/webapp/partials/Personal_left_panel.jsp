<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>

<div class="navUser">
    <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
    <figure class="avatar"><img src="${pageContext.request.contextPath}/public/imgs/user.svg" alt="User picture">
    </figure>
    <p class="info">${authUser.username}</p>
    <p class="info">${authUser.email}</p>
    <div class="navigateBox">
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/User_Information"
                                  ><i class="blue fas fa-user pr-2"></i> Hồ sơ của tôi
        </a>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/User_Change_Password"
                                 ><i class="blue fas fa-lock pr-2"></i> Đổi mật khẩu </a>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/User_Auction"
                                  ><i class="blue fas fa-wallet pr-2"></i> Đấu Giá Của Tôi
        </a>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/User_Watch_List">
                                  <i class="blue fas fa-heart pr-2"></i> Sản Phẩm Yêu Thích</a>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/User_Won_Auction"
                                  ><i class="blue fas fa-trophy pr-2"></i> Sản Phẩm Đã Thắng
        </a>
        <c:if test="${authUser.userrole==2}">
            <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Seller/Post_Products"
                                     ><i class="blue fas fa-truck pr-2"></i> Đăng bán Sản Phẩm
            </a>
            <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/My_Post_Products?option=1"
                                     > <i class="blue fas fa-shopping-cart pr-2"></i> Sản Phẩm Của Tôi
            </a>
        </c:if>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="${pageContext.request.contextPath}/Personal/My_Rates"
                            ><i class="blue fas fa-envelope-open-text pr-2"></i> Danh Sách Đánh Giá
        </a>
        <a class="btn btn-outline-info w-75 mb-2 text-left" role="button" href="javascript: $('#frmLogout').submit()"><i
                class="blue fa fa-sign-out pr-2" aria-hidden="true"></i> Đăng xuất </a>
    </div>
</div>

