package com.final_project.models;

import com.final_project.beans.Aution;
import com.final_project.beans.MyIntType;
import com.final_project.beans.Point;
import com.final_project.beans.ProductDetail;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class ProductDetailModel {
    public static ProductDetail getByID(String id) {
        String query = "select products.Pro_ID\n" +
                "     , products.Pname\n" +
                "     , products.description\n" +
                "     , products.Status\n" +
                "     , product_auction.Total_Bid\n" +
                "     , product_auction.Start_Time\n" +
                "     , max(auction.Price_of_User) as Current_Price\n" +
                "     , product_auction.End_Time\n" +
                "     , U1.username                as Owner\n" +
                "     , U2.username                as Holder\n" +
                "     , U1.User_ID                as OwnerID\n" +
                "     , Cat_ID\n" +
                "     , Distance_Price\n" +
                "     , product_auction.Pro_Auc_ID\n" +
                "from products\n" +
                "         left join magage on products.Pro_ID = magage.Pro_ID\n" +
                "         left join users as U1 on U1.User_ID = magage.User_ID\n" +
                "         left join product_auction on product_auction.Pro_ID = products.Pro_ID\n" +
                "         left join auction on auction.Pro_Auc_ID = product_auction.Pro_Auc_ID\n" +
                "         left join users U2 on U2.User_ID = auction.User_ID\n" +
                "where products.Pro_ID = :id\n" +
                " group by product_auction.Pro_ID;";

        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> detail = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(ProductDetail.class);
            if (detail.size() > 0)
                return detail.get(0);
            return null;
        }
    }

    public static List<ProductDetail> get5ProductRelative(String catID) {
        String query = "select Pname, pa.Pro_ID, Current_Price, End_Time, Total_Bid \n" +
                "from products\n" +
                "         join product_auction pa on products.Pro_ID = pa.Pro_ID\n" +
                "         join categories c on c.Cat_ID = products.Cat_ID\n" +
                "where c.Cat_ID = :id \n" +
                "   or Cparent_ID = :id \n" +
                "limit 5";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", catID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static List<ProductDetail> bidHistory(String proAuID) {
        String query = "select Pro_ID, username, Price_Time, Price_of_User, u.User_ID\n" +
                "from product_auction\n" +
                "         join auction a on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "         join users u on u.User_ID = a.User_ID\n" +
                "where a.Pro_Auc_ID = :id\n" +
                "order by Price_of_User DESC";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static void bid(String uid, String proAuID, String price) {
        int priceStep = getPriceStep(proAuID);

        String query = "select Price_of_User\n" +
                "from auction\n" +
                "where Pro_Auc_ID = :proauid\n" +
                "order by Price_of_User desc";
        try (Connection con = DBUtils.getConnection()) {
            List<Aution> history = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(Aution.class);
            System.out.println(history.size());
            if (Integer.parseInt(price) > history.get(0).getPrice_of_User()) {
                setCurrentPrice(history.get(0).getPrice_of_User() + priceStep, proAuID);
            } else if (Integer.parseInt(price) == history.get(0).getPrice_of_User()) {
                setCurrentPrice(history.get(0).getPrice_of_User(), proAuID);
            } else if ((history.size() > 1 && Integer.parseInt(price) > history.get(1).getPrice_of_User())|| history.size() == 1) {
                setCurrentPrice(Integer.parseInt(price) + priceStep, proAuID);
            }
        } catch (Exception e) {
            int curentPrice = Integer.parseInt(getCurrentPrice(proAuID));
            setCurrentPrice(curentPrice + priceStep, proAuID);
        }

        increaseTotalBid(proAuID);

        query = "insert into auction (price_of_user, price_time, pro_auc_id, user_id)\n" +
                "values (:price, NOW(), :proauid, :uid);\n";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .addParameter("uid", uid)
                    .addParameter("price", price)
                    .executeUpdate();
        }
    }


    private static int getPriceStep(String proAuID) {
        String query = "select Distance_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            String price = con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0);

            return Integer.parseInt(price);
        }
    }

    private static void setCurrentPrice(int price, String proAuID) {
        String query = "update product_auction\n" +
                "set Current_Price = :price\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("price", price)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    private static void increaseTotalBid(String proAuID) {
        String query = "update product_auction\n" +
                "  set  Total_Bid    = Total_Bid + 1\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }

    public static ProductDetail currentBidder(String proAuID) {
        String query = "select username, u.User_ID\n" +
                "from auction\n" +
                "         join users u on u.User_ID = auction.User_ID\n" +
                "where Pro_Auc_ID = :id\n" +
                "order by Price_of_User desc\n" +
                "limit 1";
        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> result = con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
            if (result.size() > 0)
                return result.get(0);
            return null;
        }
    }

    public static ProductDetail getOwner(String proAuID) {
        String query = "select m.User_ID, username\n" +
                "from users\n" +
                "         join magage m on users.User_ID = m.User_ID\n" +
                "         join product_auction pa on m.Pro_ID = pa.Pro_ID\n" +
                "where Pro_Auc_ID = :id";
        try (Connection con = DBUtils.getConnection()) {
            List<ProductDetail> result = con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
            if (result.size() > 0)
                return result.get(0);
            return new ProductDetail();
        }
    }

    public static MyIntType checkBlackList(String uid, String proAuid) {
        String query = "select User_ID from black_list\n" +
                "where User_ID = :uid and product_auction_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            List<String> result = con.createQuery(query)
                    .addParameter("proauid", proAuid)
                    .addParameter("uid", uid)
                    .executeAndFetch(String.class);
            if (result.size() > 0)
                return new MyIntType(1);
            return new MyIntType(0);
        }
    }

    public static List<ProductDetail> getBidUser(String proAuID) {
        String query = "select a.User_ID, Pro_ID, username, Price_Time, Price_of_User\n" +
                "from product_auction\n" +
                "    join auction a\n" +
                "on product_auction.Pro_Auc_ID = a.Pro_Auc_ID\n" +
                "    join users u on u.User_ID = a.User_ID\n" +
                "where a.Pro_Auc_ID = :id\n" +
                "group by a.User_ID";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proAuID)
                    .executeAndFetch(ProductDetail.class);
        }
    }

    public static String getCurrentPrice(String proAuID) {
        String query = "select Current_Price\n" +
                "from product_auction\n" +
                "where Pro_Auc_ID = :proauid";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("proauid", proAuID)
                    .executeAndFetch(String.class).get(0);
        }
    }

    public static Double userPoint(int uid) {
        String query = "select up, down\n" +
                "from points\n" +
                "where User_ID = :id";
        try (Connection con = DBUtils.getConnection()) {
            Point result = con.createQuery(query)
                    .addParameter("id", Integer.toString(uid))
                    .executeAndFetch(Point.class).get(0);
            if (result == null) {
                return 100.0;
            }
            return result.getUp() * 100.0 / (result.getUp() + result.getDown());
        } catch (Exception e) {
            return 100.0;
        }
    }

    public static String getUserEmail(int uid) {
        String query = "select email\n" +
                "from users\n" +
                "where User_ID = :uid";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("uid", uid)
                    .executeAndFetch(String.class).get(0);
        }
    }

    public static String getProductName(String proID) {
        String query = "select Pname\n" +
                "from products\n" +
                "where Pro_ID = :id";
        try (Connection con = DBUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("id", proID)
                    .executeAndFetch(String.class).get(0);
        }
    }
}
