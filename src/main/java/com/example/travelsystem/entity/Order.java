package com.example.travelsystem.entity;

import java.util.Date;

public class Order {
    private Integer id;
    private Integer uid;
    private String sid;
    private Integer num;
    private Integer price;
    private Integer check;
    private String fenlei;
    private Date sdate;

    public String getFenlei() {
        return fenlei;
    }

    public void setFenlei(String fenlei) {
        this.fenlei = fenlei;
    }

    private String uname;

    public Order() {
    }

    public Order(Integer uid, String sid, Integer num, Integer price, Integer check) {
        this.uid = uid;
        this.sid = sid;
        this.num = num;
        this.price = price;
        this.check = check;
    }

    public Integer getId() {
        return this.id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }


    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSid() {
        return this.sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getNum() {
        return this.num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getPrice() {
        return this.price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getCheck() {
        return this.check;
    }

    public void setCheck(Integer check) {
        this.check = check;
    }

    public Date getSdate() {
        return sdate;
    }

    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

}