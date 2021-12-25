<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>

<div class="navUser">
    <figure class="avatar"><img src="${pageContext.request.contextPath}/public/imgs/user.svg" alt="User picture"></figure>
    <p class="info">${authUser.username}</p>
    <p class="info">${authUser.email}</p>
    <div class="navigateBox">
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/User_Information" class="a__myProfile"><i class="blue fas fa-user pr-2"></i> Hồ sơ của tôi </a>
        </div>
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/User_Change_Password" class="a__myProfile"><i class="blue fas fa-lock pr-2"></i> Đổi mật khẩu </a></div>
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/User_Auction" class="a__myProfile"><i class="blue fas fa-wallet pr-2"></i> Đấu Giá Của Tôi </a></div>
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/User_Watch_List" class="a__myProfile"><i class="blue fas fa-stream pr-2"></i>Sản Phẩm Yêu Thích</a></div>
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/User_Won_Auction" class="a__myProfile"><i class="blue fas fa-stream pr-2"></i>Sản Phẩm Đã Thắng</a></div>
        <c:if test="${authUser.userrole==2}">
            <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/Post_Products" class="a__myProfile"><i class="blue fas fa-truck pr-2"></i>Đăng bán Sản Phẩm</a></div>
        </c:if>
        <div class="myProfile"><a href="${pageContext.request.contextPath}/Personal/Logout" class="a__myProfile"><i class="blue fa fa-sign-out" aria-hidden="true"></i> Đăng xuất </a></div>
    </div>
</div>

