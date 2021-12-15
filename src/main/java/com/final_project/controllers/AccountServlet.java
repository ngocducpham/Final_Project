package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.User;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=request.getPathInfo();
        if (path.equals("/")){

        }else {
            switch (path){
                case "/Register":
                    ServletUtils.forward("/views/Account/Register.jsp",request,response);
                    break;
                case "/Login":
                    ServletUtils.forward("/views/Account/Login.jsp",request,response);
                    break;
                default:
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=request.getPathInfo();
        if (path.equals("/")){

        }else {
            switch (path){
                case "/Register":
                    AddnewUser(request,response);
                    break;
                case "/Login":
                    Login(request,response);
                    break;
                default:
                    break;
            }
        }
    }

    private void AddnewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        String email,pass,name,address;
        String ngaysinh;

        email=request.getParameter("email");
        pass=request.getParameter("password");
        name=request.getParameter("name");
        address=request.getParameter("full_address");
        ngaysinh=request.getParameter("dob");

        System.out.println(email);
        System.out.println(pass);
        System.out.println(name);
        System.out.println(address);
        System.out.println(ngaysinh);
    }

    private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email= request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.findByEmail(email);

        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPass());
            if (result.verified) {
                HttpSession session = request.getSession();
                session.setAttribute("auth", true);
                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));

                String url = (String) session.getAttribute("retUrl");
                if (url == null)
                    url = "/Home";
                ServletUtils.redirect(url, request, response);
            } else {
                request.setAttribute("hasError", true);
                request.setAttribute("errorMessage", "Invalid login.");
                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            request.setAttribute("errorMessage", "Invalid login.");
            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }

}
