package com.final_project.beans;

public class Manager {
    private int Pro_ID;
    private int User_ID;

    public Manager()
    {

    }

    public Manager(int Pro_ID, int User_ID)
    {
        this.Pro_ID=Pro_ID;
        this.User_ID=User_ID;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }
}
