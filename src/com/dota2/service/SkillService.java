package com.dota2.service;

import java.util.List;
import com.dota2.pojo.Hero;
import com.dota2.pojo.Skill;

public interface SkillService {
	//查询
	public List<Skill> findAll();
	//添加
	public void insert(Skill skill);
	//删除单个
	public void delete(Integer id);
	//删除多个
	public void deleteAll(Integer[] ids);
	//根据id查询单个
	public Skill selectById(Integer id);
	//修改
	public void update(Skill skill);
	//模糊查询
	public List<Skill> search(String condition);
}
