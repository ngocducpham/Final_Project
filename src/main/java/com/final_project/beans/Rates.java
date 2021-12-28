package com.final_project.beans;

public class Rates {
    private int RateB_ID;
    private int Seller_ID;
    private int Type;
    private int Bidder;
    private int Pro_ID;
    private int Vote;
    private String Comment;
    private int id;
    private int up;
    private int down;
    private int points;
    private int User_ID;

    public Rates(int rateB_ID, int seller_ID, int type, int bidder, int pro_ID, int vote, String comment, int id, int up, int down, int points, int user_ID) {
        RateB_ID = rateB_ID;
        Seller_ID = seller_ID;
        Type = type;
        Bidder = bidder;
        Pro_ID = pro_ID;
        Vote = vote;
        Comment = comment;
        this.id = id;
        this.up = up;
        this.down = down;
        this.points = points;
        User_ID = user_ID;
    }

    public Rates(int seller_ID, int type, int bidder, int pro_ID, int vote, String comment) {
        Seller_ID = seller_ID;
        Type = type;
        Bidder = bidder;
        Pro_ID = pro_ID;
        Vote = vote;
        Comment = comment;
    }

    public Rates() {
    }

    public int getRateB_ID() {
        return RateB_ID;
    }

    public int getSeller_ID() {
        return Seller_ID;
    }

    public int getType() {
        return Type;
    }

    public int getBidder() {
        return Bidder;
    }

    public int getPro_ID() {
        return Pro_ID;
    }

    public int getVote() {
        return Vote;
    }

    public String getComment() {
        return Comment;
    }

    public int getId() {
        return id;
    }

    public int getUp() {
        return up;
    }

    public int getDown() {
        return down;
    }

    public int getPoints() {
        return points;
    }

    public int getUser_ID() {
        return User_ID;
    }
}


