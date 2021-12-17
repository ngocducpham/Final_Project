<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/navbar.css">
    <title>Workflow - Bid and Auction</title>
    <jsp:invoke fragment="css"/>
    <script src="${pageContext.request.contextPath}/public/scripts/tailwindcss.js"></script>
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
</head>
<body class="bg-white">
<jsp:include page="../../partials/nav.jsp"/>
<jsp:doBody/>
<jsp:include page="../../partials/footer.jsp"/>
<jsp:invoke fragment="js"/>
<script>
    let menu = document.querySelectorAll('.bid__menu').forEach(e => {
        let dropdown = e.querySelector('ul');
        dropdown.querySelectorAll('a').forEach(i =>{
            i.classList.add("w-full");
        });
        dropdown.className = "bid__dropdown invisible z-10 transition-all delay-75 absolute bg-gray-700 w-52 text-white mt-3 rounded-md left-0 py-1";
        let dropdownItem = dropdown.querySelectorAll('li');
        console.log(dropdownItem);
        dropdownItem.forEach(item => {
            let arrow = document.createElement('span');
            arrow.setAttribute('class', "iconify text-lg");
            arrow.setAttribute('data-icon', "fe:arrow-right");

            item.className = "px-4 py-2 hover:bg-gray-600 flex justify-between items-center";
            let submenu = item.querySelector('ul');
            if (submenu != null) {
                item.classList.add("relative");
                item.classList.add("bid__submenu");
                submenu.className = "bid__submenu-dropdown z-10 invisible absolute bg-gray-700 w-52 text-white rounded-md left-full top-0 py-1";
                item.appendChild(arrow);
            }
        });

    });
</script>
</body>
</html>