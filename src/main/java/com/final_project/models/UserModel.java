package com.final_project.models;

import com.final_project.beans.Favorite;
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
        String updateSql = "UPDATE users SET userrole = :userrole WHERE User_ID = :User_ID";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(updateSql)
                    .addParameter("userrole", u.getUserrole())
                    .addParameter("User_ID", u.getUser_ID())
                    .executeUpdate();
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

    public static List<ProductAuction> Get_Watch_List(int user_id) {
        final String query = "select pa.*, p.Pname, max(a.Price_of_User) as max_price, username\n" +
                "from products p\n" +
                "         left join product_auction pa on p.Pro_ID = pa.Pro_ID\n" +
                "         left join auction a on pa.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "         left join users u on u.User_ID = a.User_ID\n" +
                "where p.Pro_ID in (\n" +
                "    select Pro_ID\n" +
                "    from favorite where User_ID=:user_id)\n" +
                "group by p.Pro_ID;";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .addParameter("user_id", user_id)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static List<ProductAuction> Get_User_Auction_Product_List(int user_id) {
        final String query = "select pa.*,p.Pname,max(a.Price_of_User) as max_price,username\n" +
                "from products p left join product_auction pa on p.Pro_ID = pa.Pro_ID left join auction a on pa.Pro_Auc_ID = a.Pro_Auc_ID left join users u on u.User_ID = a.User_ID\n" +
                "where pa.Pro_ID in(\n" +
                "    select distinct Pro_ID\n" +
                "    from auction a join product_auction pa on a.Pro_Auc_ID = pa.Pro_Auc_ID\n" +
                "    where User_ID=:user_id)\n" +
                "group by a.Pro_Auc_ID;";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query)
                    .addParameter("user_id", user_id)
                    .executeAndFetch(ProductAuction.class);
        }
    }

    public static Boolean Check_Watch_List(int Pro_Id, int User_Id) {
        final String query = "select * from favorite f where f.Pro_ID=:Pro_Id and f.User_ID=:User_Id;";
        try (Connection conn = DBUtils.getConnection()) {
            List<Favorite> list = conn.createQuery(query)
                    .addParameter("Pro_Id", Pro_Id)
                    .addParameter("User_Id", User_Id)
                    .executeAndFetch(Favorite.class);
            if (list.size() != 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    public static void Add_To_Watch_List(int Pro_Id, int User_Id) {
        final String query = "insert into favorite (Pro_ID, User_ID)\n" +
                "values (:Pro_Id,:User_Id);";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query).
                    addParameter("Pro_Id", Pro_Id).
                    addParameter("User_Id", User_Id).
                    executeUpdate();
        }
    }

    public static void add(User u) {
        final String query = "insert into users (User_ID, username)\n" +
                "values (:User_ID,:username);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("User_ID", u.getUser_ID())
                    .addParameter("username", u.getUsername())
                    .executeUpdate();
        }
    }

    public static int Get_max_user_max_id() {
        final String query = "select max(user_id)from users";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(User.class).get(0).getUser_ID();
        }
    }
}
