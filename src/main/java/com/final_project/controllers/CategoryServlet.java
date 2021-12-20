package com.final_project.controllers;

import com.final_project.beans.Category;
import com.final_project.models.CategoryModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        ServletUtils.forward("/views/Category/Add.jsp", request, response);
        break;

      case "/Edit":
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
          // ServletUtils.forward("/views/204.jsp", request, response);
        }
        break;

      default:
        ServletUtils.forward("/views/404.jsp", request, response);
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


      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("CatName");
    Category c = new Category(name);
    CategoryModel.add(c);
    ServletUtils.forward("/views/vwCategory/Add.jsp", request, response);
  }

}
