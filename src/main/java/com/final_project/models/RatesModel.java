package com.final_project.models;

import com.final_project.beans.Category;
import com.final_project.beans.Favorite;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.Rates;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class RatesModel {

    public static Boolean Check_Bidder_Vote(Rates r) {
        final String sql = "select * from rates as r where r.Bidder = :Users_ID1 and r.Seller_ID = :User_ID2 and r.Type = :Type ;";
        try (Connection con = DBUtils.getConnection()) {
            List<Rates> list = con.createQuery(sql)
                    .addParameter("Users_ID1", r.getBidder())
                    .addParameter("Users_ID2", r.getSeller_ID())
                    .addParameter("Type", r.getType())
                    .executeAndFetch(Rates.class);
            if (list.size() != 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    public static Boolean Check_SellerID_Vote(Rates r) {
        final String Sql = "select * from rates as r where r.Seller_ID = :Users_ID1 and r.Bidder = :User_ID2 and r.Type = :Type;";
        try (Connection con = DBUtils.getConnection()) {
            List<Rates> list1 = con.createQuery(Sql)
                    .addParameter("Users_ID1", r.getSeller_ID())
                    .addParameter("Users_ID2", r.getBidder())
                    .addParameter("Type", r.getType())
                    .executeAndFetch(Rates.class);
            if (list1.size() != 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    public static void Insert(Rates r) {
        String insertSql = "INSERT INTO rates (RateB_ID, Seller_ID, Comment, Type, Bidder, Pro_ID, Vote) VALUES (:ratebId,:sellerId,:comment,:type,:bidder,:proId,:vote)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("RateB_ID", r.getRateB_ID())
                    .addParameter("Seller_ID", r.getSeller_ID())
                    .addParameter("Comment", r.getComment())
                    .addParameter("Type", r.getType())
                    .addParameter("Bidder", r.getBidder())
                    .addParameter("Pro_ID", r.getPro_ID())
                    .addParameter("Vote", r.getVote())
                    .executeUpdate();
        }
    }

    public static void Update(Rates r) {
        String Sql = "UPDATE points SET  up = :up, down = :down, User_ID = :userId WHERE id = :id ";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(Sql)
                    .addParameter("id", r.getId())
                    .addParameter("up", r.getUp())
                    .addParameter("down", r.getDown())
                    .addParameter("points", r.getPro_ID())
                    .addParameter("User_ID", r.getUser_ID())
                    .executeUpdate();
        }
    }

    public static Rates Select(int user_id) {
        String Sql = "select username, Seller_Expired_Date, count(m.Pro_ID) as tong_sp\n" +
                "from users as u " +
                "left join magage as m on u.User_ID = m.User_ID\n" +
                "left join rates as r on m.Pro_ID = r.Pro_ID\n" +
                "left join points p on u.User_ID = p.User_ID where u.User_ID = :User_ID group by u.User_ID;";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(Sql)
                    .addParameter("User_ID", user_id)
                    .executeAndFetch(Rates.class).get(0);
        }
    }

}
