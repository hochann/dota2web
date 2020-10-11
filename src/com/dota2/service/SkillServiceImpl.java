package com.dota2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dota2.dao.SkillMapper;
import com.dota2.pojo.Hero;
import com.dota2.pojo.Skill;

@Service
public class SkillServiceImpl implements SkillService{
	@Autowired
	private SkillMapper skillMapper;
	//查询所有
	public List<Skill> findAll() {
		return skillMapper.findAll();
	}
	//添加
	public void insert(Skill skill) {
		skillMapper.insert(skill);
	}
	//删除单个
	public void delete(Integer id) {
		skillMapper.delete(id);
	}
	//删除多个
	public void deleteAll(Integer[] ids) {
		skillMapper.deleteAll(ids);
	}
	//根据id查询单个
	public Skill selectById(Integer id) {
		return skillMapper.selectById(id);
	}
	//修改
	public void update(Skill skill) {
		skillMapper.update(skill);	
	}
	//模糊查询
	public List<Skill> search(String condition) {
		return skillMapper.search(condition);
	}
	
}
