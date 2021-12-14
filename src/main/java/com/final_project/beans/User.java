package com.final_project.beans;

import java.time.LocalDateTime;

public class User {
    private int User_ID,userrole;
    private String username, email, Pass, Address;
    private LocalDateTime Date_o_Birth,Seller_Expired_date;

    public User() {
    }

    public User(int user_ID, int userrole, String username, String email, String pass, String address, LocalDateTime date_o_Birth, LocalDateTime seller_Expired_date) {
        User_ID = user_ID;
        this.userrole = userrole;
        this.username = username;
        this.email = email;
        Pass = pass;
        Address = address;
        Date_o_Birth = date_o_Birth;
        Seller_Expired_date = seller_Expired_date;
    }

    public User(int userrole, String username, String email, String pass, String address, LocalDateTime date_o_Birth, LocalDateTime seller_Expired_date) {
        this.userrole = userrole;
        this.username = username;
        this.email = email;
        Pass = pass;
        Address = address;
        Date_o_Birth = date_o_Birth;
        Seller_Expired_date = seller_Expired_date;
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

    public LocalDateTime getDate_o_Birth() {
        return Date_o_Birth;
    }

    public void setDate_o_Birth(LocalDateTime date_o_Birth) {
        Date_o_Birth = date_o_Birth;
    }

    public LocalDateTime getSeller_Expired_date() {
        return Seller_Expired_date;
    }

    public void setSeller_Expired_date(LocalDateTime seller_Expired_date) {
        Seller_Expired_date = seller_Expired_date;
    }
}
