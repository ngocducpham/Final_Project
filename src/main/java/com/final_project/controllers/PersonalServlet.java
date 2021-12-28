package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.Rates;
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
import java.text.Bidi;
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
                    session.setAttribute("success_change_pass", false);
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
                case "/Add_To_Watch_List":
                    Add_to_Watch_list(request, response, session);
                    break;
                case "/User_Won_Auction":
                    List<ProductAuction> list2 = UserModel.Get_User_Won_Auction_Product_List(user.getUser_ID());
                    request.setAttribute("User_Won_Auction_Product_List", list2);
                    ServletUtils.forward("/views/Account/User_Won_Auction.jsp", request, response);
                    break;
                case "/My_Post_Products":
                    Get_My_Post_Product(request, response, user);
                    break;
                case "/Rate_Seller":
                    int id = Integer.parseInt(request.getParameter("seller_id"));
                    int pro_id=Integer.parseInt(request.getParameter("pro_id"));
                    Rates r = RatesModel.Select(id, pro_id);
                    request.setAttribute("Select", r);
                    ServletUtils.forward("/views/Account/Rate_Seller.jsp", request, response);
                    break;
                case "/Rate_Bidder":
                    int id1 = Integer.parseInt(request.getParameter("bidder"));
                    int pro_id1=Integer.parseInt(request.getParameter("pro_id"));
                    Rates r1 = RatesModel.Select1(id1, pro_id1);
                    request.setAttribute("Select1", r1);
                    ServletUtils.forward("/views/Account/Rate_Bidder.jsp", request, response);
                    break;
                case "/My_Rates":
                    List<Rates> list3 = RatesModel.Get_rates();
                    request.setAttribute("Get_Rates", list3);
                    ServletUtils.forward("/views/Account/My_Rates.jsp", request, response);
                    break;
                case "/MyBidder_Rates":
                    List<Rates> list4 = RatesModel.Get_rates();
                    request.setAttribute("Get_Rates", list4);
                    ServletUtils.forward("/views/Account/MyBidder_Rates.jsp", request, response);
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
                case "/Rate_Seller":
                    Bidder_Add_to_Rate_List(request, response);
                    break;
                case "/Rate_Bidder":
                    Seller_Add_to_Rate_List(request, response);
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
            session.setAttribute("success_change_pass", true);
            new_pass = BCrypt.withDefaults().hashToString(12, new_pass.toCharArray());
            User new_user = new User(user.getUser_ID(), user.getUsername(), user.getEmail(), new_pass, user.getUserrole(), user.getAddress(), user.getDate_o_Birth(), user.getSeller_Expired_date());
            session.setAttribute("authUser", new_user);
            UserModel.Update_User_Password(new_pass, user.getUser_ID());
        } else {
            session.setAttribute("false_old_pass", true);
            session.setAttribute("success_change_pass", false);
        }
        ServletUtils.redirect("/Personal/User_Change_Password", request, response);
    }

    private void Get_Request(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserModel.Add_Request(id);
        ServletUtils.redirect("/", request, response);
    }

    private void Add_to_Watch_list(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        User user = (User) session.getAttribute("authUser");
        int Pro_Id = Integer.parseInt(request.getParameter("Pro_Id"));
        if (!UserModel.Check_Watch_List(Pro_Id, user.getUser_ID()))
            UserModel.Add_To_Watch_List(Pro_Id, user.getUser_ID());

        String url = (String) session.getAttribute("retUrl_Search");
        System.out.println(url);
        if (url == null) url = "/";
        ServletUtils.redirect(url, request, response);
    }

    private void Get_My_Post_Product(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        String option = request.getParameter("option");
        if (option.equals("1")) {
            List<ProductAuction> list3 = UserModel.Get_Owner_Products(user.getUser_ID());
            request.setAttribute("My_Post_Products", list3);
        } else {
            if (option.equals("2")) {
                List<ProductAuction> list3 = UserModel.Get_Owner_Products_Still_Can_be_Sold(user.getUser_ID());
                request.setAttribute("My_Post_Products", list3);
            } else {
                List<ProductAuction> list3 = UserModel.Get_Owner_Products_Had_Winner(user.getUser_ID());
                request.setAttribute("My_Post_Products", list3);
            }
        }
        ServletUtils.forward("/views/Account/My_Post_Products.jsp", request, response);
    }

    private void Bidder_Add_to_Rate_List(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        int Type = 1;
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("authUser");
        int Seller_ID = Integer.parseInt(request.getParameter("Seller_ID"));
        int Pro_ID = Integer.parseInt(request.getParameter("Pro_ID"));
        int Vote = Integer.parseInt(request.getParameter("Vote"));
        String Comment= request.getParameter("Comment");
        Rates p = new Rates(Seller_ID, Type, u.getUser_ID(), Pro_ID, Vote, Comment);
        if(!RatesModel.Check_Bidder_Vote(p)){
            RatesModel.Insert(p);
            if(Vote == 1){
                RatesModel.Point_Up(Seller_ID);
            }
            else {
                RatesModel.Point_Down(Seller_ID);
            }
        }

        ServletUtils.redirect("/Personal/Rate_Seller", request, response);
    }

    private void Seller_Add_to_Rate_List(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        int Type = 2;
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("authUser");
        int Bidder = Integer.parseInt(request.getParameter("Bidder"));
        int Pro_ID = Integer.parseInt(request.getParameter("Pro_ID"));
        int Vote = Integer.parseInt(request.getParameter("Vote"));
        String Comment= request.getParameter("Comment");
        Rates p = new Rates(u.getUser_ID(), Type, Bidder, Pro_ID, Vote, Comment);
        if(!RatesModel.Check_SellerID_Vote(p)){
            RatesModel.Insert(p);
            if(Vote == 1){
                RatesModel.Point_Up(Bidder);
            }
            else {
                RatesModel.Point_Down(Bidder);
            }
        }

        ServletUtils.redirect("/Personal/Rate_Bidder", request, response);
    }
}
