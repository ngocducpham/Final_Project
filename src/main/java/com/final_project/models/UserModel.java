package com.final_project.models;

import com.final_project.beans.User;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserModel {

    public static User findByEmail(String enail) {
        final String query = "select * from users where email = :email";
        try (Connection con = DBUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", enail)
                    .executeAndFetch(User.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }
}
