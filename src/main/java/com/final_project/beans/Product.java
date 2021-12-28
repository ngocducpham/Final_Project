package com.final_project.beans;

import java.time.LocalDateTime;

public class Product {
    private int Pro_ID;
    private String Pname, img, description;
    private int Price, Status, Cat_ID;
    private int Start_Price, Current_Price, Total_Bid;
    private LocalDateTime Start_Time, End_Time;


    public Product(int pro_ID, String pname, String img, String description, int price, int status, int cat_ID, int start_Price, int current_Price, int total_Bid, LocalDateTime start_Time, LocalDateTime end_Time) {
        Pro_ID = pro_ID;
        Pname = pname;
        this.img = img;
        this.description = description;
        Price = price;
        Status = status;
        Cat_ID = cat_ID;
        Start_Price = start_Price;
        Current_Price = current_Price;
        Total_Bid = total_Bid;
        Start_Time = start_Time;
        End_Time = end_Time;
    }

    public Product(String pname, int price, int cat_id, LocalDateTime start_time, LocalDateTime end_time, String img, String description, int status) {
        Pname = pname;
        Price = price;
        Cat_ID = cat_id;
        Start_Time = start_time;
        End_Time = end_time;
        this.img = img;
        this.description = description;
        Status = status;
    }

    public Product(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public Product(String pname, int cat_id, String img, String description) {
        Pname = pname;
        Cat_ID = cat_id;
        this.img = img;
        this.description = description;
    }

    public Product(int pro_ID,String pname,  String description)
    {
        Pname=pname;
        this.description=description;
        Pro_ID=pro_ID;
    }

    public Product(String pname,  String description)
    {
        Pname=pname;
        this.description=description;

    }

    public Product(String pname, String img, String description, int price, int status, int cat_ID) {
        Pname = pname;
        this.img = img;
        this.description = description;
        Price = price;
        Status = status;
        Cat_ID = cat_ID;
    }

    public Product(int id, int status) {
        Pro_ID = id;
        Status = status;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public String getPname() {
        return Pname;
    }

    public String getImg() {
        return img;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return Price;
    }

    public int getStatus() {
        return Status;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public int getStart_Price() {
        return Start_Price;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }

    public int getTotal_Bid() {
        return Total_Bid;
    }

    public LocalDateTime getStart_Time() {
        return Start_Time;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }
}
