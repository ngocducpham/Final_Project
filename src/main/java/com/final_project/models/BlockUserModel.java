package com.final_project.models;

import com.final_project.beans.ProductDetail;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

public class BlockUserModel {
    public static void block(String uid, String proAuID){
        String query = "delete from auction where User_ID = :uid and Pro_Auc_ID = :proauid;";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }

        query = "insert into black_list values (:uid,:proauid);";
        try (Connection con = DBUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("uid", uid)
                    .addParameter("proauid", proAuID)
                    .executeUpdate();
        }
    }
}
