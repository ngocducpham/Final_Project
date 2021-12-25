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
    final String query = "select * from categories where Cat_ID = :Cat_ID";
    try (Connection con = DBUtils.getConnection()) {
      List<Category> list = con.createQuery(query)
              .addParameter("Cat_ID", id)
              .executeAndFetch(Category.class);

      if (list.size() == 0) {
        return null;
      }

      return list.get(0);
    }
  }


  public static void add(Category c) {
    String insertSql = "insert into categories(Cname, Cparent_ID, Level) values (:Cname, :Cparent_ID, :Level)";
    try (Connection con = DBUtils.getConnection()) {
      con.createQuery(insertSql)
        .addParameter("Cname", c.getCname())
        .addParameter("Cparent_ID", c.getCparent_ID())
        .addParameter("Level", c.getLevel())
        .executeUpdate();
    }
  }

  public static void update(Category c) {
    String Sql = "update categories set Cname = :Cname, Cparent_ID = :Cparent_ID, Level = :Level where Cat_ID = :Cat_ID";
    try (Connection con = DBUtils.getConnection()) {
      con.createQuery(Sql)
              .addParameter("Cat_ID", c.getCat_ID())
              .addParameter("Cname", c.getCname())
              .addParameter("Cparent_ID", c.getCparent_ID())
              .addParameter("Level", c.getLevel())
              .executeUpdate();
    }
  }

  public static void delete(int id) {
    String Sql = "delete from categories where Cat_ID = :Cat_ID";
    try (Connection con = DBUtils.getConnection()) {
      con.createQuery(Sql)
              .addParameter("Cat_ID", id)
              .executeUpdate();
    }
  }

  public static void add1(Category c) {
    String query = "insert into categories(Cat_ID) values (:CatID) ";
    try (Connection con = DBUtils.getConnection()) {
      con.createQuery(query)
              .addParameter("Cat_ID", c.getCat_ID())
              .executeUpdate();
    }
  }


}