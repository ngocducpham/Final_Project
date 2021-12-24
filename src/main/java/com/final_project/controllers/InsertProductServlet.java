package com.final_project.controllers;

import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "InsertProductServlet", value = "/Personals/*")
public class InsertProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path= request.getPathInfo();

        switch (path)
        {
            case "InsertProducts":
                ServletUtils.forward("/views/Account/Post_Products.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path= request.getPathInfo();

        switch (path)
        {
            case "InsertProduct":

                break;
            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }
}
