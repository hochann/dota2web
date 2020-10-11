package com.dota2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dota2.dao.ItemMapper;
import com.dota2.pojo.Item;
import com.dota2.util.PageBean;
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemMapper itemMapper;
	//简单查询所有
	public List<Item> findAll() {
		return itemMapper.findAll();
	}
	//添加
	public void insert(Item item) {
		itemMapper.insert(item);
	}
	//删除单个
	public void delete(Integer id) {
		itemMapper.delete(id);
	}
	//删除多个
	public void deleteAll(Integer[] ids) {
		itemMapper.deleteAll(ids);
	}
	//根据id查询单个
	public Item selectById(Integer id) {
		return itemMapper.selectById(id);
	}
	//修改
	public void update(Item item) {
		itemMapper.update(item);
	}
	//分页查询
	public PageBean<Item> queryAll(int pageNum) {
		int totalRecord = itemMapper.getTotalRecord();
		//创建对象
		PageBean<Item> pageBean = new PageBean<Item>(pageNum, 4, totalRecord);
		System.out.println("分页数据"+pageBean);
//		pageBean.setPageSize(10);
		//分页数据
		List<Item> data = itemMapper.queryAll(pageBean);
		System.out.println("数据"+data);
		pageBean.setData(data);
		return pageBean;
	}
	//模糊查询
	public List<Item> search(String condition) {
		return itemMapper.search(condition);
	}

}
