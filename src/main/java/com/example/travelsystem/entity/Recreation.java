package com.example.travelsystem.entity;

/**
 * Recreation entity. @author MyEclipse Persistence Tools
 */

public class Recreation{

	private Integer id;
	private String intro;
	private String name;
	private String img1;
	private String img2;
	private String img3;
	private Integer isdel;

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

	public Integer getIsdel() {
		return this.isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

}