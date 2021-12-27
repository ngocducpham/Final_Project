package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.User;
import com.final_project.models.PointModel;
import com.final_project.models.UserModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;

@WebServlet(name = "AccountServlet", value = "/Account/*")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path.equals("/")) {

        } else {
            switch (path) {
                case "/Register":
                    ServletUtils.forward("/views/Account/Register.jsp", request, response);
                    break;
                case "/CheckAvailable":
                    CheckAvailable(request, response);
                    break;
                case "/Login":
                    ServletUtils.forward("/views/Account/Login.jsp", request, response);
                    break;
                case "/Verify":
                case "/Verify_Reset_Password":
                    ServletUtils.forward("/views/Account/Verify.jsp", request, response);
                    break;
                case "/Forget_Password":
                    ServletUtils.forward("/views/Account/Forget_Password.jsp", request, response);
                    break;
                case "/Set_New_Password":
                    ServletUtils.forward("/views/Account/Set_New_Password.jsp", request, response);
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
                case "/Register":
                    try {
                        Register(request, response);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    break;
                case "/Login":
                    Login(request, response);
                    break;
                case "/Verify":
                    Verify(request, response);
                    break;
                case "/Forget_Password":
                    Forget_Password(request, response);
                    break;
                case "/Verify_Reset_Password":
                    Verify_Reset_Password(request, response);
                    break;
                case "/Set_New_Password":
                    Set_New_Password(request, response);
                    break;
                case "/Logout":
                    Logout(request, response);
                    break;
                default:
                    break;
            }
        }
    }

    private void Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String Raw_pass = request.getParameter("password");

        String EnCrypted_pass = BCrypt.withDefaults().hashToString(12, Raw_pass.toCharArray());
        String name = request.getParameter("username");
        String address = request.getParameter("full_address");
        Date ngaysinh = ServletUtils.Parse_date_format(request.getParameter("DOB"));

        String code = ServletUtils.get_Verify_Code();
        System.out.println(code);
        User user = new User(1, name, email, EnCrypted_pass, address, code, ngaysinh);

        boolean isMail_Sent = ServletUtils.sendMail_to_Active_Account(user);

        if (isMail_Sent) {
            HttpSession session = request.getSession();
            session.setAttribute("New_User", user);
            ServletUtils.redirect("/Account/Verify", request, response);
        }
    }

    private void CheckAvailable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User u = UserModel.Find_By_Email(email);
        boolean isAvailable = (u == null);

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        out.print(isAvailable);
        out.flush();
    }

    private void Verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("New_User");
        String code = request.getParameter("code");
        if (code.equals(user.getCode())) {
            System.out.println("true");
            UserModel.AddNewUser(user);
            PointModel.New_User_Point();
            ServletUtils.redirect("/Account/Login", request, response);
        } else {
            System.out.println("false");
        }
    }

    private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.Find_By_Email(email);

        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPass());
            if (result.verified) {
                System.out.println("true");
                HttpSession session = request.getSession();
                session.setAttribute("Verified", true);
                session.setAttribute("authUser", user);

                String url = (String) session.getAttribute("retUrl_Personal");
                if (url == null)
                    url = (String) session.getAttribute("retUrl_Search");
                if (url == null)
                    url = "/";
                ServletUtils.redirect(url, request, response);
            } else {
                // sai password
                request.setAttribute("hasError", true);
                ServletUtils.forward("/views/Account/Login.jsp", request, response);
            }
        } else {
            request.setAttribute("hasError", true);
            ServletUtils.forward("/views/Account/Login.jsp", request, response);
        }
    }

    private void Forget_Password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = UserModel.Find_By_Email(email);
        String code = ServletUtils.get_Verify_Code();
        System.out.println(code);
        if (user != null) {
            User new_user = new User(user.getUser_ID(), user.getUserrole(), user.getUsername(), user.getEmail(), user.getPass(), user.getAddress(), code, user.getDate_o_Birth(), user.getSeller_Expired_date());
            boolean isMailSent = ServletUtils.sengMail_to_Reset_Password(new_user);

            if (isMailSent) {
                HttpSession session = request.getSession();
                session.setAttribute("User_Forget_Password", new_user);
                ServletUtils.redirect("/Account/Verify_Reset_Password", request, response);
            }
        } else {
            ServletUtils.forward("/views/404/No_Account_Found.jsp", request, response);
        }
    }

    private void Verify_Reset_Password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User_Forget_Password");
        String code = request.getParameter("code");
        if (code.equals(user.getCode())) {
            System.out.println("true");
            ServletUtils.redirect("/Account/Set_New_Password", request, response);
        } else {
            System.out.println("false");
        }
    }

    private void Set_New_Password(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User_Forget_Password");
        String new_password = request.getParameter("new_password");
        String EnCrypted_pass = BCrypt.withDefaults().hashToString(12, new_password.toCharArray());
        UserModel.Update_User(user, EnCrypted_pass);
        ServletUtils.redirect("/Account/Login", request, response);
    }

    private void Logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("Verified", false);
        session.setAttribute("authUser", new User());
        session.setAttribute("false_old_pass", false);
        ServletUtils.redirect("/", request, response);
    }
}
