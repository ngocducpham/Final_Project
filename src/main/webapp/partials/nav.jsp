<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Verified" scope="session" type="java.lang.Boolean"/>
<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="categories" scope="session" type="java.util.List<com.final_project.beans.Category>"/>

<nav class='bg-gray-800 sticky top-0 z-50'>
    <form id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
    <div class='max-w-7xl mx-auto px-2'>
        <div class='relative flex items-center justify-between h-16'>
            <div class='flex'>
                <div class='flex items-center'>
                    <a href="${pageContext.request.contextPath}" style="text-decoration: none">
                        <img class='h-8' src="${pageContext.request.contextPath}/public/imgs/logo.svg" alt="">
                    </a>
                </div>
                <div class='flex space-x-4 ml-6 items-center'>
                    <button id="btn__home" type="button" class="text-sm font-medium text-gray-300 rounded-md px-3 py-2 hover:bg-gray-700">
                        <span>Trang chủ</span>
                    </button>
                    <script>
                        document.getElementById('btn__home').addEventListener('click' ,()=>{
                            location.href = "${pageContext.request.contextPath}";
                        })
                    </script>
                    <div
                            class='bid__menu categories__menu relative text-sm font-medium text-gray-300 rounded-md px-3 py-2 hover:bg-gray-700'>
                        <a href="${pageContext.request.contextPath}/Search?searchproduct">Đấu giá</a>
                        <ul class='invisible'>

                        </ul>
                    </div>
                </div>
            </div>
            <div class='flex items-center space-x-4'>
                <div class='relative mr-3'>
                    <div class='absolute left-2 top-2 flex items-center justify-center text-center'>
                        <svg class='fill-gray-400' xmlns="http://www.w3.org/2000/svg"
                             xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1.5em"
                             height="1.5em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
                            <path
                                    d="M19.023 16.977a35.13 35.13 0 0 1-1.367-1.384c-.372-.378-.596-.653-.596-.653l-2.8-1.337A6.962 6.962 0 0 0 16 9c0-3.859-3.14-7-7-7S2 5.141 2 9s3.14 7 7 7c1.763 0 3.37-.66 4.603-1.739l1.337 2.8s.275.224.653.596c.387.363.896.854 1.384 1.367l1.358 1.392l.604.646l2.121-2.121l-.646-.604c-.379-.372-.885-.866-1.391-1.36zM9 14c-2.757 0-5-2.243-5-5s2.243-5 5-5s5 2.243 5 5s-2.243 5-5 5z"></path>
                        </svg>
                    </div>
                    <form id="nav__searchform" action="${pageContext.request.contextPath}/Search" method="GET">
                        <input id="nav__searchproduct" name="searchproduct" type="text"
                               class='h-9 w-72 rounded-md bg-gray-600 pl-10 pr-5 text-white focus:outline-none'
                               placeholder='Tìm sản phẩm'>
                    </form>
                </div>
                <c:choose>
                    <c:when test="${Verified}">
                        <form id="Form_Request" method="post"
                              action="${pageContext.request.contextPath}/Personal/Request?id=${authUser.user_ID}"></form>
                        <div class='nav__user-box flex space-x-5 items-center'>
                            <button type='button'
                                    class='bid__menu relative nav__user-icon rounded-full focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white p-1'>
                                <img class="h-9 w-9 " src="${pageContext.request.contextPath}/public/imgs/user.svg"
                                     alt="">
                                <span class='text-left invisible'>
                                <ul class='right-0 text-sm font-semibold'>
                                    <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="bx:bxs-user"></span>
                                        <a href="${pageContext.request.contextPath}/Personal/User_Information">Tài khoản</a>
                                    </li>
                                    <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="ri:auction-fill"></span>
                                        <a href="${pageContext.request.contextPath}/Personal/User_Auction">Đấu giá của bạn</a>

                                    </li>
                                     <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="ant-design:heart-filled"></span>
                                        <a href="${pageContext.request.contextPath}/Personal/User_Watch_List">Sản Phẩm Yêu Thích</a>

                                    </li>
                                    <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="ri:lock-password-fill"></span>
                                        <a href="${pageContext.request.contextPath}/Personal/User_Change_Password">Đổi mật khẩu</a>
                                    </li>
                                    <c:if test="${authUser.userrole==1}">
                                        <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="codicon:request-changes"></span>
                                        <a href="javascript: $('#Form_Request').submit()">Đăng Kí Bán</a>
                                    </li>
                                    </c:if>
                                    <li class='flex items-center'>
                                        <span class="iconify text-2xl mr-2" data-icon="ion:log-out-sharp"></span>
                                        <a href="javascript: $('#frmLogout').submit()">Đăng xuất</a>
                                    </li>
                                </ul>
                            </span>
                            </button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class='flex space-x-2'>
                            <a href='${pageContext.request.contextPath}/Account/Login'
                               class='hover:bg-gray-700 rounded-md  px-3 py-1 text-white focus:outline-none'>Đăng
                                nhập</a>
                            <a href='${pageContext.request.contextPath}/Account/Register'
                               class='hover:bg-gray-700 rounded-md ring-2 ring-gray-400 px-3 py-1 text-white focus:outline-none'>Đăng
                                kí</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <script>
        let categories = [];
        <c:forEach items="${categories}" var="c">
        categories.push(['${c.cat_ID}', '${c.cname}', '${c.cparent_ID}']);
        </c:forEach>

        let categoriesMenu = document.querySelector('.categories__menu').querySelector('ul');
        for (const iterator of categories) {
            if (iterator[2] == 0) {
                let listItem = document.createElement('li');

                let achor = document.createElement('a');
                achor.innerText = iterator[1];
                achor.href = "${pageContext.request.contextPath}/Search?cate=" + iterator[0];

                let cateIDInput = document.createElement('input');
                cateIDInput.setAttribute('type', 'hidden');
                cateIDInput.value = iterator[0];

                listItem.appendChild(cateIDInput);
                listItem.appendChild(achor);

                categoriesMenu.appendChild(listItem);
            }
        }

        let cateList = categoriesMenu.querySelectorAll('li');
        for (const iterator of categories) {
            if (iterator[2] != 0) {
                cateList.forEach(item => {
                    let getID = item.querySelector('input').value;

                    if (getID == iterator[2]) {
                        let checkUl = item.querySelector('ul');
                        if (checkUl == null) {
                            checkUl = document.createElement('ul');
                            item.appendChild(checkUl);
                        }

                        let achor = document.createElement('a');
                        achor.innerText = iterator[1];
                        achor.href = "${pageContext.request.contextPath}/Search?cate=" + iterator[0];

                        let subListItem = document.createElement('li');
                        subListItem.appendChild(achor);

                        checkUl.appendChild(subListItem);
                    }
                });
            }
        }
    </script>
</nav>
