package com.final_project.controllers;

import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.User;
import com.final_project.models.CategoryModel;
import com.final_project.models.Check_Category_Model;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/Admin/Category/*")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Category> list = CategoryModel.findAll();
                request.setAttribute("categories", list);
                ServletUtils.forward("/views/Category/Index.jsp", request, response);
                break;

            case "/Add":
                List<Category> list1 = CategoryModel.findAll();
                request.setAttribute("categoriess", list1);
                ServletUtils.forward("/views/Category/Add.jsp", request, response);
                break;

            case "/Edit":
                List<Category> list3 = CategoryModel.findAll();
                request.setAttribute("categoriesss", list3);
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Category c = CategoryModel.findById(id);
                if (c != null) {
                    request.setAttribute("category", c);
                    ServletUtils.forward("/views/Category/Edit.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);

                }
                break;
            case "/IsAvailable":
                IsAvailable(request, response);
                break;
            case "/Delete":
                int id1 = 0;
                try {
                    id1 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Category c1 = CategoryModel.findById(id1);
                if (c1 != null) {
                    request.setAttribute("category", c1);
                    ServletUtils.forward("/views/Category/Delete.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);

                }
                break;

            default:
                ServletUtils.forward("/views/404/index.jsp  ", request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Add":
                addCategory(request, response);
                break;
            case "/Update":
                updateCategory(request, response);
                break;
            case "/Delete":
                deleteCategory(request, response);
                break;
            default:
                ServletUtils.forward("/views/404/index.jsp", request, response);
                break;
        }
    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String Cname = request.getParameter("Cname");
        int Level = Integer.parseInt(request.getParameter("Level"));
        Category c;
        if (Level != 1) {
            int Cparent_ID = Integer.parseInt(request.getParameter("Cparent_ID"));
            c = new Category(Cname, Cparent_ID, Level);
            CategoryModel.add(c);
        } else {
            c = new Category(Cname, Level);
            CategoryModel.addLv1(c);
        }

        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("Cat_ID"));
        String Cname = request.getParameter("Cname");
        int Level = Integer.parseInt(request.getParameter("Level"));
        int Cparent_ID = 0;
        if (Level != 1) {
            Cparent_ID = Integer.parseInt(request.getParameter("Cparent_ID"));
            Category c = new Category(id, Cname, Cparent_ID, Level);
            CategoryModel.update(c);
        } else {
            Category c = new Category(id, Cname, Cparent_ID, Level);
            CategoryModel.updateCateLv1(c);
        }
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("Cat_ID"));
        CategoryModel.delete(id);
        ServletUtils.redirect("/Admin/Category", request, response);
    }

    private void IsAvailable(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int Cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        Category category = Check_Category_Model.Find_By_Cat_ID(Cat_ID);
        boolean isAvailable = (category == null);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        out.print(isAvailable);
        out.flush();
    }

}
