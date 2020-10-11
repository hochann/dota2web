package com.dota2.service;

import java.util.Date;
import java.util.List;

import com.dota2.pojo.Comment;
import com.dota2.pojo.Skill;

public interface MesService {
	//查询
	public List<Comment> findAll();
	//删除单个
	public void delete(Integer id,Date date);
	//恢复单个
	public void recover(Integer id,Date date);
	//删除多个
	public void deleteAll(Integer[] ids,Date date);
	//恢复多个
	public void recoverAll(Integer[] ids, Date date);
	//模糊查询
	public List<Comment> search(String condition);

	
}
