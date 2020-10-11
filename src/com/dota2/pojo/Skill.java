package com.dota2.pojo;
//英雄技能
public class Skill {
	private Integer sid;
	private Integer skill_id;
	private String skill;
	private String img;
	private String detail;
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(Integer skill_id) {
		this.skill_id = skill_id;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "Skill [sid=" + sid + ", skill_id=" + skill_id + ", skill=" + skill + ", img=" + img + ", detail="
				+ detail + "]";
	}
}
