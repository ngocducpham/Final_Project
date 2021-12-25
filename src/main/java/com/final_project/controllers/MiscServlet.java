package com.final_project.controllers;

import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.models.CategoryModel;
import com.final_project.models.InsertProductModel;
import com.final_project.models.ProductAutionModel;
import com.final_project.models.ProductModel;
import com.final_project.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "MiscServlet", value = "/Seller/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class MiscServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        switch (path)
        {
//            Thêm sp
            case "/Post_Products":
                List<Category> Catlist = InsertProductModel.getCate();
                request.setAttribute("Cate", Catlist);
                ServletUtils.forward("/views/Account/Post_Products.jsp", request, response);
                break;

//            case "/Editor":
//                ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
//                break;
//            case "/Upload":
//                ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
//                break;
            default:
                ServletUtils.forward("/views/404.jsp",request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String path= request.getPathInfo();
        switch(path){

            case "/Post_Products":
                Post_Products(request, response);
                break;
//            case "/Editor":
//                postEditor(request,response);
//                break;
//            case "/Upload":
//                postUpload(request,response);
//                break;
            default:
                ServletUtils.forward("views/404.jsp",request,response);
                break;
        }
    }

    private void Post_Products(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pname = request.getParameter("Pname");
        int Price = Integer.parseInt(request.getParameter("Price"));
        int cat_ID = Integer.parseInt(request.getParameter("Cat_ID"));
        LocalDateTime start_Time = LocalDateTime.parse(request.getParameter("Start_Time"));
        LocalDateTime end_Time = LocalDateTime.parse(request.getParameter("End_Time"));
//        String img = request.getParameter("img");
        String description = request.getParameter("description");
        //AddProduct s = new AddProduct(pname,price,cat_ID,start_Time,end_Time,img,description);
        //InsertProductModel.InsertProduct(s);
        Product p = new Product(pname, cat_ID, "img", description);
        ProductModel.add(p);
        ProductAuction pa = new ProductAuction(pname, Price, start_Time, end_Time);
        ProductAutionModel.add1(pa);
        Category c = new Category(cat_ID);
        CategoryModel.add1(c);

        ServletUtils.redirect("/Admin/Product",request,response);
    }

    private  void postUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(request.getParameter("namePro"));

        for(Part part:request.getParts())
        {
            /*System.out.println(part.getName());
            for(String headName: part.getHeaderNames())
                System.out.println(headName);
            */
            if(part.getName().equals("fuMain"))
            {
                String contentDisposition = part.getHeader("content-disposition");
                //System.out.println(contentDisposition);

                String[] items=contentDisposition.split(";");
                for(String s:items)
                {
                    String tmp= s.trim(); //xoa khoang trang
                    if(tmp.startsWith("filename"))
                    {
                        int i=tmp.indexOf("=")+2;
                        String filename=tmp.substring(i,tmp.length()-1);
                        System.out.println(filename);

                        String tagDir=this.getServletContext().getRealPath("/public/imgProduct");
                        File newDir=new File(tagDir);
                        if(!newDir.exists())
                        {
                            newDir.mkdir();
                        }
                        String destination=tagDir + "/" + filename;
                        part.write(destination);
                    }
                }
            }
        }

        ServletUtils.forward("/views/vwMisc/Upload.jsp", request,response);
    }
    private  void postEditor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");

        String productName=request.getParameter("ProductName"); //in file Editor
        System.out.println(productName);

        String fullDes=request.getParameter("FullDes");
        System.out.println(fullDes);

        ServletUtils.forward("views/vwMisc/Editor.jsp",request,response);




    }
}

