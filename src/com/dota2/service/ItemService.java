package com.dota2.service;

import java.util.List;

import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.util.PageBean;

public interface ItemService {
	//查询
	public List<Item> findAll();
	//添加
	public void insert(Item item);
	//删除单个
	public void delete(Integer id);
	//删除多个
	public void deleteAll(Integer[] ids);
	//根据id查询单个
	public Item selectById(Integer id);
	//修改
	public void update(Item item);
	//分页查询
	public PageBean<Item> queryAll(int pageNum);
	//模糊查询
	public List<Item> search(String condition);
}
