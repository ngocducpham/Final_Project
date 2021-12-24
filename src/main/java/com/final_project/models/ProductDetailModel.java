package com.final_project.models;

import com.final_project.beans.MyIntType;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.ProductDetail;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import org.sql2o.Connection;

import java.util.List;
import java.util.Objects;

public class ProductDetailModel {
    public static ProductDetail getByID(String id) {
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
                "     , U1.User_ID                as OwnerID\n" +
                "     , Cat_ID\n" +
                "     , Distance_Price\n" +
                "     , product_auction.Pro_Auc_ID\n" +
                "from products\n" +
                "         left join magage on products.Pro_ID = magage.Pro_ID\n" +
                "         left join users as U1 on U1.User_ID = magage.User_ID\n" +
                "         left join product_auction on product_auction.Pro_ID = products.Pro_ID\n" +
                "         left join auction on auction.Pro_Auc_ID = product_auction.Pro_Auc_ID\n" +
                "         left join users U2 on U2.User_ID = auction.User_ID\n" +
                "where End_Time > now()\n" +
                "  and products.Pro_ID = :id " +
                " group by product_auction.Pro_ID;";

        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> detail = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(ProductDetail.class);
            if (detail.size() > 0)
                return detail.get(0);
            return null;
        }
    }

    public static List<ProductDetail> get5ProductRelative(String catID) {
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

    public static List<ProductDetail> bidHistory(String proAuID) {
        String query = "select Pro_ID, username, Price_Time, Price_of_User\n" +
                "from product_auction\n" +
                "         join auction a on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "         join users u on u.User_ID = a.User_ID\n" +
                "where a.Pro_Auc_ID = :id " +
                "order by Price_of_User DESC ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static void bid(String uid, String proAuID, String price) {
        String query = "insert into auction (price_of_user, price_time, pro_auc_id, user_id)\n" +
                "values (:price, NOW(), :proauid, :uid);\n";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .addParameter("uid", uid)
                    .addParameter("price", price)
                    .executeUpdate();
        }

        query = "update product_auction\n" +
                "set Current_Price = :price,\n" +
                "    Total_Bid     = Total_Bid + 1\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("price", price)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    public static String currentBidder(String proAuID) {
        String query = "select username\n" +
                "from auction join users u on u.User_ID = auction.User_ID\n" +
                "where Pro_Auc_ID = :id\n" +
                "order by Price_of_User desc\n" +
                "limit 1\n";
        try (Connection con = DBUtils.getConnection()) {
            List<String> result = con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(String.class);
            if (result.size() > 0)
                return result.get(0);
            return "";
        }
    }

    public static ProductDetail getOwner(String proAuID) {
        String query = "select m.User_ID, username\n" +
                "from users\n" +
                "         join magage m on users.User_ID = m.User_ID\n" +
                "         join product_auction pa on m.Pro_ID = pa.Pro_ID\n" +
                "where Pro_Auc_ID = :id";
        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> result = con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
            if (result.size() > 0)
                return result.get(0);
            return new ProductDetail();
        }
    }

    public static MyIntType checkBlackList(String uid, String proAuid) {
        String query = "select User_ID from black_list\n" +
                "where User_ID = :uid and product_auction_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            List<String> result = con.createQuery(query)
                    .addParameter("proauid", proAuid)
                    .addParameter("uid", uid)
                    .executeAndFetch(String.class);
            if (result.size() > 0)
                return new MyIntType(1);
            return new MyIntType(0);
        }
    }

    public static List<ProductDetail> getBidUser(String proAuID) {
        String query = "select a.User_ID, Pro_ID, username, Price_Time, Price_of_User\n" +
                "from product_auction\n" +
                "    join auction a\n" +
                "on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "    join users u on u.User_ID = a.User_ID\n" +
                "where a.Pro_Auc_ID = :id\n" +
                "group by a.User_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static String getCurrentPrice(String proAuID){
        String query = "select Current_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0);
        }
    }
}
