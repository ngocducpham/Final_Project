package com.final_project.controllers;

import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.models.ProductAutionModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/Search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String searchProductName = request.getParameter("searchproduct");
        if (searchProductName == null) {
            searchProductName = "";
        }

        String sortType = request.getParameter("sort");
        if (sortType == null)
            sortType = "1";

        String productPage = request.getParameter("page");
        if(productPage == null){
            productPage = "1";
        }

        String cate = request.getParameter("cate");
        if(cate == ""){
            cate = null;
        }

        List<ProductAuction> searchProducts = ProductAutionModel.searchGetProduct(searchProductName, sortType, cate);
        List<ProductAuction> searchProductGetBidder = ProductAutionModel.searchProductGetBidder(searchProductName, cate);
        String searchProductGetTotalProduct = ProductAutionModel.searchProductGetTotalProducts(searchProductName, cate);
        List<Category> allCategories = ProductAutionModel.getAllCategories();

        int totalPage = 1;
        List<ProductAuction> productOfPage = searchProducts;

        if(Integer.parseInt(searchProductGetTotalProduct) > 10){
            totalPage = (int) Math.ceil(Integer.parseInt(searchProductGetTotalProduct) / 10);
            productOfPage.clear();
            for (int i = Integer.parseInt(productPage)*10-10; i < Integer.parseInt(productPage)*10; i++) {
                if(searchProducts.get(i) == null)
                    break;
                productOfPage.add(searchProducts.get(i));
            }
        }

        request.setAttribute("searchProducts", productOfPage);
        request.setAttribute("searchProductGetBidder", searchProductGetBidder);
        request.setAttribute("searchProductGetTotalProduct", searchProductGetTotalProduct);
        request.setAttribute("productPage", productPage);
        request.setAttribute("sortType", sortType);
        request.setAttribute("searchProductName", searchProductName);
        request.setAttribute("totalPage", Integer.toString(totalPage));
        request.setAttribute("categories", allCategories);

        ServletUtils.forward("views/Search/index.jsp", request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
