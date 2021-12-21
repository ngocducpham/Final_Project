<%@ tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/public/imgs/icon.svg" sizes="any" type="image/svg+xml">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/styles/Personal_left_panel.css">
    <script src="${pageContext.request.contextPath}/public/scripts/tailwindcss.js"></script>
    <title>Workflow - Bid and Auction</title>
    <jsp:invoke fragment="css"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

</head>
<body class="bg-white">

<jsp:include page="../../partials/nav.jsp"/>
<div class="container container-fluid mt-5">
    <div class="row">
        <div class="col-4">
            <jsp:include page="../../partials/Personal_left_panel.jsp"/>
        </div>
        <div class="col-7">
            <jsp:doBody/>
        </div>
    </div>
</div>
<jsp:include page="../../partials/footer.jsp"/>


<%--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"--%>
<%--        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"--%>
<%--        crossorigin="anonymous"></script>--%>
<script src="${pageContext.request.contextPath}/public/scripts/iconify.js"></script>
<script src="https://kit.fontawesome.com/618a331a9e.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/public/scripts/navabar.js"></script>
<jsp:invoke fragment="js"/>
</body>
</html>