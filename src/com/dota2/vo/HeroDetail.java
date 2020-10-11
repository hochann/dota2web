package com.dota2.vo;

import com.dota2.pojo.Hero;

/**
 * 英雄详细信息
 * @author asus
 * 包括技能，技能描述等
 */
public class HeroDetail extends Hero{
	private String skill;
	private String detail;
	private String img;
	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return super.toString()+"HeroDetail [skill=" + skill + ", detail=" + detail + ", img=" + img + "]";
	}
}
