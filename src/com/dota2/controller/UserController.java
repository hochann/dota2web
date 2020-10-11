package com.dota2.controller;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dota2.pojo.Admin;
import com.dota2.pojo.Comment;
import com.dota2.pojo.Hero;
import com.dota2.pojo.Item;
import com.dota2.pojo.Player;
import com.dota2.pojo.Skill;
import com.dota2.pojo.Team;
import com.dota2.pojo.User;
import com.dota2.service.HeroService;
import com.dota2.service.UserService;
import com.dota2.util.JsonURL;
import com.dota2.util.UploadUtil;
import com.dota2.vo.Condition;
import com.dota2.vo.HeroDetail;
import com.dota2.vo.News;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	private int pageSize=6;//每页数据大小
	//查找名称,ajax请求 要求,dataType为json 
	//contentType 为 ‘application/json;charse=UTF-8’ data 转JSON字符串
	@RequestMapping("/findByName")
	@ResponseBody
	public boolean findByName(@RequestBody User user,Model model) throws Exception{
		String username = user.getUsername();
		System.out.println("开始查找用户名....");
		System.out.println("注册的用户"+username);
		if(username!=null){
			User findUser = userService.findByName(username);
			if(findUser!=null){
				System.out.println("结束....");
				//model.addAttribute("msg", "用户名以存在");
				return false;
			}
		}
		return true;
	}
	@RequestMapping("/mainLogin")	//跳转管理用户登录
	public String tomainLogin() {
		return "redirect:/mainLogin.jsp";
	}
	@RequestMapping("/main")	//管理用户登录
	@ResponseBody
	public Admin tomain(Admin admin,HttpSession session) {
		System.out.println("登录管理员"+admin);
		admin = userService.findAdmin(admin);
		if(admin!=null){
			session.setAttribute("admin", admin);
			//session.setMaxInactiveInterval(30*60);//以秒为单位，即在没有活动30分钟后，session将失效
			System.out.println(admin);
			return admin;
		}
		return admin;
	}
	@RequestMapping("/admin")	//跳转后台管理首页
	public String admin(HttpSession session) {
		Object attribute = session.getAttribute("admin");
		System.out.println(attribute);
		if(session!=null){
			return "main";
		}
		return "";
	}
	@RequestMapping("/toLogin")	//跳转登录页面
	public String toLogin() {
		return "redirect:../login.jsp";
	}
	@RequestMapping("/login")	//登录
	@ResponseBody
	public User login(User user,Model model,HttpServletRequest request,
			HttpSession session) {
		System.out.println("登录的信息"+user);
		user = userService.findUser(user);
		System.out.println("用户数据"+user);
		if(null!=user){
			//登录成功，将用户信息保存到session对象中
			System.out.println("数据库中有用户"+user);
			session.setAttribute("user",user);
			return user;
		}
		return user;
	}
	@RequestMapping("/toRegister")	//跳转注册页面
	public String toRegister() {
		return "redirect:../register.jsp";
	}
	@RequestMapping("/register")	//注册
	public String register(MultipartFile pic,User user) throws Exception{
		System.out.println("注册的信息"+user);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			user.setImg(newFilename);
		}
		userService.register(user);
		//注册成功跳转登录页面
		return "redirect:../login.jsp";
	}	
	@RequestMapping("/exit")	//退出
	public String exit(HttpSession session) throws Exception{
		//清除session
		session.invalidate();
		return "redirect:../index.jsp";
	}
	@RequestMapping("/select")	//查找用户信息
	public String selectByName(User user,Model model) throws Exception{
		Integer uid = user.getUid();
		System.out.println("用户id"+uid);
		if(uid!=null){
			User findUser = userService.findById(uid);
			System.out.println(findUser);
			if(findUser!=null){
				model.addAttribute("list", findUser);
				return "forward:../user.jsp";
			}
		}
		return "";
	}
	@RequestMapping("/update")	//修改保存用户信息
	public String update(MultipartFile pic,User user,HttpSession session,Model model) throws Exception{
		System.out.println("修改的数据------"+user);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			user.setImg(newFilename);
		}
		userService.update(user);
		user = userService.findByName(user.getUsername());
		//System.out.println("修改后的数据------"+user);
		//先清除session,再设置完成修改
		session.removeAttribute("user");
		session.setAttribute("user",user);
		return "redirect:../index.jsp";
	}
	@RequestMapping("/searchHero")	//搜索英雄
	public String searchHero(Model model,Condition query) throws Exception{
		System.out.println("查询条件:"+query);
		if(query.getType()==""||query.getAttr()==""){

		}else{
			model.addAttribute("query",query);
		}
		List<Hero> list = userService.searchHero(query);
		if(list.isEmpty()){
			model.addAttribute("msg", "暂无数据.....");
		}else{
			model.addAttribute("list",list);
		}
		return "forward:../hero.jsp";
	}
	@RequestMapping("/searchItem")	//搜索物品
	public String searchItem(Model model,Condition query) throws Exception{
		System.out.println("查询条件:"+query);
		if(query.getType()==""){

		}else{
			model.addAttribute("query",query);
		}
		List<Item> list = userService.searchItem(query);
		if(list.isEmpty()){
			model.addAttribute("msg", "暂无数据.....");
		}else{
			model.addAttribute("list",list);
		}
		return "forward:../item.jsp";
	}
	@RequestMapping("/hero")	//查询所有英雄数据
	public String findAllHero(Model model,RedirectAttributes redirectAttributes) throws Exception{
		List<HeroDetail> list = userService.findAllHero();
		System.out.println(list);
		model.addAttribute("list", list);
		return "forward:../hero.jsp";
	}
	@RequestMapping("/heroDetail")	//查询英雄详细数据
	public String findHeroDetail(Integer id,Model model) throws Exception{
		System.out.println("英雄id"+id);
		HeroDetail heroDetail = userService.findHeroDetail(id);
		//返回数据
		System.out.println(heroDetail);
		model.addAttribute("list", heroDetail);
		return "forward:../heroDetail.jsp";
	}
	@RequestMapping("/itemDetail")	//查询物品详细数据
	public String findItemDetail(Integer id,Model model) throws Exception{
		System.out.println("物品id"+id);
		Item itemDetail = userService.findItemDetail(id);
		//System.out.println(itemDetail);
		model.addAttribute("list", itemDetail);
		return "forward:../itemDetail.jsp";
	}
	@RequestMapping("/item")	//物品数据
	public String findAllItem(Model model,RedirectAttributes redirectAttributes) throws Exception{
		List<Item> list = userService.findAllItem();
		//返回数据
		model.addAttribute("list", list);
		return "forward:../item.jsp";
	}
	@RequestMapping("/teams")	//队伍接口数据
	//@ResponseBody
	public String getTeams(Model model,@RequestParam(value="num") int num) throws Exception{
		int page = 8;//每页8条
		int start = num*page;
		int end = start+page-1;
		String url = "https://api.opendota.com/api/teams";
		//传递一个URL 和要封装成的类。将json数组转换成java对象集合
		List<Team> list = JsonURL.getData(Team.class, url);
		//System.out.println(list);
		for (Team team : list) {//将10位时间戳转换成日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
	        Date date = sdf.parse(sdf.format(Long.parseLong(team.getLast_match_time())*1000));
	        team.setLast_match_time(date.toString());
		}	

		int size = list.size();
		System.out.println("数据长度"+size);
		if(end>=size){
			//最后一页 停止向下 ---测试。 目前最大 --页
			model.addAttribute("stop",0);
		}
		System.out.println("开始"+start+"结束"+end);
		model.addAttribute("list", list);
		model.addAttribute("num",num);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		return "forward:../teams.jsp";
	}
	@RequestMapping("/player")	//玩家接口数据
	public String getPlayers(Model model,@RequestParam(value="num") int num) throws Exception{
		//第0个索引开始
		int page = 16;//每页16条
		int start = num*page;
		int end = start+page-1;
		String url = "https://api.opendota.com/api/proPlayers";
		//传递一个URL 和要封装成的类。将json数组转换成java对象集合
		List<Player> list = JsonURL.getData(Player.class, url);
		//System.out.println(list);
		int size = list.size();
		System.out.println("数据长度"+size);
		if(end>=size){
			//最后一页 停止向下 ---测试。 目前最大57页
			model.addAttribute("stop",0);
		}
		System.out.println("开始"+start+"结束"+end);
		model.addAttribute("list", list);
		model.addAttribute("num",num);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		return "forward:../proPlayers.jsp";
	}
	@RequestMapping("/news")//获取新闻数据
	public String news(@RequestParam(value="type") String type,
			@RequestParam(value="px",required=false)String px,
			@RequestParam(value="pxt",required=false)String pxt,
			Model model,HttpServletRequest request) throws Exception{
		//解决get请求中文乱码
		String	types = new String(type.getBytes("ISO8859-1"),"UTF-8");
		System.out.println(types+" "+px);
		//查询新闻
		News news = userService.findNews(types,px,pxt);
		List<User> users = new ArrayList<>();
		if(news!=null){
			List<Comment> comments = news.getComments();
			for (Comment comment : comments) {
				//得到评论用户的id
				Integer uid = comment.getUid();
				//查找用户
				User user = userService.findById(uid);
				//System.out.println("新闻评论"+comment);
				//System.out.println("新闻评论用户"+user);
				users.add(user);
			}
			//System.out.println("用户集合"+users);
			//model.addAttribute("users", users);
			news.setUsers(users);
		}
		model.addAttribute("news", news);
		//排序后返回数据。ajax刷新留言部分
		if(px!=null||pxt!=null){
			return "forward:../message.jsp";
		}
		return "forward:../news.jsp";
	}
	@RequestMapping("/comment")	//评论
	public String comment(@RequestParam(value="type") String type,Comment comment,
			HttpSession session,Model model) throws Exception{
		//解决get请求中文乱码
		String ntype = new String(type.getBytes("ISO8859-1"),"UTF-8");
		//System.out.println(ntype);
		Date date = new Date();
		User loginUser = (User) session.getAttribute("user");
		if(loginUser!=null){
			//System.out.println(loginUser);
			Integer uid = loginUser.getUid();
			//增加评论信息
			comment.setUid(uid);
			comment.setCreated_at(date);
			comment.setUpdated_at(date);
			comment.setNtype(ntype);
			System.out.println("评论的信息"+comment);
			userService.addComment(comment);
		}
		//传递类型--重定向传参数
		model.addAttribute("type",ntype);
		//评论成功返回页面
		return "redirect:/user/news.action";
		//return "redirect:/user/news.action?type="+ntype+"";
	}
	@RequestMapping("/reply")	//留言回复
	public String reply(@RequestParam(value="type") String type,
		@RequestParam(value="uid") Integer uid,
		Comment comment,HttpSession session,Model model) throws Exception{
		//解决get请求中文乱码
		String ntype = new String(type.getBytes("ISO8859-1"),"UTF-8");
		//System.out.println(ntype);
		User user = (User) session.getAttribute("user");
		System.out.println("session中登录的用户"+user);
		if(user!=null){
			//System.out.println("被回复用户id"+uid);
			User findUser = userService.findById(uid);
			String username = findUser.getUsername();
			System.out.println("被回复用户姓名"+username);
			comment.setRuid(uid);
			comment.setRname(username);
			//增加评论信息
			comment.setUid(user.getUid());
			Date date = new Date();
			comment.setCreated_at(date);
			comment.setUpdated_at(date);
			comment.setNtype(ntype);
			System.out.println("回复的评论"+comment);
			//添加评论
			userService.addComment(comment);
		}
		//传递类型--重定向传参数
		model.addAttribute("type",ntype);
		return "redirect:/user/news.action";
	}
	@RequestMapping("/great")	//点赞
	@ResponseBody
	public Comment great(@RequestParam("id") Integer id,@RequestParam("count") Integer count,
		HttpSession session,Model model) throws Exception{
		System.out.println("评论"+id);
		//根据id查找评论
		Comment comment = userService.findComment(id);
		comment.setZan_count(count);
		System.out.println("赞数"+comment);
		//修改评论
		userService.updateComment(comment);
		return comment;
	}
}
