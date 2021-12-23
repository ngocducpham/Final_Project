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


    public ProductDetail(int cat_ID, int distance_Price, int pro_ID, String pname, String description, int status, int total_Bid, LocalDateTime start_Time, int current_Price, LocalDateTime end_Time, String owner, String holder) {
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
