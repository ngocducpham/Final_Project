package com.final_project.utils;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class DBUtils {
    static Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:8889/auctionWeb", "root", "root");

    public static Connection getConnection() {
        return sql2o.open();
    }
}