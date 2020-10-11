package com.dota2.service;

import java.util.List;

import com.dota2.pojo.Hero;
import com.dota2.util.PageBean;

public interface HeroService {
	//查询
	public List<Hero> findAll();
	//添加
	public void insert(Hero hero);
	//删除单个
	public void delete(Integer id);
	//删除多个
	public void deleteAll(Integer[] ids);
	//根据id查询单个
	public Hero selectById(Integer id);
	//修改
	public void update(Hero hero);
	//分页查询
	public PageBean<Hero> queryAll(int pageNum);
	//模糊查询
	public List<Hero> search(String condition);
}
