package com.final_project.beans;

import java.sql.Date;

public class User {
    private int User_ID,userrole;
    private String username, email, Pass, Address,code;
    private Date Date_o_Birth,Seller_Expired_date;

    public User(int user_ID, int userrole, String username, String email, String pass, String address, String code, Date date_o_Birth, Date seller_Expired_date) {
        User_ID = user_ID;
        this.userrole = userrole;
        this.username = username;
        this.email = email;
        Pass = pass;
        Address = address;
        this.code = code;
        Date_o_Birth = date_o_Birth;
        Seller_Expired_date = seller_Expired_date;
    }

    public User() {

    }


    public User(int id, int role) {
        User_ID = id;
        this.userrole = role;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public void setUser_ID(int user_ID) {
        User_ID = user_ID;
    }

    public int getUserrole() {
        return userrole;
    }

    public void setUserrole(int userrole) {
        this.userrole = userrole;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String pass) {
        Pass = pass;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate_o_Birth() {
        return Date_o_Birth;
    }

    public void setDate_o_Birth(Date date_o_Birth) {
        Date_o_Birth = date_o_Birth;
    }

    public Date getSeller_Expired_date() {
        return Seller_Expired_date;
    }

    public void setSeller_Expired_date(Date seller_Expired_date) {
        Seller_Expired_date = seller_Expired_date;
    }

    //constructor để select * from
    public User(int user_ID, String username, String email, String pass, int userrole, String address, Date date_o_Birth, Date seller_Expired_date) {
        User_ID = user_ID;
        this.username = username;
        this.email = email;
        Pass = pass;
        this.userrole = userrole;
        Address = address;
        Date_o_Birth = date_o_Birth;
        Seller_Expired_date = seller_Expired_date;
    }

    // constructor dùng để dk tài khoản
    public User(int userrole, String username, String email, String pass, String address, String code, Date date_o_Birth) {
        this.userrole = userrole;
        this.username = username;
        this.email = email;
        Pass = pass;
        Address = address;
        this.code = code;
        Date_o_Birth = date_o_Birth;
    }

}
