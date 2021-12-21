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
    final String query = "select * from categories where CatID = :CatID";
    try (Connection con = DBUtils.getConnection()) {
      List<Category> list = con.createQuery(query)
        .addParameter("CatID", id)
        .executeAndFetch(Category.class);

      if (list.size() == 0) {
        return null;
      }

      return list.get(0);
    }
  }

  public static void add(Category c) {
    String insertSql = "insert into categories(Cname) values (:Cname)";
    try (Connection con = DBUtils.getConnection()) {
      con.createQuery(insertSql)
        .addParameter("Cname", c.getCname())
        .executeUpdate();
    }
  }

}