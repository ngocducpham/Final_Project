package com.final_project.controllers;

import com.final_project.beans.ProductAuction;
import com.final_project.models.ProductAutionModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "DashboardServlet", value = "/Admin/Dashboard/*")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<ProductAuction> top5Time = ProductAutionModel.getTop5Time();
                List<ProductAuction> top5Price = ProductAutionModel.getTop5Price();
                List<ProductAuction> top5Bid = ProductAutionModel.getTop5Bid();
                request.setAttribute("top5Time", top5Time);
                request.setAttribute("top5Price", top5Price);
                request.setAttribute("top5Bid", top5Bid);
                ServletUtils.forward("/views/Dashboard/Index.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404/index.jsp  ", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

