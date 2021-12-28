package com.final_project.beans;

import java.sql.Date;

public class Rates {
    private int RateB_ID;
    private int Seller_ID;
    private int Type;
    private int Bidder;
    private int Pro_ID;
    private int Vote;
    private String Comment;
    private String username;
    private Date Seller_Expired_date;
    private int tong_sp;

    public Rates(String comment) {
        Comment = comment;
    }

    public Date getSeller_Expired_date() {
        return Seller_Expired_date;
    }

    public void setSeller_Expired_date(Date seller_Expired_date) {
        Seller_Expired_date = seller_Expired_date;
    }

    public void setRateB_ID(int rateB_ID) {
        RateB_ID = rateB_ID;
    }

    public void setSeller_ID(int seller_ID) {
        Seller_ID = seller_ID;
    }

    public void setType(int type) {
        Type = type;
    }

    public void setBidder(int bidder) {
        Bidder = bidder;
    }

    public void setPro_ID(int pro_ID) {
        Pro_ID = pro_ID;
    }

    public void setVote(int vote) {
        Vote = vote;
    }

    public void setComment(String comment) {
        Comment = comment;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public Rates(int seller_ID, int type, int bidder, int pro_ID, int vote, String comment) {
        Seller_ID = seller_ID;
        Type = type;
        Bidder = bidder;
        Pro_ID = pro_ID;
        Vote = vote;
        Comment = comment;
    }

    public int getTong_sp() {
        return tong_sp;
    }

    public void setTong_sp(int tong_sp) {
        this.tong_sp = tong_sp;
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

}


