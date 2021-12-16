<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
  <jsp:body>
    <div class='w-full h-screen' style='background-image: url("${pageContext.request.contextPath}/public/imgs/main-banner-bg.png");'>
      <div class='max-w-7xl mx-auto flex items-center justify-between'>
        <div class='max-w-md'>
          <div class='text-white text-7xl font-bold'>Hot Deal <br> For You</div>
          <div class='text-gray-200 text-xl font-normal mt-5'>We’re constantly bringing new properties market so
            keep visiting our website
            that you don’t miss out on the next opportunity.
          </div>
          <a href='#'
             class='block font-semibold bg-indigo-600 hover:bg-indigo-700 text-white text-xl px-7 py-3 w-64 mt-8 rounded-full text-center'>GETTING
            STARTED</a>
        </div>
        <div>
          <img src="${pageContext.request.contextPath}/public/imgs/main-banner.png" alt="">
        </div>
      </div>
      <img src="${pageContext.request.contextPath}/public/imgs/main-banner-bottom.png" alt="">
    </div>
  </jsp:body>
</t:main>