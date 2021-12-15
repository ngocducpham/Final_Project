package com.final_project.models;

import com.final_project.beans.User;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {

    public static User findByEmail(String email) {
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

    public static void AddNewUser(User u){
        final String query="insert into users (username, email, Pass, userrole, Address, Date_o_Birth)\n" +
                "values (:username,:email,:pass,:userrole,:Address,:Date_o_Birth)";
        try (Connection conn =DBUtils.getConnection()){
            conn.createQuery(query)
                    .addParameter("username",u.getUsername())
                    .addParameter("email",u.getEmail())
                    .addParameter("pass",u.getPass())
                    .addParameter("userrole",u.getUserrole())
                    .addParameter("Address",u.getAddress())
                    .addParameter("Date_o_Birth",u.getDate_o_Birth())
                    .executeUpdate();
        }
    }
}
