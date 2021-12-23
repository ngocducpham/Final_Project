package com.final_project.controllers;

import com.final_project.beans.ProductDetail;
import com.final_project.models.ProductDetailModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDetailServlet", value = "/ProductDetail")
public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proID = request.getParameter("id");

        ProductDetail productDetail = ProductDetailModel.getByID(proID);
        request.setAttribute("proDetail", productDetail);
        ServletUtils.forward("views/ProductDetail/detail.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
