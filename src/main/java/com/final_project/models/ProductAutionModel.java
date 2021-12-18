package com.final_project.models;

import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductAutionModel {
    public static List<ProductAuction> getTop5Time(){
        final String query = "select  Pname, Current_Price, End_Time from product_auction join products p on p.Pro_ID = product_auction.Pro_ID where End_Time > NOW() order by End_Time limit 5 ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> getTop5Price(){
        final String query = "select  Pname, Current_Price, End_Time from product_auction join products p on p.Pro_ID = product_auction.Pro_ID\n" +
                "order by Current_Price desc \n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> getTop5Bid(){
        final String query = "select Pname, Current_Price, End_Time, count(*) as Total_Bid\n" +
                "from product_auction join auction a on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "    join products p on p.Pro_ID = product_auction.Pro_ID\n" +
                "group by a.Pro_Auc_ID\n" +
                "order by Total_Bid desc\n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }
}
