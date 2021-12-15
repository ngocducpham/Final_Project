package com.final_project.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.final_project.beans.User;
import com.final_project.models.UserModel;
import com.final_project.utils.MailSender;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;

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
                case "/Login":
                    ServletUtils.forward("/views/Account/Login.jsp", request, response);
                    break;
                case "/Verify":
                    ServletUtils.forward("/views/Account/Verify.jsp", request, response);
                default:
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
                    Register(request, response);
                    break;
                case "/Login":
                    Login(request, response);
                    break;
                case "/Verify":
                    Verify(request,response);
                    break;
                default:
                    break;
            }
        }
    }

    private void Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String Raw_pass = request.getParameter("password");
        String EnCrypted_pass=BCrypt.withDefaults().hashToString(12, Raw_pass.toCharArray());
        String name = request.getParameter("name");
        String address = request.getParameter("full_address");
        Date ngaysinh = ServletUtils.Parse_date_format(request.getParameter("dob"));
        String role = request.getParameter("role");
        String code = MailSender.getCode();
        System.out.println(code);
        User user = new User(Integer.parseInt(role), name, email, EnCrypted_pass, address, code, ngaysinh);

//        boolean isMail_Sent = MailSender.sendMail_to_Active_Account(user);
        boolean isMail_Sent = true;
        if (isMail_Sent) {
            HttpSession session = request.getSession();
            session.setAttribute("New_User", user);
            ServletUtils.redirect("/Account/Verify", request, response);
        }
    }

    private void Verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        User user=(User)session.getAttribute("New_User");
        String code=request.getParameter("code");
        if(code.equals(user.getCode())){
            System.out.println("true");
            UserModel.AddNewUser(user);
        }else {
            System.out.println("false");
        }
    }

    private void Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = UserModel.findByEmail(email);

        if (user != null) {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPass());
            if (result.verified) {
                System.out.println("true");
//                HttpSession session = request.getSession();
//                session.setAttribute("auth", true);
//                session.setAttribute("authUser", user);
                // response.addCookie(new Cookie("ecWebAppAuthUser", user.getUsername()));

//                String url = (String) session.getAttribute("retUrl");
//                if (url == null)
//                    url = "/Home";
//                ServletUtils.redirect(url, request, response);
            } else {
                System.out.println("false");
//                request.setAttribute("hasError", true);
//                request.setAttribute("errorMessage", "Invalid login.");
//                ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
            }
        } else {
            System.out.println("no_user");
//            request.setAttribute("hasError", true);
//            request.setAttribute("errorMessage", "Invalid login.");
//            ServletUtils.forward("/views/vwAccount/Login.jsp", request, response);
        }
    }

}
