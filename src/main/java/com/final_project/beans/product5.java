package com.final_project.beans;
import java.time.LocalDateTime;
public class product5 {
    private int Pro_ID, Current_Price, Cat_ID;
    private String Pname;
    private LocalDateTime End_Time;

    public product5 (int pro_ID, int current_Price, LocalDateTime end_Time, int cat_ID, String pname)
    {
        Pro_ID=pro_ID;
        Current_Price=current_Price;
        End_Time=end_Time;
        Cat_ID=cat_ID;
        Pname=pname;
    }

    public void setCat_ID(int cat_ID) {
        Cat_ID = cat_ID;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public void setCurrent_Price(int current_Price) {
        Current_Price = current_Price;
    }

    public int getCurrent_Price() {
        return Current_Price;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public void setEnd_Time(LocalDateTime end_Time) {
        End_Time = end_Time;
    }

    public String getPname() {
        return Pname;
    }

    public LocalDateTime getEnd_Time() {
        return End_Time;
    }

}

//    select Pname, pa.Pro_ID, Current_Price, End_Time
//        from products join product_auction pa on products.Pro_ID = pa.Pro_ID
//              join categories c on c.Cat_ID = products.Cat_ID
//        where c.Cat_ID = 1 or Cparent_ID = 1
//        limit 5