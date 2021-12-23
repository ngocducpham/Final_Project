package com.final_project.controllers;

import com.final_project.beans.Product;
import com.final_project.beans.ProductDetail;
import com.final_project.models.ProductModel;
import com.final_project.utils.ServletUtils;
import com.final_project.beans.Product5;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FEproductServlet", value = "/Product")
public class FEproductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String ProID= request.getParameter("id");
        
        //int ProID=Integer.parseInt(request.getParameter("id"));
        ProductDetail proDetail=ProductModel.findById(ProID);
        request.setAttribute("proDetail",proDetail);

        int id5find = Integer.parseInt(request.getParameter("id"));
        List<Product5> list5 = ProductModel.find5(Integer.toString(id5find));
        request.setAttribute("productTop5",list5);
        //System.out.println(list5.size());

        ServletUtils.forward("/views/vwProductFE/DetailProduct.jsp", request, response);




    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
