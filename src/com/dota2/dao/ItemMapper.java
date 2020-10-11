package com.dota2.dao;

import java.util.List;

import com.dota2.pojo.Item;
import com.dota2.util.PageBean;

public interface ItemMapper {
	//简单查询所有
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
	//查询数据总数
	public int getTotalRecord();
	//分页查询
	public List<Item> queryAll(PageBean<Item> pageBean);
	//模糊查询
	public List<Item> search(String condition);
}
