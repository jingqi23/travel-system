package com.example.travelsystem.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * FoodCopy entity. @author MyEclipse Persistence Tools
 */

public class Pricture{
	private Integer id;
	private Integer uid;
	private User user;
	private String img;
	private String describe;
	private List<Feedback> feedbacks= new ArrayList<>();
	private String title;

	public Pricture() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getId() {
		return this.id;
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

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public List<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(List<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}
}