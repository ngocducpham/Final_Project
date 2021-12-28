<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="Get_Rates" scope="request" type="java.util.List<com.final_project.beans.Rates>"/>

<t:personal_page>
    <jsp:body>
        <div style="font-weight: bold;font-size: 36px">Danh sách <span
                style="color:red;">những người đánh giá bạn</span>
        </div>
        <div class="card mt-10">

            <c:choose>
                <c:when test="${Get_Rates.size() == 0}">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover text-md">
                            <thead>
                            <tr>
                                <th>ID bidder rates</th>
                                <th>Vote</th>
                                <th>Comment</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${Get_Rates}" var="c">
                                <tr>
                                    <td>${c.bidder}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.vote== 1}">
                                                +1
                                            </c:when>
                                            <c:when test="${c.vote== -1}">
                                                -1
                                            </c:when>
                                            <c:otherwise>
                                                0
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                            ${c.comment}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:personal_page>
