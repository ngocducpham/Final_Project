package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.User;
import com.final_project.models.ProductAutionModel;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "SecurityServlet", value = "/Admin/*")
public class SecurityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Login";
        }
        switch (path) {
            case "/Login":
                ServletUtils.forward("/views/Admin/Login.jsp", request, response);
                break;
            case "/Logout":
                logoutAdmin(request, response);
                break;
            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    private void logoutAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("adminlogin", false);
        ServletUtils.redirect("/Admin/Login", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Login";
        }
        switch (path) {
            case "/Login":
                Login(request, response);
                break;
            default:
                break;
        }
    }

    private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.Find_By_Email(email);

        if (user != null && user.getUserrole() == 3) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPass());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("adminlogin", true);
                ServletUtils.redirect("/Admin/Dashboard/Index", request, response);
            } else {
                // sai password
                request.setAttribute("hasError", true);
                ServletUtils.redirect("/Admin/Login", request, response);

            }
        } else {
            request.setAttribute("hasError", true);
            ServletUtils.redirect("/Admin/Login", request, response);
        }
    }
}
