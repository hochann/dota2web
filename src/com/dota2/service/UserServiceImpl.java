package com.dota2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dota2.dao.UserMapper;
import com.dota2.pojo.Admin;
import com.dota2.pojo.Comment;
import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.pojo.User;
import com.dota2.util.PageBean;
import com.dota2.vo.Condition;
import com.dota2.vo.HeroDetail;
import com.dota2.vo.News;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	//登录查找用户
	public User findUser(User user) {
		return userMapper.findUser(user);
	}
	//查找-用户名
	public User findByName(String username) {
		return userMapper.findByName(username);
	}
	//查找-id
	public User findById(Integer uid) {
		return userMapper.findById(uid);
	}
	//注册用户
	public void register(User user) {
		userMapper.register(user);
	}
	//修改用户
	public void update(User user) {
		userMapper.update(user);
	}
	//英雄数据
	public List<HeroDetail> findAllHero() {
		return userMapper.findAllHero();
	}
	//物品数据
	public List<Item> findAllItem() {
		return userMapper.findAllItem();
	}
	//查询英雄详细数据
	public HeroDetail findHeroDetail(Integer id) {
		return userMapper.findHeroDetail(id);
	}
	//查询所有用户
	public List<User> findAll() {
		return userMapper.findAll();
	}
	//查找管理员
	public Admin findAdmin(Admin admin) {
		return userMapper.findAdmin(admin);
	}
	//删除单个
	public void delete(Integer id) {
		userMapper.delete(id);
	}
	//删除多个
	public void deleteAll(Integer[] ids) {
		userMapper.deleteAll(ids);
	}
	//模糊查询
	public List<User> search(String condition) {
		return userMapper.search(condition);
	}
	//添加评论
	public void addComment(Comment comment) {
		userMapper.addComment(comment);
	}
	//根据类型查询新闻
	public News findNews(String types,String px,String pxt) {
		return userMapper.findNews(types,px,pxt);
	}
	//查询物品详细数据
	public Item findItemDetail(Integer id) {
		return userMapper.findItemDetail(id);
	}
	//条件查询英雄
	public List<Hero> searchHero(Condition query) {
		return userMapper.searchHero(query);
	}
	//条件查询物品
	public List<Item> searchItem(Condition query) {
		return userMapper.searchItem(query);
	}
	//根据id查找评论
	public Comment findComment(Integer id) {
		return userMapper.findComment(id);
	}
	//修改评论
	public void updateComment(Comment comment) {
		userMapper.updateComment(comment);
	}

}