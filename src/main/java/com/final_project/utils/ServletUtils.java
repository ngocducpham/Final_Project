package com.final_project.utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

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
                ((java.util.Date)new SimpleDateFormat("dd/MM/yyyy").parse("02/09/2012")).getTime());
        return new java.sql.Date(date2.getTime());
    }
}