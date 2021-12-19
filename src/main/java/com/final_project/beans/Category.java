package com.final_project.beans;

public class Category {
    int Cat_ID, Cparent_ID;
    String Cname;

    public Category(String cname, int cparent_ID) {
    }



    public Category(int cat_ID, int cparent_ID, String cname) {
        Cat_ID = cat_ID;
        Cparent_ID = cparent_ID;
        Cname = cname;
    }

    public Category(String cname) {
        this.Cat_ID =-1;
        Cname = cname;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public int getCparent_ID() {
        return Cparent_ID;
    }

    public String getCname() {
        return Cname;
    }
}

