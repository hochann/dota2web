package com.dota2.vo;
//查询条件
public class Condition {
	private String attr;//属性
	private String type;//类型
	private String price;//价格
	private String condition;//条件
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Override
	public String toString() {
		return "Condition [attr=" + attr + ", type=" + type + ", price=" + price + ", condition=" + condition + "]";
	}
}
