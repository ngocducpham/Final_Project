package com.final_project.controllers;

import com.final_project.beans.ProductAuction;
import com.final_project.models.ProductAutionModel;
import com.final_project.utils.DateTimeUtils;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@WebServlet(name = "HomeServlet", value = "/")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductAuction> top5Time = ProductAutionModel.getTop5Time();
        List<ProductAuction> top5Price = ProductAutionModel.getTop5Price();
        List<ProductAuction> top5Bid = ProductAutionModel.getTop5Bid();
        request.setAttribute("top5Time", top5Time);
        request.setAttribute("top5Price", top5Price);
        request.setAttribute("top5Bid", top5Bid);



        ServletUtils.forward("views/Home/index.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
