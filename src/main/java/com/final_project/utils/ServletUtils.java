package com.final_project.utils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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

    public static Date Parse_date_format(String date){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate d=LocalDate.parse(date,dtf);
        dtf.format(d);
        ZoneId systemTimeZone = ZoneId.systemDefault();
        ZonedDateTime zonedDateTime = d.atStartOfDay(systemTimeZone);
        return Date.from(zonedDateTime.toInstant());
    }
}