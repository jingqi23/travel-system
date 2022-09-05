package com.example.travelsystem.entity;

/**
 * Scenicspot entity. @author MyEclipse Persistence Tools
 */

public class Scenicspot {

    private Integer id;
    private String intro;
    private String name;
    private Double price;
    private Integer tnum;
    private Integer dianji;
    private String img1;
    private String img2;
    private String img3;
    private String srr;
    private String address;
    private String coordinate;

    public Scenicspot() {
    }

    public Scenicspot(String intro, String name, Double price, String img1,
                      String img2, String img3, String srr, String address) {
        this.intro = intro;
        this.name = name;
        this.price = price;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.srr = srr;
        this.address = address;
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate;
    }

    public Integer getDianji() {
        return dianji;
    }

    public void setDianji(Integer dianji) {
        this.dianji = dianji;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIntro() {
        return this.intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return this.price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImg1() {
        return this.img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return this.img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return this.img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getSrr() {
        return this.srr;
    }

    public void setSrr(String srr) {
        this.srr = srr;
    }

    public Integer getTnum() {
        return tnum;
    }

    public void setTnum(Integer tnum) {
        this.tnum = tnum;
    }

}