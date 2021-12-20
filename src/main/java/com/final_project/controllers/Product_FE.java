package com.final_project.controllers;

import com.final_project.beans.Product;
import com.final_project.models.ProductModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
class ProductFEServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String path = request.getPathInfo();

        switch (path) {
            case "/byCatID":
                int catID=Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catID);
                if(list==null)
                {
                    ServletUtils.forward("/views/Home/index.jsp",request,response);

                }
                request.setAttribute("productByID", list);
                ServletUtils.forward("/views/vwProductFE/byCatID.jsp", request, response);
                break;

            case "/DetailProduct":
                int proID=Integer.parseInt(request.getParameter("id"));
                Product proDetail = ProductModel.findById(proID);
                if(proDetail==null)
                {
                    ServletUtils.forward("/views/Home/index.jsp",request,response);

                }
                request.setAttribute("productDetail",proID);
                ServletUtils.forward("/views/vwProductFE/DetailProduct.jsp", request, response);
                break;

            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}