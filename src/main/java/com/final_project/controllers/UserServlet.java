package com.final_project.controllers;
import com.final_project.beans.User;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/Admin/User/*")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<User> list = UserModel.findAll();
                request.setAttribute("users", list);
                ServletUtils.forward("/views/User/Index.jsp", request, response);
                break;
            case "/Edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ignored) {
                }
                String userRequest = request.getParameter("requests");

                User u = UserModel.findById(id);
                if (u != null) {
                    request.setAttribute("users", u);
                    ServletUtils.forward("/views/User/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/User", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path){

            case "/Delete":
                //deleteUser(request, response);
                break;
            case "/Update":
                updateUser(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("User_ID"));
        int userrole = Integer.parseInt(request.getParameter("userrole"));
        User u = new User(id, userrole);
        UserModel.update(u);
        ServletUtils.redirect("/Admin/User", request, response);
    }
}

