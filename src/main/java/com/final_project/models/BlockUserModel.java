package com.final_project.models;

import com.final_project.beans.ProductDetail;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class BlockUserModel {
    public static void block(String uid, String proAuID){
        int currentBid = getCurrentBid(proAuID);
        int priceOfUser = getPriceOfUser(uid,proAuID);

        String query = "delete from auction where User_ID = :uid and Pro_Auc_ID = :proauid;";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }

        if(priceOfUser == currentBid){
            int getNextPrice = getNextPriceOfUser(proAuID);
            if(getNextPrice == 0){
                resetCurrentPrice(proAuID);
            }
            else {
                setCurrentPrice(proAuID, Integer.toString(getNextPrice));
            }
        }

        query = "insert into black_list values (:uid,:proauid);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    private static int getCurrentBid(String proAuID){
        String query = "select Current_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            return  Integer.parseInt(con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0));
        }
    }

    private static int getPriceOfUser(String uid, String proAuID){
        String query = "select MAX(Price_of_User)\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid and User_ID = :uid " +
                "order by Price_of_User desc limit 1";
        try (Connection con = DBUtils.getConnection()) {
            List<String> res = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .addParameter("uid", uid)
                    .executeAndFetch(String.class);
            if(res.size() == 0)
                return 0;
            return Integer.parseInt(res.get(0));
        }
    }

    private static int getNextPriceOfUser(String proAuID){
        String query = "select MAX(Price_of_User)\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid " +
                "order by Price_of_User desc limit 1";
        try (Connection con = DBUtils.getConnection()) {
            List<String> res = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class);
            if(res.get(0) == null)
                return 0;
            return Integer.parseInt(res.get(0));
        }
        catch(Exception e) {
            return 0;
        }
    }

    private static void resetCurrentPrice(String proAuID){
        String query = "update product_auction\n" +
                "set Current_Price = Start_Price\n" +
                "where Pro_Auc_ID = :proauid";

        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    private static void setCurrentPrice(String proAuID, String price){
        String query = "update product_auction\n" +
                "set Current_Price = :price\n" +
                "where Pro_Auc_ID = :proauid";

        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("price", price)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

}
