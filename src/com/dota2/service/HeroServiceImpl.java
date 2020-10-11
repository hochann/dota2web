package com.dota2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dota2.dao.HeroMapper;
import com.dota2.pojo.Hero;
import com.dota2.pojo.User;
import com.dota2.util.PageBean;
@Service
public class HeroServiceImpl implements HeroService {
	@Autowired
	private HeroMapper heroMapper;
	//简单查询所有
	public List<Hero> findAll() {
		return heroMapper.findAll();
	}
	//添加
	public void insert(Hero hero) {
		heroMapper.insert(hero);
	}
	//删除单个
	public void delete(Integer id) {
		heroMapper.delete(id);
	}
	//删除多个
	public void deleteAll(Integer[] ids) {
		heroMapper.deleteAll(ids);
	}
	//根据id查询单个
	public Hero selectById(Integer id) {
		return heroMapper.selectById(id);
	}
	//修改
	public void update(Hero hero) {
		heroMapper.update(hero);
	}
	//分页查询
	public PageBean<Hero> queryAll(int pageNum) {
		int totalRecord = heroMapper.getTotalRecord();
		//创建对象
		PageBean<Hero> pageBean = new PageBean<Hero>(pageNum, 4, totalRecord);
		System.out.println("分页数据"+pageBean);
//		pageBean.setPageSize(10);
		//分页数据
		List<Hero> data = heroMapper.queryAll(pageBean);
		System.out.println("数据"+data);
		pageBean.setData(data);
		return pageBean;
	}
	//模糊查询
	public List<Hero> search(String condition) {
		return heroMapper.search(condition);
	}

}
