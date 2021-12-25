package com.final_project.controllers;

import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.User;
import com.final_project.models.*;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "MiscServlet", value = "/Seller/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class MiscServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        switch (path) {
//            Thêm sp
            case "/Post_Products":
                if (!(Boolean) session.getAttribute("Verified")) {
                    ServletUtils.redirect("/Account/Login", request, response);
                } else {
                    User u = (User) session.getAttribute("authUser");
                    if (u.getUserrole() == 2) {
                        List<Category> Catlist = InsertProductModel.getCate();
                        request.setAttribute("Cate", Catlist);
                        ServletUtils.forward("/views/Account/Post_Products.jsp", request, response);
                    } else {
                        ServletUtils.forward("/views/404/index.jsp", request, response);
                    }
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String path = request.getPathInfo();
        switch (path) {

            case "/Post_Products":
                Post_Products(request, response);
                break;
            default:
                ServletUtils.forward("views/404.jsp", request, response);
                break;
        }
    }

    private void Post_Products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pname = request.getParameter("Pname");
        int Price = Integer.parseInt(request.getParameter("Price"));
        int cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        int Distance_Price = Integer.parseInt(request.getParameter("Step-Price"));
        LocalDateTime start_time = java.time.LocalDateTime.now();

        LocalDateTime end_Time = LocalDateTime.parse(request.getParameter("End_Time"));
        String description = request.getParameter("description");

        Product p = new Product(pname, "img", description, Price, 1, cat_ID);
        ProductModel.add(p);
        int new_pro_id = ProductModel.get_max_product_id();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("authUser");
        MagageModel.Add(new_pro_id, u.getUser_ID());
        ProductAuction pa = new ProductAuction(0, Price, Distance_Price, Price, start_time, end_Time, new_pro_id);
        ProductAutionModel.add1(pa);

        Save__new_product_img(request, response, new_pro_id);

        ServletUtils.redirect("/Seller/Post_Products", request, response);
    }

    private void Save__new_product_img(HttpServletRequest request, HttpServletResponse response, int Pro_id) throws ServletException, IOException {
        System.out.println(request.getParameter("Pname"));
        String targetDir = this.getServletContext().getRealPath("public/imgProduct/" + Pro_id);
        String Server_targetDir = targetDir.replace("target\\Final_Project-1.0-SNAPSHOT", "src\\main\\webapp");

        File newDir1 = new File(targetDir);
        File newDir2 = new File(Server_targetDir);

        if (!newDir1.exists()) {
            newDir1.mkdir();
        }

        if (!newDir2.exists()) {
            newDir2.mkdir();
        }

        String destination1 = newDir1 + "/";
        String destination2 = newDir2 + "/";

        for (Part part : request.getParts()) {
            if (part.getName().equals("img_main")) {
                part.write(destination1 + "main.jpg");
                part.write(destination2 + "main.jpg");
            }
            if (part.getName().equals("img1")) {
                part.write(destination1 + "1.jpg");
                part.write(destination2 + "1.jpg");
            }
            if (part.getName().equals("img2")) {
                part.write(destination1 + "2.jpg");
                part.write(destination2 + "2.jpg");
            }
            if (part.getName().equals("img3")) {
                part.write(destination1 + "3.jpg");
                part.write(destination2 + "3.jpg");
            }
            if (part.getName().equals("img4")) {
                part.write(destination1 + "4.jpg");
                part.write(destination2 + "4.jpg");
                break;
            }
        }
    }
}


