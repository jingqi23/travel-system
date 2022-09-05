package com.example.travelsystem.entity;

/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback {
	private Integer id;
	private String fback;
	private User user;
	private String ftime;
	private Integer pid;
	private Integer uid;

	public Feedback() {
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFback() {
		return this.fback;
	}

	public void setFback(String fback) {
		this.fback = fback;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
}