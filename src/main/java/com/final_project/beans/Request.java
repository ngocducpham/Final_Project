package com.final_project.beans;

public class Request {
    private int request_ID;
    private int User_ID;

    public Request(int request_ID, int user_ID) {
        this.request_ID = request_ID;
        User_ID = user_ID;
    }

    public Request() {
    }

    public int getRequest_ID() {
        return request_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }
}
