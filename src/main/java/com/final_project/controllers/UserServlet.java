package com.final_project.controllers;
import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.User;
import com.final_project.models.RequestModel;
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

                User u = UserModel.findById(id);
                if (u != null) {
                    request.setAttribute("users", u);
                    ServletUtils.forward("/views/User/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/User", request, response);
                }
                break;
            case "/Reset":
                int id1 = 0;
                try {
                    id1 = Integer.parseInt(request.getParameter("id1"));
                } catch (NumberFormatException ignored) {
                }

                User u1 = UserModel.findById(id1);
                if (u1 != null) {
                    request.setAttribute("users", u1);
                    ServletUtils.forward("/views/User/Reset.jsp", request, response);
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

            case "/Update":
                updateUser(request, response);
                break;
            case "/Delete":
                deleteUser(request, response);
                break;
            case "/Reset":
                resetUser(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    private void resetUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("User_ID"));
        String new_pass = "123456";
        String EnCrypted_pass = BCrypt.withDefaults().hashToString(12, new_pass.toCharArray());
        User u = UserModel.findById(id);
        if(u!=null){
            UserModel.Reset(u, EnCrypted_pass);
            boolean isSend = ServletUtils.sengMail_to_ResetPassword_Admin(u);
            if(isSend){
                ServletUtils.redirect("/Admin/User", request, response);
            }
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("User_ID"));
        UserModel.deleteUserAuction(id);
        UserModel.deleteUserMagage(id);
        UserModel.deleteUserPoint(id);
        UserModel.deleteUserWinList(id);
        UserModel.deleteUserFavorite(id);
        UserModel.deleteUserRequest(id);
        UserModel.deleteUser(id);
        ServletUtils.redirect("/Admin/User", request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("User_ID"));
        int userrole = Integer.parseInt(request.getParameter("userrole"));
        User u = new User(id, userrole);
        UserModel.update(u);
        RequestModel.delete(id);
        ServletUtils.redirect("/Admin/User", request, response);

    }

}

