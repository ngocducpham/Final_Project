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
                List<Product> list = ProductModel.findAll();
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
            case "/Add":
                addProduct(request, response);
                break;

            case "/Delete":
                deleteProduct(request, response);
                break;

            case "/Update":
                updateProduct(request, response);
                break;

            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("Pname");
        int Price = Integer.parseInt(request.getParameter("Price"));
        String img = request.getParameter("img");
        String description = request.getParameter("description");
        int Status = Integer.parseInt(request.getParameter("Status"));
        int Cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        Product p = new Product(name, img, description, Price, Status, Cat_ID);
        ProductModel.add(p);
        ServletUtils.forward("/views/Product/Add.jsp", request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("Pro_ID"));
        String name = request.getParameter("Pname");
        int Price = Integer.parseInt(request.getParameter("Price"));
        String img = request.getParameter("img");
        String description = request.getParameter("description");
        int Status = Integer.parseInt(request.getParameter("Status"));
        int Cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        Product p = new Product(id, name, img, description, Price, Status, Cat_ID);
        ProductModel.update(p);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("Pro_ID"));
        ProductModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }
}

