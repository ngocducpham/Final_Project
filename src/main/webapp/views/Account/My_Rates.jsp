<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="authUser" scope="session" type="com.final_project.beans.User"/>
<jsp:useBean id="Get_Rates" scope="request" type="java.util.List<com.final_project.beans.Rates>"/>
<jsp:useBean id="Get_Point" scope="request" type="java.util.List<com.final_project.beans.Rates>"/>

<t:personal_page>
    <jsp:body>
        <div style="font-weight: bold;font-size: 36px">Danh sách <span
                style="color:red;">những người đánh giá bạn</span>
        </div>
        <div class="mt-2">
                <div style="font-size: 30px; font-weight: bold;">Điểm của bạn:<span style="color: blue"> ${Get_Point.get(0).total}%</span></div>
        </div>
        <div class="card mt-10">

            <c:choose>
                <c:when test="${Get_Rates.size()==0 }">
                    <div class="card-body">
                        <p class="card-text">Không có dữ liệu.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="card-body">
                        <table class="table table-hover text-sm">
                            <thead>
                            <tr>
                                <th>ID bidder rates</th>
                                <th>Tên bidder</th>
                                <th>Điểm</th>
                                <th>Vote</th>
                                <th>Comment</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${Get_Rates}" var="c">
                                <c:if test="${c.type == 1 && c.seller_ID == authUser.user_ID}">
                                <tr>
                                    <td>${c.bidder}
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/Personal/Rate_Bidder?bidder=${c.bidder}&pro_id=${c.pro_ID}" class="hover:underline">
                                        ${c.username}
                                        </a>
                                    </td>
                                    <td>
                                        ${c.total}%
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.vote== 1}">
                                                +1
                                            </c:when>
                                            <c:otherwise>
                                                -1
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>

                                            ${c.comment}
                                    </td>
                                </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </jsp:body>
</t:personal_page>
