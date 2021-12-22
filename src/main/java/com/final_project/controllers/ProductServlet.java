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

@WebServlet(name = "ProductServlet", value = "/Admin/Product/*")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Product> list = ProductModel.Join();
                request.setAttribute("products", list);
                ServletUtils.forward("/views/Product/index.jsp", request, response);
                break;

            case "/Add":
                ServletUtils.forward("/views/Product/Add.jsp", request, response);
                break;

            case "/Edit":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ignored) {
                }

                Product p = ProductModel.findById(id);
                if (p != null) {
                    request.setAttribute("products", p);
                    ServletUtils.forward("/views/Product/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Product", request, response);
                }
                break;

            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Delete":
                deleteProduct(request, response);
                break;


            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("Request_ID"));
        ProductModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}

