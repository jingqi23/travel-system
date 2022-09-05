package com.example.travelsystem.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Food entity. @author MyEclipse Persistence Tools
 */

public class Tuan {

    private Integer id;
    private Integer uid;
    private User user;
    private String name;
    private Integer nums;
    private Integer cnums;
    private Integer isdel;
    private String content;
    private String pic;
    private String time;
    private List<Tuanxi> tuanxis = new ArrayList<Tuanxi>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNums() {
        return nums;
    }

    public void setNums(Integer nums) {
        this.nums = nums;
    }

    public Integer getCnums() {
        return cnums;
    }

    public void setCnums(Integer cnums) {
        this.cnums = cnums;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<Tuanxi> getTuanxis() {
        return tuanxis;
    }

    public void setTuanxis(List<Tuanxi> tuanxis) {
        this.tuanxis = tuanxis;
    }

}