package com.final_project.beans;

public class Favorite {
    private int Pro_Id;
    private int User_Id;

    public Favorite(int pro_Id, int user_Id) {
        Pro_Id = pro_Id;
        User_Id = user_Id;
    }

    public int getPro_Id() {
        return Pro_Id;
    }

    public void setPro_Id(int pro_Id) {
        Pro_Id = pro_Id;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int user_Id) {
        User_Id = user_Id;
    }
}
