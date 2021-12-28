package com.final_project.models;

import com.final_project.beans.Aution;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class BlockUserModel {
    public static void block(String uid, String proAuID) {
        int currentPrice = getCurrentPrice(proAuID);
        int maxPriceUser = getMaxPriceUser(uid, proAuID);
        int getMaxPrice = getMaxPriceOfUser(proAuID);
        List<Aution> priceHistory = getPriceHistory(proAuID);
        int priceStep = getPriceStep(proAuID);
        if (maxPriceUser == getMaxPrice) {
            System.out.println(priceHistory.size());
            if (priceHistory.size() == 1) {
                resetCurrentPrice(proAuID);
            } else if (priceHistory.size() == 2) {
                String price = Integer.toString(getStartPrice(proAuID) + priceStep);
                setCurrentPrice(proAuID, price);
            } else {
                String price = Integer.toString(priceHistory.get(2).getPrice_of_User() + priceStep);
                setCurrentPrice(proAuID, price);
            }
        } else if (maxPriceUser == priceHistory.get(1).getPrice_of_User()) {
            String price;
            if(priceHistory.size() > 2)
                price = Integer.toString(priceHistory.get(2).getPrice_of_User() + priceStep);
            else
                price = Integer.toString(getStartPrice(proAuID) + priceStep);
            setCurrentPrice(proAuID, price);
        }


        String query = "delete from auction where User_ID = :uid and Pro_Auc_ID = :proauid;";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }

        query = "insert into black_list values (:uid,:proauid);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    private static int getStartPrice(String proAuID) {
        String query = "select Start_Price\n" +
                "from auction join product_auction pa on pa.Pro_Auc_ID = auction.Pro_Auc_ID\n" +
                "where pa.Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            String price = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0);

            return Integer.parseInt(price);
        }
    }

    private static int getPriceStep(String proAuID) {
        String query = "select Distance_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            String price = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0);

            return Integer.parseInt(price);
        }
    }

    private static int getCurrentPrice(String proAuID) {
        String query = "select Current_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            return Integer.parseInt(con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0));
        }
    }

    private static int getMaxPriceUser(String uid, String proAuID) {
        String query = "select MAX(Price_of_User)\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid and User_ID = :uid " +
                "order by Price_of_User desc limit 1";
        try (Connection con = DBUtils.getConnection()) {
            List<String> res = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .addParameter("uid", uid)
                    .executeAndFetch(String.class);
            if (res.size() == 0)
                return 0;
            return Integer.parseInt(res.get(0));
        }
    }


    private static List<Aution> getPriceHistory(String proAuID) {
        String query = "select *\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid\n" +
                "order by Price_of_User desc ";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(Aution.class);
        }
    }

    private static int getMaxPriceOfUser(String proAuID) {
        String query = "select MAX(Price_of_User)\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid " +
                "order by Price_of_User desc limit 1";
        try (Connection con = DBUtils.getConnection()) {
            List<String> res = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class);
            if (res.get(0) == null)
                return 0;
            return Integer.parseInt(res.get(0));
        } catch (Exception e) {
            return 0;
        }
    }

    private static void resetCurrentPrice(String proAuID) {
        String query = "update product_auction\n" +
                "set Current_Price = Start_Price\n" +
                "where Pro_Auc_ID = :proauid";

        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    private static void setCurrentPrice(String proAuID, String price) {
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
