package com.final_project.models;

import com.final_project.beans.Manager;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

public class ManagerModel {

    public  static void add(Manager m)
    {
        final String query="insert into magage (Pro_ID, User_ID)\n" +
                "values (:Pro_ID,:User_ID);";
        try (Connection con =DBUtils.getConnection())
        {
           con.createQuery(query)
                   .addParameter("Pro_ID",m.getPro_ID())
                   .addParameter("username",m.getUser_ID())
                   .executeUpdate();
        }
    }
}
