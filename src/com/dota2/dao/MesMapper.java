package com.dota2.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dota2.pojo.Comment;

public interface MesMapper {
	//查询所有评论
	public List<Comment> findAll();
	//删除单个
	public void delete(Integer id,Date date);
	//恢复单个
	public void recover(Integer id, Date date);
	//删除多个
	public void deleteAll(@Param("ids") Integer[] ids,Date date);
	//恢复多个
	public void recoverAll(@Param("ids") Integer[] ids,Date date);
	//查询
	public List<Comment> search(String condition);

}
