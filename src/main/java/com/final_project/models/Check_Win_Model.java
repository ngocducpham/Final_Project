package com.final_project.models;

import com.final_project.beans.Winner_Bean;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class Check_Win_Model {
    public static List<Winner_Bean> Get_Result_of_Product_Auction() {
        final String query = "select U1.Username as owner_name, U1.email as owner_email, p.Pname, pa.End_Time, pa.total_bid, max(a.price_of_User) as winner_price, U2.Username as winner_name, U2.email as winner_email\n" +
                "from products p join magage m on p.Pro_ID = m.Pro_ID\n" +
                "\t\t\t    left join users U1 on U1.User_ID = m.User_ID\n" +
                "\t\t\t    left join product_auction pa on pa.Pro_ID = p.Pro_ID\n" +
                "\t\t\t    left join auction a on a.Pro_Auc_ID = pa.Pro_Auc_ID\n" +
                "\t\t\t    left join users U2 on U2.User_ID = a.User_ID \n" +
                "                where p.status=1\n" +
                "                and pa.End_time <= NOW()\n" +
                "                group by a.pro_auc_id;";
        try (Connection conn = DBUtils.getConnection()) {
            return conn.createQuery(query).executeAndFetch(Winner_Bean.class);
        }
    }
}
