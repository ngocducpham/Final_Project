package com.final_project.controllers;
import com.final_project.beans.Request;
import com.final_project.models.RequestModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RequestServlet", value = "/Admin/Request/*")
public class RequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Request> list = RequestModel.findAll();
                request.setAttribute("requests", list);
                ServletUtils.forward("/views/Request/Index.jsp", request, response);
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

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

}
