package com.final_project.Filters;

import com.final_project.beans.Category;
import com.final_project.beans.User;
import com.final_project.models.CategoryModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LoginFilter", value = "/*")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        if (session.getAttribute("Verified") == null) {
            session.setAttribute("Verified", false);
            session.setAttribute("authUser", new User());
            session.setAttribute("email_used",false);
        }

        List<Category> category = CategoryModel.findAll();
        session.setAttribute("categories", category);
        chain.doFilter(request, response);
    }
}