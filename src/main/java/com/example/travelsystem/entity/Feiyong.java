package com.example.travelsystem.entity;

/**
 * Scenicspot entity. @author MyEclipse Persistence Tools
 */

public class Feiyong {

	private Integer id;
	private Integer uid;
	private Double feiyong;
	private String ftime;
	private String content;
	
	public Feiyong() {
	}

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

	public Double getFeiyong() {
		return feiyong;
	}

	public void setFeiyong(Double feiyong) {
		this.feiyong = feiyong;
	}

	public String getFtime() {
		return ftime;
	}

	public void setFtime(String ftime) {
		this.ftime = ftime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}