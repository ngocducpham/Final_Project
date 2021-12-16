<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    <title>Workflow - Bid and Auction</title>
    <jsp:invoke fragment="css"/>
    <script src="${pageContext.request.contextPath}/public/scripts/tailwindcss.js"></script>
</head>
<body class="bg-white">
    <jsp:include page="../../partials/nav.jsp"/>
    <div class="my-20">
        <jsp:doBody/>
    </div>

    <jsp:include page="../../partials/footer.jsp"/>
    <jsp:invoke fragment="js"/>
</body>
</html>