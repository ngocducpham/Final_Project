package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.User;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
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
                    break;
                case "/User_Watch_List":
                    List<Product> list = UserModel.Get_Watch_List(user.getUser_ID());
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
                default:
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
            new_pass = BCrypt.withDefaults().hashToString(12, new_pass.toCharArray());
            User new_user = new User(user.getUser_ID(), user.getUsername(), user.getEmail(), new_pass, user.getUserrole(), user.getAddress(), user.getDate_o_Birth(), user.getSeller_Expired_date());
            session.setAttribute("authUser", new_user);
            UserModel.Update_User_Password(new_pass, user.getUser_ID());
        } else {
            session.setAttribute("false_old_pass", true);
        }

        ServletUtils.redirect("/Personal/User_Information", request, response);
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
        ServletUtils.redirect("/", request, response);
    }

}
