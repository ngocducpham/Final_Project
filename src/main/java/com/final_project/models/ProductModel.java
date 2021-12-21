package com.final_project.models;

import com.final_project.beans.Product;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductModel {

    public static List<Product> findAll() {
        final String query = "select * from products";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }
    public static List<Product> findByCatId(int catId) {
        final String query = "select * from products where Cat_ID = :CatID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("CatID", catId)
                    .executeAndFetch(Product.class);
        }
    }

    public static List<Product> GetPriceProAuction() {
        final String query = "select  Start_Price, Current_Price, End_Time, Start_Time from product_auction join products p on p.Pro_ID = product_auction.Pro_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static Product findById(int id) {
        final String query = "select * from products where Pro_ID = :ProID";
        try (Connection con = DBUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("ProID", id)
                    .executeAndFetch(Product.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }


    public static void delete(int id) {
        String sql = "delete from products where Pro_ID = :Pro_ID";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("Pro_ID", id)
                    .executeUpdate();
        }
    }
}
