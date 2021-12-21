package com.final_project.models;

import com.final_project.beans.ProductAuction;
import com.final_project.beans.Request;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class RequestModel {

    public static List<Request> findAll() {
        final String query = "select * from request";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Request.class);
        }
    }

    public static List<Request> getUser(){
        final String query = "select User_ID from request join users u on u.User_ID = request.User_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Request.class);
        }
    }


    public static Request findById(int id) {
        final String query = "select * from request where Request_ID = :Request_ID";
        try (Connection con = DBUtils.getConnection()) {
            List<Request> list = con.createQuery(query)
                    .addParameter("Request_ID", id)
                    .executeAndFetch(Request.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

}
