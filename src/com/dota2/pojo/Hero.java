package com.dota2.pojo;
//英雄
public class Hero {
	private Integer hid;
	private String hero_name;
	private String hero_bg;
	private String hero_img;
	private String skill;
	private String attr;
	private String type;
	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}
	public String getHero_name() {
		return hero_name;
	}
	public void setHero_name(String hero_name) {
		this.hero_name = hero_name;
	}
	public String getHero_bg() {
		return hero_bg;
	}
	public void setHero_bg(String hero_bg) {
		this.hero_bg = hero_bg;
	}
	public String getHero_img() {
		return hero_img;
	}
	public void setHero_img(String hero_img) {
		this.hero_img = hero_img;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getAttr() {
		return attr;
	}
	public void setAttr(String attr) {
		this.attr = attr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Hero [hid=" + hid + ", hero_name=" + hero_name + ", hero_bg=" + hero_bg + ", hero_img=" + hero_img
				+ ", skill=" + skill + ", attr=" + attr + ", type=" + type + "]";
	}
	
}
