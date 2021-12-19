package com.final_project.models;

import com.final_project.beans.Category;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class CategoryModel {

    public static List<Category> findAll() {
        final String query = "select * from categories";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }


    public static Category findById(int id) {
        final String query = "select * from categories where Cat_ID = :cat_id";
        try (Connection con = DBUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("cat_id", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static void add(Category c) {
        String insertSql = "INSERT INTO categories (Cname) VALUES (:Cname)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("Cname", c.getCname())
                    .executeUpdate();
        }
    }
//
//    public static void update(Product p) {
//        String sql = "UPDATE products SET  Pname = :Pname, Price = :Price, img = :img, description = :description, Status = :Status, Cat_ID= :Cat_ID WHERE Pro_ID = :Pro_id";
//        try (Connection con = DBUtils.getConnection()) {
//            con.createQuery(sql)
//                    .addParameter("Pname", p.getPname())
//                    .addParameter("Price", p.getPrice())
//                    .addParameter("img", p.getImg())
//                    .addParameter("description", p.getDescription())
//                    .addParameter("Status", p.getStatus())
//                    .addParameter("Cat_ID", p.getCat_ID())
//                    .addParameter("Pro_ID", p.getPro_ID())
//                    .executeUpdate();
//        }
//    }
//
//    public static void delete(int id) {
//        String sql = "delete from products where Pro_ID = :Pro_ID";
//        try (Connection con = DBUtils.getConnection()) {
//            con.createQuery(sql)
//                    .addParameter("Pro_ID", id)
//                    .executeUpdate();
//        }
//    }
}
