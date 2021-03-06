package com.final_project.beans;

public class Point {
    private int id,up,down,user_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUp() {
        return up;
    }

    public void setUp(int up) {
        this.up = up;
    }

    public int getDown() {
        return down;
    }

    public void setDown(int down) {
        this.down = down;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Point(int id, int up, int down, int user_id) {
        this.id = id;
        this.up = up;
        this.down = down;
        this.user_id = user_id;
    }

    public Point(int up, int down, int user_id) {
        this.up = up;
        this.down = down;
        this.user_id = user_id;
    }
}
