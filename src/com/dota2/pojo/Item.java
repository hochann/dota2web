package com.dota2.pojo;
//物品
public class Item {
	private Integer item_id;
	private String item_details;
	private String item_img;
	private String item_type;
	private Integer item_price;
	private String item_name;
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public String getItem_details() {
		return item_details;
	}
	public void setItem_details(String item_details) {
		this.item_details = item_details;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public Integer getItem_price() {
		return item_price;
	}
	public void setItem_price(Integer item_price) {
		this.item_price = item_price;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	@Override
	public String toString() {
		return "Item [item_id=" + item_id + ", item_details=" + item_details + ", item_img=" + item_img + ", item_type="
				+ item_type + ", item_price=" + item_price + ", item_name=" + item_name + "]";
	}
	
	
}
