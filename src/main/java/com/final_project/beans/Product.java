package com.final_project.beans;

public class Product {
    private int Pro_ID;
    private String Pname, img, description;
    private int Price, Status, Cat_ID;

    public Product() {
    }

    public Product(String pname, String img, String description, int price, int status, int cat_ID) {
        Pname = pname;
        this.img = img;
        this.description = description;
        Price = price;
        Status = status;
        Cat_ID = cat_ID;
    }

    public Product(int pro_ID, String pname, String img, String description, int price, int status, int cat_ID) {
        this.Pro_ID = pro_ID;
        this.Pname = pname;
        this.img = img;
        this.description = description;
        this.Price = price;
        this.Status = status;
        this.Cat_ID = cat_ID;
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
}
