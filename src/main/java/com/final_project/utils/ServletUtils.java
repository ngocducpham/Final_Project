package com.final_project.utils;

import com.final_project.beans.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Random;

public class ServletUtils {
    public static void forward(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    public static void redirect(String url, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String contextPath = request.getContextPath();
        int idx = url.indexOf(contextPath);
        if (idx < 0) {
            response.sendRedirect(contextPath + url);
        } else {
            response.sendRedirect(url);
        }
    }

    public static Date Parse_date_format(String date) throws ParseException {
//        java.util.Date utilDate = new SimpleDateFormat("dd/MMM/yyyy").parse("02-09-2021");
        java.util.Date date2 = new java.sql.Date(
                new SimpleDateFormat("dd/MM/yyyy").parse("02/09/2012").getTime());
        return new java.sql.Date(date2.getTime());
    }

    public static String get_Verify_Code() {
        Random r = new Random();
        int n = r.nextInt(999999);
        return String.format("%06d", n);
    }

    public static boolean sendMail_to_Active_Account(User user) {
        String mail_to = user.getEmail();
        String header = "Verify Your Account";
        String content = "Use this code to verify your Account: " + user.getCode();
        return MailSender.send(mail_to, header, content);
    }

    public static boolean sengMail_to_Reset_Password(User user){
        String mail_to = user.getEmail();
        String header = "Reset Your Password";
        String content = "Use this code to Reset Your Password: " + user.getCode();
        return MailSender.send(mail_to, header, content);
    }

    public static void send_mail_to_owner_when_no_one_bid(){

    }

    public static void send_mail_to_winner(){

    }

    public static void send_mail_to_owner_when_somebody_win(){

    }

    public static void send_mail_when_bid_successfully(){

    }
}