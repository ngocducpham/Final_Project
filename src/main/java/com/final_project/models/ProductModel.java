package com.final_project.models;

import com.final_project.beans.*;
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

    public static List<Product> findByCatId(int id) {
        final String query = "select * from products where Cat_ID = :Cat_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("Cat_ID", id)
                    .executeAndFetch(Product.class);
        }
    }



    public static List<Product> Join() {
        final String query = "select Current_Price, End_Time, Start_Price, Start_Time, Pname, pa.Pro_ID from products join product_auction pa on pa.Pro_ID = products.Pro_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Product.class);
        }
    }

    public static ProductDetail findById(String id) {
        final String query =
                "select products.Pro_ID, products.Pname, products.description, products.Status, product_auction.Total_Bid"
+",product_auction.Start_Time, max(auction.Price_of_User) as GiaCaoNhat,product_auction.End_Time,U1.username as Owner,U2.username as Holder"
        +"from products inner join magage  on products.Pro_ID= magage.Pro_ID"
        +"inner join users  as U1 on U1.User_ID=magage.User_ID"
        +"inner join product_auction on product_auction.Pro_ID = products.Pro_ID"
        +"inner join auction on auction.Pro_Auc_ID=product_auction.Pro_Auc_ID"
        +"inner join users U2 on U2.User_ID= auction.User_ID"
        +"where products.Pro_ID=1"
        +"group by product_auction.Pro_ID";

        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> detail = con.createQuery(query)
                    .addParameter("Pro_ID", id)
                    .executeAndFetch(ProductDetail.class);
            return detail.get(0);
        }
    }

    public static Product findById1(int id) {
        final String query = "select * from products";

        try (Connection con = DBUtils.getConnection()) {
            List<Product> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Product.class);
            if (list.size() == 0) {
                return null;
            }
            return list.get(0);
        }
    }

//    //Tim theo Pro_ID
//    public static Product findProID(int id)
//    {
//        final  String query="select * from products where Pro_ID = :Pro_ID";
//        try(Connection con =DBUtils.getConnection())
//        {
//            List<Product> list= con.createQuery(query)
//                    .addParameter("Pro_ID",id)
//                    .executeAndFetch(Product.class);
//            if (list.size() == 0) {
//                return null;
//            }
//
//            return list.get(0);
//        }
//    }
    //Truy van Chi tiet SP
    public static FEDetail productDetail(int id)
    {
        final String query= "select products.Pro_ID, products.Pname, products.Cat_ID, products.Status, product_auction.Total_Bid, product_auction.Current_Price\n" +
                ",max(auction.Price_of_User) as GiaCaoNhat,product_auction.Start_Time, product_auction.End_Time,U1.username as Owner,U2.username as Holder, products.description\n" +
                "from products inner join magage  on products.Pro_ID= magage.Pro_ID\n" +
                "inner join users  as U1 on U1.User_ID=magage.User_ID\n" +
                "inner join product_auction on product_auction.Pro_ID = products.Pro_ID\n" +
                "inner join auction on auction.Pro_Auc_ID=product_auction.Pro_Auc_ID\n" +
                "inner join users U2 on U2.User_ID= auction.User_ID\n" +
                "where products.Pro_ID= :Pro_ID " +
                " group by product_auction.Pro_ID\n";
        try(Connection con=DBUtils.getConnection())
        {
            return  con.createQuery(query)
                    .addParameter("Pro_ID",id)
                    .executeAndFetch(FEDetail.class).get(0);

        }

    }
//    Tim 5 sp cung loai
    public static List<Product5> find5(String id)
    {
        final  String query= "select Pname, pa.Pro_ID, Current_Price, End_Time, Total_Bid \n" +
                "from products join product_auction pa on products.Pro_ID = pa.Pro_ID join categories c on c.Cat_ID = products.Cat_ID\n" +
                "where c.Cat_ID = :id or Cparent_ID = :id limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Product5.class);
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

    public static List<ProductAuction> getAllProductAuction(){
        String query = "select *from product_auction";

        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(ProductAuction.class);
        }
    }


    public static void add(Product p) {
        String insertSql = "insert into products(Pname , img, description, Cat_ID) values (:Pname, :img, :description, :Cat_ID)";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(insertSql)
                    .addParameter("Pname", p.getPname())
                    .addParameter("img", p.getImg())
                    .addParameter("description", p.getDescription())
                    .addParameter("Cat_ID", p.getCat_ID())
                    .executeUpdate();
        }
    }


}
