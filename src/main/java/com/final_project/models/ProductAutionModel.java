package com.final_project.models;

import com.final_project.beans.Category;
import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductAutionModel {
    public static List<ProductAuction> getTop5Time(){
        final String query = "select  Pname, Current_Price, End_Time from product_auction " +
                "join products p on p.Pro_ID = product_auction.Pro_ID " +
                "where End_Time > NOW() " +
                "order by End_Time limit 5 ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> getTop5Price(){
        final String query = "select  Pname, Current_Price, End_Time from product_auction " +
                "join products p on p.Pro_ID = product_auction.Pro_ID\n" +
                "where End_Time > NOW() " +
                "order by Current_Price desc \n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> getTop5Bid(){
        final String query = "select Pname, Current_Price, End_Time, Total_Bid\n" +
                "from product_auction join auction a on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "    join products p on p.Pro_ID = product_auction.Pro_ID\n" +
                "where End_Time > NOW() " +
                "order by Total_Bid desc\n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> searchGetProduct(String product, String sortType, String cate){
        String query = "select pa.Pro_ID, Pname, Pro_Auc_ID, End_Time, Start_Time, Current_Price, Total_Bid\n" +
                "from products\n" +
                "         join product_auction pa on products.Pro_ID = pa.Pro_ID\n" +
                "         join categories c on c.Cat_ID = products.Cat_ID\n" +
                "where End_Time > NOW()\n" +
                "  and match(Pname) against(:p)";

        if(cate != null){
            query += " and c.Cat_ID = " + cate;
        }
        switch (sortType)
        {
            default:
            case "1":
                query += " order by End_Time DESC";
                break;
            case "2":
                query += " order by End_Time";
                break;
            case "3":
                query += " order by Current_Price";
                break;
            case "4":
                query += " order by Current_Price DESC";
                break;
        }
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("p", product)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> searchProductGetBidder(String product, String cate){
        String query = "select u.username, u.User_ID, pa.Pro_Auc_ID, p.Pro_ID, MAX(Price_of_User) as Price_of_User\n" +
                "from auction\n" +
                "         join product_auction pa on pa.Pro_Auc_ID = auction.Pro_Auc_ID\n" +
                "         join products p on p.Pro_ID = pa.Pro_ID\n" +
                "         join users u on auction.User_ID = u.User_ID\n" +
                "         join categories c on c.Cat_ID = p.Cat_ID\n" +
                "where End_Time > NOW()\n" +
                "  and match(Pname) against(:p) ";

        if(cate != null){
            query += " and c.Cat_ID = " + cate + " group by pa.Pro_Auc_ID";;
        }
        else{
            query += " group by pa.Pro_Auc_ID";;
        }
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("p", product)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static String searchProductGetTotalProducts(String product, String cate){
        String query = "select count(Pro_Auc_ID) as Total_Products\n" +
                "from product_auction\n" +
                "         join products p on p.Pro_ID = product_auction.Pro_ID\n" +
                "         join categories c on c.Cat_ID = p.Cat_ID\n" +
                "where End_Time > NOW()\n" +
                "  and match(Pname) against(:p) ";

        if(cate != null){
            query += " and c.Cat_ID = " + cate;
        }
        try (Connection con = DBUtils.getConnection()) {
            List<ProductAuction> pa = con.createQuery(query)
                    .addParameter("p", product)
                    .executeAndFetch(ProductAuction.class);
            return pa.get(0).getTotal_Products();
        }
    }

    public static List<Category> getAllCategories(){
        String query = "select *\n" +
                "from categories";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
}
