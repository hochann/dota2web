package com.dota2.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Team {
/*	team_id":1838315,"
	rating":1626.88,"
	wins":618,"
	losses":321,"
	last_match_time":1551030031,"
	name":"Team Secret","
	tag":"Secret","
	logo_url":"https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png*/			
	private String team_id;//队伍id
	private String rating;//
	private String wins;
	private String losses;
	//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private String last_match_time;
	private String name;
	private String logo_url;
	private String tag;// 队标
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getWins() {
		return wins;
	}
	public void setWins(String wins) {
		this.wins = wins;
	}
	public String getLosses() {
		return losses;
	}
	public void setLosses(String losses) {
		this.losses = losses;
	}
	
	public String getLast_match_time() {
		return last_match_time;
	}
	public void setLast_match_time(String last_match_time) {
		this.last_match_time = last_match_time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo_url() {
		return logo_url;
	}
	public void setLogo_url(String logo_url) {
		this.logo_url = logo_url;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "Team [team_id=" + team_id + ", rating=" + rating + ", wins=" + wins + ", losses=" + losses
				+ ", last_match_time=" + last_match_time + ", name=" + name + ", logo_url=" + logo_url + ", tag=" + tag
				+ "]";
	}
	
}
