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
                "from products\n" +
                "         inner join magage on products.Pro_ID = magage.Pro_ID\n" +
                "         inner join users as U1 on U1.User_ID = magage.User_ID\n" +
                "         inner join product_auction on product_auction.Pro_ID = products.Pro_ID\n" +
                "         inner join auction on auction.Pro_Auc_ID = product_auction.Pro_Auc_ID\n" +
                "         inner join users U2 on U2.User_ID = auction.User_ID\n" +
                "where End_Time > now()\n" +
                "  and Status = :id\n" +
                "  and products.Pro_ID = :id\n" +
                "group by product_auction.Pro_ID;";

        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> detail = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(ProductDetail.class);
            return detail.get(0);
        }
    }
}
