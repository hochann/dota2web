package com.dota2.vo;

import java.util.Date;
import java.util.List;

import com.dota2.pojo.Comment;
import com.dota2.pojo.User;
//新闻 包含评论
public class News{
	private List<Comment> comments;
	private Integer nid;
	private String title;
	private String content;
	private Date time;
	private String type;
	private List<User> users;
	public List<Comment> getComments() {
		return comments;
	}
	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	public Integer getNid() {
		return nid;
	}
	public void setNid(Integer nid) {
		this.nid = nid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "News [comments=" + comments + ", nid=" + nid + ", title=" + title + ", content=" + content + ", time="
				+ time + ", type=" + type + ", users=" + users + "]";
	}
	
}
