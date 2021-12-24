package com.final_project.models;

import com.final_project.beans.Category;
import com.final_project.utils.DBUtils;
import org.sql2o.Connection;

import java.util.List;

public class Check_Category_Model {
    public static Category Find_By_Cat_ID(int id) {
        final String query = "select Cat_ID from products where Cat_ID = :Cat_ID";
        try (Connection con1 = DBUtils.getConnection()) {
            List<Category> list = con1.createQuery(query)
                    .addParameter("Cat_ID", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}
