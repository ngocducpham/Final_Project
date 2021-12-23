package com.final_project.beans;

import  java.time.LocalDateTime;

public class FEDetail {
    private int Pro_ID, Status,Total_Bid, Cat_ID;
    private String Pname, username;
    private LocalDateTime Start_Time, End_Time;
    private int Price_of_User, max_price;
    private int Current_Price;
    private String description;


    public FEDetail(String pname, String username, String description,LocalDateTime start_Time, LocalDateTime end_Time,
        int pro_ID, int price_of_User, int status, int total_Bid, int max_price, int current_Price,int cat_ID )
    {
        Total_Bid=total_Bid;
        Pname=pname;
        this.username=username;
        Start_Time=start_Time;
        End_Time=end_Time;
        Pro_ID=pro_ID;
        Cat_ID = cat_ID;

        Price_of_User=price_of_User;
        Status=status;
        this.max_price=max_price;
        Current_Price=current_Price;
        this.description=description;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

    public LocalDateTime getStart_Time() {
        return Start_Time;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public int getMax_price() {
        return max_price;
    }

    public int getPrice_of_User() {
        return Price_of_User;
    }

    public int getTotal_Bid() {
        return Total_Bid;
    }

    public int getStatus() {
        return Status;
    }

    public String getDescription() {
        return description;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public void setCat_ID(int cat_ID) {
        Cat_ID = cat_ID;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCurrent_Price(int current_Price) {
        Current_Price = current_Price;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }

    public String getUsername() {
        return username;
    }

    public String getPname() {
        return Pname;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public void setTotal_Bid(int total_Bid) {
        Total_Bid = total_Bid;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public void setMax_price(int max_price) {
        this.max_price = max_price;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public void setPrice_of_User(int price_of_User) {
        Price_of_User = price_of_User;
    }

    public void setStart_Time(LocalDateTime start_Time) {
        Start_Time = start_Time;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
