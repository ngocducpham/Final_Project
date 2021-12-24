package com.final_project.beans;

import java.time.LocalDateTime;

public class ProductDetail {
    private int Pro_ID;
    private String Pname;
    private String Description;
    private int Status;
    private int Total_Bid;
    private LocalDateTime Start_Time;
    private int Current_Price;
    private LocalDateTime End_Time;
    private String Owner;
    private String Holder;
    private int Distance_Price;
    private int Cat_ID;
    private int Pro_Auc_ID;
    private String username;
    private LocalDateTime Price_Time;
    private int Price_of_User;
    private int Min_Price;
    private int OwnerID;
    private int User_ID;

    public ProductDetail(){

    }

    public ProductDetail(int user_ID, int ownerID, String username, LocalDateTime price_Time, int price_of_User, int pro_Auc_ID , int cat_ID, int distance_Price, int pro_ID, String pname, String description, int status, int total_Bid, LocalDateTime start_Time, int current_Price, LocalDateTime end_Time, String owner, String holder) {
        User_ID = user_ID;
        OwnerID = ownerID;
        this.username = username;
        Price_Time = price_Time;
        Price_of_User = price_of_User;
        Pro_Auc_ID = pro_Auc_ID;
        Cat_ID = cat_ID;
        Distance_Price = distance_Price;
        Pro_ID = pro_ID;
        Pname = pname;
        Description = description;
        Status = status;
        Total_Bid = total_Bid;
        Start_Time = start_Time;
        Current_Price = current_Price;
        End_Time = end_Time;
        Owner = owner;
        Holder = holder;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setOwnerID(int ownerID) {
        OwnerID = ownerID;
    }

    public int getOwnerID() {
        return OwnerID;
    }

    public void setMin_Price(int min_Price) {
        Min_Price = min_Price;
    }

    public int getMin_Price() {
        return Min_Price;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPrice_Time(LocalDateTime price_Time) {
        Price_Time = price_Time;
    }

    public void setPrice_of_User(int price_of_User) {
        Price_of_User = price_of_User;
    }

    public String getUsername() {
        return username;
    }

    public LocalDateTime getPrice_Time() {
        return Price_Time;
    }

    public int getPrice_of_User() {
        return Price_of_User;
    }

    public void setPro_Auc_ID(int pro_Auc_ID) {
        Pro_Auc_ID = pro_Auc_ID;
    }

    public int getPro_Auc_ID() {
        return Pro_Auc_ID;
    }

    public void setCat_ID(int cat_ID) {
        Cat_ID = cat_ID;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public void setDistance_Price(int distance_Price) {
        Distance_Price = distance_Price;
    }

    public int getDistance_Price() {
        return Distance_Price;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public void setTotal_Bid(int total_Bid) {
        Total_Bid = total_Bid;
    }

    public void setStart_Time(LocalDateTime start_Time) {
        Start_Time = start_Time;
    }

    public void setCurrent_Price(int current_Price) {
        Current_Price = current_Price;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public void setOwner(String owner) {
        Owner = owner;
    }

    public void setHolder(String holder) {
        Holder = holder;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public String getPname() {
        return Pname;
    }

    public String getDescription() {
        return Description;
    }

    public int getStatus() {
        return Status;
    }

    public int getTotal_Bid() {
        return Total_Bid;
    }

    public LocalDateTime getStart_Time() {
        return Start_Time;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

    public String getOwner() {
        return Owner;
    }

    public String getHolder() {
        return Holder;
    }
}
