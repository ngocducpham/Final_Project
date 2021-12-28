package com.final_project.beans;

import java.time.LocalDateTime;

public class Aution {
    private int Price_of_User;
    private LocalDateTime Price_Time;
    private int Auction_ID;
    private int Pro_Auc_ID;
    private int User_ID;

    public Aution(int price_of_User, LocalDateTime price_Time, int auction_ID, int pro_Auc_ID, int user_ID) {
        Price_of_User = price_of_User;
        Price_Time = price_Time;
        Auction_ID = auction_ID;
        Pro_Auc_ID = pro_Auc_ID;
        User_ID = user_ID;
    }

    public void setPrice_of_User(int price_of_User) {
        Price_of_User = price_of_User;
    }

    public void setPrice_Time(LocalDateTime price_Time) {
        Price_Time = price_Time;
    }

    public void setAuction_ID(int auction_ID) {
        Auction_ID = auction_ID;
    }

    public void setPro_Auc_ID(int pro_Auc_ID) {
        Pro_Auc_ID = pro_Auc_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public int getPrice_of_User() {
        return Price_of_User;
    }

    public LocalDateTime getPrice_Time() {
        return Price_Time;
    }

    public int getAuction_ID() {
        return Auction_ID;
    }

    public int getPro_Auc_ID() {
        return Pro_Auc_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }
}
