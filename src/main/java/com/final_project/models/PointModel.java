package com.final_project.models;

import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

public class PointModel {

    public static void New_User_Point() {
        final String query = "insert into auctionweb.points (up, down, points, User_ID)\n" +
                "values (0,0,10,:user_id);";
        try (Connection conn = DBUtils.getConnection()) {
            conn.createQuery(query).addParameter("user_id", UserModel.Get_max_user_max_id()).executeUpdate();
        }
    }
}
