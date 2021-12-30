package com.final_project.beans;

import java.time.LocalDateTime;

public class
ProductAuction {
    private String Pname,owner_name;
    private int Total_Bid;
    private int Pro_Auc_ID;
    private int Start_Price;
    private int Immediate_Pice;
    private int Distance_Price;
    private int Current_Price;
    private LocalDateTime Start_Time;
    private LocalDateTime End_Time;
    private int Pro_ID;
    private int User_ID;
    private String username,winner_name,seller_name;
    private int Price_of_User;
    private String Total_Products;
    private int max_price,winner_id,owner_id,winner_price,seller_id,status;

    public ProductAuction(String total_Products, int price_of_User, int user_ID, String username, int total_Bid, String pname, int current_Price, int pro_Auc_ID, int start_Price, int immediate_Pice, int distance_Price, LocalDateTime start_Time, LocalDateTime end_Time, int pro_ID) {
        Total_Products = total_Products;
        Price_of_User = price_of_User;
        User_ID = user_ID;
        this.username = username;
        Total_Bid = total_Bid;
        Pname = pname;
        Current_Price = current_Price;
        Pro_Auc_ID = pro_Auc_ID;
        Start_Price = start_Price;
        Immediate_Pice = immediate_Pice;
        Distance_Price = distance_Price;
        Start_Time = start_Time;
        End_Time = end_Time;
        Pro_ID = pro_ID;
    }

    public ProductAuction(String pname, int total_Bid, int pro_Auc_ID, int start_Price, int immediate_Pice, int distance_Price, int current_Price, LocalDateTime start_Time, LocalDateTime end_Time, int pro_ID, int user_ID, String username, int price_of_User, String total_Products, int max_price) {
        Pname = pname;
        Total_Bid = total_Bid;
        Pro_Auc_ID = pro_Auc_ID;
        Start_Price = start_Price;
        Immediate_Pice = immediate_Pice;
        Distance_Price = distance_Price;
        Current_Price = current_Price;
        Start_Time = start_Time;
        End_Time = end_Time;
        Pro_ID = pro_ID;
        User_ID = user_ID;
        this.username = username;
        Price_of_User = price_of_User;
        Total_Products = total_Products;
        this.max_price = max_price;
    }

    public ProductAuction(int total_Bid, int start_Price, int distance_Price, int current_Price, LocalDateTime start_Time, LocalDateTime end_Time, int pro_ID) {
        Total_Bid = total_Bid;
        Start_Price = start_Price;
        Distance_Price = distance_Price;
        Current_Price = current_Price;
        Start_Time = start_Time;
        End_Time = end_Time;
        Pro_ID = pro_ID;
    }

    public ProductAuction(String pname, int price, LocalDateTime start_time, LocalDateTime end_time) {
        Start_Price=price;
        Pname=pname;
        Start_Time=start_time;
        End_Time=end_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getWinner_price() {
        return winner_price;
    }

    public int getSeller_id() {
        return seller_id;
    }

    public void setSeller_id(int seller_id) {
        this.seller_id = seller_id;
    }

    public String getWinner_name() {
        return winner_name;
    }

    public void setWinner_name(String winner_name) {
        this.winner_name = winner_name;
    }

    public void setWinner_price(int winner_price) {
        this.winner_price = winner_price;
    }

    public int getWinner_id() {
        return winner_id;
    }

    public void setWinner_id(int winner_id) {
        this.winner_id = winner_id;
    }

    public String getOwner_name() {
        return owner_name;
    }

    public void setOwner_name(String owner_name) {
        this.owner_name = owner_name;
    }

    public int getOwner_id() {
        return owner_id;
    }

    public void setOwner_id(int owner_id) {
        this.owner_id = owner_id;
    }

    public void setTotal_Products(String total_Products) {
        Total_Products = total_Products;
    }

    public String getTotal_Products() {
        return Total_Products;
    }

    public void setPrice_of_User(int price_of_User) {
        Price_of_User = price_of_User;
    }

    public int getPrice_of_User() {
        return Price_of_User;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public String getUsername() {
        return username;
    }

    public int getTotal_Bid() {
        return Total_Bid;
    }

    public void setTotal_Bid(int total_Bid) {
        Total_Bid = total_Bid;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }

    public void setCurrent_Price(int current_Price) {
        Current_Price = current_Price;
    }

    public int getPro_Auc_ID() {
        return Pro_Auc_ID;
    }

    public int getStart_Price() {
        return Start_Price;
    }

    public int getImmediate_Pice() {
        return Immediate_Pice;
    }

    public int getDistance_Price() {
        return Distance_Price;
    }

    public LocalDateTime getStart_Time() {
        return Start_Time;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public void setPro_Auc_ID(int pro_Auc_ID) {
        Pro_Auc_ID = pro_Auc_ID;
    }

    public void setStart_Price(int start_Price) {
        Start_Price = start_Price;
    }

    public void setImmediate_Pice(int immediate_Pice) {
        Immediate_Pice = immediate_Pice;
    }

    public void setDistance_Price(int distance_Price) {
        Distance_Price = distance_Price;
    }

    public void setStart_Time(LocalDateTime start_Time) {
        Start_Time = start_Time;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public int getMax_price() {
        return max_price;
    }

    public void setMax_price(int max_price) {
        this.max_price = max_price;
    }

    public String getSeller_name() {
        return seller_name;
    }

    public void setSeller_name(String seller_name) {
        this.seller_name = seller_name;
    }
}
