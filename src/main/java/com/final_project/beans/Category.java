package com.final_project.beans;

public class Category {
    private String Cname;
    private int Cat_ID, Cparent_ID, Level;

    public Category(String cname, int cat_ID, int cparent_ID, int level) {
        Cname = cname;
        Cat_ID = cat_ID;
        Cparent_ID = cparent_ID;
        Level = level;
    }

    public Category() {
    }

    public Category(String cname) {
        this.Cname = cname;
        this.Cat_ID = -1;
    }

    public String getCname() {
        return Cname;
    }

    public int getCat_ID() {
        return Cat_ID;
    }

    public int getCparent_ID() {
        return Cparent_ID;
    }

    public int getLevel() {
        return Level;
    }
}


