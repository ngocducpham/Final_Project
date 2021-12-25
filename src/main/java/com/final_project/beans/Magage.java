package com.final_project.beans;

public class Magage {
    private int User_id,Pro_id;

    public Magage(int user_id, int pro_id) {
        User_id = user_id;
        Pro_id = pro_id;
    }

    public int getUser_id() {
        return User_id;
    }

    public void setUser_id(int user_id) {
        User_id = user_id;
    }

    public int getPro_id() {
        return Pro_id;
    }

    public void setPro_id(int pro_id) {
        Pro_id = pro_id;
    }
}
