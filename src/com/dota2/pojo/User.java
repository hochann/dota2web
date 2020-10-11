package com.dota2.pojo;

import java.util.Date;
//用户类
public class User {
	private Integer uid;//用户id
	private String username;
	private String password;
	private String img;
	private String comment;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", img=" + img + ", comment="
				+ comment + ", birthday=" + birthday + "]";
	}
	
}
