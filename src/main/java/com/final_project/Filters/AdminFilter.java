package com.final_project.Filters;

import com.final_project.beans.User;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter", value = "/Admin/*")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("adminlogin") == null) {
            session.setAttribute("adminlogin", false);
        }
        if (session.getAttribute("authUser") != null) {
            User u = (User) session.getAttribute("authUser");
            if (u.getUserrole() < 3) {
                ServletUtils.forward("/views/404/index.jsp", request,(HttpServletResponse) response);
            }
        }
        chain.doFilter(request, response);
    }
}
