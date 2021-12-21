package com.final_project.models;

import com.final_project.beans.Product;
import com.final_project.beans.ProductAuction;
import com.final_project.beans.User;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.Date;
import java.util.List;

public class UserModel {

    public static List<User> findAll() {
        final String query = "select * from users";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class);
        }
    }

    public static void update(User u) {
        String updateSql = "UPDATE users SET  username = :username, email = :email, Pass = :pass, userrole = :userrole, Address = :address WHERE User_ID = :userId";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(updateSql)
                    .addParameter("username", u.getUsername())
                    .addParameter("email", u.getEmail())
                    .addParameter("pass", u.getPass())
                    .addParameter("userrole", u.getUserrole())
                    .addParameter("Address", u.getAddress())
                    .addParameter("userId", u.getUser_ID());
        }
    }

    public static User findById(int id) {
        final String query = "select * from users where User_ID = :user_id";
        try (Connection con = DBUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("user_id", id)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }


    public static User Find_By_Email(String email) {
        final String query = "select * from users where email = :email";
        try (Connection con = DBUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

    public static void AddNewUser(User u) {
        final String query = "insert into users (username, email, Pass, userrole, Address, Date_o_Birth)\n" +
                "values (:username,:email,:pass,:userrole,:Address,:Date_o_Birth)";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query)
                    .addParameter("username", u.getUsername())
                    .addParameter("email", u.getEmail())
                    .addParameter("pass", u.getPass())
                    .addParameter("userrole", u.getUserrole())
                    .addParameter("Address", u.getAddress())
                    .addParameter("Date_o_Birth", u.getDate_o_Birth())
                    .executeUpdate();
        }
    }

    public static void Update_User(User user, String new_password) {
        final String query = "update auctionweb.users set Pass = :pass where User_ID = :user_id;";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("pass", new_password)
                    .addParameter("user_id", user.getUser_ID())
                    .executeUpdate();
        }
    }

    public static void Update_User_Information(String username, String email, String Address, Date Date_o_Birth, int user_id) {
        final String query = "update auctionweb.users" +
                " set username=:username, " +
                " email=:email," +
                "Address=:Address," +
                "Date_o_Birth=:Date_o_Birth " +
                "where User_ID = :user_id;";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query)
                    .addParameter("username", username)
                    .addParameter("email", email)
                    .addParameter("Address", Address)
                    .addParameter("Date_o_Birth", Date_o_Birth)
                    .addParameter("user_id", user_id)
                    .executeUpdate();
        }
    }

    public static void Update_User_Password(String new_pass, int id) {
        final String query = "update auctionweb.users set Pass=:pass where user_id=:id";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query)
                    .addParameter("pass", new_pass)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }

    public static void Add_Request(int id) {
        final String query = "Insert into auctionweb.request(user_id) values(:id)";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }

    public static List<Product> Get_Watch_List(int user_id) {
        final String query = "select *from products where Pro_ID in(\n" +
                "    select Pro_ID\n" +
                "    from favorite\n" +
                "    where User_ID=:user_id\n" +
                "    );";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .addParameter("user_id", user_id)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<ProductAuction> Get_User_Auction_Product_List(int user_id) {
        final String query = "select pa.*,p.Pname from product_auction pa join products p on p.Pro_ID = pa.Pro_ID where pa.Pro_ID in(\n" +
                "                    select distinct Pro_ID\n" +
                "                    from auction a join product_auction pa on a.Pro_Auc_ID = pa.Pro_Auc_ID \n" +
                "                    where User_ID=:user_id)";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .addParameter("user_id", user_id)
                    .executeAndFetch(ProductAuction.class);
        }
    }
}
