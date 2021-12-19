package com.final_project.controllers;

import com.final_project.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.Part;

@WebServlet(name = "MiscServlet", value = "/Misc/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class MiscServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        /*if (path.equals("/"))
        {
            //ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
        }*/
        switch (path)
        {
            case "/Editor":
                ServletUtils.forward("/views/vwMisc/Editor.jsp", request, response);
                break;
            case "/Upload":
                ServletUtils.forward("/views/vwMisc/Upload.jsp", request, response);
                break;
            default:
                ServletUtils.forward("views/404.jsp",request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String path= request.getPathInfo();
        switch(path){
            case "/Editor":
                postEditor(request,response);
                break;
            case "/Upload":
                postUpload(request,response);
                break;
            default:
                ServletUtils.forward("views/404.jsp",request,response);
                break;
        }
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

                        String tagDir=this.getServletContext().getRealPath("public/img2");
                        File dir=new File(tagDir);
                        if(!dir.exists())
                        {
                            dir.mkdir();
                        }
                        String destination=tagDir+"/"+filename;
                        part.write(destination);
                    }
                }
            }
        }
        ServletUtils.forward("views/vwMisc/Upload.jsp", request,response);
    }
    private  void postEditor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        System.out.println(request.getParameter("namePro"));


    }
}

