package com.dota2.pojo;

import java.util.Date;

//评论
public class Comment {
/*	  `id` int(11) '评论id',
	  `uid` int(11)'外键',
	  `comment` varchar(255)'评论内容',
	  `status` int(255)'评论状态',
	  `created_at` datetime '创建时间',
	  `updated_at` datetime'修改时间',
	  `zan_count` int(11)'赞数',
	  `ruid` int(11)'回复人id',*/
	private Integer id;//评论id
	private Integer uid;
	private Integer ruid;
	private String comment;
	private Integer status;//评论状态 数据库设置默认为‘1’，‘0’表示伪删除
	private Date created_at;
	private Date updated_at;
	private int zan_count;
	private Integer num;//文章id
	private String ntype;//文章类型
	private String rname;//被回复用户姓名
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
	public Integer getRuid() {
		return ruid;
	}
	public void setRuid(Integer ruid) {
		this.ruid = ruid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	public int getZan_count() {
		return zan_count;
	}
	public void setZan_count(int zan_count) {
		this.zan_count = zan_count;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getNtype() {
		return ntype;
	}
	public void setNtype(String ntype) {
		this.ntype = ntype;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", uid=" + uid + ", ruid=" + ruid + ", comment=" + comment + ", status=" + status
				+ ", created_at=" + created_at + ", updated_at=" + updated_at + ", zan_count=" + zan_count + ", num="
				+ num + ", ntype=" + ntype + ", rname=" + rname + "]";
	}
	
}
