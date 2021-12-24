package com.final_project.controllers;

import com.final_project.models.BlockUserModel;
import com.final_project.utils.ServletUtils;

import javax.print.ServiceUI;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BlockBidderServlet", value = "/BlockBidder")
public class BlockBidderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String proAuID = request.getParameter("proauid");
        String proID = request.getParameter("proid");

        BlockUserModel.block(uid,proAuID);
        ServletUtils.redirect("/ProductDetail?id=" + proID, request, response);
    }
}