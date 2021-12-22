package com.final_project.beans;

public class Request {
    private int Request_ID;
    private int User_ID;
    private String username;
    private int userrole;

    public int getRequest_ID() {
        return Request_ID;
    }

    public int getUser_ID() {
        return User_ID;
    }

    public String getUsername() {
        return username;
    }

    public int getUserrole() {
        return userrole;
    }

    public Request() {
    }

    public Request(int request_ID, int user_ID, String username, int userrole) {
        Request_ID = request_ID;
        User_ID = user_ID;
        this.username = username;
        this.userrole = userrole;
    }
}
