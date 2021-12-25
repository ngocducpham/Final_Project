package com.final_project.models;

import com.final_project.beans.User;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class MagageModel {
    public static void Add(int pro_id, int user_id) {
        final String query = "insert into magage (Pro_ID, User_ID)\n" +
                "values (:Pro_id,:User_id);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("Pro_id", pro_id)
                    .addParameter("User_id", user_id)
                    .executeUpdate();
        }

    }
}
