package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.User;
import com.final_project.models.*;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "PersonalServlet", value = "/Personal/*")
public class PersonalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path.equals("/") || path == null) {
        } else {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("authUser");
            switch (path) {
                case "/User_Information":
                    ServletUtils.forward("/views/Account/Personal.jsp", request, response);
                    break;
                case "/User_Change_Password":
                    ServletUtils.forward("/views/Account/Change_Password.jsp", request, response);
                    session.setAttribute("success_change_pass",false);
                    session.setAttribute("false_old_pass", false);
                    break;
                case "/User_Watch_List":
                    List<ProductAuction> list = UserModel.Get_Watch_List(user.getUser_ID());
                    request.setAttribute("Watch_List", list);
                    ServletUtils.forward("/views/Account/Watch_List.jsp", request, response);
                    break;
                case "/User_Auction":
                    List<ProductAuction> list1 = UserModel.Get_User_Auction_Product_List(user.getUser_ID());
                    request.setAttribute("User_Auction_Product_List", list1);
                    ServletUtils.forward("/views/Account/User_Auction.jsp", request, response);
                    break;
                case "/Logout":
                    Logout(request, response);
                    break;
                case "/Add_To_Watch_List":
                    Add_to_Watch_list(request, response);
                    break;
//                    Post SP
                case "/Post_Products":

                    List<Category> Catlist = InsertProductModel.getCate();
                    request.setAttribute("Cate",Catlist);
                    ServletUtils.forward("/views/Account/Post_Products.jsp", request, response);
                    break;
                default:
                    ServletUtils.forward("/views/404/index.jsp", request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path.equals("/")) {
        } else {
            switch (path) {
                case "/User_Information":
                    try {
                        Update_User_Information(request, response);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case "/User_Change_Password":
                    Update_User_Password(request, response);
                    break;
                case "/Request":
                    Get_Request(request, response);
                    break;

                case "/Post_Products":
                    Post_Products(request, response);
                    break;

                default:
                    ServletUtils.forward("/views/404/index.jsp", request, response);
                    break;
            }
        }
    }


    private void Update_User_Information(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        String new_name = request.getParameter("username");
        String new_email = request.getParameter("email");
        Date new_dob = ServletUtils.Parse_date_format(request.getParameter("dob"));
        String new_address = request.getParameter("address");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        User new_user = new User(user.getUser_ID(), new_name, new_email, user.getPass(), user.getUserrole(), new_address, new_dob, user.getSeller_Expired_date());

        UserModel.Update_User_Information(new_name, new_email, new_address, new_dob, user.getUser_ID());

        session.setAttribute("authUser", new_user);
        ServletUtils.redirect("/Personal/User_Information", request, response);
    }

    private void Update_User_Password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        String new_pass = request.getParameter("new_pass");
        String old_pass = request.getParameter("old_pass");
        BCrypt.Result result = BCrypt.verifyer().verify(old_pass.toCharArray(), user.getPass());

        if (result.verified) {
            session.setAttribute("false_old_pass", false);
            session.setAttribute("success_change_pass",true);
            new_pass = BCrypt.withDefaults().hashToString(12, new_pass.toCharArray());
            User new_user = new User(user.getUser_ID(), user.getUsername(), user.getEmail(), new_pass, user.getUserrole(), user.getAddress(), user.getDate_o_Birth(), user.getSeller_Expired_date());
            session.setAttribute("authUser", new_user);
            UserModel.Update_User_Password(new_pass, user.getUser_ID());
        } else {
            session.setAttribute("false_old_pass", true);
            session.setAttribute("success_change_pass",false);
        }
        ServletUtils.redirect("/Personal/User_Change_Password", request, response);
    }

    private void Get_Request(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserModel.Add_Request(id);
        ServletUtils.redirect("/", request, response);
    }

    private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Verified", false);
        session.setAttribute("authUser", new User());
        session.setAttribute("false_old_pass", false);
        ServletUtils.redirect("/", request, response);
    }

    private void Add_to_Watch_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        int Pro_Id = Integer.parseInt(request.getParameter("Pro_Id"));
        if (!UserModel.Check_Watch_List(Pro_Id, user.getUser_ID()))
            UserModel.Add_To_Watch_List(Pro_Id, user.getUser_ID());

        String url = (String) session.getAttribute("retUrl");
        if (url == null) url = "/";
        ServletUtils.redirect(url, request, response);
    }

//    private void Post_Products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("authUser");
//    }
    private void Post_Products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pname= request.getParameter("Pname");
        int Price = Integer.parseInt(request.getParameter("Price"));
        int cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        LocalDateTime start_Time = LocalDateTime.parse(request.getParameter("Start_Time")) ;
        LocalDateTime end_Time = LocalDateTime.parse(request.getParameter("End_Time"));
        String img = request.getParameter("img");
        String description =request.getParameter("description");
        //AddProduct s = new AddProduct(pname,price,cat_ID,start_Time,end_Time,img,description);
        //InsertProductModel.InsertProduct(s);
        Product p=new Product(pname, cat_ID, img,description);
        ProductModel.add(p);
        ProductAuction pa=new ProductAuction(pname,Price,start_Time,end_Time);
        ProductAutionModel.add1(pa);
        Category c= new Category(cat_ID);
        CategoryModel.add1(c);

        ServletUtils.redirect("views/Account/Post_Products.jsp",request,response);
    }
}
