package com.final_project.models;

import com.final_project.beans.Rates;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class RatesModel {

    public static Boolean Check_Bidder_Vote(Rates r) {
        final String sql = "select * from rates as r where r.Bidder = :Users_ID1 and r.Seller_ID = :Users_ID2 and r.Type = :Type ;";
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
        final String Sql = "select * from rates as r where r.Seller_ID = :Users_ID1 and r.Bidder = :Users_ID2 and r.Type = :Type;";
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
        String insertSql = "INSERT INTO rates ( Seller_ID, Comment, Type, Bidder, Pro_ID, Vote) VALUES (:Seller_ID,:Comment,:Type,:Bidder,:Pro_ID,:Vote)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("Seller_ID", r.getSeller_ID())
                    .addParameter("Comment", r.getComment())
                    .addParameter("Type", r.getType())
                    .addParameter("Bidder", r.getBidder())
                    .addParameter("Pro_ID", r.getPro_ID())
                    .addParameter("Vote", r.getVote())
                    .executeUpdate();
        }
    }

    // Nguoi mua nhin` ve ng ban'
    public static Rates Select(int user_id, int pro_id) {
        String Sql = "select username, Seller_Expired_Date, u.User_ID as Seller_ID, m.Pro_ID, ROUND(((up - down)/(up))*100, 1) as total\n" +
                "                                from users as u\n" +
                "                                left join magage as m on u.User_ID = m.User_ID\n" +
                "                                left join rates as r on m.Pro_ID = r.Pro_ID\n" +
                "                                left join points p on u.User_ID = p.User_ID\n" +
                "    where u.User_ID = :User_ID and m.Pro_ID = :Pro_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(Sql)
                    .addParameter("User_ID", user_id)
                    .addParameter("Pro_ID", pro_id)
                    .executeAndFetch(Rates.class).get(0);
        }
    }
//Nguoi ban nhin` ve nguoi mua
    public static Rates Select1(int user_id, int pro_id) {
        String Sql = "select Bidder, username, pa.Pro_ID, ROUND(((up - down)/(up))*100, 1) as total from rates\n" +
                "                left join products p on p.Pro_ID = rates.Pro_ID\n" +
                "                left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "                left join win_list wl on pa.Pro_Auc_ID = wl.Pro_Auc_ID\n" +
                "                left join users u on u.User_ID = wl.User_ID\n" +
                "                left join points p2 on u.User_ID = p2.User_ID\n" +
                "                where wl.User_ID = :User_ID and pa.Pro_ID= :Pro_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(Sql)
                    .addParameter("User_ID", user_id)
                    .addParameter("Pro_ID", pro_id)
                    .executeAndFetch(Rates.class).get(0);
        }
    }

    public static void Point_Up(int user_id){
        String insertSql = "update points\n" +
                "set up = up + 1\n" +
                "where User_ID = :User_ID\n";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("User_ID", user_id)
                    .executeUpdate();
        }
    }

    public static void Point_Down(int user_id){
        String insertSql = "update points\n" +
                "set down = down + 1\n" +
                "where User_ID = :User_ID";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("User_ID", user_id)
                    .executeUpdate();
        }
    }

    public static List<Rates> Get_rates1() {
        final String query = "select r.*,ROUND(((up - down)/(up))*100,2) as total, username from rates r\n" +
                "                left join products p on p.Pro_ID = r.Pro_ID\n" +
                "                left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "                left join win_list wl on pa.Pro_Auc_ID = wl.Pro_Auc_ID\n" +
                "                left join users u on u.User_ID = wl.User_ID\n" +
                "                left join points p2 on u.User_ID = p2.User_ID\n" +
                "                WHERE Type = 1";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .executeAndFetch(Rates.class);
        }
    }

    public static List<Rates> Get_rates2() {
        final String query = "select r.*, ROUND(((up - down)/(up))*100, 1) as total, username from rates r\n" +
                "                left join products p on p.Pro_ID = r.Pro_ID\n" +
                "                left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "                left join magage m on p.Pro_ID = m.Pro_ID\n" +
                "                left join users u on m.User_ID = u.User_ID\n" +
                "                left join points p2 on u.User_ID = p2.User_ID\n" +
                "                WHERE Type = 2";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .executeAndFetch(Rates.class);
        }
    }

    public static List<Rates> Get_Point1() {
        final String query = "select ROUND(((up - down)/(up))*100, 1) as total from rates r\n" +
                "                left join products p on p.Pro_ID = r.Pro_ID\n" +
                "                left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "                left join magage m on p.Pro_ID = m.Pro_ID\n" +
                "                left join users u on m.User_ID = u.User_ID\n" +
                "                left join points p2 on u.User_ID = p2.User_ID\n" +
                "                WHERE Type = 2";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .executeAndFetch(Rates.class);
        }
    }

    public static List<Rates> Get_Point2() {
        final String query = "select ROUND(((up - down)/(up))*100,2) as total from rates r\n" +
                "                left join products p on p.Pro_ID = r.Pro_ID\n" +
                "                left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "                left join win_list wl on pa.Pro_Auc_ID = wl.Pro_Auc_ID\n" +
                "                left join users u on u.User_ID = wl.User_ID\n" +
                "                left join points p2 on u.User_ID = p2.User_ID\n" +
                "                WHERE Type = 1";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .executeAndFetch(Rates.class);
        }
    }


}
