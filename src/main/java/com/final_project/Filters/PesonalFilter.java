package com.final_project.Filters;

import com.final_project.beans.Category;
import com.final_project.beans.User;
import com.final_project.models.CategoryModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "PesonalFilter",value = "/Personal/*")
public class PesonalFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("false_old_pass") == null) {
            session.setAttribute("false_old_pass", false);
            session.setAttribute("success_change_pass",false);
        }
        chain.doFilter(request, response);
    }
}
