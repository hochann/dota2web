package com.dota2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dota2.pojo.User;
import com.dota2.service.UserService;
import com.dota2.util.UploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
//后台操作用户数据
public class UserBackController extends BaseController{
	@Autowired
	private UserService userService;
	private int pageSize=6;//每页数据大小
	@RequestMapping("/list")	//查询所有 后台
	public String findAll(Model model,int pageNum) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<User> list = userService.findAll();
		PageInfo<User> pageInfo = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo",pageInfo);
		return "user";
	}
	@RequestMapping("/toInsert")	//跳转添加数据
	public String toInsert(){
		return "/insertUser";
	}
	@RequestMapping("/insert")	//添加
	public String insert(MultipartFile pic,User user) throws Exception{
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			user.setImg(newFilename);
		}
		userService.register(user);
		return "redirect:/user/search.action";
	}
	@RequestMapping("/delete")	//删除单个数据
	public String delete(@RequestParam("id") Integer id) throws Exception{
		userService.delete(id);
		return "redirect:/user/search.action";
	}
	@RequestMapping("/deleteAll")	//删除多个数据
	public String deleteAll(Integer[] ids) throws Exception{
		userService.deleteAll(ids);
		return "redirect:/user/search.action";
	}
	@RequestMapping("/toUpdate")	//跳转修改
	public String toUpdate(User user,Model model) throws Exception{
		Integer uid = user.getUid();
		if(uid!=null){
			User findUser = userService.findById(uid);
			if(findUser!=null){
				model.addAttribute("list", findUser);
				return "updateUser";
			}
		}
		return "";
	}
	@RequestMapping("/saveUpdate")	//修改保存用户信息
	public String saveUpdate(MultipartFile pic,User user) throws Exception{
		String newFilename = UploadUtil.upload(pic);
		System.out.println("数据------"+user);
		if(newFilename!=null && newFilename.length()>0){
			user.setImg(newFilename);
		}
		//System.out.println("修改后的数据------"+user);
		userService.update(user);
		return "redirect:/user/search.action";
	}
	@RequestMapping("/search")	//搜索用户，模糊-查询
	public String search(Model model,String condition) throws Exception{
		System.out.println("查询条件:"+condition);
		if(condition==null){
			condition="";
		}
		List<User> list = userService.search(condition);
		model.addAttribute("list", list);
		model.addAttribute("condition",condition);
		if(list.isEmpty()){
			model.addAttribute("msg", "没有数据!重新输入...");
		}
		return "user";
	}
}
