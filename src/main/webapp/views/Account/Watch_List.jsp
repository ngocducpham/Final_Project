<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="Watch_List" scope="request" type="java.util.List<com.final_project.beans.Product>"/>

<t:personal_page>
    <jsp:body>
        <c:choose>
            <c:when test="${Watch_List.size()==0}">
                <p style="font-size: 90">Khong co san pham yeu thich</p>
            </c:when>
            <c:otherwise>
                <p style="font-size: 90">hehe</p>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:personal_page>