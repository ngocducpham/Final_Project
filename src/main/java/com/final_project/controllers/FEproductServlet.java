package com.final_project.controllers;

import com.final_project.beans.Product;
import com.final_project.models.ProductModel;
import com.final_project.utils.ServletUtils;
import com.final_project.beans.Product5;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FEproductServlet", value = "/Product/*")
public class FEproductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String path = request.getPathInfo();

        switch (path) {
            case "/byCatID":
                int catID=Integer.parseInt(request.getParameter("id"));
                List<Product> list = ProductModel.findByCatId(catID);

                request.setAttribute("productByID", list);
                ServletUtils.forward("/views/vwProductFE/byCatID.jsp", request, response);
                break;

            case "/Detail":
//
                int proID=Integer.parseInt(request.getParameter("id"));
                Product proDetail=ProductModel.findProID(proID);
                request.setAttribute("proDetail",proDetail);

                int id5find = Integer.parseInt(request.getParameter("id"));
                List<Product5> list5 = ProductModel.find5(id5find);
                request.setAttribute("productTop5",list5);
                System.out.println(list5.size());

                ServletUtils.forward("/views/vwProductFE/DetailProduct.jsp", request, response);
                break;



            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
