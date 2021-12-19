package com.final_project.beans;

import java.time.LocalDateTime;

public class ProductAuction {
    private String Pname;
    private int Total_Bid;
    private int Pro_Auc_ID;
    private int Start_Price;
    private int Immediate_Pice;
    private int Distance_Price;
    private int Current_Price;
    private LocalDateTime Start_Time;
    private LocalDateTime End_Time;
    private int Pro_ID;

    public ProductAuction(int total_Bid,String pname,int current_Price, int pro_Auc_ID, int start_Price, int immediate_Pice, int distance_Price, LocalDateTime start_Time, LocalDateTime end_Time, int pro_ID) {
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
}