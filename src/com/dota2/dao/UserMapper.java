package com.dota2.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dota2.pojo.Admin;
import com.dota2.pojo.Comment;
import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.pojo.Skill;
import com.dota2.pojo.User;
import com.dota2.util.PageBean;
import com.dota2.vo.Condition;
import com.dota2.vo.HeroDetail;
import com.dota2.vo.News;


public interface UserMapper {
	//登录查找用户
	public User findUser(User user);
	//查找用户名
	public User findByName(String username);
	//查找用户id
	public User findById(Integer uid);
	//注册用户
	public void register(User user);
	//修改用户
	public void update(User user);
	//英雄数据
	public List<HeroDetail> findAllHero();
	//物品数据
	public List<Item> findAllItem();
	//查询英雄详细数据
	public HeroDetail findHeroDetail(Integer id);
	//查询所有用户
	public List<User> findAll();
	//查找管理员
	public Admin findAdmin(Admin admin);
	//删除单个
	public void delete(Integer id);
	//删除多个
	public void deleteAll(Integer[] ids);
	//模糊查询
	public List<User> search(String condition);
	//添加评论
	public void addComment(Comment comment);
	//根据类型查询新闻
	public News findNews(String types,@Param("px")String px,@Param("pxt")String pxt);
	//查询物品详细数据
	public Item findItemDetail(Integer id);
	//条件查询英雄
	public List<Hero> searchHero(Condition query);
	//条件查询物品
	public List<Item> searchItem(Condition query);
	//根据id查找评论
	public Comment findComment(Integer id);
	//修改评论
	public void updateComment(Comment comment);
}
