package com.final_project.beans;
import java.time.LocalDateTime;

public class AddProduct
{
    private int Pro_ID;
    private int Status;
    private int Cat_ID;
    private int Price;
    private int SellerID;
    private int Cparent_ID;
    private LocalDateTime Start_Time,End_Time;
    //private LocalDateTime End_Time;

    private String Pname;
    private String description;
    private String Seller;
    private String img;

    public AddProduct(int pro_ID,int status,int cat_ID, int price,int sellerID, int cparent_ID,
                      LocalDateTime start_Time, LocalDateTime end_Time, String pname, String description,
                      String seller, String img)
    {
        Pro_ID=pro_ID;
        Status=status;
        Cat_ID=cat_ID;
        Price=price;
        SellerID=sellerID;
        Cparent_ID=cparent_ID;
        Start_Time=start_Time;
        End_Time=end_Time;
        Pname=pname;
        this.description=description;
        Seller=seller;
        this.img=img;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public void setCat_ID(int cat_ID) {
        Cat_ID = cat_ID;
    }

    public void setStart_Time(LocalDateTime start_Time) {
        Start_Time = start_Time;
    }

    public LocalDateTime getStart_Time() {
        return Start_Time;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int status) {
        Status = status;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int price) {
        Price = price;
    }

    public int getCparent_ID() {
        return Cparent_ID;
    }

    public void setCparent_ID(int cparent_ID) {
        Cparent_ID = cparent_ID;
    }

    public int getSellerID() {
        return SellerID;
    }

    public void setSellerID(int sellerID) {
        SellerID = sellerID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getSeller() {
        return Seller;
    }

    public void setSeller(String seller) {
        Seller = seller;
    }

}
