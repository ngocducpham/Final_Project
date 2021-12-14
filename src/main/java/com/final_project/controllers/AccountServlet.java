package com.final_project.controllers;

import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
                    break;
                case "/Login":

                    break;
                default:
                    break;
            }
        }


    }
}
