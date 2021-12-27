package com.final_project.controllers;

import com.final_project.beans.MyIntType;
import com.final_project.beans.ProductDetail;
import com.final_project.beans.User;
import com.final_project.models.ProductDetailModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailServlet", value = "/ProductDetail")
public class ProductDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proID = request.getParameter("id");

        ProductDetail productDetail = ProductDetailModel.getByID(proID);
        if(productDetail == null){
            ServletUtils.forward("views/404/index.jsp", request, response);
            return;
        }
        productDetail.setMin_Price(productDetail.getCurrent_Price() + productDetail.getDistance_Price());

        int cateID = productDetail.getCat_ID();
        List<ProductDetail> fiveRelative = ProductDetailModel.get5ProductRelative(Integer.toString(cateID));

        int proAuID = productDetail.getPro_Auc_ID();
        List<ProductDetail> history = ProductDetailModel.bidHistory(Integer.toString(proAuID));

        String currentBid = ProductDetailModel.currentBidder(Integer.toString(proAuID));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("authUser");
        if(user.getUsername() != null) {
            MyIntType checkBlackList = ProductDetailModel.checkBlackList(Integer.toString(user.getUser_ID()), Integer.toString(proAuID));
            request.setAttribute("blacklist", checkBlackList);
            if (ProductDetailModel.userPoint(user.getUser_ID()) >= 80.0){
                request.setAttribute("lowrate", "0");
            }
            else{
                request.setAttribute("lowrate", "1");
            }
        }
        else {
            request.setAttribute("blacklist",new MyIntType(3));
            request.setAttribute("lowrate", "2");
        }

        List<ProductDetail> bidderList = ProductDetailModel.getBidUser(Integer.toString(proAuID));
        ProductDetail owner = ProductDetailModel.getOwner(Integer.toString(proAuID));

        String currentPrice = ProductDetailModel.getCurrentPrice(Integer.toString(proAuID));
        String minPrice = Integer.toString(Integer.parseInt(currentPrice) + productDetail.getDistance_Price());

        request.setAttribute("minPrice", minPrice);
        request.setAttribute("currentPrice", currentPrice);
        request.setAttribute("owner", owner);
        request.setAttribute("bidderList", bidderList);
        request.setAttribute("currentBid", currentBid);
        request.setAttribute("history", history);
        request.setAttribute("relative", fiveRelative);
        request.setAttribute("proDetail", productDetail);
        ServletUtils.forward("views/ProductDetail/detail.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String proAuID = request.getParameter("proauid");
        String bidPrice = request.getParameter("bidprice");
        String uid = request.getParameter("uid");
        String proID = request.getParameter("proid");

        ProductDetailModel.bid(uid, proAuID, bidPrice);

        String userEmail = ProductDetailModel.getUserEmail(Integer.parseInt(uid));
        String proName = ProductDetailModel.getProductName(proID);
        ServletUtils.sendMail_to_bid(userEmail,proName, bidPrice);
        ServletUtils.redirect("/ProductDetail?id=" + proID, request, response);
    }
}
