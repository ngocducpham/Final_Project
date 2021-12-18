package com.final_project.controllers;

import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MiscServlet", value = "/Misc/*")
public class MiscServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path.equals("/"))
        {
            ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
        }
        switch (path)
        {
            case "/Editor":
                ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
                break;
            case "/Login":
                ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
