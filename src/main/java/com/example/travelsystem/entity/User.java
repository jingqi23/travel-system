package com.example.travelsystem.entity;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer role;
    private String name;
    private Integer sex;
    private String phone;
    private String idcard;
    private Integer isdel;

    public User() {
    }

    public User(String username, String password, Integer role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public User(String username, String password, Integer role, String name,
                Integer sex, String phone, String idcard, Integer isdel) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.phone = phone;
        this.idcard = idcard;
        this.isdel = isdel;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRole() {
        return this.role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return this.sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdcard() {
        return this.idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public Integer getIsdel() {
        return this.isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

}