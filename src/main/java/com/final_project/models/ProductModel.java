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

    public static void add(Product p) {
        String insertSql = "INSERT INTO products (Pname, Price, img, description, Status, Cat_ID) VALUES (:Pname,:Price,:img,:description,:Status,:Cat_ID)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("Pname", p.getPname())
                    .addParameter("Price", p.getPrice())
                    .addParameter("img", p.getImg())
                    .addParameter("description", p.getDescription())
                    .addParameter("Status", p.getStatus())
                    .addParameter("Cat_ID", p.getCat_ID())
                    .executeUpdate();
        }
    }

    public static void update(Product p) {
        String sql = "UPDATE products SET  Pname = :Pname, Price = :Price, img = :img, description = :description, Status = :Status, Cat_ID= :Cat_ID WHERE Pro_ID = :Pro_id";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(sql)
                    .addParameter("Pname", p.getPname())
                    .addParameter("Price", p.getPrice())
                    .addParameter("img", p.getImg())
                    .addParameter("description", p.getDescription())
                    .addParameter("Status", p.getStatus())
                    .addParameter("Cat_ID", p.getCat_ID())
                    .addParameter("Pro_ID", p.getPro_ID())
                    .executeUpdate();
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
