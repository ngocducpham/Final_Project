package com.final_project.beans;

public class Category {
    private String CatName;
    private int CatID, CatparentID, Level;

    public Category(String catName, int catID, int catparentID, int level) {
        CatName = catName;
        CatID = catID;
        CatparentID = catparentID;
        Level = level;
    }

    public Category(String name) {
    }

    public String getCatName() {
        return CatName;
    }

    public void setCatName(String catName) {
        CatName = catName;
    }

    public int getCatID() {
        return CatID;
    }

    public void setCatID(int catID) {
        CatID = catID;
    }

    public int getCatparentID() {
        return CatparentID;
    }

    public void setCatparentID(int catparentID) {
        CatparentID = catparentID;
    }

    public int getLevel() {
        return Level;
    }

    public void setLevel(int level) {
        Level = level;
    }
}


