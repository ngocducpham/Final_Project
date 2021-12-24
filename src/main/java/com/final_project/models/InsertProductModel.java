package com.final_project.models;

import com.final_project.beans.AddProduct;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

  public class InsertProductModel {

  public static void SellerProduct(AddProduct s)
  {
      final String query="select * \n" +
              "from (\n" +
              "select p1.Pro_ID, p1.Pname, p1.Status,p1.Cat_ID, p1.Price, p1.description, p1.img,\t\n" +
              "\t u1.User_ID as SellerID, u1.username as Seller, \n" +
              "    pa1.End_Time, pa1.Start_Time,\n" +
              "    c1.Cparent_ID \n" +
              "from products p1 inner join magage  on p1.Pro_ID=magage.Pro_ID\n" +
              "\t inner join users u1 on u1.User_ID=magage.User_ID\n" +
              "    inner join categories c1 on p1.Cat_ID=c1.Cat_ID \n" +
              "    inner join product_auction pa1 on pa1.Pro_ID=p1.Pro_ID\n" +
              "    ) as Seller ";

      try(Connection con =DBUtils.getConnection())
      {
        con.createQuery(query)
                .executeAndFetch(AddProduct.class);
      }
  }

  public static void InsertProduct(AddProduct s)
  {
    String query= "insert into Seller(Pro_ID, Pname, Status, Cat_ID, Price, img, SellerID, Seller, \n" +
            "End_Time, Start_Time, Cparent_ID, description ) \n" +
            "value(:Pro_ID, :Pname, :Status, :Cat_ID, :Price, :img , :SellerID , :Seller , \n" +
            ":End_Time , :Start_Time , :Cparent_ID, :description );\n";
    try (Connection con =DBUtils.getConnection())
    {
      con.createQuery(query)
              .addParameter("Pro_ID",s.getPro_ID())
              .addParameter("Pname",s.getPname())
              .addParameter("Status",s.getStatus())
              .addParameter("Cat_ID",s.getCat_ID())
              .addParameter("img",s.getImg())
              .addParameter("Price",s.getPrice())
              .addParameter("SellerID",s.getSellerID())
              .addParameter("Seller",s.getSeller())
              .addParameter("End_Time",s.getEnd_Time())
              .addParameter("Start_Time",s.getStart_Time())
              .addParameter("Cparent_ID",s.getCparent_ID())
              .addParameter("desciption",s.getDescription())
              .executeUpdate();
    }
  }

//  public static List<ProductDetail> get5ProductRelative(String catID) {
//      String query = "select Pname, pa.Pro_ID, Current_Price, End_Time, Total_Bid \n" +
//              "from products\n" +
//              "         join product_auction pa on products.Pro_ID = pa.Pro_ID\n" +
//              "         join categories c on c.Cat_ID = products.Cat_ID\n" +
//              "where c.Cat_ID = :id \n" +
//              "   or Cparent_ID = :id \n" +
//              "limit 5";
//      try (Connection con = DBUtils.getConnection()) {
//        return con.createQuery(query)
//                .addParameter("id", catID)
//                .executeAndFetch(ProductDetail.class);
//      }
//    }
//
//  public static Category findById(int id) {
//    final String query = "select * from categories where Cat_ID = :Cat_ID";
//    return getCategory(id, query);
//  }
//
//  public static void add(Category c) {
//    String insertSql = "insert into categories(Cname, Cparent_ID, Level) values (:Cname, :Cparent_ID, :Level)";
//    try (Connection con = DBUtils.getConnection()) {
//      con.createQuery(insertSql)
//        .addParameter("Cname", c.getCname())
//        .addParameter("Cparent_ID", c.getCparent_ID())
//        .addParameter("Level", c.getLevel())
//        .executeUpdate();
//    }
//  }
//
//  public static void update(Category c) {
//    String Sql = "update categories set Cname = :Cname, Cparent_ID = :Cparent_ID, Level = :Level where Cat_ID = :Cat_ID";
//    try (Connection con = DBUtils.getConnection()) {
//      con.createQuery(Sql)
//              .addParameter("Cat_ID", c.getCat_ID())
//              .addParameter("Cname", c.getCname())
//              .addParameter("Cparent_ID", c.getCparent_ID())
//              .addParameter("Level", c.getLevel())
//              .executeUpdate();
//    }
//  }
//
//  public static void delete(int id) {
//    String Sql = "delete from categories where Cat_ID = :Cat_ID";
//    try (Connection con = DBUtils.getConnection()) {
//      con.createQuery(Sql)
//              .addParameter("Cat_ID", id)
//              .executeUpdate();
//    }
//  }
//
//  public static Category Find_By_Cat_ID(int Cat_ID) {
//    final String query = "select * from products as p where p.Cat_ID = :Cat_ID";
//    return getCategory(Cat_ID, query);
//  }
//
//  private static Category getCategory(int Cat_ID, String query) {
//    try (Connection con = DBUtils.getConnection()) {
//      List<Category> list = con.createQuery(query)
//              .addParameter("Cat_ID", Cat_ID)
//              .executeAndFetch(Category.class);
//      if (list.size() == 0) {
//        return null;
//      }
//      return list.get(0);
//    }
//  }

}