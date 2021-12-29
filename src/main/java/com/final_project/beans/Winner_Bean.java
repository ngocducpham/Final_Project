package com.final_project.beans;

import java.time.LocalDateTime;

public class Winner_Bean {
    private String owner_name, owner_email, Pname, winner_name, winner_email;
    private LocalDateTime End_Time,Price_Time;
    private int total_bid, winner_price,Pro_id,Pro_Auc_ID;

    public Winner_Bean(String owner_name, String owner_email, String pname, String winner_name, String winner_email, LocalDateTime end_Time, int total_bid, int winner_price, int pro_id) {
        this.owner_name = owner_name;
        this.owner_email = owner_email;
        Pname = pname;
        this.winner_name = winner_name;
        this.winner_email = winner_email;
        End_Time = end_Time;
        this.total_bid = total_bid;
        this.winner_price = winner_price;
        Pro_id = pro_id;
    }

    public int getPro_Auc_ID() {
        return Pro_Auc_ID;
    }

    public void setPro_Auc_ID(int pro_Auc_ID) {
        Pro_Auc_ID = pro_Auc_ID;
    }

    public LocalDateTime getPrice_Time() {
        return Price_Time;
    }

    public void setPrice_Time(LocalDateTime price_Time) {
        Price_Time = price_Time;
    }

    public int getPro_id() {
        return Pro_id;
    }

    public void setPro_id(int pro_id) {
        Pro_id = pro_id;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public String getOwner_email() {
        return owner_email;
    }

    public void setOwner_email(String owner_email) {
        this.owner_email = owner_email;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public String getWinner_name() {
        return winner_name;
    }

    public void setWinner_name(String winner_name) {
        this.winner_name = winner_name;
    }

    public String getWinner_email() {
        return winner_email;
    }

    public void setWinner_email(String winner_email) {
        this.winner_email = winner_email;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public int getTotal_bid() {
        return total_bid;
    }

    public void setTotal_bid(int total_bid) {
        this.total_bid = total_bid;
    }

    public int getWinner_price() {
        return winner_price;
    }

    public void setWinner_price(int winner_price) {
        this.winner_price = winner_price;
    }
}
