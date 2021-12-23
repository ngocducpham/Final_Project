package com.final_project.models;

import com.final_project.beans.ProductAuction;
import com.final_project.beans.ProductDetail;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import org.sql2o.Connection;

import java.util.List;
import java.util.Objects;

public class ProductDetailModel {
    public static ProductDetail getByID(String id){
        String query = "select products.Pro_ID\n" +
                "     , products.Pname\n" +
                "     , products.description\n" +
                "     , products.Status\n" +
                "     , product_auction.Total_Bid\n" +
                "     , product_auction.Start_Time\n" +
                "     , max(auction.Price_of_User) as Current_Price\n" +
                "     , product_auction.End_Time\n" +
                "     , U1.username                as Owner\n" +
                "     , U2.username                as Holder\n" +
                "     , Cat_ID\n" +
                "     , Distance_Price\n" +
                "     , auction.Pro_Auc_ID\n" +
                "from products\n" +
                "         left join magage on products.Pro_ID = magage.Pro_ID\n" +
                "         left join users as U1 on U1.User_ID = magage.User_ID\n" +
                "         left join product_auction on product_auction.Pro_ID = products.Pro_ID\n" +
                "         left join auction on auction.Pro_Auc_ID = product_auction.Pro_Auc_ID\n" +
                "         left join users U2 on U2.User_ID = auction.User_ID\n" +
                "where End_Time > now()\n" +
                "  and Status = 1\n" +
                "  and products.Pro_ID = :id\n" +
                "group by product_auction.Pro_ID;";

        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> detail = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(ProductDetail.class);
            return detail.get(0);
        }
    }

    public static List<ProductDetail> get5ProductRelative(String catID){
        String query = "select Pname, pa.Pro_ID, Current_Price, End_Time, Total_Bid \n" +
                "from products\n" +
                "         join product_auction pa on products.Pro_ID = pa.Pro_ID\n" +
                "         join categories c on c.Cat_ID = products.Cat_ID\n" +
                "where c.Cat_ID = :id \n" +
                "   or Cparent_ID = :id \n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", catID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static List<ProductDetail> bidHistory(String proAuID){
        String query = "select Pro_ID, username, Price_Time, Price_of_User\n" +
                "from product_auction\n" +
                "         join auction a on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "         join users u on u.User_ID = a.User_ID\n" +
                "where a.Pro_Auc_ID = :id " +
                "order by Price_of_User";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
        }
    }
}
