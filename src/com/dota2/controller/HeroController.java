package com.dota2.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dota2.pojo.Hero;
import com.dota2.service.HeroService;
import com.dota2.util.PageBean;
import com.dota2.util.UploadUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/hero")
public class HeroController extends BaseController{
	@Autowired//依赖注入
	private HeroService heroService;
	private int pageSize=6;//每页数据大小
	//简单查询所有数据
	@RequestMapping("/list")
	public String findAll(Model model,int pageNum) throws Exception{
		PageHelper.startPage(pageNum,pageSize);
		List<Hero> list = heroService.findAll();
		PageInfo<Hero> pageInfo = new PageInfo<>(list);
		System.out.println("分页信息"+pageInfo);
		System.out.println("查询的数据"+list);
		//返回数据
		model.addAttribute("list", list);
		model.addAttribute("pageInfo",pageInfo);
		return "hero";
	}
	//springMvc可以直接接收基本数据类型,包括string.spirngMvc可以帮你自动进行类型转换.
	//controller方法接收的参数的变量名称必须要等于页面上input框的name属性值
	//spirngMvc可以直接接收pojo类型:要求页面上input框的name属性名称必须等于pojo的属性名称
	//跳转添加页面
	@RequestMapping("toInsert")
	public String toInsert(){
		return"insertHero";
	}
	//初始添加数据
	@RequestMapping("/insert")
	public String insert(MultipartFile pic,Hero hero) throws Exception{
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			hero.setHero_img(newFilename);
		}
		heroService.insert(hero);
		System.out.println("添加成功!");
		//指定返回的页面(如果controller方法返回值为void,则不走springMvc组件,所以要写页面的完整路径名称)
		//request.getRequestDispatcher("/WEB-INF/jsp/success.jsp").forward(request, response);
		//重定向:浏览器中url发生改变,request域中的数据不可以带到重定向后的方法中
		//model.addAttribute("id", items.getId());
		//在springMvc中凡是以redirect:字符串开头的都为重定向
		return "redirect:/hero/search.action";
	}
	//删除单个数据
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Integer id,Model model) throws Exception{
		System.out.println("得到的id:"+id);
		heroService.delete(id);
//		删除完成后，重定向到查询所有数据
//		model.addAttribute("msg", "删除成功!");
		return "redirect:/hero/search.action";
	}
	//删除多个数据
	@RequestMapping("/deleteAll")
	//注意controller的Integer[]数组变量名ids要和jsp页面checkbox的name属性ids相等
	public String deleteAll(Integer[] ids,Model model) throws Exception{
		//测试
/*		for (int i = 0; i < ids.length; i++) {
			System.out.println(ids[i]);
		}*/
		heroService.deleteAll(ids);
//		删除完成后，重定向到查询所有数据
		model.addAttribute("msg", "删除成功！");
		return "redirect:/hero/search.action";
	}
	//修改,先查询一个数据 @RequestParam("id") 
	//@ResponseBody的作用是将java对象转为json格式的数据
	@RequestMapping("/detail")
	public String selectById(Integer id,Model model) throws Exception{
		System.out.println("得到用户的id:"+id);
		//根据id查询用户
		Hero hero = heroService.selectById(id);
		System.out.println("结果--"+hero);
		//查询完成后，，，，，返回用户信息.
		model.addAttribute("list", hero);
		//跳转修改页面----
		return "updateHero";
	}
	//update修改 
	@RequestMapping("/update")
	public String update(MultipartFile pic,Hero hero) throws Exception{
		//System.out.println("修改---用户的id:"+hero.getHid());
		System.out.println("表单的数据------"+hero);
		String newFilename = UploadUtil.upload(pic);
		if(newFilename!=null && newFilename.length()>0){
			hero.setHero_img(newFilename);
		}
		heroService.update(hero);
		return "redirect:/hero/search.action";
	}
	//分页查询query
	/*@RequestMapping("/query")
	public String queryAll(Model model,HttpServletRequest request) throws Exception{
		//当前第pageNum 1页，每页10条
		String pageNum = request.getParameter("pageNum");
		System.out.println("当前页"+pageNum);
		//传递当前页
		PageBean<Hero> pageBean = heroService.queryAll(Integer.parseInt(pageNum));
		//测试
		System.out.println(pageBean);
		List<User> data = pageBean.getData();
		System.out.println(data);
		//返回页面
		model.addAttribute("pb", pageBean);
		return "heroPage";
	}*/
	////搜索，模糊-查询search
	@RequestMapping("/search")
	public String search(Model model,String condition) throws Exception{
		System.out.println("查询条件:"+condition);
		if(condition==null){
			condition="";
		}
		List<Hero> list = heroService.search(condition);
		//返回数据
		System.out.println(list);
		model.addAttribute("list", list);
		//搜索条件
		model.addAttribute("condition",condition);
		if(list.isEmpty()){
			model.addAttribute("msg", "没有数据!重新输入...");
		}
		return "hero";
	}
}
